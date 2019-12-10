package eu.paulrobinson.pricewatcher.loader;

import eu.paulrobinson.pricewatcher.entities.Item;
import eu.paulrobinson.pricewatcher.entities.Price;
import io.quarkus.scheduler.Scheduled;
import org.eclipse.microprofile.rest.client.inject.RestClient;
import org.jboss.logging.Logger;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.Collection;

@Path("/loader")
@ApplicationScoped
public class DataLoader {

    private static final int RESULTS_PER_PAGE = 50;
    private static final long DELAY_BETWEEN_REQUESTS_MS = 200;
    private static final int[] CATAGORY_IDS = {1064, 1003};

    private static final Logger LOGGER = Logger.getLogger(DataLoader.class.getName());

    @Inject
    @RestClient
    CEXService cexService;

    @GET
    @Path("/load")
    @Produces(MediaType.APPLICATION_JSON)
    @Transactional
    @Scheduled(cron = "{cron.load.schedule}")
    public void load() throws DataLoadException {

        DataLoadResult dataLoadResult = new DataLoadResult();
        for (int categoryId : CATAGORY_IDS) {
            loadCatagoryData(categoryId, dataLoadResult);
        }
        LOGGER.info("Created: " + dataLoadResult.createCount + ", Price Updated: " + dataLoadResult.updateCount + ", Kept same: " + dataLoadResult.sameCount);
    }

    private void loadCatagoryData(int catagoryID, DataLoadResult dataLoadResult) throws DataLoadException {
        try {
            LOGGER.info("Loading Category: " + catagoryID);

            int pageNumber = 0;
            while (true) {
                int firstRecord = pageNumber * RESULTS_PER_PAGE + 1;
                LOGGER.debug("Getting page: " + pageNumber);

                Boxes boxesResult = cexService.getBoxes("[" + catagoryID +"]", firstRecord, RESULTS_PER_PAGE, CEXService.SORT_BY_RELEVANCE, CEXService.SORT_ORDER_DESC, CEXService.USER_AGENT);
                if (boxesResult.isEmpty()) {
                    break;
                }

                for (Boxes.Response.Data.Box box : boxesResult.getBoxes()) {

                    Item existingItem = Item.findByExternalId(box.boxId);
                    Price price = new Price(box.sellPrice, box.exchangePrice, box.cashPrice);

                    if (existingItem == null) {
                        Item newItem = new Item(box.boxId, box.boxName, box.categoryId);
                        newItem.addNewPrice(price);
                        price.persist();
                        newItem.persist();

                        dataLoadResult.createCount++;
                    } else {

                        if (existingItem.hasPriceChanged(price)) {
                            price.persist();
                            existingItem.addNewPrice(price);
                            existingItem.persist();
                            dataLoadResult.updateCount++;
                        } else {
                            dataLoadResult.sameCount++;
                        }

                    }
                }
                Thread.sleep(DELAY_BETWEEN_REQUESTS_MS);
                pageNumber++;
            }

        } catch (javax.ws.rs.WebApplicationException e) {
            String message = "Error accessing CEX service. Response status code: " + e.getResponse().getStatus();
            LOGGER.error(message);
            LOGGER.error(e.getResponse().getHeaders());
            throw new DataLoadException(message, e);
        } catch (InterruptedException e) {
            throw new DataLoadException("Thread interupted when loading data from CEX", e);
        }
    }

}
