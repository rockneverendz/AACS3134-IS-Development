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
@Table(name = "INGREDIENT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ingredient.findAll", query = "SELECT i FROM Ingredient i")
    , @NamedQuery(name = "Ingredient.findByIngredientId", query = "SELECT i FROM Ingredient i WHERE i.ingredientId = :ingredientId")
    , @NamedQuery(name = "Ingredient.findByIngredientName", query = "SELECT i FROM Ingredient i WHERE i.ingredientName = :ingredientName")})
public class Ingredient implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "INGREDIENT_ID")
    private Integer ingredientId;
    @Basic(optional = false)
    @Column(name = "INGREDIENT_NAME")
    private String ingredientName;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ingredient")
    private List<Ingredientlist> ingredientlistList;

    public Ingredient() {
    }

    public Ingredient(Integer ingredientId) {
        this.ingredientId = ingredientId;
    }

    public Ingredient(Integer ingredientId, String ingredientName) {
        this.ingredientId = ingredientId;
        this.ingredientName = ingredientName;
    }

    public Integer getIngredientId() {
        return ingredientId;
    }

    public void setIngredientId(Integer ingredientId) {
        this.ingredientId = ingredientId;
    }

    public String getIngredientName() {
        return ingredientName;
    }

    public void setIngredientName(String ingredientName) {
        this.ingredientName = ingredientName;
    }

    @XmlTransient
    public List<Ingredientlist> getIngredientlistList() {
        return ingredientlistList;
    }

    public void setIngredientlistList(List<Ingredientlist> ingredientlistList) {
        this.ingredientlistList = ingredientlistList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ingredientId != null ? ingredientId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ingredient)) {
            return false;
        }
        Ingredient other = (Ingredient) object;
        if ((this.ingredientId == null && other.ingredientId != null) || (this.ingredientId != null && !this.ingredientId.equals(other.ingredientId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Ingredient[ ingredientId=" + ingredientId + " ]";
    }

}