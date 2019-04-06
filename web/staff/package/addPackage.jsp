<%@page import="entity.Meal" %>
<%@page import="service.MealService" %>
<%@page import="java.util.List"%>
<%
    MealService mealService = new MealService();
    List<Meal> MealList = mealService.findMealByAvailability(true);

%>

<!doctype html>
<html lang="en">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <%@include file="../layout/css.jsp" %>
        <title>Staff | Manage Packages</title>

        <%            String dayOfWeeks[] = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
            String colorClass[] = {"bg-primary", "bg-info", "bg-success ", "bg-danger ", "bg-warning ", "bg-dark "};
        %>

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
                        <!--        Add New Package Form-->
                        <div class=" mt-5" style="max-width: 1000px; margin: auto">
                            <form action="AddPackage" method="get">
                                <h3>Add Package</h3>
                                <hr>
                                <div class="row">
                                    <div class="form-group col-md-4">
                                        <label>Select Time : </label>
                                        <select name="maelTime" class="custom-select" required>
                                            <option value="" disabled selected>Choose...</option>
                                            <option value="Breakfast">Breakfast</option>
                                            <option value="Lunch">Lunch</option>
                                        </select>
                                    </div>

                                    <div class="form-group col-md-4 ml-5">
                                        <label>Availability : </label>
                                        <select name="availability" class="custom-select" required>
                                            <option value="true" selected>Active</option>
                                            <option value="false">Disable</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>Description :</label>
                                    <textarea name="desc" class="form-control w-50" rows="3" placeholder="Please enter some description for this package" required></textarea>
                                </div> 

                                <div class="row mt-4">
                                    <% for (int i = 0; i < 6; i++) {%>
                                    <div class="col-md-4">
                                        <div class="<%= colorClass[i]%> text-white card mb-4 rounded shadow">
                                            <div class="card-body">
                                                <h5 class="card-title"><%= dayOfWeeks[i]%></h5>
                                                <hr>
                                                <h6>Please select a meal for the day.</h6>
                                            </div>
                                            <div class="card-footer text-right">
                                                <select name="maelArr" class="custom-select" required="true">
                                                    <option value="" selected="true" disabled="true">Choose...</option>
                                                    <% for (Meal meal : MealList) {%>
                                                    <option value="<%= meal.getMealId()%>"><%= meal.getName()%></option>
                                                    <% } %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <% }%>
                                </div>
                                <div class="row">
                                    <div class="mr-auto">
                                        <a class="btn btn-lg btn-secondary" href="managePackage.jsp">Back</a>
                                    </div>
                                    <div class="ml-auto">
                                        <button class="btn btn-lg btn-outline-primary" type="submit">Add Package</button>
                                    </div>
                                </div>
                            </form>


                        </div>
                    </div>
                    <hr>
                    <p class="mb-3 text-muted text-center">Bricks © 2019</p>
                </main>
            </div>
        </div>

        <%@include file="../layout/scripts.jsp" %>
        <script>




        </script>



    </body>
</html>