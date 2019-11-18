package eu.paulrobinson.pricewatcher.loader;

import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;

import javax.ws.rs.*;
import java.util.Collection;
import java.util.List;

@Path("/v3")
@RegisterRestClient
@Produces("application/json")
@Consumes("application/json")
public interface CEXService {

    @GET
    @Path("/boxes")
    @Produces("application/json")
    Boxes getBoxes(@QueryParam("categoryIds") String categoryIds, @QueryParam("firstRecord") int firstRecord, @QueryParam("count") int count);

}
