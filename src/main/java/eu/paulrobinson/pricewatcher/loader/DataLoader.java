package eu.paulrobinson.pricewatcher.loader;

import eu.paulrobinson.pricewatcher.entities.Item;
import org.eclipse.microprofile.rest.client.inject.RestClient;

import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.Collection;

@Path("/load")
public class DataLoader {

    @Inject
    @RestClient
    CEXService cexService;

    @GET
    @Path("/load")
    @Produces(MediaType.APPLICATION_JSON)
    @Transactional
    public String load() {
        Collection<Boxes.Response.Data.Box> boxes =  cexService.getBoxes("[1064]", 1, 5).getBoxes();

        int updateCount = 0;
        int createCount = 0;

        for (Boxes.Response.Data.Box box : boxes) {

            Item existingItem = Item.findByExternalId(box.boxId);
            if (existingItem == null) {
                Item newItem = new Item();
                newItem.externalId = box.boxId;
                newItem.name = box.boxName;
                newItem.cashPrice = box.cashPrice;
                newItem.exchangePrice = box.exchangePrice;
                newItem.sellPrice = box.sellPrice;
                newItem.categoryId = box.categoryId;
                newItem.persist();

                createCount++;
            } else {
                updateCount++;
            }

        }
        return "Created: " + createCount + ", Updated: " + updateCount;
    }

    @GET
    @Path("/list")
    @Produces(MediaType.APPLICATION_JSON)
    @Transactional
    public Collection<Item> list() {
        return Item.listAll();
    }

}
