package entity;

import java.io.Serializable;
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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "PACKAGE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Package.findAll", query = "SELECT p FROM Package p"),
    @NamedQuery(name = "Package.findByPackageId", query = "SELECT p FROM Package p WHERE p.packageId = :packageId"),
    @NamedQuery(name = "Package.findByDescription", query = "SELECT p FROM Package p WHERE p.description = :description"),
    @NamedQuery(name = "Package.findByAvailability", query = "SELECT p FROM Package p WHERE p.availability = :availability"),
    @NamedQuery(name = "Package.findByPackageTime", query = "SELECT p FROM Package p WHERE p.packageTime = :packageTime")})
public class Package implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "PACKAGE_ID")
    private Integer packageId;
    @Column(name = "DESCRIPTION")
    private String description;
    @Basic(optional = false)
    @Column(name = "AVAILABILITY")
    private Boolean availability;
    @Basic(optional = false)
    @Column(name = "PACKAGE_TIME")
    private String packageTime;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "package1")
    private List<Packageist> packageistList;

    public Package() {
    }

    public Package(Integer packageId) {
        this.packageId = packageId;
    }

    public Package(Integer packageId, Boolean availability, String packageTime) {
        this.packageId = packageId;
        this.availability = availability;
        this.packageTime = packageTime;
    }

    public Integer getPackageId() {
        return packageId;
    }

    public void setPackageId(Integer packageId) {
        this.packageId = packageId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getAvailability() {
        return availability;
    }

    public void setAvailability(Boolean availability) {
        this.availability = availability;
    }

    public String getPackageTime() {
        return packageTime;
    }

    public void setPackageTime(String packageTime) {
        this.packageTime = packageTime;
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
