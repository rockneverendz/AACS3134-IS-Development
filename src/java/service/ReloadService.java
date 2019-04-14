package service;

import entity.Customer;
import entity.Reload;
import java.util.List;
import javax.persistence.*;

public class ReloadService {

    EntityManager em;

    public ReloadService() {
        EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("AACS3134-IS-DevelopmentPU");
        this.em = emfactory.createEntityManager();
    }

    public void addReload(Reload reload) throws RollbackException {
        em.getTransaction().begin();
        em.persist(reload);
        em.getTransaction().commit();
    }

    public Reload findReloadByID(int id) {
        return (Reload) em.find(Reload.class, id);
    }

    public List<Reload> findReloadByCustID(Customer custId) {
        return (List<Reload>) em.createNamedQuery("Meal.findByCategoryId")
                .setParameter("custId", custId)
                .getResultList();
    }

    public List<Reload> findReloadByCustIDYear(int custId, int year) {
        return em.createNativeQuery("SELECT r.* FROM RELOAD r"
                + " WHERE r.CUST_ID = " + custId
                + " AND YEAR(r.\"DATE\") = " + year,
                Reload.class)
                .getResultList();
    }

    public List findReloadSummary(int custId, int year) {
        return em.createNativeQuery("SELECT MONTH(r.\"DATE\"), SUM(r.AMOUNT)"
                + " FROM RELOAD r"
                + " WHERE r.CUST_ID = " + custId
                + " AND YEAR(r.\"DATE\") = " + year
                + " GROUP BY MONTH(r.\"DATE\")")
                .getResultList();
    }

    public List<Reload> findAll() {
        List ReloadList = em.createNamedQuery("Reload.findAll").getResultList();
        return ReloadList;
    }

    public void close() {
        this.em.close();
    }
}
