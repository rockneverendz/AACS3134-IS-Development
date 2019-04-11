<%@page import="java.lang.Integer" %>
<%@page import="java.util.List"%>
<%@page import="entity.Staff"%>
<%@page import="entity.Meal"%>
<%@page import="entity.Ingredient"%>
<%@page import="service.MealService" %>
<%@page import="service.IngredientService" %>
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
                            <form class="form-signup" action="UpdateMeal" enctype="multipart/form-data" method="post">
                                <div class="text-center mb-4">
                                    <h1 class="h1 mb-3">Update Meal Information</h1>
                                </div>
                                <%  String status = request.getParameter("status");
                                    String message;
                                    String type;
                                    if (status == null) {
                                    } else {
                                        char code = status.charAt(0);
                                        if (code == '1') {
                                            type = "success";
                                            message = "Successfully Added Meal!";
                                        } else {
                                            type = "danger";
                                            message = "An error has occured";
                                        }
                                %>
                                <div class="alert alert-<%= type%>" role="alert">
                                    <%= message%>
                                </div>
                                <%
                                    }
                                %>
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputName">Name</label>
                                        <div class="input-group">
                                            <input value="<%= currentMeal.getMealId()%>" name="mealId" hidden>
                                            <input id="inputName" name="Name" type="text" class="form-control"  
                                                   placeholder="Name" value="<%= currentMeal.getName()%>" required>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label for="inputPrice">Price</label>
                                        <div class="input-group">
                                            <input id="inputPrice" name="Price" type="number" class="form-control" min="0" max="20" step="0.01"
                                                   placeholder="Price RM :" value="<%= currentMeal.getPrice()%>" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputDesc">Description</label>
                                        <div class="input-group">
                                            <textarea id="inputDesc" name="Description" type="text" rows="3" class="form-control"
                                                      placeholder="Description"><%= currentMeal.getDescription()%></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputCal">Calories</label>
                                        <div class="input-group">
                                            <input id="inputCal" name="Calories" type="text" class="form-control"
                                                   placeholder="Calories" value="<%= currentMeal.getCalories()%>" required>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label for="inputCal">Image</label>
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <label for="inputFile" class="form-control custom-file-label">Choose file</label>
                                                <input id="inputFile" name="image" type="file" class="custom-file-input">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputIngredients">Ingredient List</label>
                                        <button class="btn btn-outline-secondary" type="button" onclick="add_fields()"><i class="fas fa-plus"></i></button>
                                        <div class="input-group mb-2">
                                            <div id="ingredientList" class="row" style="margin-left: 0px; margin-right: 0px; width: 100%;">
                                                <input name='Ingredient' type="text" class="flexdatalist form-control col-8" placeholder="Ingredient">
                                                <input name='Quantity' type="number" class="ingreQuantity form-control col-2" placeholder="Quantity" min="1" max="10" step="0.01" required>
                                                <button class="removeBtn btn btn-outline-secondary col-2" type="button" onclick="remove_fields(this.id)" hidden>Remove</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row m-auto">
                                    <button class="btn btn-lg btn-primary btn-block" type="submit">Update Meal</button>
                                </div>
                            </form>
                            <hr>

                            <%
                                if (currentMeal.getAvailability() == true) {
                            %>
                            <button type="button" class="btn btn-lg btn-danger btn-block mb-4" data-toggle="modal" data-target="#exampleModalCenter">
                                Deactivate
                            </button>
                            <!-- Button trigger modal -->

                            <form action="UpdateAvail" method="get">
                                <!-- Modal -->
                                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">

                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLongTitle">Confirmation to deactivate meal</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <input value="<%= currentMeal.getMealId()%>" name="mealId" hidden>
                                                <p>Are you sure you want to deactivate this meal?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-outline-danger">Yes</button>
                                                <button type="button" class="btn btn-outline-primary" data-dismiss="modal">No</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </form>

                            <% } else {%>
                            <button type="button" class="btn btn-lg btn-success btn-block mb-4" data-toggle="modal" data-target="#exampleModalCenter">
                                Activate
                            </button>
                            <!-- Button trigger modal -->

                            <form action="UpdateAvail" method="get">
                                <!-- Modal -->
                                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">

                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLongTitle">Confirmation to activate meal</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <input value="<%= currentMeal.getMealId()%>" name="mealId" hidden>
                                                <p>Are you sure you want to activate this meal?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-outline-success">Yes</button>
                                                <button type="button" class="btn btn-outline-primary" data-dismiss="modal">No</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </form>

                            <% }%>














                            <a href="manageMeal.jsp" class="btn btn-lg btn-secondary btn-block" style="color: white;">Back</a>

                        </div>

                    </div>
                    <p class="mt-5 mb-3 text-muted text-center">Bricks &copy; 2019</p>
                </main>
            </div>
        </div>
        <%@include file="../layout/scripts.jsp" %>
        <link href="../../bootstrap/css/jquery.flexdatalist.css" rel="stylesheet" type="text/css"/>
        <script src="../../bootstrap/js/jquery.flexdatalist.min.js" type="text/javascript"></script>
        <script>

                                                    var ingredients;
                                                    var flag = 1;

                                                    $(document).ready(function () {
                                                        $.get("../ingredient/retriveIngre", function (responseJson) {    // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
                                                            ingredients = responseJson;
                                                            $('.flexdatalist').flexdatalist({
                                                                selectionRequired: true,
                                                                minLength: 0,
                                                                maxShownResults: 5,
                                                                valueProperty: 'ingredientId',
                                                                searchIn: 'ingredientName',
                                                                data: responseJson
                                                            });
                                                        });
                                                    });


                                                    function add_fields() {

                                                        flag += 1; //counter increment by 1

                                                        // clone
                                                        $('.flexdatalist:first').clone().appendTo('#ingredientList').addClass(flag + 'input');
                                                        $('.ingreQuantity:first').clone().appendTo('#ingredientList').addClass(flag + 'qty');
                                                        $('.removeBtn:first').clone().appendTo('#ingredientList').removeAttr('hidden').attr('id', flag);

                                                        //re-initialise
                                                        $('.flexdatalist:last').flexdatalist({
                                                            selectionRequired: true,
                                                            minLength: 0,
                                                            maxShownResults: 5,
                                                            valueProperty: 'ingredientId',
                                                            searchIn: 'ingredientName',
                                                            data: ingredients
                                                        });
                                                        $('.ingreQuantity:last').val("");
                                                    }

                                                    function remove_fields(clicked_id) {
                                                        // remove
                                                        //Initialazation
                                                        var setInputString = clicked_id + 'input';
                                                        var setQtyString = clicked_id + 'qty';

                                                        //Processing
                                                        $("." + setInputString).hide();
                                                        $("." + setQtyString).hide();
                                                        $("#" + clicked_id).hide();
                                                    }
        </script>
    </body>
</html>