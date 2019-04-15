package entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "RELOAD")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Reload.findAll", query = "SELECT r FROM Reload r"),
    @NamedQuery(name = "Reload.findByReloadId", query = "SELECT r FROM Reload r WHERE r.reloadId = :reloadId"),
    @NamedQuery(name = "Reload.findByDate", query = "SELECT r FROM Reload r WHERE r.date = :date"),
    @NamedQuery(name = "Reload.findByTime", query = "SELECT r FROM Reload r WHERE r.time = :time"),
    @NamedQuery(name = "Reload.findByAmount", query = "SELECT r FROM Reload r WHERE r.amount = :amount")})
public class Reload implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "RELOAD_ID")
    private Integer reloadId;
    @Basic(optional = false)
    @Column(name = "DATE")
    @Temporal(TemporalType.DATE)
    private Date date;
    @Basic(optional = false)
    @Column(name = "TIME")
    @Temporal(TemporalType.TIME)
    private Date time;
    @Basic(optional = false)
    @Column(name = "AMOUNT")
    private double amount;
    @JoinColumn(name = "CUST_ID", referencedColumnName = "CUST_ID")
    @ManyToOne
    private Customer custId;
    @JoinColumn(name = "STAFF_ID", referencedColumnName = "STAFF_ID")
    @ManyToOne
    private Staff staffId;

    public Reload() {
    }

    public Reload(Integer reloadId) {
        this.reloadId = reloadId;
    }

    public Reload(Integer reloadId, Date date, Date time, double amount) {
        this.reloadId = reloadId;
        this.date = date;
        this.time = time;
        this.amount = amount;
    }

    public Integer getReloadId() {
        return reloadId;
    }

    public void setReloadId(Integer reloadId) {
        this.reloadId = reloadId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Customer getCustId() {
        return custId;
    }

    public void setCustId(Customer custId) {
        this.custId = custId;
    }

    public Staff getStaffId() {
        return staffId;
    }

    public void setStaffId(Staff staffId) {
        this.staffId = staffId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (reloadId != null ? reloadId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Reload)) {
            return false;
        }
        Reload other = (Reload) object;
        if ((this.reloadId == null && other.reloadId != null) || (this.reloadId != null && !this.reloadId.equals(other.reloadId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Reload[ reloadId=" + reloadId + " ]";
    }

}
