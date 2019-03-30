package service;

import entity.Ingredient;
import javax.persistence.*;
import java.util.List;

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

    public List<Ingredient> findAll() {
        List IngredientList = em.createNamedQuery("Ingredient.findAll").getResultList();
        return IngredientList;
    }

    public void close() {
        this.em.close();
    }
}
