package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class PackageistPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "PACKAGE_ID")
    private int packageId;
    @Basic(optional = false)
    @Column(name = "DAY_OF_WEEK")
    private int dayOfWeek;

    public PackageistPK() {
    }

    public PackageistPK(int packageId, int dayOfWeek) {
        this.packageId = packageId;
        this.dayOfWeek = dayOfWeek;
    }

    public int getPackageId() {
        return packageId;
    }

    public void setPackageId(int packageId) {
        this.packageId = packageId;
    }

    public int getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(int dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) packageId;
        hash += (int) dayOfWeek;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PackageistPK)) {
            return false;
        }
        PackageistPK other = (PackageistPK) object;
        if (this.packageId != other.packageId) {
            return false;
        }
        if (this.dayOfWeek != other.dayOfWeek) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.PackageistPK[ packageId=" + packageId + ", dayOfWeek=" + dayOfWeek + " ]";
    }

}