
import entity.Category;
import entity.Meal;
import entity.Orderlist;
import entity.Ordermeal;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.imageio.ImageIO;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import service.MealService;
import service.OrderService;

public class DBFIX {

    EntityManager em;

    public static void main(String[] args) throws IOException {

        DBFIX dbfix = new DBFIX();

        MealService ms = new MealService();
        OrderService os = new OrderService();
        List<Ordermeal> list = os.findAll();
        double totalAmount;

        for (Ordermeal ordermeal : list) {

            totalAmount = 0;
            for (Orderlist orderlist : ordermeal.getOrderlistList()) {
                totalAmount += orderlist.getPriceeach() * orderlist.getQuantity();
            }
            System.out.println(ordermeal.getOrderId() + " < " + totalAmount);
            dbfix.updatePaymentAmount(ordermeal.getOrderId(), totalAmount);
        }
    }

    private DBFIX() {
        EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("AACS3134-IS-DevelopmentPU");
        em = emfactory.createEntityManager();
    }

    private void updatePaymentAmount(int id, double amount) {
        Ordermeal oldMeal = (Ordermeal) em.find(Ordermeal.class, id);
        em.getTransaction().begin();
        oldMeal.getPaymentId().setAmount(amount);
        em.getTransaction().commit();

    }
}
