package control.user.order;

import entity.Orderlist;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class removeMeal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get parameter from the form
        String mealIndex = request.getParameter("mealIndex");

        // Initialize variables
        StringBuilder url = new StringBuilder("../cart/cart.jsp");
        int indexOfMeal;

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

            // Remove
            order.remove(indexOfMeal);
            
            // Update cart and redirect back to cart with status 'Update Success'
            url.append("?status=1");
        } catch (NumberFormatException ex) {
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
