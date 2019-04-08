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
                        <h3>Today Meal Orders</h3>
                        <% } else {%>
                        <h3>Meal Orders for <%= todayDateString%></h3>
                        <% } %>



                        <table class="table table-sm table-bordered table-hover mb-5">
                            <thead>
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">Meal ID</th>
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
                                    String sqlQuery = "SELECT OL.MEAL_ID, M.NAME, SUM(OL.QUANTITY) AS TOTAL_FOOD_ORDERED "
                                            + "FROM ORDERMEAL O INNER JOIN  ORDERLIST OL ON O.ORDER_ID = OL.ORDER_ID "
                                            + "INNER JOIN MEAL M ON OL.MEAL_ID = M.MEAL_ID "
                                            + "INNER JOIN COUPON C ON OL.COUPON_ID = C.COUPON_ID "
                                            + "INNER JOIN CATEGORY CA ON CA.CATEGORY_ID = M.CATEGORY_ID "
                                            + "WHERE C.REDEEM_DATE = ? AND M.CATEGORY_ID = ? "
                                            + "GROUP BY OL.MEAL_ID, M.NAME "
                                            + "ORDER BY OL.MEAL_ID "
                                            + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
                                    try {
                                        Connection conn = DriverManager.getConnection(host, user, password);
                                        PreparedStatement stmt = conn.prepareStatement(sqlQuery);
                                        stmt.setString(1, todayDateString);
                                        stmt.setString(2, Integer.toString(catID));
                                        stmt.setString(3, Integer.toString(pageid - 1));
                                        stmt.setString(4, Integer.toString(total));
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

                        <table class="table table-sm table-bordered table-hover mt-">
                            <h4>Ingredients to be prepared</h4>
                            <thead>
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">ID</th>
                                    <th scope="col">Ingredients</th>
                                    <th scope="col">Total Ingredients</th>
                                </tr>
                            </thead>
                            
                            <tbody>
                                <%    
                                    int j=0;
                                    String sqlQuery2 = "SELECT IL.INGREDIENT_ID, I.INGREDIENT_NAME, SUM(IL.QUANTITY) AS TOTAL_INGREDIENTS "
                                            + "FROM ORDERMEAL O INNER JOIN  ORDERLIST OL ON O.ORDER_ID = OL.ORDER_ID "
                                            + "INNER JOIN MEAL M ON OL.MEAL_ID = M.MEAL_ID "
                                            + "INNER JOIN COUPON C ON OL.COUPON_ID = C.COUPON_ID "
                                            + "INNER JOIN CATEGORY CA ON CA.CATEGORY_ID = M.CATEGORY_ID "
                                            + "INNER JOIN INGREDIENTLIST IL ON IL.MEAL_ID = M.MEAL_ID "
                                            + "INNER JOIN INGREDIENT I ON I.INGREDIENT_ID = IL.INGREDIENT_ID "
                                            + "WHERE C.REDEEM_DATE = ? AND M.CATEGORY_ID = ? "
                                            + "GROUP BY IL.INGREDIENT_ID, I.INGREDIENT_NAME "
                                            + "ORDER BY IL.INGREDIENT_ID "
                                            + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
                                    try {
                                        Connection conn = DriverManager.getConnection(host, user, password);
                                        PreparedStatement stmt = conn.prepareStatement(sqlQuery2);
                                        stmt.setString(1, todayDateString);
                                        stmt.setString(2, Integer.toString(catID));
                                        stmt.setString(3, Integer.toString(pageid - 1));
                                        stmt.setString(4, Integer.toString(total));
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
                            <nav class="col-sm-3" aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="mealPreparation.jsp?page=1">1</a></li>
                                    <li class="page-item"><a class="page-link" href="mealPreparation.jsp?page=2">2</a></li>
                                    <li class="page-item"><a class="page-link" href="mealPreparation.jsp?page=3">3</a></li>
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

            function setDate() {
                var month = $('.inputMonth').val();
                var url = 'mealPreparation.jsp?page=' + '<%= pageid%>' + '&date=' + month;

                $('#search').attr('href', url);
            }
            ;



        </script>

    </body>
</html>