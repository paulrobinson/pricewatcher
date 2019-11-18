package eu.paulrobinson.pricewatcher.entities;

import io.quarkus.hibernate.orm.panache.PanacheEntity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import java.util.ArrayList;
import java.util.List;


@Entity
public class Item extends PanacheEntity {

        public String externalId;
        public String name;
        public String categoryId;
        @OneToMany(fetch=FetchType.EAGER)
        public List<Price> prices = new ArrayList<>();

        public static Item findByExternalId(String externalId) {
                return find("externalId", externalId).firstResult();
        }

        public Price getCurrentPrice() {
                return prices.get(0);
        }

        public void addNewPrice(Price price) {
                prices.add(price);
        }

        public boolean hasPriceChanged(Price price) {
                return (!price.sellPrice.equals(getCurrentPrice().sellPrice) || !price.exchangePrice.equals(getCurrentPrice().exchangePrice) || !price.cashPrice.equals(getCurrentPrice().cashPrice));

        }


}
