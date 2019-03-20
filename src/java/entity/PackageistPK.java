package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class PackageistPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "MEAL_ID")
    private int mealId;
    @Basic(optional = false)
    @Column(name = "PACKAGE_ID")
    private int packageId;

    public PackageistPK() {
    }

    public PackageistPK(int mealId, int packageId) {
        this.mealId = mealId;
        this.packageId = packageId;
    }

    public int getMealId() {
        return mealId;
    }

    public void setMealId(int mealId) {
        this.mealId = mealId;
    }

    public int getPackageId() {
        return packageId;
    }

    public void setPackageId(int packageId) {
        this.packageId = packageId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) mealId;
        hash += (int) packageId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PackageistPK)) {
            return false;
        }
        PackageistPK other = (PackageistPK) object;
        if (this.mealId != other.mealId) {
            return false;
        }
        if (this.packageId != other.packageId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.PackageistPK[ mealId=" + mealId + ", packageId=" + packageId + " ]";
    }

}