package service;

import entity.Product;
import javax.persistence.*;
import java.util.List;

public class ProductService {

    EntityManager em;

    public ProductService() {
        EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("AACS3134-IS-DevelopmentPU");
        this.em = emfactory.createEntityManager();
    }

    public void addProduct(Product product) throws RollbackException {
        em.getTransaction().begin();
        em.persist(product);
        em.getTransaction().commit();
    }

    /**
     * @param id ID of the product which needs to be deleted
     *
     * @return true if successfully committed false if product not found
     *
     * @throws RollbackException If commit fails
     */
    public boolean deleteProduct(int id) throws RollbackException {
        Product product = findProdByID(id);
        if (product != null) {
            em.getTransaction().begin();
            em.remove(product);
            em.getTransaction().commit();
            return true;
        }
        return false;
    }

    public Product findProdByID(int id) {
        return (Product) em.find(Product.class, id);
    }

    public List<Product> findProdByName(String name) {
        return (List<Product>) em.createNamedQuery("Product.findByName")
                .setParameter("name", name)
                .getResultList();
    }

    /**
     * @param newProduct The modified product
     *
     * @return true if successfully committed false if product not found
     *
     * @throws RollbackException If commit fails
     */
    public boolean updateProduct(Product newProduct) throws RollbackException {
        Product thisProduct = findProdByID(newProduct.getProductid());
        if (thisProduct != null) {
            em.getTransaction().begin();
            thisProduct.setName(newProduct.getName());
            thisProduct.setImage(newProduct.getImage());
            em.getTransaction().commit();
            return true;
        }
        return false;
    }

    public int countProduct() {
        return (int) em.createNativeQuery("SELECT COUNT(*) FROM NBUSER.PRODUCT").getSingleResult();
    }

    public List<Product> findAll() {
        List ProductList = em.createNamedQuery("Product.findAll").getResultList();
        return ProductList;
    }

    public void close() {
        this.em.close();
    }
}
