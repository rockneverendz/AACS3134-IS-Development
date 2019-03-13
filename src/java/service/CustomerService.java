package service;

import entity.Customer;
import javax.persistence.*;
import java.util.List;

public class CustomerService {

    EntityManager em;

    public CustomerService() {
        EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("AACS3134-IS-DevelopmentPU");
        this.em = emfactory.createEntityManager();
    }

    public void addCustomer(Customer customer) throws RollbackException {
        em.getTransaction().begin();
        em.persist(customer);
        em.getTransaction().commit();
    }

    public Customer findProdByID(int id) {
        return (Customer) em.find(Customer.class, id);
    }

    /**
     * @param newCustomer The modified customer
     * @return true if successfully committed false if customer not found
     * @throws RollbackException If commit fails
     */
    public boolean updateCustomer(Customer newCustomer) throws RollbackException {
        Customer oldCustomer = findProdByID(newCustomer.getId());
        if (oldCustomer != null) {
            em.getTransaction().begin();
            oldCustomer.setUsername(newCustomer.getUsername());
            oldCustomer.setEmail(newCustomer.getEmail());
            oldCustomer.setPassword(newCustomer.getPassword());
            oldCustomer.setCreditpoints(newCustomer.getCreditpoints());
            em.getTransaction().commit();
            return true;
        }
        return false;
    }

    public List<Customer> findAll() {
        List CustomerList = em.createNamedQuery("Customer.findAll").getResultList();
        return CustomerList;
    }

    public void close() {
        this.em.close();
    }
}
