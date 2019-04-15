<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Calendar"%>
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
                    int selectedMonth, dayOfMonth = 0;
                    String monthString = request.getParameter("month");
                    System.out.println(monthString);
                    if (monthString == null) {
                        Calendar cal = Calendar.getInstance();
                        Date date = new Date();
                        cal.setTime(date); //Requested Date
                        selectedMonth = cal.get(Calendar.MONTH); //If parameter equal null then set it to default
                        dayOfMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
                        selectedMonth++; //Month start from 0 so i add one lel
                    } else {
                        selectedMonth = Integer.parseInt(monthString); //else use selected month
                        System.out.println(selectedMonth);
                    }
                %>

                <main id="mainContainer" role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <div class="container mt-4" style="max-width: 1000px;">

                        <div class="row" style="position: relative; height:300px">
                            <canvas class="col-12" id="myChart"></canvas>
                        </div>

                        <div id="reportHeader" class="row mb-3">
                            <div class="col-6  d-none d-print-block">
                                <img class="img-fluid" src="../../resource/Logo2.png" alt="logo" width="200px">
                            </div>
                            <div class="col-6 text-right mt-1  d-none d-print-block">
                                <h6>Block B, Tunku Abdul Rahman University College,<br>53100 Kuala Lumpur,<br>Federal Territory of Kuala Lumpur</h6>
                            </div>                            
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
                                    int i = 1;
                                    String host = "jdbc:derby://localhost:1527/canteenDB";
                                    String user = "nbuser";
                                    String password = "nbuser";
                                    String sqlQuery = "SELECT C.CUST_ID, C.USERNAME, R.RELOAD_ID, R.DATE, R.TIME, S.USERNAME AS STAFFNAME, R.AMOUNT "
                                            + "FROM CUSTOMER C INNER JOIN  RELOAD R ON C.CUST_ID = R.CUST_ID "
                                            + "INNER JOIN STAFF S ON S.STAFF_ID = R.STAFF_ID "
                                            + "WHERE MONTH(R.DATE) = ? "
                                            + "ORDER BY R.DATE ";
                                    try {
                                        Connection conn = DriverManager.getConnection(host, user, password);
                                        PreparedStatement stmt = conn.prepareStatement(sqlQuery);
                                        stmt.setString(1, Integer.toString(selectedMonth));
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
                                            + "WHERE MONTH(R.DATE) = ? ";
                                    try {
                                        Connection conn = DriverManager.getConnection(host, user, password);
                                        PreparedStatement stmt = conn.prepareStatement(sqlQuery2);
                                        stmt.setString(1, Integer.toString(selectedMonth));

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
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Search by Month</span>
                                    </div>
                                    <select onchange="setMonth()" name="inputMonth" class="inputMonth form-control col-5">
                                        <option value="" selected disabled>Choose</option>
                                        <option value="1">Jan</option>
                                        <option value="2">Feb</option>
                                        <option value="3">Mar</option>
                                        <option value="4">Apr</option>
                                        <option value="5">May</option>
                                        <option value="6">Jun</option>
                                        <option value="7">Jul</option>
                                        <option value="8">Aug</option>
                                        <option value="9">Sept</option>
                                        <option value="10">Oct</option>
                                        <option value="11">Nov</option>
                                        <option value="12">Dec</option>
                                    </select>
                                    <div class="input-group-append">
                                        <a class="btn btn-outline-success" href="transaction.jsp?" id="search">Search</a>
                                    </div>
                                </div>
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
        <script src="../../bootstrap/js/dataTables.bootstrap4.min.js"></script>
        <script src="../../bootstrap/js/Chart.min.js" type="text/javascript"></script>
        <link href="../../bootstrap/css/Chart.min.css" rel="stylesheet" type="text/css"/>
        <script>
                                    $(document).ready(function () {
                                        $('#myTable').DataTable();
                                    });

                                    function printFn() {
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
                                    }


                                    function setMonth() {
                                        var month = $('.inputMonth').val();
                                        var url = 'transaction.jsp?month=' + month;

                                        $('#search').attr('href', url);
                                    }
                                    ;

            <%
                String[] labels = new String[dayOfMonth];
                for (int j = 0; j < labels.length; j++) {
                    labels[j] = String.format("'%d'", j + 1);
                }

                String[] data = new String[dayOfMonth];
                for (int j = 0; j < data.length; j++) {
                    data[j] = String.format("'%d'", j + 1);
                }
            %>

                                    var ctx = document.getElementById('myChart');
                                    var myChart = new Chart(ctx, {
                                        type: 'line',
                                        data: {
                                            labels: [<%= String.join(",", labels)%>],
                                            datasets: [{
                                                    label: 'Calories (kcal)',
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