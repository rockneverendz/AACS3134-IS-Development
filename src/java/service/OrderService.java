package service;

import entity.Ordermeal;
import entity.Payment;
import entity.Customer;
import entity.Orderlist;
import entity.OrderlistPK;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.persistence.*;
import java.util.List;

public class OrderService {

    EntityManager em;

    public OrderService() {
        EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("AACS3134-IS-DevelopmentPU");
        this.em = emfactory.createEntityManager();
    }

    public void addMealorder(
            Ordermeal ordermeal,
            Payment payment,
            ArrayList<Orderlist> cart,
            Customer customer
    ) throws RollbackException {
        em.getTransaction().begin();
        em.persist(ordermeal);
        em.persist(payment);
        cart.forEach((orderlist) -> {
            em.persist(orderlist.getCoupon());
        });
        em.getTransaction().commit();

        cart.stream().map((orderlist) -> {
            orderlist.setOrdermeal(ordermeal);
            return orderlist;
        }).forEachOrdered((orderlist) -> {
            orderlist.setOrderlistPK(
                    new OrderlistPK(
                            orderlist.getMeal().getMealId(),
                            ordermeal.getOrderId(),
                            orderlist.getCoupon().getCouponId()
                    )
            );
        });

        em.getTransaction().begin();
        ordermeal.setOrderlistList(cart);
        em.getTransaction().commit();
    }

    public Ordermeal findOrderByID(int id) {
        return (Ordermeal) em.find(Ordermeal.class, id);
    }

    public List<Ordermeal> findOrderByCustPaid(int custId) {
        return em.createNativeQuery("SELECT o.* FROM Ordermeal o"
                + " WHERE o.CUST_ID = " + custId
                + " AND o.STATUS = 'Paid'"
                + " ORDER BY o.ORDER_ID ASC",
                Ordermeal.class)
                .getResultList();
    }

    public List<Ordermeal> findOrderByCustCompleted(int custId, int month) {
        return em.createNativeQuery("SELECT o.* FROM Ordermeal o"
                + " INNER JOIN Payment p ON o.PAYMENT_ID = p.PAYMENT_ID"
                + " WHERE o.CUST_ID = " + custId
                + " AND o.STATUS <> 'Paid'"
                + " AND MONTH(p.date) = " + month
                + " ORDER BY p.date ASC",
                Ordermeal.class)
                .getResultList();
    }

    public List<Ordermeal> findOrderByCustDateRange(int custId, Date startDate, Date endDate) {
        SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");
        return em.createNativeQuery("SELECT o.* FROM Ordermeal o"
                + " INNER JOIN Payment p ON o.PAYMENT_ID = p.PAYMENT_ID"
                + " WHERE o.CUST_ID = " + custId
                + " AND p.date BETWEEN '"
                + df.format(startDate) + "' AND '" + df.format(endDate) + "'"
                + " ORDER BY p.date ASC",
                Ordermeal.class)
                .getResultList();
    }

    public List<Orderlist> findOrderlistByOrderId(int orderId) {
        return em.createNativeQuery("SELECT o.* FROM Orderlist o"
                + " INNER JOIN Coupon c ON o.COUPON_ID = c.COUPON_ID"
                + " WHERE o.ORDER_ID = " + orderId
                + " ORDER BY c.REDEEM_DATE ASC",
                Orderlist.class)
                .getResultList();
    }

    /**
     * @param newOrdermeal The modified order
     * @return true if successfully committed false if order not found
     * @throws RollbackException If commit fails
     */
    public boolean cancelMealorder(Ordermeal newOrdermeal) throws RollbackException {
        Ordermeal oldOrdermeal = findOrderByID(newOrdermeal.getOrderId());
        if (oldOrdermeal != null) {
            em.getTransaction().begin();
            oldOrdermeal.getPaymentId().setAmount(0);
            oldOrdermeal.setStatus("Canceled");
            em.getTransaction().commit();
            return true;
        }
        return false;
    }

    public List<Ordermeal> findAll() {
        List MealorderList = em.createNamedQuery("Mealorder.findAll").getResultList();
        return MealorderList;
    }

    public void close() {
        this.em.close();
    }
}
