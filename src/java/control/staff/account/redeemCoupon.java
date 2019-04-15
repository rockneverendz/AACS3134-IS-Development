package control.staff.account;

import entity.Coupon;
import entity.Orderlist;
import entity.Ordermeal;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CouponService;
import service.OrderService;

public class redeemCoupon extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CouponService couponService = new CouponService();
        OrderService orderService = new OrderService();
        StringBuilder url = new StringBuilder("redeemCoupon.jsp");
        try {
            // Get input
            int couponID = Integer.parseInt(request.getParameter("couponid"));
            String redeemTime = request.getParameter("redeemTime");

            // Get today date
            Calendar cal = Calendar.getInstance();
            Date todayDate = new Date();

            // Remove time
            cal.setTime(todayDate);
            cal.set(Calendar.HOUR_OF_DAY, 0);
            cal.set(Calendar.MINUTE, 0);
            cal.set(Calendar.SECOND, 0);
            cal.set(Calendar.MILLISECOND, 0);
            todayDate = cal.getTime();

            // Initialization
            Coupon coupon = couponService.findCouponByID(couponID);

            // Get ordermeal from coupon.
            Ordermeal ordermeal = orderService.findOrderByID(coupon.getOrderlist().getOrdermeal().getOrderId());
            switch (ordermeal.getStatus()) {
                case "Paid":
                    switch (coupon.getStatus()) {
                        case "Active":

                            // Check is today date
                            System.out.println(coupon.getRedeemDate());
                            System.out.println(todayDate);
                            if (coupon.getRedeemDate().compareTo(todayDate) == 0) {

                                // Check time matches the option selected
                                if (coupon.getRedeemTime().equals(redeemTime)) {
                                    couponService.setStatusRedeem(couponID); // Update Status and send redirect
                                    url.append("?status=1");
                                } else {
                                    url.append("?status=T"); // Does not match time selected
                                }

                            } else if (coupon.getRedeemDate().before(todayDate)) { // Check if coupon is expired
                                couponService.setStatusExpried(couponID); // Update coupon status and send redirect
                                url.append("?status=E");
                            } else {
                                url.append("?status=D"); // Not valid date for redeem (Maybe too early)
                            }

                            // Get orderlist from the order
                            List<Orderlist> list = ordermeal.getOrderlistList();
                            int i;

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

                            break;
                        case "Redeemed":
                            url.append("?status=R");
                            break;
                        case "Expired":
                            url.append("?status=E");
                            break;
                        default:
                            url.append("?status=X"); // Unknown error occured.
                            break;
                    }
                    break;
                case "Completed":
                    url.append("?status=O");
                    break;
                case "Canceled":
                    url.append("?status=C");
                    break;
                default:
                    url.append("?status=X"); // Unknown error occured.
                    break;
            }

            response.sendRedirect(url.toString());

        } catch (NumberFormatException | NullPointerException | NoResultException ex) {
            response.sendRedirect("redeemCoupon.jsp?status=U");
            System.out.println(ex.getMessage());
        } finally {
            couponService.close();
            orderService.close();
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
