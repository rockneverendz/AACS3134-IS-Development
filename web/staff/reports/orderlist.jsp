<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Calendar"%>
<!doctype html>
<html lang="en">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <%@include file="../layout/css.jsp" %>
        <title>Report | Meal Orders Report</title>
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
                        
                        <h3>Daily Meals Order List for <%= monthArr[selectedMonth - 1]%></h3>

                        <table class="table table-sm table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">Customer ID</th>
                                    <th scope="col">Username</th>
                                    <th scope="col">Order Status</th>
                                    <th scope="col">Payment ID</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String spageid = request.getParameter("page");
                                    int pageid = Integer.parseInt(spageid);
                                    int offset = 1;
                                    int total = 30;
                                    if (pageid == 1) {
                                    } else {
                                        offset = (pageid - 1) * total + 1;
                                        System.out.println(offset);
                                    }

                                    String host = "jdbc:derby://localhost:1527/canteenDB";
                                    String user = "nbuser";
                                    String password = "nbuser";
                                    String sqlQuery = "SELECT C.CUST_ID, C.USERNAME, O.ORDER_ID, O.STATUS, P.PAYMENT_ID, P.DATE, P.TIME, P.AMOUNT "
                                            + "FROM CUSTOMER C INNER JOIN  ORDERMEAL O ON C.CUST_ID = O.CUST_ID "
                                            + "INNER JOIN PAYMENT P ON P.PAYMENT_ID = O.PAYMENT_ID "
                                            + "WHERE MONTH(P.DATE) = ? AND O.STATUS= 'Paid' "
                                            + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
                                    try {
                                        Connection conn = DriverManager.getConnection(host, user, password);
                                        PreparedStatement stmt = conn.prepareStatement(sqlQuery);
                                        stmt.setString(1, Integer.toString(selectedMonth));
                                        stmt.setString(2, Integer.toString(offset - 1));
                                        stmt.setString(3, Integer.toString(total));
                                        ResultSet rs = stmt.executeQuery();
                                        while (rs.next()) {
                                            String custid = rs.getString("CUST_ID");
                                            String uname = rs.getString("USERNAME");
                                            String statusid = rs.getString("STATUS");
                                            String payid = rs.getString("PAYMENT_ID");
                                            String date = rs.getString("DATE");
                                            String time = rs.getString("TIME");
                                            String amount = rs.getString("AMOUNT");
                                %>   
                                <tr>
                                    <td><%= custid%></td>
                                    <td><%= uname%></td>
                                    <td><%= statusid%></td>
                                    <td><%= payid%></td>
                                    <td><%= date%></td>
                                    <td><%= time%></td>
                                    <td class="text-right"><%= amount%></td>
                                </tr>
                                <%

                                        }
                                        conn.close();
                                    } catch (SQLException ex) {
                                        ex.printStackTrace();
                                    }
                                %>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr> 
                                <%
                                    String sqlQuery2 = "SELECT COUNT(*) AS TOTAL_PAYMENT ,SUM(P.AMOUNT) AS TOTAL_AMOUNT "
                                            + "FROM CUSTOMER C INNER JOIN  ORDERMEAL O ON C.CUST_ID = O.CUST_ID "
                                            + "INNER JOIN PAYMENT P ON P.PAYMENT_ID = O.PAYMENT_ID "
                                            + "WHERE MONTH(P.DATE) = ? AND O.STATUS= 'Paid' "
                                            + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
                                    try {
                                        Connection conn = DriverManager.getConnection(host, user, password);
                                        PreparedStatement stmt = conn.prepareStatement(sqlQuery2);
                                        stmt.setString(1, Integer.toString(selectedMonth));
                                        stmt.setString(2, Integer.toString(offset - 1));
                                        stmt.setString(3, Integer.toString(total));
                                        ResultSet rs = stmt.executeQuery();
                                        while (rs.next()) {
                                            String totalPaidOrder = rs.getString("TOTAL_PAYMENT");
                                            String totalEarning = rs.getString("TOTAL_AMOUNT");

                                %>
                                <tr>
                                    <th colspan="2" scope="th">Total Number of Paid Orders</th>
                                    <th colspan="2" ><%= totalPaidOrder%></th>
                                    <th colspan="2" scope="th">Total Amount of Earning</th>
                                    <th class="text-right"><%= totalEarning%></th>
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
                                        <a class="btn btn-outline-success" href="orderlist.jsp?page=1" id="search">Search</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <button class="btn btn-outline-primary d-print-none" onclick="printFn()" id="print"><i class="fas fa-print"></i> Print</button>
                            </div>
                            <nav class="col-sm-3">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="orderlist.jsp?page=1&month=<%= selectedMonth%>">1</a></li>
                                    <li class="page-item"><a class="page-link" href="orderlist.jsp?page=2&month=<%= selectedMonth%>">2</a></li>
                                    <li class="page-item"><a class="page-link" href="orderlist.jsp?page=3&month=<%= selectedMonth%>">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <p class="mt-5 mb-3 text-muted text-center">Bricks &copy; 2019</p>
                </main>

            </div>
        </div>

        <%@include file="../layout/scripts.jsp" %>
        <script>
            function printFn() {

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
                var url = 'orderlist.jsp?page=' + '<%= pageid%>' + '&month=' + month;

                $('#search').attr('href', url);
            }
            ;
        </script>
    </body>
</html>