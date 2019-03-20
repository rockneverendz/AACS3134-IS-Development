package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "ORDERLIST")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orderlist.findAll", query = "SELECT o FROM Orderlist o")
    , @NamedQuery(name = "Orderlist.findByMealId", query = "SELECT o FROM Orderlist o WHERE o.orderlistPK.mealId = :mealId")
    , @NamedQuery(name = "Orderlist.findByOrderId", query = "SELECT o FROM Orderlist o WHERE o.orderlistPK.orderId = :orderId")
    , @NamedQuery(name = "Orderlist.findByQuantity", query = "SELECT o FROM Orderlist o WHERE o.quantity = :quantity")
    , @NamedQuery(name = "Orderlist.findByPriceeach", query = "SELECT o FROM Orderlist o WHERE o.priceeach = :priceeach")})
public class Orderlist implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected OrderlistPK orderlistPK;
    @Basic(optional = false)
    @Column(name = "QUANTITY")
    private int quantity;
    @Basic(optional = false)
    @Column(name = "PRICEEACH")
    private double priceeach;
    @JoinColumn(name = "MEAL_ID", referencedColumnName = "MEAL_ID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Meal meal;
    @JoinColumn(name = "ORDER_ID", referencedColumnName = "ORDER_ID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Order1 order1;

    public Orderlist() {
    }

    public Orderlist(OrderlistPK orderlistPK) {
        this.orderlistPK = orderlistPK;
    }

    public Orderlist(OrderlistPK orderlistPK, int quantity, double priceeach) {
        this.orderlistPK = orderlistPK;
        this.quantity = quantity;
        this.priceeach = priceeach;
    }

    public Orderlist(int mealId, int orderId) {
        this.orderlistPK = new OrderlistPK(mealId, orderId);
    }

    public OrderlistPK getOrderlistPK() {
        return orderlistPK;
    }

    public void setOrderlistPK(OrderlistPK orderlistPK) {
        this.orderlistPK = orderlistPK;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPriceeach() {
        return priceeach;
    }

    public void setPriceeach(double priceeach) {
        this.priceeach = priceeach;
    }

    public Meal getMeal() {
        return meal;
    }

    public void setMeal(Meal meal) {
        this.meal = meal;
    }

    public Order1 getOrder1() {
        return order1;
    }

    public void setOrder1(Order1 order1) {
        this.order1 = order1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderlistPK != null ? orderlistPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orderlist)) {
            return false;
        }
        Orderlist other = (Orderlist) object;
        if ((this.orderlistPK == null && other.orderlistPK != null) || (this.orderlistPK != null && !this.orderlistPK.equals(other.orderlistPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Orderlist[ orderlistPK=" + orderlistPK + " ]";
    }

}