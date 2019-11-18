package eu.paulrobinson.pricewatcher.loader;

import eu.paulrobinson.pricewatcher.entities.Box;
import org.eclipse.microprofile.rest.client.inject.RestClient;

import javax.inject.Inject;
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
    @Produces(MediaType.APPLICATION_JSON)
    public Collection<Box> hello() {
        System.out.println("called");
        return cexService.getBoxes("[1064]", 1, 5).getBoxes();
    }

}
