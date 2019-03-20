package control.user;

import entity.Customer;
import java.io.IOException;
import javax.persistence.RollbackException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.CustomerService;

public class signup extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Get parameter from the form
        String userid = request.getParameter("UserID");
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");
        String passwordRe = request.getParameter("CPassword");

        // Initialize variables
        StringBuilder url = new StringBuilder("/user/account/signup.jsp");
        Customer customer = new Customer();
        CustomerService customerService = new CustomerService();

        customer.setEmail(email);
        customer.setUsername(userid);

        try {
            if (customerService.isUserIDUsed(userid)) {
                url.append("?status=U");
                throw new IllegalArgumentException();
            }

            if (customerService.isEmailUsed(email)) {
                url.append("?status=E");
                throw new IllegalArgumentException();
            }

            if (!password.equals(passwordRe)) {
                url.append("?status=P");
                throw new IllegalArgumentException();
            }
            customer.setPassword(password);

            // Insert & Commit (over at service.CustomerService)
            customerService.addCustomer(customer);
            customerService.close();

            // Bind into Session
            HttpSession session = request.getSession();
            session.setAttribute("customer", customer);
            session.setMaxInactiveInterval(-1);

            // Redirect back to homepage with status 'Success'
            response.sendRedirect("../meal/main.jsp?status=1");
            return;

        } catch (IllegalArgumentException ex) {
        } catch (RollbackException ex) {
            url.append("?status=X");
        }

        customerService.close();
        customer.setPassword("");
        request.setAttribute("customer", customer);

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
