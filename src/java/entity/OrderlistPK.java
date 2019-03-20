package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class OrderlistPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "MEAL_ID")
    private int mealId;
    @Basic(optional = false)
    @Column(name = "ORDER_ID")
    private int orderId;

    public OrderlistPK() {
    }

    public OrderlistPK(int mealId, int orderId) {
        this.mealId = mealId;
        this.orderId = orderId;
    }

    public int getMealId() {
        return mealId;
    }

    public void setMealId(int mealId) {
        this.mealId = mealId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) mealId;
        hash += (int) orderId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderlistPK)) {
            return false;
        }
        OrderlistPK other = (OrderlistPK) object;
        if (this.mealId != other.mealId) {
            return false;
        }
        if (this.orderId != other.orderId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.OrderlistPK[ mealId=" + mealId + ", orderId=" + orderId + " ]";
    }

}