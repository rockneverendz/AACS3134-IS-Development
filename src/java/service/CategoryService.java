package service;

import entity.Category;
import java.util.List;
import javax.persistence.*;

public class CategoryService {

    EntityManager em;

    public CategoryService() {
        EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("AACS3134-IS-DevelopmentPU");
        this.em = emfactory.createEntityManager();
    }

    public void addCategory(Category category) throws RollbackException {
        em.getTransaction().begin();
        em.persist(category);
        em.getTransaction().commit();
    }

    /**
     * @param id ID of the category which needs to be deleted
     * @return true if successfully committed false if category not found
     * @throws RollbackException If commit fails
     */
    public boolean deleteCategory(int id) throws RollbackException {
        Category category = findCategoryByID(id);
        if (category != null) {
            em.getTransaction().begin();
            em.remove(category);
            em.getTransaction().commit();
            return true;
        }
        return false;
    }

    public Category findCategoryByID(int id) {
        return (Category) em.find(Category.class, id);
    }

    /**
     * @param newCategory The modified category
     * @return true if successfully committed false if category not found
     * @throws RollbackException If commit fails
     */
    public boolean updateCategory(Category newCategory) throws RollbackException {
        Category oldCategory = findCategoryByID(newCategory.getCategoryId());
        if (oldCategory != null) {
            em.getTransaction().begin();
            oldCategory.setName(newCategory.getName());
            oldCategory.setDescription(newCategory.getDescription());
            oldCategory.setImage(newCategory.getImage());
            em.getTransaction().commit();
            return true;
        }
        return false;
    }

    public List<Category> findAll() {
        List CategoryList = em.createNamedQuery("Category.findAll").getResultList();
        return CategoryList;
    }

    public void close() {
        this.em.close();
    }
}
