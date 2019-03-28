package control.staff.account;

import entity.Staff;
import java.io.IOException;
import javax.persistence.NoResultException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.StaffService;

public class signin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get parameter from the form
        String username = request.getParameter("StaffUsername");
        String password = request.getParameter("Password");

        // Initialize variables
        StringBuilder url = new StringBuilder("/staff/account/signin.jsp");
        StaffService staffService = new StaffService();

        try {
            // Find by Staff Email which is Unique.
            Staff staff = staffService.findStaffByUsername(username);
            staffService.close();

            // Compare both passwords
            if (!password.equals(staff.getPassword())) {
                throw new IllegalArgumentException();
            }

            // Bind into Session
            HttpSession session = request.getSession();
            session.setAttribute("staff", staff);
            session.setMaxInactiveInterval(-1);

            // Redirect back to topup page with status 'Success'
            response.sendRedirect("topup.jsp");
            return;

        } catch (NoResultException ex) {
            url.append("?status=U");
        } catch (IllegalArgumentException ex) {
            url.append("?status=P");
        }

        request.setAttribute("username", username);

        RequestDispatcher dispatcher
                = getServletContext().getRequestDispatcher(url.toString());
        dispatcher.forward(request, response);
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
