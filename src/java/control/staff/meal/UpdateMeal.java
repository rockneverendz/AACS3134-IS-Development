package control.staff.meal;

import entity.Meal;
import entity.Staff;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.MealService;

public class UpdateMeal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Get parameter from the form
        // Get parameter from the form
        String name = request.getParameter("Name");
        String description = request.getParameter("Description");
        String price = request.getParameter("Price");
        String calories = request.getParameter("Calories");
        String[] ingredient = request.getParameterValues("Ingredient");
        String[] quantity = request.getParameterValues("Quantity");
        HttpSession session = request.getSession();
        Staff staff = (Staff) session.getAttribute("staff");
        
        // Initialization
        Meal meal = new Meal();
        MealService ms = new MealService();
        
        meal.setName(name);
        meal.setDescription(description);
        meal.setPrice(Double.parseDouble(price));
        meal.setCalories(Integer.parseInt(calories));
        
        
        
        
        
    }
// <editor-fold defaultstate="collapsed" desc="HttpServlet methods">

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
        return "Register customer";
    }// </editor-fold>
}
