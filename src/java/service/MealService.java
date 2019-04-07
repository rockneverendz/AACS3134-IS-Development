package service;

import entity.Category;
import entity.Ingredientlist;
import entity.IngredientlistPK;
import entity.Meal;
import java.util.ArrayList;
import javax.persistence.*;
import java.util.List;

public class MealService {

    EntityManager em;

    public MealService() {
        EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("AACS3134-IS-DevelopmentPU");
        this.em = emfactory.createEntityManager();
    }

    public void addMeal(Meal meal, ArrayList<Ingredientlist> arrayList) throws RollbackException {
        em.getTransaction().begin();
        em.persist(meal);
        em.getTransaction().commit();

        arrayList.stream().map((ingredientlist) -> {
            ingredientlist.setMeal(meal);
            return ingredientlist;
        }).forEachOrdered((ingredientlist) -> {
            ingredientlist.setIngredientlistPK(
                    new IngredientlistPK(
                            meal.getMealId(),
                            ingredientlist.getIngredient().getIngredientId()
                    )
            );
        });

        em.getTransaction().begin();
        meal.setIngredientlistList(arrayList);
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

    public List<Meal> findMealByCategoryID(Category categoryId) {
        return (List<Meal>) em.createNamedQuery("Meal.findByCategoryId")
                .setParameter("categoryId", categoryId)
                .getResultList();
    }

    public List<Meal> findMealByAvailability(Boolean availability) {
        return (List<Meal>) em.createNamedQuery("Meal.findByAvailability")
                .setParameter("availability", availability)
                .getResultList();
    }

    /**
     * @param newMeal The modified meal
     * @param arrayList The list of ingredients
     * @return true if successfully committed false if meal not found
     * @throws RollbackException If commit fails
     */
    public boolean updateMeal(Meal newMeal, ArrayList<Ingredientlist> arrayList) throws RollbackException {
        Meal oldMeal = findMealByID(newMeal.getMealId());
        if (oldMeal != null) {

            em.getTransaction().begin();
            // DO NOT USE FUNCTIONAL OPERATION
            for (Ingredientlist ingredientlist : oldMeal.getIngredientlistList()) {
                em.remove(ingredientlist);
            }
            em.getTransaction().commit();

            arrayList.stream().map((ingredientlist) -> {
                ingredientlist.setMeal(newMeal);
                return ingredientlist;
            }).forEachOrdered((ingredientlist) -> {
                ingredientlist.setIngredientlistPK(
                        new IngredientlistPK(
                                oldMeal.getMealId(),
                                ingredientlist.getIngredient().getIngredientId()
                        )
                );
            });

            em.getTransaction().begin();
            oldMeal.setName(newMeal.getName());
            oldMeal.setDescription(newMeal.getDescription());
            oldMeal.setPrice(newMeal.getPrice());
            oldMeal.setIngredientlistList(arrayList);
            oldMeal.setCalories(newMeal.getCalories());
            oldMeal.setImage(newMeal.getImage());
            oldMeal.setCategoryId(newMeal.getCategoryId());
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
