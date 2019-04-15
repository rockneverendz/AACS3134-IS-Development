<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Calendar"%>
<!doctype html>
<html lang="en">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <%@include file="../layout/css.jsp" %>
        <title>Report | View Meal Orders</title>
        <link rel="stylesheet" type="text/css" href="../../bootstrap/css/dataTables.bootstrap4.min.css">
    </head>
    <body>
        <!-- Fixed-top Navs -->
        <%@include file="../layout/topnavbar.jsp" %>

        <div class="container-fluid">
            <div class="row">
                <!-- Fixed-Sidebar Navs -->
                <%@include file="../layout/sidebar.jsp" %>

                <%                    SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd");
                    int catID = cat.getCategoryId();
                    String dateString = request.getParameter("date");
                    String todayDateString;
                    System.out.println(dateString);
                    if (dateString == null) {

                        Date todayDate = new Date();
                        Calendar cal = Calendar.getInstance();
                        cal.setTime(todayDate); //Requested Date
                        cal.add(Calendar.DATE, 1);
                        todayDate = cal.getTime();
                        todayDateString = dateFormat.format(todayDate);
                        System.out.println(todayDate);

                    } else {
                        todayDateString = dateString;
                        System.out.println(dateString);
                    }
                %>
                <main id="mainContainer" role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <div class="container mt-4" style="max-width: 1000px;">
                        <% if (dateString == null) {%>
                        <h3 class="m-3 mt-5 mb-3">Tomorrow Meal Orders</h3>
                        <% } else {%>
                        <h3 class="m-3">Meal Orders for <%= todayDateString%></h3>
                        <% } %>
                        <hr>
                        <table id="myTable"  class="table table-sm table-striped table-bordered" style="width:100%">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Meal ID</th>
                                    <th>Food</th>
                                    <th>Total food order</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int i = 1;
                                    String host = "jdbc:derby://localhost:1527/canteenDB";
                                    String user = "nbuser";
                                    String password = "nbuser";
                                    String sqlQuery = "SELECT OL.MEAL_ID, M.NAME, SUM(OL.QUANTITY) AS TOTAL_FOOD_ORDERED "
                                            + "FROM ORDERMEAL O INNER JOIN  ORDERLIST OL ON O.ORDER_ID = OL.ORDER_ID "
                                            + "INNER JOIN MEAL M ON OL.MEAL_ID = M.MEAL_ID "
                                            + "INNER JOIN COUPON C ON OL.COUPON_ID = C.COUPON_ID "
                                            + "INNER JOIN CATEGORY CA ON CA.CATEGORY_ID = M.CATEGORY_ID "
                                            + "WHERE C.REDEEM_DATE = ? AND M.CATEGORY_ID = ? "
                                            + "GROUP BY OL.MEAL_ID, M.NAME "
                                            + "ORDER BY OL.MEAL_ID ";
                                    try {
                                        Connection conn = DriverManager.getConnection(host, user, password);
                                        PreparedStatement stmt = conn.prepareStatement(sqlQuery);
                                        stmt.setString(1, todayDateString);
                                        stmt.setString(2, Integer.toString(catID));
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
                            <tfoot>
                                <tr>
                                    <th>No.</th>
                                    <th>Meal ID</th>
                                    <th>Food</th>
                                    <th>Total food order</th>
                                </tr>
                            <tfoot>
                                </tbody>
                        </table>

                        <hr class="border-dark">
                        <table id="myTable2"  class="table table-sm table-striped table-bordered" style="width:100%">
                            <h4 class="m-3 mt-5 mb-3">Ingredients to be prepared</h4>
                            <hr>
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>ID</th>
                                    <th>Ingredients</th>
                                    <th>Total Ingredients</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%
                                    int j = 1;
                                    String sqlQuery2 = "SELECT IL.INGREDIENT_ID, I.INGREDIENT_NAME, SUM(IL.QUANTITY) AS TOTAL_INGREDIENTS "
                                            + "FROM ORDERMEAL O INNER JOIN  ORDERLIST OL ON O.ORDER_ID = OL.ORDER_ID "
                                            + "INNER JOIN MEAL M ON OL.MEAL_ID = M.MEAL_ID "
                                            + "INNER JOIN COUPON C ON OL.COUPON_ID = C.COUPON_ID "
                                            + "INNER JOIN CATEGORY CA ON CA.CATEGORY_ID = M.CATEGORY_ID "
                                            + "INNER JOIN INGREDIENTLIST IL ON IL.MEAL_ID = M.MEAL_ID "
                                            + "INNER JOIN INGREDIENT I ON I.INGREDIENT_ID = IL.INGREDIENT_ID "
                                            + "WHERE C.REDEEM_DATE = ? AND M.CATEGORY_ID = ? "
                                            + "GROUP BY IL.INGREDIENT_ID, I.INGREDIENT_NAME "
                                            + "ORDER BY IL.INGREDIENT_ID ";
                                    //   + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
                                    try {
                                        Connection conn = DriverManager.getConnection(host, user, password);
                                        PreparedStatement stmt = conn.prepareStatement(sqlQuery2);
                                        stmt.setString(1, todayDateString);
                                        stmt.setString(2, Integer.toString(catID));
//                                        stmt.setString(3, Integer.toString(pageid - 1));
//                                        stmt.setString(4, Integer.toString(total));
                                        ResultSet rs = stmt.executeQuery();
                                        while (rs.next()) {
                                            String ingredientID = rs.getString("INGREDIENT_ID");
                                            String ingredientName = rs.getString("INGREDIENT_NAME");
                                            String totalIngredient = rs.getString("TOTAL_INGREDIENTS");
                                %>
                                <tr>
                                    <th scope="row"><%= j++%></th>
                                    <td><%= ingredientID%></td>
                                    <td><%= ingredientName%></td>
                                    <td><%= totalIngredient%></td>
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
                                    <th>No.</th>
                                    <th>ID</th>
                                    <th>Ingredients</th>
                                    <th>Total Ingredients</th>
                                </tr>
                            </tfoot>
                            </tbody>
                        </table>
                        <div class="row mt-3 d-print-none">
                            <div class="col-sm-7">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Search by Month</span>
                                    </div>
                                    <input type="date" onchange="setDate()" name="inputDate" class="inputMonth form-control col-5">

                                    <div class="input-group-append">
                                        <a class="btn btn-outline-success" href="mealPreparation.jsp?page=1" id="search">Search</a>
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

        <script>
                                    $(document).ready(function () {
                                        $('#myTable').DataTable();
                                        $('#myTable2').DataTable();
                                    });

                                    function printFn() {
                                        $(".dataTables_length").addClass("d-print-none");
                                        $(".dataTables_filter").addClass("d-print-none");
                                        $(".dataTables_paginate").addClass("d-print-none");
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

                                    function setDate() {
                                        var month = $('.inputMonth').val();
                                        var url = 'mealPreparation.jsp?&date=' + month;

                                        $('#search').attr('href', url);
                                    }
                                    ;



        </script>

    </body>
</html>