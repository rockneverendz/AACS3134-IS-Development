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
import service.ExternalService;

public class signup extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Get parameter from the form
        String useridcard = request.getParameter("UserIDCard");
        String username = request.getParameter("Username");
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");
        String passwordRe = request.getParameter("CPassword");

        // Initialize variables
        StringBuilder url = new StringBuilder("/user/account/signup.jsp");
        Customer customer = new Customer();
        CustomerService service = new CustomerService();
        ExternalService externalService = new ExternalService();

        customer.setUserIdCard(useridcard);
        customer.setUsername(username);
        customer.setEmail(email);

        try {
            if (!externalService.isStudentIdIDExist(customer.getUserIdCard())) {
                url.append("?status=C");
                throw new IllegalArgumentException();
            }
            
            if (service.isUserIDUsed(customer.getUserIdCard())) {
                url.append("?status=U");
                throw new IllegalArgumentException();
            }
            
            if (service.isUsernameUsed(customer.getUsername())) {
                url.append("?status=N");
                throw new IllegalArgumentException();
            }

            if (service.isEmailUsed(customer.getEmail())) {
                url.append("?status=E");
                throw new IllegalArgumentException();
            }

            if (!password.equals(passwordRe)) {
                url.append("?status=P");
                throw new IllegalArgumentException();
            }
            customer.setPassword(password);

            // Insert & Commit (over at service.CustomerService)
            service.addCustomer(customer);
            service.close();

            // Bind into Session
            HttpSession session = request.getSession();
            session.setAttribute("customer", customer);
            session.setMaxInactiveInterval(-1);

            // Success! Closing services since we're not gonna enter 'finally'
            externalService.close();
            service.close();
            
            // Redirect back to homepage with status 'Success'
            response.sendRedirect("../meal/main.jsp?status=1");
            return;

        } catch (IllegalArgumentException ex) {
        } catch (RollbackException ex) {
            url.append("?status=X");
        } finally {
            externalService.close();
            service.close();
        }
        
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
