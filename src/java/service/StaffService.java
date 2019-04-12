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

    public Staff findStaffByID(int id) {
        return (Staff) em.find(Staff.class, id);
    }
    
     public Staff findStaffByUsername(String username) {
        return (Staff) em.createNamedQuery("Staff.findByUsername")
                .setParameter("username", username)
                .getSingleResult();
    }

     public Staff findStaffByUserIdCard(String staffIdCard) {
        return (Staff) em.createNamedQuery("Staff.findByUserIdCard")
                .setParameter("userIdCard", staffIdCard)
                .getSingleResult();
    }
     
    public Staff findStaffByEmail(String email) {
        return (Staff) em.createNamedQuery("Staff.findByEmail")
                .setParameter("email", email)
                .getSingleResult();
    }

    public boolean isUserIDUsed(String useridcard) {
        int count = (int) em.createNativeQuery(
                "SELECT COUNT(USER_ID_CARD) "
                + "FROM STAFF "
                + "WHERE USER_ID_CARD = '" + useridcard + "'")
                .getSingleResult();
        return (count != 0);
    }

    public boolean isUsernameUsed(String username) {
        int count = (int) em.createNativeQuery(
                "SELECT COUNT(USERNAME) "
                + "FROM STAFF "
                + "WHERE USERNAME = '" + username + "'")
                .getSingleResult();
        return (count != 0);
    }

    public boolean isEmailUsed(String email) {
        int count = (int) em.createNativeQuery(
                "SELECT COUNT(EMAIL) "
                + "FROM STAFF "
                + "WHERE EMAIL ='" + email + "'")
                .getSingleResult();
        return (count != 0);
    }
    
    /**
     * @param newStaff The modified staff
     * @return true if successfully committed false if staff not found
     * @throws RollbackException If commit fails
     */
    public boolean updateStaff(Staff newStaff) throws RollbackException {
        Staff oldStaff = findStaffByID(newStaff.getStaffId());
        if (oldStaff != null) {
            em.getTransaction().begin();
            oldStaff.setUsername(newStaff.getUsername());
            oldStaff.setEmail(newStaff.getEmail());
            oldStaff.setPassword(newStaff.getPassword());
            oldStaff.setCategoryId(newStaff.getCategoryId());
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
