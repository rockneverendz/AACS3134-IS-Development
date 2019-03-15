package entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "MEALORDER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Mealorder.findAll", query = "SELECT m FROM Mealorder m")
    , @NamedQuery(name = "Mealorder.findById", query = "SELECT m FROM Mealorder m WHERE m.id = :id")
    , @NamedQuery(name = "Mealorder.findByStutus", query = "SELECT m FROM Mealorder m WHERE m.stutus = :stutus")
    , @NamedQuery(name = "Mealorder.findByRedeemDate", query = "SELECT m FROM Mealorder m WHERE m.redeemDate = :redeemDate")
    , @NamedQuery(name = "Mealorder.findByRedeemTime", query = "SELECT m FROM Mealorder m WHERE m.redeemTime = :redeemTime")})
public class Mealorder implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "STUTUS")
    private String stutus;
    @Column(name = "REDEEM_DATE")
    @Temporal(TemporalType.DATE)
    private Date redeemDate;
    @Column(name = "REDEEM_TIME")
    @Temporal(TemporalType.TIME)
    private Date redeemTime;
    @JoinColumn(name = "CATEGORYID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Category categoryid;
    @JoinColumn(name = "CUSTID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Customer custid;
    @JoinColumn(name = "PAYMENTID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Payment paymentid;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "mealorder")
    private List<Orderlist> orderlistList;

    public Mealorder() {
    }

    public Mealorder(Integer id) {
        this.id = id;
    }

    public Mealorder(Integer id, String stutus) {
        this.id = id;
        this.stutus = stutus;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStutus() {
        return stutus;
    }

    public void setStutus(String stutus) {
        this.stutus = stutus;
    }

    public Date getRedeemDate() {
        return redeemDate;
    }

    public void setRedeemDate(Date redeemDate) {
        this.redeemDate = redeemDate;
    }

    public Date getRedeemTime() {
        return redeemTime;
    }

    public void setRedeemTime(Date redeemTime) {
        this.redeemTime = redeemTime;
    }

    public Category getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Category categoryid) {
        this.categoryid = categoryid;
    }

    public Customer getCustid() {
        return custid;
    }

    public void setCustid(Customer custid) {
        this.custid = custid;
    }

    public Payment getPaymentid() {
        return paymentid;
    }

    public void setPaymentid(Payment paymentid) {
        this.paymentid = paymentid;
    }

    @XmlTransient
    public List<Orderlist> getOrderlistList() {
        return orderlistList;
    }

    public void setOrderlistList(List<Orderlist> orderlistList) {
        this.orderlistList = orderlistList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Mealorder)) {
            return false;
        }
        Mealorder other = (Mealorder) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Mealorder[ id=" + id + " ]";
    }

}