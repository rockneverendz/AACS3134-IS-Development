package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class IngredientlistPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "MEAL_ID")
    private int mealId;
    @Basic(optional = false)
    @Column(name = "INGREDIENT_ID")
    private int ingredientId;

    public IngredientlistPK() {
    }

    public IngredientlistPK(int mealId, int ingredientId) {
        this.mealId = mealId;
        this.ingredientId = ingredientId;
    }

    public int getMealId() {
        return mealId;
    }

    public void setMealId(int mealId) {
        this.mealId = mealId;
    }

    public int getIngredientId() {
        return ingredientId;
    }

    public void setIngredientId(int ingredientId) {
        this.ingredientId = ingredientId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) mealId;
        hash += (int) ingredientId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof IngredientlistPK)) {
            return false;
        }
        IngredientlistPK other = (IngredientlistPK) object;
        if (this.mealId != other.mealId) {
            return false;
        }
        if (this.ingredientId != other.ingredientId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.IngredientlistPK[ mealId=" + mealId + ", ingredientId=" + ingredientId + " ]";
    }

}
