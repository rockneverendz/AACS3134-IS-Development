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
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "MEAL")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Meal.findAll", query = "SELECT m FROM Meal m")
    , @NamedQuery(name = "Meal.findByMealId", query = "SELECT m FROM Meal m WHERE m.mealId = :mealId")
    , @NamedQuery(name = "Meal.findByName", query = "SELECT m FROM Meal m WHERE m.name = :name")
    , @NamedQuery(name = "Meal.findByDescription", query = "SELECT m FROM Meal m WHERE m.description = :description")
    , @NamedQuery(name = "Meal.findByPrice", query = "SELECT m FROM Meal m WHERE m.price = :price")
    , @NamedQuery(name = "Meal.findByAvailability", query = "SELECT m FROM Meal m WHERE m.availability = :availability")
    , @NamedQuery(name = "Meal.findByCalories", query = "SELECT m FROM Meal m WHERE m.calories = :calories")
    , @NamedQuery(name = "Meal.findByCategoryId", query = "SELECT m FROM Meal m WHERE m.categoryId = :categoryId")})
public class Meal implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "MEAL_ID")
    private Integer mealId;
    @Basic(optional = false)
    @Column(name = "NAME")
    private String name;
    @Column(name = "DESCRIPTION")
    private String description;
    @Basic(optional = false)
    @Column(name = "PRICE")
    private double price;
    @Basic(optional = false)
    @Column(name = "AVAILABILITY")
    private Boolean availability;
    @Basic(optional = false)
    @Column(name = "CALORIES")
    private int calories;
    @Lob
    @Column(name = "IMAGE")
    private byte[] image;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "meal")
    private List<Ingredientlist> ingredientlistList;
    @JoinColumn(name = "CATEGORY_ID", referencedColumnName = "CATEGORY_ID")
    @ManyToOne(optional = false)
    private Category categoryId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "meal")
    private List<Orderlist> orderlistList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "mealId")
    private List<Packageist> packageistList;

    public Meal() {
    }

    public Meal(Integer mealId) {
        this.mealId = mealId;
    }

    public Meal(Integer mealId, String name, double price, Boolean availability, int calories) {
        this.mealId = mealId;
        this.name = name;
        this.price = price;
        this.availability = availability;
        this.calories = calories;
    }

    public Integer getMealId() {
        return mealId;
    }

    public void setMealId(Integer mealId) {
        this.mealId = mealId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Boolean getAvailability() {
        return availability;
    }

    public void setAvailability(Boolean availability) {
        this.availability = availability;
    }

    public int getCalories() {
        return calories;
    }

    public void setCalories(int calories) {
        this.calories = calories;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    @XmlTransient
    public List<Ingredientlist> getIngredientlistList() {
        return ingredientlistList;
    }

    public void setIngredientlistList(List<Ingredientlist> ingredientlistList) {
        this.ingredientlistList = ingredientlistList;
    }

    public Category getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Category categoryId) {
        this.categoryId = categoryId;
    }

    @XmlTransient
    public List<Orderlist> getOrderlistList() {
        return orderlistList;
    }

    public void setOrderlistList(List<Orderlist> orderlistList) {
        this.orderlistList = orderlistList;
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
        hash += (mealId != null ? mealId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Meal)) {
            return false;
        }
        Meal other = (Meal) object;
        if ((this.mealId == null && other.mealId != null) || (this.mealId != null && !this.mealId.equals(other.mealId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Meal[ mealId=" + mealId + " ]";
    }

}