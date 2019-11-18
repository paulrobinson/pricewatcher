package eu.paulrobinson.pricewatcher.entities;

import io.quarkus.hibernate.orm.panache.PanacheEntity;

import javax.persistence.Entity;
import java.util.Date;

@Entity
public class Price extends PanacheEntity {

    public Double sellPrice;
    public Double cashPrice;
    public Double exchangePrice;
    public Date date;

    public Price() {
    }

    public Price(Double sellPrice, Double cashPrice, Double exchangePrice) {
        this.sellPrice = sellPrice;
        this.cashPrice = cashPrice;
        this.exchangePrice = exchangePrice;
        date = new Date(System.currentTimeMillis());
    }
}
