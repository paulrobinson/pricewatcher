package eu.paulrobinson.pricewatcher.entities;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import io.quarkus.hibernate.orm.panache.PanacheEntity;

import javax.persistence.Entity;

@JsonIgnoreProperties(ignoreUnknown = true)
@Entity
public class Box extends PanacheEntity {

        public String boxId;
        public String boxName;
        public String categoryId;
        public Double sellPrice;
        public Double cashPrice;
        public Double exchangePrice;

        public static Box findByBoxId(String boxId) {
                return find("boxId", boxId).firstResult();
        }
}
