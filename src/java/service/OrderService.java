package service;

import entity.Ordermeal;
import entity.Payment;
import entity.Customer;
import entity.Orderlist;
import entity.OrderlistPK;
import java.util.ArrayList;
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
        em.getTransaction().commit();

        cart.stream().map((orderlist) -> {
            orderlist.setOrdermeal(ordermeal);
            return orderlist;
        }).forEachOrdered((orderlist) -> {
            orderlist.setOrderlistPK(
                    new OrderlistPK(
                            orderlist.getMeal().getMealId(),
                            ordermeal.getOrderId()
                    )
            );
        });

        em.getTransaction().begin();
        ordermeal.setOrderlistList(cart);
        ordermeal.setCustId(customer);
        em.getTransaction().commit();
    }

    public Ordermeal findOrderByID(int id) {
        return (Ordermeal) em.find(Ordermeal.class, id);
    }

    /**
     * @param newOrdermeal The modified order
     * @return true if successfully committed false if order not found
     * @throws RollbackException If commit fails
     */
    public boolean updateMealorder(Ordermeal newOrdermeal) throws RollbackException {
        Ordermeal oldOrdermeal = findOrderByID(newOrdermeal.getOrderId());
        if (oldOrdermeal != null) {
            em.getTransaction().begin();
            oldOrdermeal.setStatus(newOrdermeal.getStatus());
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
