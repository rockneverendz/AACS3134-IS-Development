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
    </head>
    <body>
        <!-- Fixed-top Navs -->
        <%@include file="../layout/topnavbar.jsp" %>

        <div class="container-fluid">
            <div class="row">
                <!-- Fixed-Sidebar Navs -->
                <%@include file="../layout/sidebar.jsp" %>

                <%                    
                    String[] monthArr = {"January", "February", "March", "April", "May", "June", "July", "August", "September" , "October", "November", "December"};
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
                        <h3>Sales Report for <%= monthArr[selectedMonth-1]%></h3>

                        <table class="table table-sm table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">ID</th>
                                    <th scope="col">Food</th>
                                    <th scope="col">Total food order</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%

                                    String spageid = request.getParameter("page");
                                    int pageid = Integer.parseInt(spageid);
                                    int total = 20;
                                    int i = 1;
                                    if (pageid == 1) {
                                    } else {
                                        pageid = pageid - 1;
                                        pageid = pageid * total;
                                    }

                                    String host = "jdbc:derby://localhost:1527/canteenDB";
                                    String user = "nbuser";
                                    String password = "nbuser";
                                    String sqlQuery = "SELECT OL.MEAL_ID, M.NAME, COUNT(M.MEAL_ID) AS TOTAL_FOOD_ORDERED "
                                            + "FROM ORDERMEAL O INNER JOIN  ORDERLIST OL ON O.ORDER_ID = OL.ORDER_ID "
                                            + "INNER JOIN MEAL M ON OL.MEAL_ID = M.MEAL_ID "
                                            + "INNER JOIN COUPON C ON OL.COUPON_ID = C.COUPON_ID "
                                            + "WHERE MONTH(C.REDEEM_DATE) = ? "
                                            + "GROUP BY OL.MEAL_ID, M.NAME, MONTH(C.REDEEM_DATE) "
                                            + "ORDER BY COUNT(M.MEAL_ID) DESC "
                                            + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
                                    try {
                                        Connection conn = DriverManager.getConnection(host, user, password);
                                        PreparedStatement stmt = conn.prepareStatement(sqlQuery);
                                        stmt.setString(1, Integer.toString(selectedMonth));
                                        stmt.setString(2, Integer.toString(pageid - 1));
                                        stmt.setString(3, Integer.toString(total));
                                        ResultSet rs = stmt.executeQuery();
                                        while (rs.next()) {
                                            String mealID = rs.getString("MEAL_ID");
                                            String mealName = rs.getString("NAME");
                                            String totalOrder = rs.getString("TOTAL_FOOD_ORDERED");
                                %>
                                <tr>
                                    <th scope="row"><%= i++%></th>
                                    <td><%= mealID%></td>
                                    <td><%= mealName%></td>
                                    <td><%= totalOrder%></td>
                                </tr>
                                <%

                                        }
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
                                        <a class="btn btn-outline-success" href="topSales.jsp?page=1" id="search">Search</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <button class="btn btn-outline-primary d-print-none" onclick="printFn()" id="print"><i class="fas fa-print"></i> Print</button>
                            </div>
                            <nav class="col-sm-3" aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="topSales.jsp?page=1">1</a></li>
                                    <li class="page-item"><a class="page-link" href="topSales.jsp?page=2">2</a></li>
                                    <li class="page-item"><a class="page-link" href="topSales.jsp?page=3">3</a></li>
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
                    <p class="mt-5 mb-3 text-muted text-center">Bricks <i class="far fa-copyright"></i> 2019</p>
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
                var url = 'topSales.jsp?page=' + '<%= pageid%>' + '&month=' + month;

                $('#search').attr('href', url);
            }
            ;



        </script>

    </body>
</html>