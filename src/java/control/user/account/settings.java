package control.user.account;

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

public class settings extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Get parameter from the form
        String newPassword = request.getParameter("NewPassword");
        String newCPassword = request.getParameter("NewCPassword");
        String currentPassword = request.getParameter("CurrentPassword");
        
        // Get current customer
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");

        // Initialize variables
        StringBuilder url = new StringBuilder("../account/settings.jsp");
        CustomerService service = new CustomerService();
        customer = service.findCustByID(customer.getCustId()); //Use the customer object from session to find customer from database.

        try {
            if (!newPassword.equals(newCPassword)) {
                url.append("?status=P");
                throw new IllegalArgumentException();
            }
            
            if (!customer.getPassword().equals(currentPassword)) {
                url.append("?status=C");
                throw new IllegalArgumentException();
            }
            customer.setPassword(newPassword);

            // Insert & Commit (over at service.CustomerService)
            service.addCustomer(customer);
            service.close();

            // Bind into Session
            session.setAttribute("customer", customer);
            session.setMaxInactiveInterval(-1);

            // Redirect back to homepage with status 'Success'
            response.sendRedirect(url.append("?status=1").toString());
            return;

        } catch (IllegalArgumentException ex) {
        } catch (RollbackException ex) {
            url.append("?status=X");
        }

        service.close();
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
