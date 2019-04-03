package service;

import entity.Coupon;
import javax.persistence.*;
import java.util.List;

public class CouponService {

    EntityManager em;

    public CouponService() {
        EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("AACS3134-IS-DevelopmentPU");
        this.em = emfactory.createEntityManager();
    }

    public void addCoupon(Coupon coupon) throws RollbackException {
        em.getTransaction().begin();
        em.persist(coupon);
        em.getTransaction().commit();
    }

    public Coupon findCouponByID(int id) {
        return (Coupon) em.find(Coupon.class, id);
    }

    /**
     * @param id The coupon ID which needs to be redeemed
     * @return true if successfully committed false if coupon not found
     * @throws RollbackException If coupon is already redeemed
     */
    public boolean setStatusRedeem(int id) throws RollbackException {
        Coupon couponDB = findCouponByID(id);
        if (couponDB == null) { // If coupon not found
            return false;
        } else {
            em.getTransaction().begin();
            couponDB.setStatus("Redeemed");
            em.getTransaction().commit();
            return true;
        }
    }

    /**
     * @param id The coupon ID which needs to be redeemed
     * @return true if successfully committed false if coupon not found
     * @throws RollbackException If coupon is already redeemed
     */
    public boolean setStatusExpried(int id) throws RollbackException {
        Coupon couponDB = findCouponByID(id);
        if (couponDB == null) { // If coupon not found
            return false;
        } else {
            em.getTransaction().begin();
            couponDB.setStatus("Expired");
            em.getTransaction().commit();
            return true;
        }
    }

    public List<Coupon> findAll() {
        List CouponList = em.createNamedQuery("Coupon.findAll").getResultList();
        return CouponList;
    }

    public void close() {
        this.em.close();
    }
}
