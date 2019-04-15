<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="service.OrderService"%>
<%@page import="service.ReloadService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="service.CustomerService"%>
<%@page import="entity.Reload"%>
<%@page import="java.util.List"%>
<!doctype html>
<html lang="en" style="position: relative; min-height: 100%;">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <title>Reload History</title>
        <style>
            a.dropdown-item:nth-of-type(3){
                color: #fff;
                text-decoration: none;
                background-color: #007bff;
            }

            html{
                background-color: #f8f9fa;
            }

            .table {
                margin-bottom: 0;
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

            .border-left-success {
                border-left: .25rem solid #1cc88a!important;
            }

            .border-left-primary {
                border-left: .25rem solid #4e73df!important;
            }

        </style>
    </head>
    <body style="margin-bottom: 60px;">
        <%@include file="../layout/navbar.jsp" %>
        <main role="main">

            <section class="text-center">
                <div class="container d-flex justify-content-between align-items-center">
                    <h1 class="display-2">Reload History</h1>
                    <a href="#" class="btn btn-primary my-2">Print
                        <i class="fas fa-print"></i>
                    </a>
                </div>
            </section>

            <%  String yearS = request.getParameter("year");
                int year;

                if (yearS == null) { // If no year is received
                    Calendar c = Calendar.getInstance();
                    c.setTime(new Date());
                    year = c.get(Calendar.YEAR);
                } else { // If parameter is received
                    year = Integer.parseInt(yearS);
                }
            %>

            <div class="album py-5 bg-light">
                <div class="container">
                    <div class="container-fluid">
                        <div class="mb-4" style="position: relative; height:400px">
                            <canvas id="myChart"></canvas>
                        </div>
                        <div class="card shadow mb-4 w-100">
                            <div class="card-header py-3 d-flex">
                                <h6 class="my-auto text-primary">Reload Report</h6>
                                <div class="ml-auto">
                                    <form class="input-group" action="./reload.jsp">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Year</span>
                                        </div>
                                        <input id="datepicker" name="year" type="text" class="form-control" value="<%= year%>">
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
                                            <th rowspan="1" colspan="1" style="width: 12.5%;">Reload #</th>
                                            <th rowspan="1" colspan="1" style="width: 22.5%;">Date</th>
                                            <th rowspan="1" colspan="1" style="width: 22.5%;">Time</th>
                                            <th rowspan="1" colspan="1" style="width: 20%;">Staff</th>
                                            <th rowspan="1" colspan="1" style="width: 22.5%;">Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%  OrderService os = new OrderService();
                                            ReloadService rs = new ReloadService();
                                            List<Reload> list = rs.findReloadByCustIDYear(customer.getCustId(), year);

                                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-YYYY");
                                            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

                                            double totalAmount = 0;
                                            for (Reload reload : list) {
                                        %>
                                        <tr role="row">
                                            <td><%= reload.getReloadId()%></td>
                                            <td><%= dateFormat.format(reload.getDate())%></td>
                                            <td><%= timeFormat.format(reload.getTime())%></td>
                                            <td><%= reload.getStaffId().getUsername()%></td>
                                            <td>RM <%= String.format("%.2f", reload.getAmount())%></td>
                                        </tr>
                                        <%
                                                totalAmount = totalAmount + reload.getAmount();
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
            $('#datepicker').datepicker({
                format: "yyyy",
                startView: 2,
                minViewMode: 2,
                maxViewMode: 2
            });

            <%  // Get list of Object[] and cast it into Int and String
                List<Object[]> summaryReload = rs.findReloadSummary(customer.getCustId(), year);
                List<Object[]> summaryPayment = os.findPaymentSummary(customer.getCustId(), year);

                String[] reloadData = new String[]{"0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"};
                String[] paymentData = new String[]{"0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"};
                Object[] elem;

                int idx;

                for (idx = 0; idx < summaryReload.size(); idx++) {
                    elem = summaryReload.get(idx);
                    reloadData[(Integer) elem[0] - 1] = String.format("%.2f", (Double) elem[1]);
                }

                for (idx = 0; idx < summaryPayment.size(); idx++) {
                    elem = summaryPayment.get(idx);
                    paymentData[(Integer) elem[0] - 1] = String.format("%.2f", (Double) elem[1]);
                }
            %>

            var ctx = $('#myChart');
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    datasets: [{
                            label: 'Reload Amount (RM)',
                            data: [<%= String.join(",", reloadData)%>],
                            borderWidth: 3,
                            lineTension: 0.3,
                            backgroundColor: "rgba(78, 115, 223, 0.05)",
                            borderColor: "rgba(78, 115, 223, 1)",
                            pointRadius: 3,
                            pointBackgroundColor: "rgba(78, 115, 223, 1)",
                            pointBorderColor: "rgba(78, 115, 223, 1)",
                            pointHoverRadius: 3,
                            pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
                            pointHoverBorderColor: "rgba(78, 115, 223, 1)",
                            pointHitRadius: 10,
                            pointBorderWidth: 2
                        }, {
                            label: 'Payment Amount (RM)',
                            data: [<%= String.join(",", paymentData)%>],
                            borderWidth: 3,
                            lineTension: 0.3,
                            backgroundColor: "rgba(244, 67, 54, 0.05)",
                            borderColor: "rgba(244, 67, 54, 1)",
                            pointRadius: 3,
                            pointBackgroundColor: "rgba(244, 67, 54, 1)",
                            pointBorderColor: "rgba(244, 67, 54, 1)",
                            pointHoverRadius: 3,
                            pointHoverBackgroundColor: "rgba(244, 67, 54, 1)",
                            pointHoverBorderColor: "rgba(244, 67, 54, 1)",
                            pointHitRadius: 10,
                            pointBorderWidth: 2
                        }]
                },
                options: {
                    maintainAspectRatio: false,
                    scales: {
                        xAxes: [{
                                gridLines: {
                                    display: false,
                                    drawBorder: false
                                },
                                ticks: {
                                    maxTicksLimit: 12
                                }
                            }],
                        yAxes: [{
                                ticks: {
                                    beginAtZero: true,
                                    maxTicksLimit: 5
                                },
                                gridLines: {
                                    color: "rgb(234, 236, 244)",
                                    zeroLineColor: "rgb(234, 236, 244)",
                                    drawBorder: false,
                                    borderDash: [2],
                                    zeroLineBorderDash: [2]
                                }
                            }]
                    },
                    legend: {
                        display: true
                    },
                    tooltips: {
                        backgroundColor: "rgb(255,255,255)",
                        bodyFontColor: "#858796",
                        titleMarginBottom: 10,
                        titleFontColor: '#6e707e',
                        titleFontSize: 14,
                        borderColor: '#dddfeb',
                        borderWidth: 1,
                        xPadding: 15,
                        yPadding: 15,
                        caretPadding: 10
                    }
                }
            });

        </script>
    </body>
</html>
