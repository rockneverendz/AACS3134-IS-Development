package control.user.packages;

import entity.Coupon;
import entity.Customer;
import entity.Orderlist;
import entity.Ordermeal;
import entity.Packageist;
import entity.Payment;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.CustomerService;
import service.OrderService;
import service.PackageService;

public class confirmPackage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String dateS = request.getParameter("packageDate");
        String packageId = request.getParameter("packageId");
        String pacakgeType = request.getParameter("packageType");

        // Get session order. If null, redirect with status 'Error'.
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            session.invalidate();
            response.sendRedirect("../account/signin.jsp?status=X");
            return;
        }

        // begin Service
        CustomerService cs = new CustomerService();
        OrderService os = new OrderService();

        try {
            // Initialize variables
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            StringBuilder url = new StringBuilder("../report/coupon.jsp");
            Date date = dateFormat.parse(dateS);

            PackageService ps = new PackageService();
            entity.Package packagee = ps.findPackageByID(Integer.parseInt(packageId));
            List<Packageist> packagelist = packagee.getPackageistList();

            ArrayList<Orderlist> list = new ArrayList<>();
            Orderlist orderlist;
            Coupon coupon;
            double total = 0;

            int loopCount = 1; // On default loop one time (Weekly)
            if (pacakgeType.equals("Monthly")) { // If monthly loop 4 times (Monthly)
                loopCount = 4;
            }

            for (int i = 0; i < loopCount; i++) {
                for (Packageist packageist : packagelist) {

                    orderlist = new Orderlist();
                    coupon = new Coupon();

                    coupon.setRedeemDate(date);
                    coupon.setRedeemTime(packagee.getPackageTime());
                    coupon.setStatus("Active");

                    orderlist.setCouponId(coupon);
                    orderlist.setQuantity(1);
                    orderlist.setPriceeach(packageist.getPriceeach());
                    orderlist.setMeal(packageist.getMeal());

                    total += packageist.getPriceeach();

                    list.add(orderlist);
                }
            }

            Payment payment = new Payment();

            payment.setAmount(total);
            payment.setDate(new Date());
            payment.setTime(new Date());

            Ordermeal ordermeal = new Ordermeal();

            ordermeal.setCustId(cs.findCustByID(customer.getCustId()));
            ordermeal.setStatus("Paid");
            ordermeal.setType(pacakgeType);
            ordermeal.setPaymentId(payment);

            // Release the kraken
            os.addMealorder(ordermeal, payment, list, customer);

            // Redirect back with status 'Success'
            session.removeAttribute("order");
            url.append("?status=1");
            response.sendRedirect(url.toString());

        } catch (ParseException ex) {
            Logger.getLogger(confirmPackage.class.getName()).log(Level.SEVERE, null, ex);
        }
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
