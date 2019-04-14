
import entity.Orderlist;
import entity.Ordermeal;
import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import service.OrderService;

public class DBFIX {

    EntityManager em;

    public static void main(String[] args) throws IOException {

        DBFIX dbfix = new DBFIX();

        OrderService os = new OrderService();
        List<Ordermeal> list = os.findAll();
        double totalAmount;
        int mismatchCount = 0;

        for (Ordermeal ordermeal : list) {

            totalAmount = 0;
            for (Orderlist orderlist : ordermeal.getOrderlistList()) {
                totalAmount += orderlist.getPriceeach() * orderlist.getQuantity();
            }

            switch (ordermeal.getStatus()) {
                case "Paid":
                case "Completed":
                    System.out.print(" ( Completed || Paid ) order read : ");
                    if (totalAmount == ordermeal.getPaymentId().getAmount()) {
                        System.out.println(ordermeal.getOrderId() + " amount matched");
                    } else {
                        mismatchCount++;
                        System.out.println(ordermeal.getOrderId() + " amount mismatch");
                        System.out.println("Current " + ordermeal.getPaymentId().getAmount());
                        System.out.println("New " + totalAmount);
                        dbfix.updatePaymentAmount(ordermeal.getOrderId(), totalAmount);
                    }
                    break;
                case "Cancelled":
                    System.out.print("Cancelled order read : ");
                    if (0 == ordermeal.getPaymentId().getAmount()) {
                        System.out.println(ordermeal.getOrderId() + " amount matched");
                    } else {
                        mismatchCount++;
                        System.out.println(ordermeal.getOrderId() + " amount mismatch");
                        System.out.println("Current " + ordermeal.getPaymentId().getAmount());
                        System.out.println("New " + 0);
                        dbfix.updatePaymentAmount(ordermeal.getOrderId(), 0);
                    }
                    break;
                default:
                    System.out.println("Unknown order read : ? ");
                    break;
            }
        }
        System.out.println(mismatchCount + " orders mismatched");
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
