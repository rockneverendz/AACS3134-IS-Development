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

            tr th:first-child, tr td:first-child{
                padding-left: 2.25rem;
            }

            tr th:nth-last-child(2), tr td:nth-last-child(2){
                text-align: right;
            }

            tr th:last-child, tr td:last-child{                
                padding-right: 2.25rem;
                text-align: right;
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
                        <%  String status = request.getParameter("status");
                            String message;
                            String type;
                            if (status != null) {
                                char code = status.charAt(0);
                                if (code == 'C') {
                                    type = "warning";
                                    message = "Not enough credit points!";
                                } else {
                                    type = "danger";
                                    message = "An error has occured";
                                }
                        %>            
                        <div class="alert alert-<%= type%>" role="alert">
                            <%= message%>
                        </div>
                        <%
                            }
                        %>
                        <div class="card shadow mb-4 w-100">
                            <div class="card-body p-0">
                                <table class="table">
                                    <thead class="thead-light">
                                        <tr>
                                            <th style="width: 5%;">#</th>
                                            <th style="width: 27.5%;">Food</th>
                                            <th style="width: 12.5%;">Quantity</th>
                                            <th style="width: 12.5%;">Date</th>
                                            <th style="width: 12.5%;">Time</th>
                                            <th style="width: 15%;">Price</th>
                                            <th style="width: 15%;">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%  Orderlist orderlist;
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
                                                coupon = orderlist.getCoupon();

                                                priceEach = orderlist.getPriceeach();
                                                quantity = orderlist.getQuantity();
                                                total = priceEach * quantity;
                                                grandTotal += total;

                                        %>
                                        <tr>
                                            <td id="row<%= i%>"><%= i + 1%></td>
                                            <td><%= orderlist.getMeal().getName()%></td>
                                            <td><%= orderlist.getQuantity()%></td>
                                            <td><%= dateFormat.format(coupon.getRedeemDate())%></td>
                                            <td><%= coupon.getRedeemTime()%></td>
                                            <td><%= String.format("%.2f", priceEach)%></td>
                                            <td><strong><%= String.format("%.2f", total)%></strong></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                        <tr scope="row">
                                            <td colspan="6"><strong>Subtotal:</strong></td>
                                            <td><strong><%= String.format("%.2f", grandTotal)%></strong></td>
                                        </tr> 
                                        <tr scope="row">
                                            <td colspan="6"><strong>Current Credit Points:</strong></td>
                                            <td><strong><%= String.format("%.2f", customer.getCreditpoints())%></strong></td>
                                        </tr>
                                        <tr scope="row">
                                            <td colspan="6"><strong>New Credit Points:</strong></td>
                                            <td><strong><%= String.format("%.2f", customer.getCreditpoints() - grandTotal)%></strong></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer">
                                <a href="javascript:history.back()" class="btn btn-secondary btn-lg" 
                                   role="button">Go Back</a>
                                <a href="../order/confirmOrder" class="btn btn-primary btn-lg float-right" 
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
