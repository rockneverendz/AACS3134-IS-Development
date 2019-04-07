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
    @Basic(optional = false)
    @Column(name = "COUPON_ID")
    private int couponId;

    public OrderlistPK() {
    }

    public OrderlistPK(int mealId, int orderId, int couponId) {
        this.mealId = mealId;
        this.orderId = orderId;
        this.couponId = couponId;
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

    public int getCouponId() {
        return couponId;
    }

    public void setCouponId(int couponId) {
        this.couponId = couponId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) mealId;
        hash += (int) orderId;
        hash += (int) couponId;
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
        if (this.couponId != other.couponId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.OrderlistPK[ mealId=" + mealId + ", orderId=" + orderId + ", couponId=" + couponId + " ]";
    }

}