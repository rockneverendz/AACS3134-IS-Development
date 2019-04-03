package control.staff.account;

import entity.Coupon;
import service.CouponService;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
            String active = "Active";
            String redeemed = "Redeemed";
            String expired = "Expired";
            String status = coupon.getStatus();
            Date redeemDate = coupon.getRedeemDate();
            String redeemDateString = dateFormat.format(coupon.getRedeemDate());
            System.out.println(status);
            //Check Status
            if (status.equalsIgnoreCase(active)) {
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

            } else if (status.equalsIgnoreCase(redeemed)) {
                response.sendRedirect("redeemCoupon.jsp?status=R");

            } else if (status.equalsIgnoreCase(expired)) {
                response.sendRedirect("redeemCoupon.jsp?status=E");
            }
        } catch (NoResultException ex) {
            response.sendRedirect("redeemCoupon.jsp?status=U");
            System.out.println(ex.getMessage());
        } catch (NumberFormatException ex) {
            response.sendRedirect("redeemCoupon.jsp?status=U");
            System.out.println(ex.getMessage());
        } catch (NullPointerException ex) {
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
