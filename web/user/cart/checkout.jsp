<%@page import="entity.Coupon"%>
<%@page import="entity.Orderlist"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<!doctype html>
<html lang="en" style="position: relative; min-height: 100%;">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <title>Order Confirmation</title>
        <style>
            html{
                background-color: #f8f9fa;
            }

            .table > tbody > tr > td {
                vertical-align: middle;
            }
        </style>
    </head>
    <body style="margin-bottom: 60px;">
        <%@include file="../layout/navbar.jsp" %>
        <main role="main">
            <section class="text-center">
                <div class="container d-flex justify-content-between align-items-center">
                    <h1 class="display-2">Order Confirmation</h1>
                </div>
            </section>
            <div class="album py-5 bg-light">
                <div class="container">
                    <div class="container-fluid">
                        <div class="card shadow mb-4 w-100">
                            <div class="card-body p-0">
                                <table class="table table-hover">
                                    <thead class="thead-light">
                                        <tr>
                                            <th style="width: 1.25rem;"></th>

                                            <th style="width: 5%;">#</th>
                                            <th style="width: 27.5%;">Food</th>
                                            <th style="width: 12.5%;">Quantity</th>
                                            <th style="width: 12.5%;">Date</th>
                                            <th style="width: 12.5%;">Time</th>
                                            <th style="width: 15%;">Price</th>
                                            <th style="width: 15%;">Total</th>

                                            <th style="width: 1.25rem;"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%  List<Orderlist> order = (List<Orderlist>) session.getAttribute("order");
                                            Orderlist orderlist;
                                            Coupon coupon;
                                            double priceEach;
                                            int quantity;
                                            double total;
                                            double grandTotal = 0;

                                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                                            Date today = new Date();

                                            Calendar calendar = Calendar.getInstance();
                                            calendar.setTime(today);
                                            calendar.add(Calendar.DATE, 2);

                                            for (int i = 0; i < order.size(); i++) {
                                                orderlist = order.get(i);
                                                coupon = orderlist.getCouponId();

                                                priceEach = orderlist.getPriceeach();
                                                quantity = orderlist.getQuantity();
                                                total = priceEach * quantity;
                                                grandTotal += total;
                                        %>
                                        <tr>
                                            <td></td>
                                            
                                            <td id="row<%= i%>"><%= i + 1%></td>
                                            <td><%= orderlist.getMeal().getName()%></td>
                                            <td><%= orderlist.getQuantity()%></td>
                                            <td><%= dateFormat.format(coupon.getRedeemDate())%></td>
                                            <td><%= coupon.getRedeemTime()%></td>
                                            <td><%= String.format("%.2f", priceEach)%></td>
                                            <td><strong><%= String.format("%.2f", total)%></strong></td>
                                            
                                            <td></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                        <tr scope="row">
                                            <td></td>
                                            
                                            <td colspan="6"><strong>Subtotal:</strong></td>
                                            <td><strong><%= String.format("%.2f", grandTotal)%></strong></td>
                                            
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer">
                                <a href="javascript:history.back()" class="btn btn-secondary btn-lg" 
                                   role="button">Go Back</a>
                                <a href="checkout.jsp" class="btn btn-primary btn-lg float-right" 
                                   role="button">Confirm Order</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="../layout/footer.jsp" %>
        <%@include file="../layout/scripts.jsp" %>
    </body>
</html>
