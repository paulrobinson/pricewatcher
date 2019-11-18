package eu.paulrobinson.pricewatcher.entities;

import io.quarkus.hibernate.orm.panache.PanacheEntity;

import javax.persistence.Entity;
import javax.persistence.Id;


@Entity
public class Item extends PanacheEntity {
        
        public String externalId;
        public String name;
        public String categoryId;
        public Double sellPrice;
        public Double cashPrice;
        public Double exchangePrice;

        public static Item findByExternalId(String externalId) {
                return find("externalId", externalId).firstResult();
        }
}
