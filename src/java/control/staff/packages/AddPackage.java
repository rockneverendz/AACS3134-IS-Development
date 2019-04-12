package control.staff.packages;

import entity.Package;
import entity.Packageist;
import service.PackageService;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.MealService;

public class AddPackage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            //Get Parameters
            String time = request.getParameter("maelTime");
            String availability = request.getParameter("availability");
            String description = request.getParameter("desc");
            String[] mealList = request.getParameterValues("maelArr");

            //Initialization
            Package apackage = new Package();
            PackageService ps = new PackageService();
            MealService ms = new MealService();

            Packageist pList;

            ArrayList<Packageist> arraylist = new ArrayList();

            //Set values..
            apackage.setPackageTime(time);
            apackage.setAvailability(Boolean.parseBoolean(availability));
            apackage.setDescription(description);

            String flagSameMeal = "flag";
            int flagDoNotCommit = 0;
            //Loop meal List  *6 days == 6 meal
            for (String meal : mealList) {
                if (!flagSameMeal.equalsIgnoreCase(meal)) {
                    if (meal != null) {
                        pList = new Packageist();
                        pList.setMealId(ms.findMealByID(Integer.parseInt(meal)));
                        pList.setQuantity(1);
                        pList.setPriceeach(ms.findMealByID(Integer.parseInt(meal)).getPrice());
                        //Finally Add Meal
                        arraylist.add(pList);
                        flagSameMeal = meal;
                    }
                } else {
                    flagDoNotCommit = 1;
                    response.sendRedirect("../package/addPackage.jsp?status=S");
                }
            }

            if (flagDoNotCommit != 1) {
                ps.addMealpackage(apackage, arraylist);
                ms.close();
                ps.close();
                response.sendRedirect("../package/managePackage.jsp?status=1");
            }
            
        } catch (Exception e) {
            System.out.println(e.getMessage());

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
