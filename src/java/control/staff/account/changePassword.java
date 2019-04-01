package control.staff.account;

import entity.Staff;
import service.StaffService;
import java.io.IOException;
import javax.persistence.RollbackException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class changePassword extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Get parameters from the form
        int staffID = Integer.parseInt(request.getParameter("staffid"));
        String newPassword = request.getParameter("newPass");

        //Initialization
        StaffService staffService = new StaffService();
        Staff staff = staffService.findStaffByID(staffID);

        //Update information
        try {
            staff.setPassword(newPassword);
            staffService.updateStaff(staff);

            HttpSession session = request.getSession();
            session.setAttribute("staff", staff);
            session.setMaxInactiveInterval(-1);

            response.sendRedirect("setting.jsp?status=1");

        } catch (RollbackException e) {
            System.out.println(e.getMessage());
            response.sendRedirect("setting.jsp?status=U");
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
