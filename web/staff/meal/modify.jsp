<%@page import="java.lang.Integer" %>
<%@page import="java.util.List"%>
<%@page import="entity.Staff"%>
<%@page import="entity.Meal"%>
<%@page import="service.MealService" %>
<!-- retrieve session object, ProductList -->
<%
    Meal currentMeal = (Meal) session.getAttribute("Meal");
%>

<!doctype html>
<html lang="en">
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
                        <!--        Add New Meal Form-->
                        <div class="form-container col-md-9 mt-5" style="max-width: 800px; margin: auto;">
                            <form class="form-signup" action="" method="get">
                                <div class="text-center mb-4">
                                    <h1 class="h1 mb-3">Update Meal Information</h1>
                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputName">Name</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputName" placeholder="Name" value="<%= currentMeal.getName()%>">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label for="inputPrice">Price</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputPrice" placeholder="Price RM :" value="<%= currentMeal.getPrice()%>">
                                        </div>
                                    </div>

                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputDesc">Description</label>
                                        <div class="input-group">
                                            <textarea  type="text" rows="3" class="form-control" id="inputDesc" placeholder="Description"><%= currentMeal.getDescription()%></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputCal">Calories</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputCal" placeholder="Calories" value="<%= currentMeal.getCalories()%>">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label for="inputCal">Image</label>
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" id="inputGroupFile02">
                                                <label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputIngred">Ingredient</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputIngred" placeholder="Ingredient">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label for="inputIngredQty">Ingredient Qty</label>
                                        <div class="input-group">
                                            <input type="number" class="form-control" id="inputIngredQty" placeholder="Quantity">
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputIngred" placeholder="Ingredient">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="input-group">
                                            <input type="number" class="form-control" id="inputIngredQty" placeholder="Quantity">
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputIngred" placeholder="Ingredient">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="input-group">
                                            <input type="number" class="form-control" id="inputIngredQty" placeholder="Quantity">
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="row p-1 mb-3">
                                    <div class="col">
                                        <button class="btn btn-lg btn-primary btn-block" type="submit">Update Meal</button>
                                    </div>
                                    <div class="col">
                                        <button class="btn btn-lg btn-danger btn-block" type="submit">Disable</button>
                                    </div>
                                </div>
                                <a href="manageMeal.jsp" class="btn btn-lg btn-secondary btn-block" style="color: white;">Back</a>
                            </form>
                        </div>

                    </div>
                    <p class="mt-5 mb-3 text-muted text-center">Bricks © 2019</p>
                </main>
            </div>
        </div>
        <%@include file="../layout/scripts.jsp" %>
    </body>
</html>