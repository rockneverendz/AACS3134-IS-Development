package control.user.order;

import entity.Coupon;
import entity.Meal;
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
        int mealQtyInt;

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
            mealQtyInt = Integer.parseInt(mealQty);

            // If out of range throw exception.
            if (mealQtyInt < 1 || mealQtyInt > 10) {
                throw new NumberFormatException();
            }

            orderlist = new Orderlist();
            orderlist.setMeal(meal);
            orderlist.setQuantity(mealQtyInt);
            orderlist.setPriceeach(meal.getPrice());
            coupon = new Coupon();
            coupon.setRedeemDate(df.parse(mealDate));
            coupon.setRedeemTime(mealTime);
            coupon.setStatus("Active");
            orderlist.setCoupon(coupon);
            order.add(orderlist);

            // Redirect back with status 'Success'
            url.append("&status=1");

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
