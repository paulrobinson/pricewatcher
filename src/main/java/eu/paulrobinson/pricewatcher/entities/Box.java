package eu.paulrobinson.pricewatcher.entities;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Box {

        public String boxId;
        public String boxName;
        public String categoryId;
        public Double sellPrice;
        public Double cashPrice;
        public Double exchangePrice;
}
