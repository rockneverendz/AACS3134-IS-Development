package service;

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

    /**
     * @param newMeal The modified meal
     * @return true if successfully committed false if meal not found
     * @throws RollbackException If commit fails
     */
    public boolean updateMeal(Meal newMeal, ArrayList<Ingredientlist> arrayList) throws RollbackException {
        Meal oldMeal = findMealByID(newMeal.getMealId());
        if (oldMeal != null) {
            
            IngredientlistPK ingredientlistPK;

            for (Ingredientlist ingredientlist : arrayList) {

                ingredientlistPK = new IngredientlistPK(
                        oldMeal.getMealId(),
                        ingredientlist.getIngredient().getIngredientId()
                );

                ingredientlist.setMeal(newMeal);
                ingredientlist.setIngredientlistPK(ingredientlistPK);

            }
            
            em.getTransaction().begin();
            oldMeal.setName(newMeal.getName());
            oldMeal.setDescription(newMeal.getDescription());
            oldMeal.setDay(newMeal.getDay());
            oldMeal.setPrice(newMeal.getPrice());
            oldMeal.setIngredientId(newMeal.getIngredientId());
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
