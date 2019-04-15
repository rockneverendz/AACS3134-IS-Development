package control.staff.meal;

import entity.Ingredientlist;
import entity.Meal;
import entity.Staff;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import service.CategoryService;
import service.IngredientService;
import service.MealService;

@MultipartConfig(maxFileSize = 16177215)
public class UpdateMeal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Get parameter from the form
        String mealId = request.getParameter("mealId");
        String name = request.getParameter("Name");
        String description = request.getParameter("Description");
        String price = request.getParameter("Price");
        String calories = request.getParameter("Calories");
        String[] ingredient = request.getParameterValues("Ingredient");
        String[] quantity = request.getParameterValues("Quantity");
        
        MealService ms = new MealService();
        Meal meal = ms.findMealByID(Integer.parseInt(mealId));

        meal.setName(name);
        meal.setDescription(description);
        meal.setPrice(Double.parseDouble(price));
        meal.setCalories(Integer.parseInt(calories));

        Ingredientlist ingredientlist;
        IngredientService is = new IngredientService();

        ArrayList<Ingredientlist> arraylist = new ArrayList();

        for (int i = 0; i < ingredient.length; i++) {
            if (ingredient[i] != null) {
                ingredientlist = new Ingredientlist();
                ingredientlist.setQuantity(Double.parseDouble(quantity[i]));
                ingredientlist.setIngredient(is.findIngredientByID(Integer.parseInt(ingredient[i])));

                arraylist.add(ingredientlist);
            }
        }

        // Obtains the upload file part in this multipart request
        Part filePart = request.getPart("image");
        if (filePart != null) {
            // Prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            // Obtains input stream of the upload file
            InputStream inputStream = filePart.getInputStream();

            // Convert InputSteam to Byte[]
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }

            // Set in Byte[]
            meal.setImage(outputStream.toByteArray());

            // Close
            inputStream.close();
            outputStream.close();
        }

        ms.updateMeal(meal, arraylist);
        ms.close();
        is.close();

        response.sendRedirect("../meal/manageMeal.jsp?status=2");

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
