package control.user.order;

import entity.Customer;
import entity.Orderlist;
import entity.Ordermeal;
import entity.Payment;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.CustomerService;
import service.OrderService;

public class confirmOrder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Initialize variables
        StringBuilder url = new StringBuilder("../meal/report/order.jsp");
        CustomerService cs;
        OrderService os;
        Ordermeal ordermeal;
        Payment payment;
        Date date;
        double total = 0;

        // Get session order. If null, redirect with status 'Error'.
        HttpSession session = request.getSession();
        ArrayList<Orderlist> order = (ArrayList) session.getAttribute("order");
        Customer customer = (Customer) session.getAttribute("customer");
        if (order == null && customer == null) {
            session.invalidate();
            response.sendRedirect("../account/signin.jsp?status=X");
            return;
        }

        cs = new CustomerService();
        os = new OrderService();
        ordermeal = new Ordermeal();
        payment = new Payment();
        date = new Date();

        for (Orderlist orderlist : order) {
            total =+ orderlist.getPriceeach() * orderlist.getQuantity();
        }
        
        payment.setDate(date);
        payment.setTime(date);
        payment.setAmount(total);

        ordermeal.setPaymentId(payment);
        ordermeal.setStatus("Paid");
        ordermeal.setType("Single"); //TODO variable type
        ordermeal.setCustId(cs.findCustByID(customer.getCustId()));

        // Release the kraken
        os.addMealorder(ordermeal, payment, order, customer);

        // Redirect back with status 'Success'
        url.append("?status=1");

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
