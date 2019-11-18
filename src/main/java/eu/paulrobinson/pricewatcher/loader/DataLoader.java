package eu.paulrobinson.pricewatcher.loader;

import eu.paulrobinson.pricewatcher.entities.Box;
import org.eclipse.microprofile.rest.client.inject.RestClient;

import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.Collection;
import java.util.List;

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
        Collection<Box> boxes =  cexService.getBoxes("[1064]", 1, 5).getBoxes();

        int updateCount = 0;
        int createCount = 0;

        for (Box box : boxes) {

            Box existingBox = Box.findByBoxId(box.boxId);
            if (existingBox == null) {
                box.persist();
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
    public Collection<Box> list() {
        return Box.listAll();
    }

}
