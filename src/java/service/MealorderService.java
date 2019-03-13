package service;

import entity.Mealorder;
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
            Mealorder mealorder,
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
                    orderlist.getMeal().getId(),
                    mealorder.getId()
            );
            orderlist.setMealorder(mealorder);
            orderlist.setOrderlistPK(orderlistpk);
        }

        em.getTransaction().begin();
        mealorder.setOrderlistList(cart);
        mealorder.setCustid(customer);
        em.getTransaction().commit();
    }

    public Mealorder findOrderByID(int id) {
        return (Mealorder) em.find(Mealorder.class, id);
    }

    /**
     * @param newMealorder The modified mealorder
     * @return true if successfully committed false if mealorder not found
     * @throws RollbackException If commit fails
     */
    public boolean updateMealorder(Mealorder newMealorder) throws RollbackException {
        Mealorder oldMealorder = findOrderByID(newMealorder.getId());
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

    public List<Mealorder> findAll() {
        List MealorderList = em.createNamedQuery("Mealorder.findAll").getResultList();
        return MealorderList;
    }

    public void close() {
        this.em.close();
    }
}
