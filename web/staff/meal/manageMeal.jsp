<%@page import="entity.Staff"%>
<%@page import="java.util.List"%>
<%@page import="entity.Meal"%>
<%@page import = "service.MealService" %>

<!doctype html>
<html lang="en">
    <!-- retrieve session object, MealList -->

    <head>
        <%@include file="../layout/meta.jsp" %>
        <%@include file="../layout/css.jsp" %>
        <title>Staff | Manage Meals</title>
    </head>

    <body>
        <!-- Fixed-top Navs -->
        <%@include file="../layout/topnavbar.jsp" %>

        <div class="container-fluid">
            <div class="row">
                <!-- Fixed-Sidebar Navs -->
                <%@include file="../layout/sidebar.jsp" %>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <div class="container mt-4">
                        <h3>Manage Meals</h3>

                        <table id="myTable" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">Item ID</th>
                                    <th scope="col">Food</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Availability</th>
                                    <th scope="col">Calories</th>
                                </tr>
                            </thead>
                            <%                                //Already initialize in sidebar.jsp
                                //If user is not logged in
//                                Staff staff = (Staff) session.getAttribute("staff");
//                                if (staff == null) {
//                                    response.sendRedirect("../account/signin.jsp?status=N");
//                                    return;
//                                }
                                MealService mealService = new MealService();
                                List<Meal> MealList = mealService.findMealByCategoryID(staff.getCategoryId());
                            %>
                            <tbody>
                                <% for (Meal meal : MealList) {%>
                                <tr>
                                    <td scope="row"><%= meal.getMealId()%></td>
                                    <td><%= meal.getName()%></td>
                                    <td><%= meal.getDescription()%></td>
                                    <td><%= meal.getPrice()%></td>
                                    <td><%= meal.getAvailability()%></td>
                                    <td><%= meal.getCalories()%></td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>

                        <div class="row">
                            <div class="col-sm-4">
                                <a class="btn btn-dark btn-lg" href="add.jsp" role="button">Add Item</a>
                            </div>
                            <div class="col-sm-8">
                                <form class="row" action="SearchMeal" method="get">
                                    <div class="col input-group mt-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Search Item</span>
                                        </div>
                                        <input type="text" name="mealid" class="form-control col-5" id="itemid" placeholder="Item ID" onkeyup="myFunction()" required>

                                    </div>
                                    <div class="col">
                                        <button type="submit" class="btn btn-dark btn-lg white" role="button">Modify Item</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <p class="mt-5 mb-3 text-muted text-center">Bricks &copy; 2019</p>
                </main>
            </div>
        </div>
        <%@include file="../layout/scripts.jsp" %>
        <script>
            function myFunction() {
                var input, filter, table, tr, td, i, txtValue;
                input = document.getElementById("itemid");
                filter = input.value.toUpperCase();
                table = document.getElementById("myTable");
                tr = table.getElementsByTagName("tr");
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[0];
                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
        </script>



    </body>
</html>