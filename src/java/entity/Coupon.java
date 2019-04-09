package entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "COUPON")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Coupon.findAll", query = "SELECT c FROM Coupon c")
    , @NamedQuery(name = "Coupon.findByCouponId", query = "SELECT c FROM Coupon c WHERE c.couponId = :couponId")
    , @NamedQuery(name = "Coupon.findByRedeemDate", query = "SELECT c FROM Coupon c WHERE c.redeemDate = :redeemDate")
    , @NamedQuery(name = "Coupon.findByRedeemTime", query = "SELECT c FROM Coupon c WHERE c.redeemTime = :redeemTime")
    , @NamedQuery(name = "Coupon.findByStatus", query = "SELECT c FROM Coupon c WHERE c.status = :status")})
public class Coupon implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "COUPON_ID")
    private Integer couponId;
    @Column(name = "REDEEM_DATE")
    @Temporal(TemporalType.DATE)
    private Date redeemDate;
    @Basic(optional = false)
    @Column(name = "REDEEM_TIME")
    private String redeemTime;
    @Basic(optional = false)
    @Column(name = "STATUS")
    private String status;
    @OneToOne(mappedBy = "coupon")
    private Orderlist orderlist;

    public Coupon() {
    }

    public Coupon(Integer couponId) {
        this.couponId = couponId;
    }

    public Coupon(Integer couponId, String redeemTime, String status) {
        this.couponId = couponId;
        this.redeemTime = redeemTime;
        this.status = status;
    }

    public Integer getCouponId() {
        return couponId;
    }

    public void setCouponId(Integer couponId) {
        this.couponId = couponId;
    }

    public Date getRedeemDate() {
        return redeemDate;
    }

    public void setRedeemDate(Date redeemDate) {
        this.redeemDate = redeemDate;
    }

    public String getRedeemTime() {
        return redeemTime;
    }

    public void setRedeemTime(String redeemTime) {
        this.redeemTime = redeemTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @XmlTransient
    public Orderlist getOrderlist() {
        return orderlist;
    }

    public void setOrderlist(Orderlist orderlist) {
        this.orderlist = orderlist;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (couponId != null ? couponId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Coupon)) {
            return false;
        }
        Coupon other = (Coupon) object;
        if ((this.couponId == null && other.couponId != null) || (this.couponId != null && !this.couponId.equals(other.couponId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Coupon[ couponId=" + couponId + " ]";
    }

}