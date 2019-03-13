package service;

import entity.Meal;
import javax.persistence.*;
import java.util.List;

public class ReloadService {

    EntityManager em;

    public ReloadService() {
        EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("AACS3134-IS-DevelopmentPU");
        this.em = emfactory.createEntityManager();
    }

    public void addMeal(Meal meal) throws RollbackException {
        em.getTransaction().begin();
        em.persist(meal);
        em.getTransaction().commit();
    }

    /**
     * @param id ID of the meal which needs to be deleted
     * @return true if successfully committed false if meal not found
     * @throws RollbackException If commit fails
     */
    public boolean deleteMeal(int id) throws RollbackException {
        Meal meal = findMealByID(id);
        if (meal != null) {
            em.getTransaction().begin();
            em.remove(meal);
            em.getTransaction().commit();
            return true;
        }
        return false;
    }

    public Meal findMealByID(int id) {
        return (Meal) em.find(Meal.class, id);
    }

    /**
     * @param newMeal The modified meal
     * @return true if successfully committed false if meal not found
     * @throws RollbackException If commit fails
     */
    public boolean updateMeal(Meal newMeal) throws RollbackException {
        Meal oldMeal = findMealByID(newMeal.getId());
        if (oldMeal != null) {
            em.getTransaction().begin();
            oldMeal.setName(newMeal.getName());
            oldMeal.setDescription(newMeal.getDescription());
            oldMeal.setDay(newMeal.getDay());
            oldMeal.setPrice(newMeal.getPrice());
            oldMeal.setIngredient(newMeal.getIngredient());
            oldMeal.setIngredientQty(newMeal.getIngredientQty());
            oldMeal.setCalories(newMeal.getCalories());
            oldMeal.setImage(newMeal.getImage());
            oldMeal.setCategoryid(newMeal.getCategoryid());
            em.getTransaction().commit();
            return true;
        }
        return false;
    }

    public List<Meal> findAll() {
        List MealList = em.createNamedQuery("Meal.findAll").getResultList();
        return MealList;
    }

    public void close() {
        this.em.close();
    }
}
