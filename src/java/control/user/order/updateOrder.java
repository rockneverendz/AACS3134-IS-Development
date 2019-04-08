package control.user.order;

import entity.Coupon;
import entity.Customer;
import entity.Orderlist;
import entity.Ordermeal;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.CouponService;

public class updateOrder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get parameter from the form
        String couponId = request.getParameter("couponId");
        String mealDate = request.getParameter("mealDate");
        String mealTime = request.getParameter("mealTime");

        // Initialize variables
        SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        StringBuilder url = new StringBuilder("../report/orderpaid.jsp");
        CouponService cs = new CouponService();

        try {
            Date date = new Date();

            // Get session object
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("customer");
            if (customer == null) {
                url.append("?status=X");
                throw new IllegalArgumentException();
            }

            // Get the coupon and the ordermeal
            Coupon coupon = cs.findCouponByID(Integer.parseInt(couponId));
            Ordermeal ordermeal = coupon.getOrderlistList().get(0).getOrdermeal();

            // Validate order status
            if (ordermeal.getStatus().equals("Canceled")) {
                url.append("?status=X");
                throw new IllegalArgumentException();
            }

            // Check if the order belongs to the custoemr.
            if (!Objects.equals(ordermeal.getCustId().getCustId(), customer.getCustId())) {
                url.append("?status=X");
                throw new IllegalArgumentException();
            }

            // Math
            long diff = coupon.getRedeemDate().getTime() - date.getTime();
            int daydiff = (int) TimeUnit.MILLISECONDS.toDays(diff);

            if (daydiff >= 2) { // Updatable coupon

                coupon.setRedeemDate(df.parse(mealDate));
                coupon.setRedeemTime(mealTime);
                cs.updateCoupon(coupon);

            } else { // Unupdatable coupon
                url.append("?status=U");
                throw new IllegalArgumentException();
            }

            // Redirect back with status 'Success'
            url.append("?status=2");

        } catch (IllegalArgumentException | ParseException ex) {
            Logger.getLogger(updateOrder.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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
