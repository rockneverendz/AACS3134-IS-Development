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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "PACKAGE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Package.findAll", query = "SELECT p FROM Package p")
    , @NamedQuery(name = "Package.findByPackageId", query = "SELECT p FROM Package p WHERE p.packageId = :packageId")
    , @NamedQuery(name = "Package.findByType", query = "SELECT p FROM Package p WHERE p.type = :type")
    , @NamedQuery(name = "Package.findByStartDate", query = "SELECT p FROM Package p WHERE p.startDate = :startDate")})
public class Package implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "PACKAGE_ID")
    private Integer packageId;
    @Basic(optional = false)
    @Column(name = "TYPE")
    private String type;
    @Basic(optional = false)
    @Column(name = "START_DATE")
    @Temporal(TemporalType.DATE)
    private Date startDate;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "package1")
    private List<Packageist> packageistList;

    public Package() {
    }

    public Package(Integer packageId) {
        this.packageId = packageId;
    }

    public Package(Integer packageId, String type, Date startDate) {
        this.packageId = packageId;
        this.type = type;
        this.startDate = startDate;
    }

    public Integer getPackageId() {
        return packageId;
    }

    public void setPackageId(Integer packageId) {
        this.packageId = packageId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    @XmlTransient
    public List<Packageist> getPackageistList() {
        return packageistList;
    }

    public void setPackageistList(List<Packageist> packageistList) {
        this.packageistList = packageistList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (packageId != null ? packageId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Package)) {
            return false;
        }
        Package other = (Package) object;
        if ((this.packageId == null && other.packageId != null) || (this.packageId != null && !this.packageId.equals(other.packageId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Package[ packageId=" + packageId + " ]";
    }

}