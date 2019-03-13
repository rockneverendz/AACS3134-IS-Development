package service;

import entity.Staff;
import javax.persistence.*;
import java.util.List;

public class StaffService {

    EntityManager em;

    public StaffService() {
        EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("AACS3134-IS-DevelopmentPU");
        this.em = emfactory.createEntityManager();
    }

    public void addStaff(Staff staff) throws RollbackException {
        em.getTransaction().begin();
        em.persist(staff);
        em.getTransaction().commit();
    }

    public Staff findProdByID(int id) {
        return (Staff) em.find(Staff.class, id);
    }

    /**
     * @param newStaff The modified staff
     * @return true if successfully committed false if staff not found
     * @throws RollbackException If commit fails
     */
    public boolean updateStaff(Staff newStaff) throws RollbackException {
        Staff oldStaff = findProdByID(newStaff.getId());
        if (oldStaff != null) {
            em.getTransaction().begin();
            oldStaff.setUsername(newStaff.getUsername());
            oldStaff.setEmail(newStaff.getEmail());
            oldStaff.setPassword(newStaff.getPassword());
            oldStaff.setCategoryid(newStaff.getCategoryid());
            em.getTransaction().commit();
            return true;
        }
        return false;
    }

    public List<Staff> findAll() {
        List StaffList = em.createNamedQuery("Staff.findAll").getResultList();
        return StaffList;
    }

    public void close() {
        this.em.close();
    }
}
