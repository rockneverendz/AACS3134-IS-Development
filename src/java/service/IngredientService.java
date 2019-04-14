package service;

import entity.Ingredient;
import java.util.List;
import javax.persistence.*;

public class IngredientService {

    EntityManager em;

    public IngredientService() {
        EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("AACS3134-IS-DevelopmentPU");
        this.em = emfactory.createEntityManager();
    }

    public void addIngredient(Ingredient ingredient) throws RollbackException {
        em.getTransaction().begin();
        em.persist(ingredient);
        em.getTransaction().commit();
    }

    public Ingredient findIngredientByID(int id) {
        return (Ingredient) em.find(Ingredient.class, id);
    }

    public List<Ingredient> findAllWithoutList() {
        return em.createNativeQuery(
                "SELECT INGREDIENT_ID, INGREDIENT_NAME "
                + "FROM INGREDIENT", Ingredient.class)
                .getResultList();
    }

    /**
     * @param newIngredient The modified ingredient
     * @return true if successfully committed false if ingredient not found
     * @throws RollbackException If commit fails
     */
    public boolean updateIngredient(Ingredient newIngredient) throws RollbackException {
        Ingredient oldIngredient = findIngredientByID(newIngredient.getIngredientId());
        if (oldIngredient != null) {
            em.getTransaction().begin();
            oldIngredient.setIngredientName(newIngredient.getIngredientName());
            em.getTransaction().commit();
            return true;
        }
        return false;
    }

    /**
     * @param id ID of the ingredient which needs to be deleted
     * @return true if successfully committed false if product not found
     * @throws RollbackException If commit fails
     */
    public boolean removeIngredient(int id) throws RollbackException {
        Ingredient ingredient = findIngredientByID(id);
        if (ingredient != null) {
            em.getTransaction().begin();
            em.remove(ingredient);
            em.getTransaction().commit();
            return true;
        }
        return false;
    }

    public List<Ingredient> findAll() {
        List IngredientList = em.createNamedQuery("Ingredient.findAll").getResultList();
        return IngredientList;
    }

    public void close() {
        this.em.close();
    }
}
