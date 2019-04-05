<%@page import="java.sql.*"%>



<!doctype html>
<html lang="en">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <%@include file="../layout/css.jsp" %>
        <title>Report | Cancellation Report</title>
    </head>
    <body>
        <!-- Fixed-top Navs -->
        <%@include file="../layout/topnavbar.jsp" %>

        <div class="container-fluid">
            <div class="row">
                <!-- Fixed-Sidebar Navs -->
                <%@include file="../layout/sidebar.jsp" %>

                <main id="mainContainer" role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <div class="container mt-4" style="max-width: 1000px;">
                        <h3>Cancellations Report</h3>

                        <table class="table table-sm table-bordered table-hover"">
                            <thead>
                                <tr>
                                    <th scope="col">Order ID</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Meal</th>
                                    <th scope="col">Quantity</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                    
                                    String spageid = request.getParameter("page");
                                    int pageid = Integer.parseInt(spageid);
                                    int total = 15;
                                    if (pageid == 1) {
//                                        pageid = pageid - 1;  // Set offset to 0 and total = 15
                                    } else {
                                        pageid = pageid - 1;    //page id = 2 then - 1 then == 1 then offest = 1 * 15 + 1 
                                        pageid = (pageid * total) + 1;
                                    }

                                    String host = "jdbc:derby://localhost:1527/canteenDB";
                                    String user = "nbuser";
                                    String password = "nbuser";
                                    String sqlQuery = "SELECT  O.ORDER_ID, O.STATUS, M.NAME, OL.QUANTITY "
                                            + "FROM    ORDERMEAL O INNER JOIN ORDERLIST OL "
                                            + "ON O.ORDER_ID = OL.ORDER_ID "
                                            + "INNER JOIN MEAL M "
                                            + "ON OL.MEAL_ID = M.MEAL_ID "
                                            + "WHERE O.STATUS = 'Canceled' "
                                            + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
                                    try {
                                        Connection conn = DriverManager.getConnection(host, user, password);
                                        PreparedStatement stmt = conn.prepareStatement(sqlQuery);
                                        stmt.setString(1, Integer.toString(pageid-1));
                                        stmt.setString(2, Integer.toString(total));
                                        ResultSet rs = stmt.executeQuery();
                                        
                                        System.out.println(pageid);
                                        System.out.println(total);
                                        while (rs.next()) {
                                            String id = rs.getString("ORDER_ID");
                                            String status = rs.getString("STATUS");
                                            String mealName = rs.getString("NAME");
                                            String qty = rs.getString("QUANTITY");
                                %>    
                                <tr>

                                    <th scope = "row" ><%= id%></th>

                                    <td><%= status%></td>
                                    <td><%= mealName%></td>
                                    <td><%= qty%></td>
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
                                <form>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Search by Date/Week</span>
                                        </div>
                                        <input type="date" class="form-control col-5" id="itemid" placeholder="Date">
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-success" type="submit" id="search">Search</button>
                                        </div>
                                    </div>
                                </form>
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
                                    <li class="page-item"><a class="page-link" href="cancelledOrders.jsp?page=1">1</a></li>
                                    <li class="page-item"><a class="page-link" href="cancelledOrders.jsp?page=2">2</a></li>
                                    <li class="page-item"><a class="page-link" href="cancelledOrders.jsp?page=3">3</a></li>
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
        </script>

    </body>
</html>