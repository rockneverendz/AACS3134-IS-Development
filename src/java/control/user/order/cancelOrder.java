package control.user.order;

import entity.Coupon;
import entity.Customer;
import entity.Orderlist;
import entity.Ordermeal;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.CustomerService;
import service.OrderService;

public class cancelOrder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get parameter from the form
        String orderId = request.getParameter("orderId");

        // Initialize variables
        StringBuilder url = new StringBuilder("../report/orderpaid.jsp");
        OrderService os = new OrderService();
        CustomerService cs = new CustomerService();
        int indexOfMeal = -1;

        try {
            Date date = new Date();

            // Get session object
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("customer");
            if (customer == null) {
                throw new IllegalArgumentException();
            }

            // Find the order from parameter
            Ordermeal ordermeal = os.findOrderByID(Integer.parseInt(orderId));
            List<Orderlist> list = ordermeal.getOrderlistList();

            // Validate order status
            if (ordermeal.getStatus().equals("Canceled")) {
                throw new IllegalArgumentException();
            }

            // Check if every coupon has more than 1 day left
            for (int i = 0; i < list.size(); i++) {
                // Get coupon
                Coupon coupon = list.get(i).getCoupon();

                // Math
                long diff = coupon.getRedeemDate().getTime() - date.getTime();
                int daydiff = (int) TimeUnit.MILLISECONDS.toDays(diff);

                // If found less than 1 day left, terminate loop
                if (daydiff < 1) {
                    indexOfMeal = i;
                    i = list.size();
                }
            }

            if (indexOfMeal == -1) { // Cancellable order

                // Get genuine customer object
                customer = cs.findCustByID(customer.getCustId());

                // Cancel
                os.cancelMealorder(ordermeal);

                // Refund
                customer.setCreditpoints(
                        customer.getCreditpoints()
                        + ordermeal.getPaymentId().getAmount()
                );
                cs.updateCustomer(customer);

            } else { // Uncancellable order due to 'indexOfMeal'
                throw new IllegalArgumentException();
            }

            // Redirect back with status 'Success'
            url.append("?status=1");

        } catch (IllegalArgumentException ex) {
            url.append("?status=L");
        } finally {
            os.close();
            cs.close();
        }

        response.sendRedirect(url.toString());
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
