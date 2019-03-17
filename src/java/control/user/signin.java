package control.user;

import entity.Customer;
import java.io.IOException;
import javax.persistence.NoResultException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.CustomerService;

public class signin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get parameter from the form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Initialize variables
        String message;
        String url = "/user/account/SignIn.jsp";
        CustomerService customerService = new CustomerService();

        try {
            // Find by Customer Email which is Unique.
            Customer customer = customerService.findCustByUsername(username);
            customerService.close();

            // Compare both passwords
            if (!password.equals(customer.getPassword())) {
                throw new IllegalArgumentException();
            }

            // Bind into Session
            HttpSession session = request.getSession();
            session.setAttribute("customer", customer);
            session.setMaxInactiveInterval(-1);

            // Redirect back to homepage with status 'Success'
            response.sendRedirect("../../index.jsp");
            return;

        } catch (NoResultException ex) {
            message = "Username is found.";
        } catch (IllegalArgumentException ex) {
            message = "Password incorrect.";
        }

        // Redirect back with the username and error message.
        request.setAttribute("message", message);
        request.setAttribute("username", username);

        RequestDispatcher dispatcher
                = getServletContext().getRequestDispatcher(url);
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