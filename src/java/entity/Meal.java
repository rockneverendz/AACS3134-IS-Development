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
    , @NamedQuery(name = "Meal.findById", query = "SELECT m FROM Meal m WHERE m.id = :id")
    , @NamedQuery(name = "Meal.findByName", query = "SELECT m FROM Meal m WHERE m.name = :name")
    , @NamedQuery(name = "Meal.findByDescription", query = "SELECT m FROM Meal m WHERE m.description = :description")
    , @NamedQuery(name = "Meal.findByPrice", query = "SELECT m FROM Meal m WHERE m.price = :price")
    , @NamedQuery(name = "Meal.findByIngredient", query = "SELECT m FROM Meal m WHERE m.ingredient = :ingredient")
    , @NamedQuery(name = "Meal.findByIngredientQty", query = "SELECT m FROM Meal m WHERE m.ingredientQty = :ingredientQty")
    , @NamedQuery(name = "Meal.findByCalories", query = "SELECT m FROM Meal m WHERE m.calories = :calories")})
public class Meal implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "NAME")
    private String name;
    @Column(name = "DESCRIPTION")
    private String description;
    @Basic(optional = false)
    @Lob
    @Column(name = "DAY")
    private byte[] day;
    @Basic(optional = false)
    @Column(name = "PRICE")
    private double price;
    @Basic(optional = false)
    @Column(name = "INGREDIENT")
    private String ingredient;
    @Basic(optional = false)
    @Column(name = "INGREDIENT_QTY")
    private double ingredientQty;
    @Basic(optional = false)
    @Column(name = "CALORIES")
    private int calories;
    @Lob
    @Column(name = "IMAGE")
    private byte[] image;
    @JoinColumn(name = "CATEGORYID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Category categoryid;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "meal")
    private List<Orderlist> orderlistList;

    public Meal() {
    }

    public Meal(Integer id) {
        this.id = id;
    }

    public Meal(Integer id, String name, byte[] day, double price, String ingredient, double ingredientQty, int calories) {
        this.id = id;
        this.name = name;
        this.day = day;
        this.price = price;
        this.ingredient = ingredient;
        this.ingredientQty = ingredientQty;
        this.calories = calories;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public byte[] getDay() {
        return day;
    }

    public void setDay(byte[] day) {
        this.day = day;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getIngredient() {
        return ingredient;
    }

    public void setIngredient(String ingredient) {
        this.ingredient = ingredient;
    }

    public double getIngredientQty() {
        return ingredientQty;
    }

    public void setIngredientQty(double ingredientQty) {
        this.ingredientQty = ingredientQty;
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

    public Category getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Category categoryid) {
        this.categoryid = categoryid;
    }

    @XmlTransient
    public List<Orderlist> getOrderlistList() {
        return orderlistList;
    }

    public void setOrderlistList(List<Orderlist> orderlistList) {
        this.orderlistList = orderlistList;
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
        if (!(object instanceof Meal)) {
            return false;
        }
        Meal other = (Meal) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Meal[ id=" + id + " ]";
    }

}