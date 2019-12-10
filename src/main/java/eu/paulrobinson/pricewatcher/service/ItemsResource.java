package eu.paulrobinson.pricewatcher.service;

import eu.paulrobinson.pricewatcher.entities.Item;

import javax.transaction.Transactional;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import java.util.Collection;

@Path("/items")
public class ItemsResource {

    @GET
    @Path("/list")
    @Produces(MediaType.APPLICATION_JSON)
    @Transactional
    public Collection<Item> list() {
        return Item.listAll();
    }

    @GET
    @Path("/search")
    @Produces(MediaType.APPLICATION_JSON)
    @Transactional
    public Collection<Item> search(@QueryParam("query") String query) {
        return Item.findByName(query);
    }
}