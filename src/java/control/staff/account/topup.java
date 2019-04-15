package control.staff.account;

import entity.Customer;
import entity.Reload;
import entity.Staff;
import java.io.IOException;
import java.util.Date;
import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CustomerService;
import service.ReloadService;
import service.StaffService;

public class topup extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get parameter from the form
        String studentID = request.getParameter("studid");
        int staffID = Integer.parseInt(request.getParameter("staffid"));
        int amount = Integer.parseInt(request.getParameter("amount"));

        //Initialization
        Date date = new Date();
        Customer customer;
        CustomerService customerService = new CustomerService();
        Reload reload = new Reload();
        ReloadService reloadService = new ReloadService();
        Staff staff;
        StaffService staffService = new StaffService();

        try {
            //Find customer and staff
            customer = customerService.findCustByUserIdCard(studentID);
            staff = staffService.findStaffByID(staffID);
            //Get current credit points
            double currentCreditPoints = customer.getCreditpoints();
            //Update credit points
            double updatedCreditPoints = currentCreditPoints + amount;
            customer.setCreditpoints(updatedCreditPoints);

            //Update Reload table(Top-up History)
            reload.setCustId(customer);
            reload.setStaffId(staff);
            reload.setDate(date);
            reload.setTime(date);
            reload.setAmount(amount);

            if (customerService.updateCustomer(customer)) {
                reloadService.addReload(reload);                //Add new Topup record
                response.sendRedirect("topup.jsp?status=1&studID="+ studentID +"&updatedCP=" + updatedCreditPoints);    //Successful Update Credit Points
            } else {
                response.sendRedirect("topup.jsp?status=0");    //Failed Update Credit Points
            }

        } catch (NoResultException ex) {
            response.sendRedirect("topup.jsp?status=U");        //Failed to get Student ID
        } finally {
            customerService.close();
            reloadService.close();
            staffService.close();
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
