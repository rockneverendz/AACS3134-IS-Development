package control.staff.account;

import entity.Coupon;
import entity.Orderlist;
import entity.Ordermeal;
import service.CouponService;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.OrderService;

public class redeemCoupon extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            //Get input
            int couponID = Integer.parseInt(request.getParameter("couponid"));

            //Get today date
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/YYYY");
            Date todayDate = new Date();
            String todayDateString = dateFormat.format(todayDate);

            //Initialization
            CouponService couponService = new CouponService();
            Coupon coupon = couponService.findCouponByID(couponID);
            String status = coupon.getStatus();
            Date redeemDate = coupon.getRedeemDate();
            String redeemDateString = dateFormat.format(coupon.getRedeemDate());
            System.out.println(status);

            int i;
            //Check Status
            switch (status) {
                case "Active":
                    //Check is today date
                    if (redeemDateString.equalsIgnoreCase(todayDateString)) {
                        //Update Status and send redirect
                        couponService.setStatusRedeem(couponID);
                        response.sendRedirect("redeemCoupon.jsp?status=1");
                    } else if (redeemDate.before(todayDate)) {    //Check if coupon is expired
                        //Update coupon status and send redirect
                        couponService.setStatusExpried(couponID);
                        response.sendRedirect("redeemCoupon.jsp?status=E");
                    } else {
                        response.sendRedirect("redeemCoupon.jsp?status=D");  //Not valid date for redeem
                    }
                    break;
                case "Redeemed":
                    response.sendRedirect("redeemCoupon.jsp?status=R");
                    break;
                case "Expired":
                    response.sendRedirect("redeemCoupon.jsp?status=E");
                    break;
                default:
                    break;
            }

            // Get ordermeal from database to ensure it's up to date. ( From coupon update above )
            OrderService orderservice = new OrderService();
            Ordermeal ordermeal = orderservice.findOrderByID(coupon.getOrderlistList().get(0).getOrdermeal().getOrderId());
            List<Orderlist> list = ordermeal.getOrderlistList();

            // Check if every coupon is redeem
            for (i = 0; i < list.size(); i++) {
                if (list.get(i).getCoupon().getStatus().equals("Active")) {
                    i = list.size() + 1;
                }
            }

            // If 'i' made it through the whole list
            if (i == list.size()) {
                ordermeal.setStatus("Completed");
            }

        } catch (NoResultException | NumberFormatException | NullPointerException ex) {
            response.sendRedirect("redeemCoupon.jsp?status=U");
            System.out.println(ex.getMessage());
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
