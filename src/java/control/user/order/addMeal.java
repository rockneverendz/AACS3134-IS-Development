package control.user.order;

import entity.Coupon;
import entity.Meal;
import entity.Orderlist;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.MealService;

public class addMeal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get parameter from the form
        String mealId = request.getParameter("mealId");
        String mealDate = request.getParameter("mealDate");
        String mealTime = request.getParameter("mealTime");
        String mealQty = request.getParameter("mealQty");

        // Initialize variables
        SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        StringBuilder url = new StringBuilder("../meal/viewmeal.jsp?CategoryId=" + request.getParameter("CategoryId"));
        MealService ms = new MealService();
        Orderlist orderlist;
        Coupon coupon;
        Meal meal;
        int indexOfMeal = -1;

        // Get session order. If null, new order.
        HttpSession session = request.getSession();
        ArrayList<Orderlist> order = (ArrayList) session.getAttribute("order");
        if (order == null) {
            order = new ArrayList<>();
            session.setAttribute("order", order);
        }

        try {
            // Find the meal by ID
            meal = ms.findMealByID(Integer.parseInt(mealId));

            // Find the index of meal on the cart, return -1 if not found
            for (int i = 0; i < order.size(); i++) {
                if (order.get(i).getMeal().equals(meal)) {
                    indexOfMeal = i;
                }
            }

            if (indexOfMeal == -1) { // If meal is not in the cart yet.
                orderlist = new Orderlist();
                orderlist.setMeal(meal);
                orderlist.setQuantity(Integer.parseInt(mealQty));
                orderlist.setPriceeach(meal.getPrice());
                coupon = new Coupon();
                coupon.setRedeemDate(df.parse(mealDate));
                coupon.setRedeemTime(mealTime);
                orderlist.setCouponId(coupon);
                order.add(orderlist);

                // Redirect back with status 'Success'
                url.append("&status=1");

            } else { // If product is already in the cart.
                // Redirect back with status 'Failed'
                url.append("&status=2");
            }
        } catch (NumberFormatException | ParseException ex) {
            url.append("&status=X");
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
