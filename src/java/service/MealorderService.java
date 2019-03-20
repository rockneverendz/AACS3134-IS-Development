package service;

import entity.Order1;
import entity.Payment;
import entity.Customer;
import entity.Orderlist;
import entity.OrderlistPK;
import java.util.ArrayList;
import javax.persistence.*;
import java.util.List;

public class MealorderService {

    EntityManager em;

    public MealorderService() {
        EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("AACS3134-IS-DevelopmentPU");
        this.em = emfactory.createEntityManager();
    }

    public void addMealorder(
            Order1 mealorder,
            Payment payment,
            ArrayList<Orderlist> cart,
            Customer customer
    ) throws RollbackException {
        em.getTransaction().begin();
        em.persist(mealorder);
        em.persist(payment);
        em.getTransaction().commit();

        OrderlistPK orderlistpk;

        for (Orderlist orderlist : cart) {
            orderlistpk = new OrderlistPK(
                    orderlist.getMeal().getMealId(),
                    mealorder.getOrderId()
            );
            orderlist.setOrder1(mealorder);
            orderlist.setOrderlistPK(orderlistpk);
        }

        em.getTransaction().begin();
        mealorder.setOrderlistList(cart);
        mealorder.setCustId(customer);
        em.getTransaction().commit();
    }

    public Order1 findOrderByID(int id) {
        return (Order1) em.find(Order1.class, id);
    }

    /**
     * @param newMealorder The modified mealorder
     * @return true if successfully committed false if mealorder not found
     * @throws RollbackException If commit fails
     */
    public boolean updateMealorder(Order1 newMealorder) throws RollbackException {
        Order1 oldMealorder = findOrderByID(newMealorder.getOrderId());
        if (oldMealorder != null) {
            em.getTransaction().begin();
            oldMealorder.setStutus(newMealorder.getStutus());
            oldMealorder.setRedeemDate(newMealorder.getRedeemDate());
            oldMealorder.setRedeemTime(newMealorder.getRedeemTime());
            em.getTransaction().commit();
            return true;
        }
        return false;
    }

    public List<Order1> findAll() {
        List MealorderList = em.createNamedQuery("Mealorder.findAll").getResultList();
        return MealorderList;
    }

    public void close() {
        this.em.close();
    }
}
