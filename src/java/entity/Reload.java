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
    @NamedQuery(name = "Reload.findAll", query = "SELECT r FROM Reload r")
    , @NamedQuery(name = "Reload.findById", query = "SELECT r FROM Reload r WHERE r.id = :id")
    , @NamedQuery(name = "Reload.findByDate", query = "SELECT r FROM Reload r WHERE r.date = :date")
    , @NamedQuery(name = "Reload.findByTime", query = "SELECT r FROM Reload r WHERE r.time = :time")
    , @NamedQuery(name = "Reload.findByAmount", query = "SELECT r FROM Reload r WHERE r.amount = :amount")})
public class Reload implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
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
    @JoinColumn(name = "CUSTID", referencedColumnName = "ID")
    @ManyToOne
    private Customer custid;
    @JoinColumn(name = "STAFFID", referencedColumnName = "ID")
    @ManyToOne
    private Staff staffid;

    public Reload() {
    }

    public Reload(Integer id) {
        this.id = id;
    }

    public Reload(Integer id, Date date, Date time, double amount) {
        this.id = id;
        this.date = date;
        this.time = time;
        this.amount = amount;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Customer getCustid() {
        return custid;
    }

    public void setCustid(Customer custid) {
        this.custid = custid;
    }

    public Staff getStaffid() {
        return staffid;
    }

    public void setStaffid(Staff staffid) {
        this.staffid = staffid;
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
        if (!(object instanceof Reload)) {
            return false;
        }
        Reload other = (Reload) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Reload[ id=" + id + " ]";
    }
    
}
