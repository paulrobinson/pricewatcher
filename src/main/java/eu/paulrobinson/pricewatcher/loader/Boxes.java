package eu.paulrobinson.pricewatcher.loader;

import com.fasterxml.jackson.annotation.*;
import eu.paulrobinson.pricewatcher.entities.Box;

import java.util.Collection;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Boxes {

    public Response response;

    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Response {

        public Data data;

        @JsonIgnoreProperties(ignoreUnknown = true)
        public static class Data {

            public Collection<Box> boxes;
        };
    };

    public Collection<Box> getBoxes() {
        return response.data.boxes;
    }

}
