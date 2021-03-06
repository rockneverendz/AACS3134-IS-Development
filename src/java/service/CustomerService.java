package service;

import entity.Customer;
import java.util.List;
import javax.persistence.*;

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

    public Customer findCustByUsername(String username) {
        return (Customer) em.createNamedQuery("Customer.findByUsername")
                .setParameter("username", username)
                .getSingleResult();
    }

    public Customer findCustByUserIdCard(String userIdCard) {
        return (Customer) em.createNamedQuery("Customer.findByUserIdCard")
                .setParameter("userIdCard", userIdCard)
                .getSingleResult();
    }

    public Customer findCustByEmail(String email) {
        return (Customer) em.createNamedQuery("Customer.findByEmail")
                .setParameter("email", email)
                .getSingleResult();
    }

    public boolean isUserIDUsed(String useridcard) {
        int count = (int) em.createNativeQuery(
                "SELECT COUNT(USER_ID_CARD) "
                + "FROM CUSTOMER "
                + "WHERE USER_ID_CARD = '" + useridcard + "'")
                .getSingleResult();
        return (count == 1);
    }

    public boolean isUsernameUsed(String username) {
        int count = (int) em.createNativeQuery(
                "SELECT COUNT(USERNAME) "
                + "FROM CUSTOMER "
                + "WHERE USERNAME = '" + username + "'")
                .getSingleResult();
        return (count == 1);
    }

    public boolean isEmailUsed(String email) {
        int count = (int) em.createNativeQuery(
                "SELECT COUNT(EMAIL) "
                + "FROM CUSTOMER "
                + "WHERE EMAIL ='" + email + "'")
                .getSingleResult();
        return (count == 1);
    }

    public Customer findCustByID(int id) {
        return (Customer) em.find(Customer.class, id);
    }

    /**
     * @param newCustomer The modified customer
     * @return true if successfully committed false if customer not found
     * @throws RollbackException If commit fails
     */
    public boolean updateCustomer(Customer newCustomer) throws RollbackException {
        Customer oldCustomer = findCustByID(newCustomer.getCustId());
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
