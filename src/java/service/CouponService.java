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
    
    public List findCouponSummary(int custId) {
        return em.createNativeQuery("SELECT COUNT(c.COUPON_ID) AS NumberOfFood, ca.\"NAME\""
                + " FROM COUPON c"
                + " INNER JOIN ORDERLIST ol ON ol.COUPON_ID = c.COUPON_ID"
                + " INNER JOIN MEAL m ON ol.MEAL_ID = m.MEAL_ID"
                + " INNER JOIN ORDERMEAL om ON om.ORDER_ID = ol.ORDER_ID"
                + " INNER JOIN CATEGORY ca ON ca.CATEGORY_ID = m.CATEGORY_ID"
                + " WHERE om.CUST_ID = " + custId
                + " AND om.STATUS = 'Completed'"
                + " GROUP BY ca.\"NAME\"")
                .getResultList();
    }
    
    public boolean updateCoupon(Coupon newCoupon) throws RollbackException {
        Coupon oldCoupon = findCouponByID(newCoupon.getCouponId());
        if (oldCoupon != null) {
            em.getTransaction().begin();
            oldCoupon.setRedeemDate(newCoupon.getRedeemDate());
            oldCoupon.setRedeemTime(newCoupon.getRedeemTime());
            em.getTransaction().commit();
            return true;
        }
        return false;
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
