<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="service.OrderService"%>
<%@page import="entity.Coupon"%>
<%@page import="entity.Orderlist"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entity.Ordermeal"%>
<%@page import="javax.persistence.criteria.Order"%>
<%@page import="java.util.List"%>
<%@page import="service.CustomerService"%>
<!doctype html>
<html lang="en" style="position: relative; min-height: 100%;">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <title>Order History</title>
        <style>
            a.dropdown-item:nth-of-type(2){
                color: #fff;
                text-decoration: none;
                background-color: #007bff;
            }

            html{
                background-color: #f8f9fa;
            }

            td, th {
                vertical-align: middle!important;
            }

            .table > thead > tr > th:first-child,
            .table > tbody > tr > td:first-child
            {
                padding-left: 2.25rem;
                text-align: center;
            }

            .table > thead > tr > th:last-child,
            .table > tbody > tr > td:last-child
            {                
                padding-right: 2.25rem;
            }

            .ordermeal {
                background-color: rgba(0,0,0,.05);
                cursor: pointer;
            }

        </style>
    </head>
    <body style="margin-bottom: 60px;">
        <%@include file="../layout/navbar.jsp" %>
        <main role="main">

            <section class="text-center">
                <div class="container d-flex justify-content-between align-items-center">
                    <h1 class="display-2">Order History</h1>
                    <div class="btn-group">
                        <a class="btn btn-secondary btn-lg" href="./orderpaid.jsp" role="button">Paid</a>
                        <a class="btn btn-secondary btn-lg active" href="#" role="button">Completed</a>
                    </div>
                    <a href="#" class="btn btn-primary my-2">Print
                        <i class="fas fa-print"></i>
                    </a>
                </div>
            </section>

            <div class="album py-5 bg-light">
                <div class="container">
                    <div class="container-fluid">
                        <%  String dateString = request.getParameter("date");
                            SimpleDateFormat dateFormat = new SimpleDateFormat("MM-yyyy");
                            Calendar c = Calendar.getInstance();
                            Date date;

                            if (dateString == null) {
                                date = new Date();
                            } else {
                                date = dateFormat.parse(dateString);
                            }

                            c.setTime(date);
                            int month = c.get(Calendar.MONTH) + 1; // beware of month indexing from zero

                            OrderService os = new OrderService();
                            List<Ordermeal> list = os.findOrderByCustCompleted(customer.getCustId(), month);

                            double amount;
                            double totalAmount = 0;

                            String status = request.getParameter("status");
                            String message;
                            String type;
                            if (status != null) {
                                char code = status.charAt(0);
                                if (code == '1') {
                                    type = "success";
                                    message = "Successfully Canceled Order!";
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
                            <div class="card-header py-3 d-flex mb-3">
                                <h6 class="my-auto text-primary">Order Report</h6>
                                <div class="ml-auto">
                                    <form class="input-group" action="./ordercompleted.jsp">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Month</span>
                                        </div>
                                        <input id="datepicker" name="date" type="text" class="form-control" value="<%= dateFormat.format(date)%>">
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-success" type="submit" id="search">Search</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="card-body p-0">
                                <table class="table" width="100%" cellspacing="0" role="grid" style="width: 100%;">
                                    <thead class="thead-light">
                                        <tr role="row">
                                            <th rowspan="1" colspan="1" style="width: 10%;">Order #</th>
                                            <th rowspan="1" colspan="1" style="width: 25%;">Type</th>
                                            <th rowspan="1" colspan="1" style="width: 25%;">Order Date</th>
                                            <th rowspan="1" colspan="1" style="width: 20%;">Status</th>
                                            <th rowspan="1" colspan="1" style="width: 20%;">Subtotal</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%  for (int i = 0; i < list.size(); i++) {
                                                Ordermeal order = list.get(i);
                                                amount = order.getPaymentId().getAmount();
                                        %>
                                        <tr role="row" class="ordermeal" data-prod-cat="<%= i%>">
                                            <td><%= order.getOrderId()%></td>
                                            <td><%= order.getType()%></td>
                                            <td><%= dateFormat.format(order.getPaymentId().getDate())%></td>
                                            <td><%= order.getStatus()%></td>
                                            <td>RM <%= String.format("%.2f", amount)%></td>
                                        </tr>
                                        <tr role="row" class="table-secondary cat<%= i%>" style="display:none">
                                            <td></td>
                                            <th>Meal</th>
                                            <th>Quantity</th>
                                            <th>Date</th>
                                            <th>Time</th>
                                        </tr>
                                        <%
                                            for (Orderlist ol : order.getOrderlistList()) {
                                                Coupon coupon = ol.getCoupon();
                                        %>
                                        <tr role="row" class="cat<%= i%>" style="display:none">
                                            <td></td>
                                            <td><%= ol.getMeal().getName()%></td>
                                            <td><%= ol.getQuantity()%></td>
                                            <td><%= dateFormat.format(coupon.getRedeemDate())%></td>
                                            <td><%= coupon.getRedeemTime()%></td>
                                        </tr>
                                        <%
                                                }
                                                totalAmount = totalAmount + amount;
                                            }
                                        %>
                                    </tbody>
                                    <tfoot>
                                        <tr role="row">
                                            <td colspan="4"><strong>Total</strong></td>
                                            <td>RM <%= String.format("%.2f", totalAmount)%></td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>      
            </div>
        </div>
    </main>
    <%@include file="../layout/footer.jsp" %>
    <%@include file="../layout/scripts.jsp" %>
    <link href="../../bootstrap/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css"/>
    <script src="../../bootstrap/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $(".ordermeal").click(function (e) {
                e.preventDefault();
                $('.cat' + $(this).attr('data-prod-cat')).toggle();
            });
        });

        $('#datepicker').datepicker({
            format: "mm-yyyy",
            startView: 1,
            minViewMode: 1,
            maxViewMode: 2
        });
    </script>
</body>
</html>
