package control.user.account;

import entity.Customer;
import entity.Token;
import java.io.IOException;
import java.util.Date;
import javax.persistence.RollbackException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CustomerService;
import service.TokenService;

public class token extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Get parameter from the form
        String tokenS = request.getParameter("token");
        String newPassword = request.getParameter("NewPassword");
        String newCPassword = request.getParameter("NewCPassword");

        // Initialize variables
        TokenService ts = new TokenService();
        CustomerService cs = new CustomerService();
        Date now = new Date();

        try {
            // Find token
            Token token = ts.findTokenByToken(tokenS);

            // If Token not found OR (now > tokenDate+1)
            if (token == null || now.after(
                    TokenService.combinePlusOne(token.getDate(), token.getTime()))) {
                throw new RollbackException();
            }

            // Use token to find customer
            Customer customer = cs.findCustByID(token.getId());

            // If customer not found. Possible
            if (customer == null) {
                System.out.println(token.getId() + " has an invalid Customer/Staff ID");
                throw new RollbackException();
            }

            // Check password if it's the same
            if (!newPassword.equals(newCPassword)) {
                throw new IllegalArgumentException();
            }

            // Set and Update record
            token.setStutus("Used");
            ts.updateToken(token);

            customer.setPassword(newPassword);
            cs.updateCustomer(customer);

            // Redirect back to signin page with status 'Success'
            response.sendRedirect("../account/signin.jsp?status=C");
        } catch (IllegalArgumentException ex) {
            response.sendRedirect("../account/token.jsp?token=" + tokenS + "&status=P");
        } catch (RollbackException ex) {
            response.sendRedirect("../account/signin.jsp?status=X");
        } finally {
            cs.close();
            ts.close();
        }
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
