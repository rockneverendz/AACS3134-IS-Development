<%@page import="service.CouponService"%>
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

            <%  String dateString = request.getParameter("date");
                SimpleDateFormat monthFormat = new SimpleDateFormat("MM-yyyy");
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                OrderService os = new OrderService();
                CouponService cs = new CouponService();
                Calendar c = Calendar.getInstance();
                Date date;

                if (dateString == null) {
                    date = new Date();
                } else {
                    date = monthFormat.parse(dateString);
                }

                c.setTime(date);
                int month = c.get(Calendar.MONTH) + 1; // beware of month indexing from zero
            %>

            <div class="container">
                <div class="container-fluid row">
                    <div class="col-6 mb-4 p-5" style="position: relative; height:350px">
                        <canvas class="col-12" id="monthChart"></canvas>
                        <h2 class="display-4 text-left"><%= monthFormat.format(date)%></h2>
                    </div>
                    <div class="col-6 mb-4 p-5" style="position: relative; height:350px">
                        <canvas class="col-12" id="overallChart"></canvas>
                        <h2 class="display-4 text-right">Overall</h2>
                    </div>
                </div>          
            </div>


            <div class="album py-5 bg-light">
                <div class="container">
                    <div class="container-fluid">
                        <%  List<Ordermeal> list = os.findOrderByCustCompleted(customer.getCustId(), month);

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
                            <div class="card-header py-3 d-flex">
                                <h6 class="my-auto text-primary">Order Report</h6>
                                <div class="ml-auto">
                                    <form class="input-group" action="./ordercompleted.jsp">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Month</span>
                                        </div>
                                        <input id="datepicker" name="date" type="text" class="form-control" value="<%= monthFormat.format(date)%>">
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-success" type="submit" id="search">Search</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="card-body p-0">
                                <table class="table mb-0" width="100%" cellspacing="0" role="grid" style="width: 100%;">
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
                                                Ordermeal ordermeal = list.get(i);
                                                amount = ordermeal.getPaymentId().getAmount();
                                        %>
                                        <tr role="row" class="ordermeal" data-prod-cat="<%= i%>">
                                            <td><%= ordermeal.getOrderId()%></td>
                                            <td><%= ordermeal.getType()%></td>
                                            <td><%= dateFormat.format(ordermeal.getPaymentId().getDate())%></td>
                                            <td><%= ordermeal.getStatus()%></td>
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
                                            for (Orderlist ol : ordermeal.getOrderlistList()) {
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
                                        <tr role="row" class="table-primary">
                                            <td colspan="4" class="text-right"><strong>Total</strong></td>
                                            <td>RM <%= String.format("%.2f", totalAmount)%></td>
                                        </tr>
                                    </tfoot>
                                </table>
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
        <link href="../../bootstrap/css/Chart.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../bootstrap/js/Chart.min.js" type="text/javascript"></script>
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

            <%  List<Object[]> summary;
                StringBuilder data = new StringBuilder();
                StringBuilder labels = new StringBuilder();

                summary = cs.findCouponSummary(customer.getCustId(), month);

                data = new StringBuilder();
                labels = new StringBuilder();

                for (int idx = 0; idx < summary.size(); idx++) {
                    Object[] elem = summary.get(idx);
                    data.append((Integer) elem[0] + ",");
                    labels.append("\"" + (String) elem[1] + "\",");
                }
            %>

            var ctx = $('#monthChart');
            var myPieChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: [<%= labels.toString()%>],
                    datasets: [{
                            data: [<%= data.toString()%>],
                            backgroundColor: ['#537c8e', '#2ebdbd', '#eff1e4', '#ceae7f', '#85583f', '#573718'],
                            borderWidth: 0
                        }]
                },
                options: {
                    maintainAspectRatio: true,
                    tooltips: {
                        backgroundColor: "rgb(255,255,255)",
                        bodyFontColor: "#858796",
                        borderColor: '#dddfeb',
                        borderWidth: 1,
                        xPadding: 15,
                        yPadding: 15,
                        displayColors: false,
                        caretPadding: 10
                    },
                    cutoutPercentage: 50
                }
            });

            <%  // Get list of Object[] and cast it into Int and String
                summary = cs.findCouponSummary(customer.getCustId());

                data = new StringBuilder();
                labels = new StringBuilder();

                for (int idx = 0; idx < summary.size(); idx++) {
                    Object[] elem = summary.get(idx);
                    data.append((Integer) elem[0] + ",");
                    labels.append("\"" + (String) elem[1] + "\",");
                }
            %>

            var ctx = $('#overallChart');
            var myPieChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: [<%= labels.toString()%>],
                    datasets: [{
                            data: [<%= data.toString()%>],
                            backgroundColor: ['#ff6358', '#ffd246', '#78d237', '#28b4c8', '#2d73f5', '#aa46be'],
                            borderWidth: 0
                        }]
                },
                options: {
                    maintainAspectRatio: true,
                    tooltips: {
                        backgroundColor: "rgb(255,255,255)",
                        bodyFontColor: "#858796",
                        borderColor: '#dddfeb',
                        borderWidth: 1,
                        xPadding: 15,
                        yPadding: 15,
                        displayColors: false,
                        caretPadding: 10
                    },
                    cutoutPercentage: 50
                }
            });
        </script>
    </body>
</html>