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
@Table(name = "INGREDIENTLIST")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ingredientlist.findAll", query = "SELECT i FROM Ingredientlist i")
    , @NamedQuery(name = "Ingredientlist.findByMealId", query = "SELECT i FROM Ingredientlist i WHERE i.ingredientlistPK.mealId = :mealId")
    , @NamedQuery(name = "Ingredientlist.findByIngredientId", query = "SELECT i FROM Ingredientlist i WHERE i.ingredientlistPK.ingredientId = :ingredientId")
    , @NamedQuery(name = "Ingredientlist.findByQuantity", query = "SELECT i FROM Ingredientlist i WHERE i.quantity = :quantity")})
public class Ingredientlist implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected IngredientlistPK ingredientlistPK;
    @Basic(optional = false)
    @Column(name = "QUANTITY")
    private double quantity;
    @JoinColumn(name = "INGREDIENT_ID", referencedColumnName = "INGREDIENT_ID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Ingredient ingredient;
    @JoinColumn(name = "MEAL_ID", referencedColumnName = "MEAL_ID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Meal meal;

    public Ingredientlist() {
    }

    public Ingredientlist(IngredientlistPK ingredientlistPK) {
        this.ingredientlistPK = ingredientlistPK;
    }

    public Ingredientlist(IngredientlistPK ingredientlistPK, double quantity) {
        this.ingredientlistPK = ingredientlistPK;
        this.quantity = quantity;
    }

    public Ingredientlist(int mealId, int ingredientId) {
        this.ingredientlistPK = new IngredientlistPK(mealId, ingredientId);
    }

    public IngredientlistPK getIngredientlistPK() {
        return ingredientlistPK;
    }

    public void setIngredientlistPK(IngredientlistPK ingredientlistPK) {
        this.ingredientlistPK = ingredientlistPK;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public Ingredient getIngredient() {
        return ingredient;
    }

    public void setIngredient(Ingredient ingredient) {
        this.ingredient = ingredient;
    }

    public Meal getMeal() {
        return meal;
    }

    public void setMeal(Meal meal) {
        this.meal = meal;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ingredientlistPK != null ? ingredientlistPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ingredientlist)) {
            return false;
        }
        Ingredientlist other = (Ingredientlist) object;
        if ((this.ingredientlistPK == null && other.ingredientlistPK != null) || (this.ingredientlistPK != null && !this.ingredientlistPK.equals(other.ingredientlistPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Ingredientlist[ ingredientlistPK=" + ingredientlistPK + " ]";
    }

}