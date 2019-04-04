package control.user.order;

import entity.Coupon;
import entity.Orderlist;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class updateMeal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get parameter from the form
        String mealIndex = request.getParameter("mealIndex");
        String mealQty = request.getParameter("mealQty");
        String mealDate = request.getParameter("mealDate");
        String mealTime = request.getParameter("mealTime");

        // Initialize variables
        SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        StringBuilder url = new StringBuilder("../cart/cart.jsp");
        Orderlist orderlist;
        Coupon coupon;
        int indexOfMeal;
        int mealQtyInt;

        // Get session order. If null, redirect with status 'Error'.
        HttpSession session = request.getSession();
        ArrayList<Orderlist> order = (ArrayList) session.getAttribute("order");
        if (order == null) {
            response.sendRedirect("../account/signin.jsp?status=X");
            return;
        }

        try {
            // Parse the given parameter
            indexOfMeal = Integer.parseInt(mealIndex);
            mealQtyInt = Integer.parseInt(mealQty);

            // If out of range throw exception.
            if (mealQtyInt < 1 || mealQtyInt > 10) {
                throw new NumberFormatException();
            }

            // Retirve and update
            orderlist = order.get(indexOfMeal);
            coupon = orderlist.getCouponId();

            orderlist.setQuantity(mealQtyInt);
            coupon.setRedeemDate(df.parse(mealDate));
            coupon.setRedeemTime(mealTime);

            // Update cart and redirect back to cart with status 'Update Success'
            url.append("?status=1");
        } catch (NumberFormatException | ParseException ex) {
            url.append("?status=X");
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
