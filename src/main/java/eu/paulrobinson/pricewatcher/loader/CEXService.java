package eu.paulrobinson.pricewatcher.loader;

import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;

import javax.ws.rs.*;

@Path("/v3")
@RegisterRestClient
@Produces("application/json")
@Consumes("application/json")
public interface CEXService {

    public static final String SORT_BY_RELEVANCE = "relevance";
    public static final String SORT_ORDER_DESC = "desc";
    public static final String USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36";

    //categoryIds=[1064]&firstRecord=151&count=50&sortBy=relevance&sortOrder=desc
    @GET
    @Path("/boxes")
    @Produces("application/json")
    Boxes getBoxes(@QueryParam("categoryIds") String categoryIds, @QueryParam("firstRecord") int firstRecord, @QueryParam("count") int count, @QueryParam("sortBy") String sortBy, @QueryParam("sortOrder") String sortOrder, @HeaderParam("User-Agent") String userAgent);

}
