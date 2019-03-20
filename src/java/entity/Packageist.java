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
@Table(name = "PACKAGEIST")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Packageist.findAll", query = "SELECT p FROM Packageist p")
    , @NamedQuery(name = "Packageist.findByMealId", query = "SELECT p FROM Packageist p WHERE p.packageistPK.mealId = :mealId")
    , @NamedQuery(name = "Packageist.findByPackageId", query = "SELECT p FROM Packageist p WHERE p.packageistPK.packageId = :packageId")
    , @NamedQuery(name = "Packageist.findByQuantity", query = "SELECT p FROM Packageist p WHERE p.quantity = :quantity")
    , @NamedQuery(name = "Packageist.findByPriceeach", query = "SELECT p FROM Packageist p WHERE p.priceeach = :priceeach")})
public class Packageist implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected PackageistPK packageistPK;
    @Basic(optional = false)
    @Column(name = "QUANTITY")
    private int quantity;
    @Basic(optional = false)
    @Column(name = "PRICEEACH")
    private double priceeach;
    @JoinColumn(name = "MEAL_ID", referencedColumnName = "MEAL_ID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Meal meal;
    @JoinColumn(name = "PACKAGE_ID", referencedColumnName = "PACKAGE_ID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Package package1;

    public Packageist() {
    }

    public Packageist(PackageistPK packageistPK) {
        this.packageistPK = packageistPK;
    }

    public Packageist(PackageistPK packageistPK, int quantity, double priceeach) {
        this.packageistPK = packageistPK;
        this.quantity = quantity;
        this.priceeach = priceeach;
    }

    public Packageist(int mealId, int packageId) {
        this.packageistPK = new PackageistPK(mealId, packageId);
    }

    public PackageistPK getPackageistPK() {
        return packageistPK;
    }

    public void setPackageistPK(PackageistPK packageistPK) {
        this.packageistPK = packageistPK;
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

    public Package getPackage1() {
        return package1;
    }

    public void setPackage1(Package package1) {
        this.package1 = package1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (packageistPK != null ? packageistPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Packageist)) {
            return false;
        }
        Packageist other = (Packageist) object;
        if ((this.packageistPK == null && other.packageistPK != null) || (this.packageistPK != null && !this.packageistPK.equals(other.packageistPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Packageist[ packageistPK=" + packageistPK + " ]";
    }

}