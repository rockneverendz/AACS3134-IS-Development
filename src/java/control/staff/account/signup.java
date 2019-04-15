package control.staff.account;

import entity.Category;
import entity.Staff;
import java.io.IOException;
import javax.persistence.RollbackException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.CategoryService;
import service.StaffService;

public class signup extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Get parameter from the form
        String staffid = request.getParameter("StaffID");
        String staffusername = request.getParameter("StaffUsername");
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");
        String passwordRe = request.getParameter("CPassword");
        String category = request.getParameter("Category");

        // Initialize variables
        StringBuilder url = new StringBuilder("/staff/account/signup.jsp");
        Staff staff = new Staff();
        StaffService staffService = new StaffService();
        CategoryService categoryService = new CategoryService();

        staff.setUserIdCard(staffid);
        staff.setUsername(staffusername);
        staff.setEmail(email);

        try {
            if (staffService.isUserIDUsed(staff.getUserIdCard())) {
                url.append("?status=U");
                throw new IllegalArgumentException();
            }

            if (staffService.isUsernameUsed(staff.getUsername())) {
                url.append("?status=N");
                throw new IllegalArgumentException();
            }

            if (staffService.isEmailUsed(staff.getEmail())) {
                url.append("?status=E");
                throw new IllegalArgumentException();
            }

            if (!password.equals(passwordRe)) {
                url.append("?status=P");
                throw new IllegalArgumentException();
            }
            staff.setPassword(password);

            Category categoryObj = categoryService.findCategoryByID(Integer.parseInt(category));
            if (categoryObj == null) {
                url.append("?status=C");
                throw new IllegalArgumentException();
            }
            staff.setCategoryId(categoryObj);

            // Insert & Commit (over at service.CustomerService)
            staffService.addStaff(staff);
            staffService.close();

            // Bind into Session
            HttpSession session = request.getSession();
            session.setAttribute("staff", staff);
            session.setMaxInactiveInterval(-1);

            // Redirect back to homepage with status 'Success'
            response.sendRedirect("../reports/mealPreparation.jsp");
            return;

        } catch (IllegalArgumentException ex) {
        } catch (RollbackException ex) {
            url.append("?status=X");
        }

        staffService.close();
        staff.setPassword("");
        request.setAttribute("staff", staff);

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
