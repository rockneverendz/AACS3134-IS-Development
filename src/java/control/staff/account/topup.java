package control.staff.account;

import entity.Customer;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CustomerService;

public class topup extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get parameter from the form
        String studentID = request.getParameter("studid");
        int amount = Integer.parseInt(request.getParameter("amount"));

        //Initialization
        Customer customer;
        CustomerService customerService = new CustomerService();

        try {
            //Find customer
            customer = customerService.findCustByUserIdCard(studentID);
            //Get current credit points
            int currentCreditPoints = customer.getCreditpoints();
            //Update credit points
            int updatedCreditPoints = currentCreditPoints + amount;
            customer.setCreditpoints(updatedCreditPoints);

            if (customerService.updateCustomer(customer)) {
                response.sendRedirect("topup.jsp?status=1");
            } else {
                response.sendRedirect("topup.jsp?status=0");
            }

        } catch (Exception e) {
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
