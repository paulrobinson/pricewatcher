package eu.paulrobinson.pricewatcher.loader;

import com.fasterxml.jackson.annotation.*;
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

            @JsonIgnoreProperties(ignoreUnknown = true)
            public static class Box {

                public String boxId;
                public String boxName;
                public String categoryId;
                public Double sellPrice;
                public Double cashPrice;
                public Double exchangePrice;
            };
        };
    };

    public Collection<Response.Data.Box> getBoxes() {
        return response.data.boxes;
    }

    public boolean isEmpty() {
        return response.data == null;
    }

}
