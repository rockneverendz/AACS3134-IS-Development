<%@page import="service.ReloadService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*"%>
<!doctype html>
<html lang="en">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <%@include file="../layout/css.jsp" %>
        <title>Report | Top Up History</title>
        <link rel="stylesheet" type="text/css" href="../../bootstrap/css/dataTables.bootstrap4.min.css">
    </head>
    <body>
        <!-- Fixed-top Navs -->
        <%@include file="../layout/topnavbar.jsp" %>

        <div class="container-fluid">
            <div class="row">
                <!-- Fixed-Sidebar Navs -->
                <%@include file="../layout/sidebar.jsp" %>

                <%  String[] monthArr = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
                    SimpleDateFormat monthFormat = new SimpleDateFormat("MM-yyyy");
                    int i, selectedMonth, selectedYear, dayOfMonth = 0;
                    Calendar cal = Calendar.getInstance();
                    Date datee;

                    String monthString = request.getParameter("month");
                    System.out.println(monthString);
                    if (monthString == null) {
                        datee = new Date();
                    } else {
                        datee = monthFormat.parse(monthString);
                    }

                    cal.setTime(datee); //Requested Date
                    selectedMonth = cal.get(Calendar.MONTH); //If parameter equal null then set it to default
                    selectedYear = cal.get(Calendar.YEAR);
                    dayOfMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
                    selectedMonth++; //Month start from 0 so i add one lel

                %>

                <main id="mainContainer" role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <div class="container mt-4" style="max-width: 1000px;">

                        <div id="reportHeader" class="row mb-3">
                            <div class="col-6  d-none d-print-block">
                                <img class="img-fluid" src="../../resource/Logo2.png" alt="logo" width="200px">
                            </div>
                            <div class="col-6 text-right mt-1  d-none d-print-block">
                                <h6>Block B, Tunku Abdul Rahman University College,<br>53100 Kuala Lumpur,<br>Federal Territory of Kuala Lumpur</h6>
                            </div>                            
                        </div>

                        <div class="row" style="position: relative; height:300px">
                            <canvas class="col-12" id="myChart"></canvas>
                        </div>

                        <h3>Top Up History for <%= monthArr[selectedMonth - 1]%></h3>

                        <table id="myTable"  class="table table-sm table-striped table-bordered" style="width:100%">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Customer ID</th>
                                    <th>Customer Name</th>
                                    <th>Reload ID</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Staff Name</th>
                                    <th>Reload Amount</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    i = 1;
                                    String host = "jdbc:derby://localhost:1527/canteenDB";
                                    String user = "nbuser";
                                    String password = "nbuser";
                                    String sqlQuery = "SELECT C.CUST_ID, C.USERNAME, R.RELOAD_ID, R.DATE, R.TIME, S.USERNAME AS STAFFNAME, R.AMOUNT "
                                            + "FROM CUSTOMER C INNER JOIN  RELOAD R ON C.CUST_ID = R.CUST_ID "
                                            + "INNER JOIN STAFF S ON S.STAFF_ID = R.STAFF_ID "
                                            + "WHERE MONTH(R.DATE) = ? "
                                            + "AND YEAR(R.DATE) = ? "
                                            + "ORDER BY R.DATE ";
                                    try {
                                        Connection conn = DriverManager.getConnection(host, user, password);
                                        PreparedStatement stmt = conn.prepareStatement(sqlQuery);
                                        stmt.setString(1, Integer.toString(selectedMonth));
                                        stmt.setString(2, Integer.toString(selectedYear));
                                        ResultSet rs = stmt.executeQuery();
                                        while (rs.next()) {
                                            String custID = rs.getString("CUST_ID");
                                            String custName = rs.getString("USERNAME");
                                            String reloadID = rs.getString("RELOAD_ID");
                                            String date = rs.getString("DATE");
                                            String time = rs.getString("TIME");
                                            String staffName = rs.getString("STAFFNAME");
                                            String amount = rs.getString("AMOUNT");
                                %>
                                <tr>
                                    <th scope="row"><%= i++%></th>
                                    <td><%= custID%></td>
                                    <td><%= custName%></td>
                                    <td><%= reloadID%></td>
                                    <td><%= date%></td>
                                    <td><%= time%></td>
                                    <td><%= staffName%></td>
                                    <td class="text-center"><%= amount%></td>
                                </tr>
                                <%

                                        }
                                        conn.close();
                                    } catch (SQLException ex) {
                                        ex.printStackTrace();
                                    }
                                %>


                            <tfoot>
                                <tr>
                                    <th>#</th>
                                    <th>Customer ID</th>
                                    <th>Customer Name</th>
                                    <th>Reload ID</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Staff Name</th>
                                    <th>Reload Amount</th>
                                </tr>
                            </tfoot>
                            </tbody>
                        </table>

                        <table class="table table-primary table-bordered mt-5 " style="width:100%">
                            <tbody>
                                <%
                                    String sqlQuery2 = "SELECT COUNT(*) AS TOTAL_NUMBER_OF_TOPUP, SUM(R.AMOUNT) AS TOTAL_AMOUNT "
                                            + "FROM CUSTOMER C INNER JOIN  RELOAD R ON C.CUST_ID = R.CUST_ID "
                                            + "INNER JOIN STAFF S ON S.STAFF_ID = R.STAFF_ID "
                                            + "WHERE MONTH(R.DATE) = ? "
                                            + "AND YEAR(R.DATE) = ? ";
                                    try {
                                        Connection conn = DriverManager.getConnection(host, user, password);
                                        PreparedStatement stmt = conn.prepareStatement(sqlQuery2);
                                        stmt.setString(1, Integer.toString(selectedMonth));
                                        stmt.setString(2, Integer.toString(selectedYear));

                                        ResultSet rs = stmt.executeQuery();
                                        while (rs.next()) {
                                            String totalTopup = rs.getString("TOTAL_NUMBER_OF_TOPUP");
                                            String totalAmount = rs.getString("TOTAL_AMOUNT");

                                %>
                                <tr>
                                    <th class="text-center">Total Number of Top-Up : </th>
                                    <th class="text-center"><%= totalTopup%></th>
                                    <th class="text-center">Total Amount : </th>
                                    <th class="text-center"><%= totalAmount%></th>
                                </tr>


                                <%              }
                                        conn.close();
                                    } catch (SQLException ex) {
                                        ex.printStackTrace();
                                    }
                                %>
                            </tbody>
                        </table>

                        <div class="row mt-3 d-print-none">
                            <div class="col-sm-7">
                                <form class="input-group" action="./transaction.jsp" method="GET">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Search by Month</span>
                                    </div>
                                    <input class="form-control" id="datepicker" name="month" type="text" value="<%= monthFormat.format(datee)%>">
                                    <div class="input-group-append">
                                        <input class="btn btn-outline-success" type="submit" value="Search">
                                    </div>
                                </form>
                            </div>
                            <div class="col-sm-2">
                                <button class="btn btn-outline-primary d-print-none" onclick="printFn()" id="print"><i class="fas fa-print"></i> Print</button>
                            </div>

                        </div>
                    </div>
                    <p class="mt-5 mb-3 text-muted text-center">Bricks &copy; 2019</p>
                </main>
            </div>
        </div>

        <%@include file="../layout/scripts.jsp" %>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="../../bootstrap/js/jquery.dataTables.min.js"></script>
        <link href="../../bootstrap/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../bootstrap/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <script src="../../bootstrap/js/dataTables.bootstrap4.min.js"></script>
        <script src="../../bootstrap/js/Chart.min.js" type="text/javascript"></script>
        <link href="../../bootstrap/css/Chart.min.css" rel="stylesheet" type="text/css"/>
        <script>
                                    $(document).ready(function () {
                                        $('#myTable').DataTable();
                                    });

                                    $('#datepicker').datepicker({
                                        format: "mm-yyyy",
                                        startView: 1,
                                        minViewMode: 1,
                                        maxViewMode: 2

                                    });

                                    $('#print').on('click', function () {
                                        $("#myTable_length").addClass("d-print-none");
                                        $("#myTable_filter").addClass("d-print-none");
                                        $("#myTable_paginate").addClass("d-print-none");
                                        $("#mainContainer").removeClass("col-md-9");
                                        $("#mainContainer").removeClass("ml-sm-auto");
                                        $("#mainContainer").removeClass("col-lg-10");
                                        $("#mainContainer").addClass("col-sm-12");
                                        window.print();
                                        $("#mainContainer").removeClass("col-sm-12");
                                        $("#mainContainer").addClass("col-md-9");
                                        $("#mainContainer").addClass("ml-sm-auto");
                                        $("#mainContainer").addClass("col-lg-10");
                                    });

            <%
                ReloadService reloadService = new ReloadService();
                List<Object[]> summary = reloadService.findReloadSummaryMonthly(selectedMonth, selectedYear);

                String[] labels = new String[dayOfMonth];
                String[] data = new String[dayOfMonth];

                for (i = 0; i < labels.length; i++) {
                    labels[i] = String.format("'%d'", i + 1);
                }

                for (i = 0; i < data.length; i++) {
                    data[i] = "0";
                }

                for (i = 0; i < summary.size(); i++) {
                    Object[] elem = summary.get(i);
                    data[(Integer) elem[0] - 1]
                            = String.format("%.2f", (Double) elem[1]);
                }
            %>

                                    var ctx = document.getElementById('myChart');
                                    var myChart = new Chart(ctx, {
                                        type: 'line',
                                        data: {
                                            labels: [<%= String.join(",", labels)%>],
                                            datasets: [{
                                                    label: 'Amount (RM)',
                                                    data: [<%= String.join(",", data)%>],
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
                                                }]
                                        },
                                        options: {
                                            maintainAspectRatio: false,
                                            scales: {
                                                xAxes: [{
                                                        gridLines: {
                                                            display: false,
                                                            drawBorder: false
                                                        }
                                                    }],
                                                yAxes: [{
                                                        ticks: {
                                                            beginAtZero: true
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
                                                display: false
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
                                                displayColors: false,
                                                intersect: false,
                                                mode: 'index',
                                                caretPadding: 10
                                            }
                                        }
                                    });
        </script>
    </body>
</html>