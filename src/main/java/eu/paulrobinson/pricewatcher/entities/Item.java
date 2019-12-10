package eu.paulrobinson.pricewatcher.entities;

import io.quarkus.hibernate.orm.panache.PanacheEntity;
import io.quarkus.panache.common.Sort;

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

        public Item(String externalId, String name, String categoryId) {
                this.externalId = externalId;
                this.name = name;
                this.categoryId = categoryId;
        }

        public Item() {
        }

        public static Item findByExternalId(String externalId) {
                return find("externalId", externalId).firstResult();
        }

        public static List<Item> findByName(String name) {

                return list("name LIKE ?1", Sort.by("name"),"%"+name+"%");
        }

        public void addNewPrice(Price price) {
                prices.add(price);
        }

        public boolean hasPriceChanged(Price price) {
                return (!price.sellPrice.equals(getLatestPrice().sellPrice) || !price.exchangePrice.equals(getLatestPrice().exchangePrice) || !price.cashPrice.equals(getLatestPrice().cashPrice));

        }

        public Price getLatestPrice() {
                Price latestPrice = prices.get(0);
                for (Price p : prices) {
                        if (p.date.after(latestPrice.date)) {
                                latestPrice = p;
                        }
                }
                return latestPrice;
        }
}
