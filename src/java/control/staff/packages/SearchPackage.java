package control.staff.packages;

import entity.Package;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.PackageService;

public class SearchPackage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            //Get Parameters
            int mealpackageID = Integer.parseInt(request.getParameter("packageid"));

            //Initialization
            Package mealpackage;
            PackageService ps = new PackageService();
            mealpackage = ps.findPackageByID(mealpackageID);

            if(mealpackage ==null){
                response.sendRedirect("managePackage.jsp?status=N");
                return;
            }
            //Set sessions and redirect
            HttpSession session = request.getSession();
            session.setAttribute("MealPackage", mealpackage);
            response.sendRedirect("modifyPackage.jsp");
        } catch (NumberFormatException  e) {
            response.sendRedirect("managePackage.jsp?status=N");
            e.getMessage();
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
