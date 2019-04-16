<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Calendar"%>
<!doctype html>
<html lang="en">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <%@include file="../layout/css.jsp" %>
        <title>Report | Sales Report</title>
        <link rel="stylesheet" type="text/css" href="../../bootstrap/css/dataTables.bootstrap4.min.css">
    </head>
    <body>
        <!-- Fixed-top Navs -->
        <%@include file="../layout/topnavbar.jsp" %>

        <div class="container-fluid">
            <div class="row">
                <!-- Fixed-Sidebar Navs -->
                <%@include file="../layout/sidebar.jsp" %>

                <%                    String[] monthArr = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
                    int selectedMonth;
                    String monthString = request.getParameter("month");
                    System.out.println(monthString);
                    if (monthString == null) {
                        Calendar cal = Calendar.getInstance();
                        Date date = new Date();
                        cal.setTime(date); //Requested Date
                        selectedMonth = cal.get(Calendar.MONTH); //If parameter equal null then set it to default
                        selectedMonth = selectedMonth + 1; //Month start from 0 so i add one lel
                    } else {
                        selectedMonth = Integer.parseInt(monthString); //else use selected month
                        System.out.println(selectedMonth);
                    }
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

                        <h3>Sales Report for <%= monthArr[selectedMonth - 1]%></h3>

                        <canvas id="myChart" width="400" height="200"></canvas>


                        <table id="myTable"  class="table table-sm table-striped table-bordered" style="width:100%">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Food</th>
                                    <th>Unit Price</th>
                                    <th>Total food order</th>
                                    <th>Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    //** For Bar Chart Usage*****
                                    String mealLabels = "";
                                    String datalist = "";
                                    StringBuilder sb = new StringBuilder();
                                    StringBuilder sb2 = new StringBuilder();
                                    sb.append("[");
                                    sb2.append("[");
                                    //***************************
                                    int i = 1;
                                    int totalFoodOrdered = 0;
                                    double subtotal = 0.0;
                                    String host = "jdbc:derby://localhost:1527/canteenDB";
                                    String user = "nbuser";
                                    String password = "nbuser";
                                    String sqlQuery = "SELECT OL.MEAL_ID, M.NAME, M.PRICE, COUNT(M.PRICE) AS TOTAL_FOOD_ORDERED, M.PRICE*COUNT(M.MEAL_ID) AS TOTAL_PRICE "
                                            + "FROM ORDERMEAL O INNER JOIN  ORDERLIST OL ON O.ORDER_ID = OL.ORDER_ID "
                                            + "INNER JOIN MEAL M ON OL.MEAL_ID = M.MEAL_ID "
                                            + "INNER JOIN COUPON C ON OL.COUPON_ID = C.COUPON_ID "
                                            + "WHERE MONTH(C.REDEEM_DATE) = ? "
                                            + "GROUP BY OL.MEAL_ID, M.NAME, M.PRICE, MONTH(C.REDEEM_DATE) "
                                            + "ORDER BY COUNT(M.MEAL_ID) DESC ";
                                    try {
                                        Connection conn = DriverManager.getConnection(host, user, password);
                                        PreparedStatement stmt = conn.prepareStatement(sqlQuery);
                                        stmt.setString(1, Integer.toString(selectedMonth));
                                        ResultSet rs = stmt.executeQuery();
                                        while (rs.next()) {
                                            String mealID = rs.getString("MEAL_ID");
                                            String mealName = rs.getString("NAME");
                                            String mealPrice = rs.getString("PRICE");
                                            String totalOrder = rs.getString("TOTAL_FOOD_ORDERED");
                                            String totalPrice = rs.getString("TOTAL_PRICE");

                                            totalFoodOrdered = totalFoodOrdered + Integer.parseInt(totalOrder);
                                            subtotal = subtotal + Double.parseDouble(totalPrice);
                                            
                                            //***********
                                            sb.append("'" + mealName + "', ");
                                            sb2.append(totalOrder + ", ");
                                            //*********** 

                                %>
                                <tr>
                                    <th scope="row"><%= i++%></th>

                                    <td><%= mealName%></td>
                                    <td><%= mealPrice%></td>
                                    <td><%= totalOrder%></td>
                                    <td><%= totalPrice%></td>
                                </tr>
                                <%

                                        }

                                        //*******************************
                                        sb.deleteCharAt(sb.length()-2);
                                        sb2.deleteCharAt(sb2.length()-2);
                                        sb.append("]");
                                        sb2.append("]");
                                        
                                        mealLabels = sb.toString();
                                        datalist = sb2.toString();
                                        //*******************************

                                        //Test string
                                        //System.out.println(mealLabels);
                                        //System.out.println(datalist);
                                        conn.close();
                                    } catch (SQLException ex) {
                                        ex.printStackTrace();
                                    }
                                %>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>No.</th>
                                    <th>Food</th>
                                    <th>Unit Price</th>
                                    <th>Total food order</th>
                                    <th>Amount</th>
                                </tr>
                            </tfoot>
                        </table>



                        <table class="table table-primary table-bordered mt-5 " style="width:100%">
                            <tbody>
                                <tr>
                                    <th class="text-center">Total Number Meal Ordered</th>
                                    <th class="text-center"><%= totalFoodOrdered%></th>
                                    <th class="text-center">Subtotal</th>
                                    <th class="text-center"><%= subtotal%></th>
                                </tr>
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
                                        <a class="btn btn-outline-success" href="topSales.jsp?page=1" id="search">Search</a>
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
        <link href="../../bootstrap/css/Chart.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../bootstrap/js/Chart.min.js" type="text/javascript"></script>
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
                                        var url = 'topSales.jsp?month=' + month;

                                        $('#search').attr('href', url);
                                    }
                                    ;

                                    var ctx = document.getElementById('myChart').getContext('2d');
                                    var myChart = new Chart(ctx, {
                                        type: 'bar',
                                        data: {
                                            labels: <%= mealLabels %>,
                                            datasets: [{
                                                    label: 'Total Number of Ordered',
                                                    data: <%= datalist %>,
                                                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                                                    borderColor: 'rgba(54, 162, 235, 1)',
                                                    borderWidth: 1
                                                }]
                                        },
                                        options: {
                                            scales: {
                                                yAxes: [{
                                                        ticks: {
                                                            beginAtZero: true
                                                        }
                                                    }]
                                            }
                                        }
                                    });

        </script>

    </body>
</html>