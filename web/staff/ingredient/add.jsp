<%@page import="entity.Staff"%>
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
                            <form class="form-signup" action="AddMeal" enctype="multipart/form-data">
                                <div class="text-center mb-4">
                                    <h1 class="h1 mb-3">Add New Meal</h1>
                                </div>
                                <%
                                    //Already initialize in sidebar.jsp
                                    //If user is not logged in
//                                    Staff staff = (Staff) session.getAttribute("staff");
//                                    if (staff == null) {
//                                        response.sendRedirect("../account/signin.jsp?status=N");
//                                        return;
//                                    }

                                    String status = request.getParameter("status");
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
                                            <input id="inputName" name="Name" type="text" class="form-control"  
                                                   placeholder="Name" required>
                                        </div>
                                    </div>

                                    <div class="col">
                                        <label for="inputCategory">Category</label>
                                        <div class="input-group">
                                            <!-- I get it -->
                                            <input id="inputCategory" type="text" class="form-control"  
                                                   value="<%= staff.getCategoryId().getName()%>" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputDesc">Description</label>
                                        <div class="input-group">
                                            <input id="inputDesc" name="Description" type="text" class="form-control"
                                                   placeholder="Description">
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputPrice">Price</label>
                                        <div class="input-group">
                                            <input id="inputPrice" name="Price" type="text" class="form-control"
                                                   placeholder="Price RM :" required>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label for="inputAvailability">Availability</label>
                                        <div class="input-group">
                                            <select id="inputGroupSelect" name="Availability" class="custom-select" required>
                                                <option value="true" selected>Available</option>
                                                <option value="false">Unavailable</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputCal">Calories</label>
                                        <div class="input-group">
                                            <input id="inputCal" name="Calories" type="text" class="form-control"
                                                   placeholder="Calories" required>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label for="inputImage">Image</label>
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <label for="inputFile" class="form-control custom-file-label">Choose file</label>
                                                <input id="inputFile" name="image" type="file" class="custom-file-input" >
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
                                                <input name='Ingredient' type="text" class="flexdatalist form-control col-10" placeholder="Ingredient">
                                                <input name='Quantity' type="number" class="ingreQuantity form-control col-2" placeholder="Quantity" min="1" max="10" step="0.01">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <button class="btn btn-lg btn-primary btn-block" type="submit">Add Meal</button>
                                <a href="manageMeal.jsp" class="btn btn-lg btn-secondary btn-block" style="color: white;">Back</a>
                            </form>
                        </div>
                    </div>
                    <div id="somediv"></div>
                    <p class="mt-5 mb-3 text-muted text-center">Bricks <i class="far fa-copyright"></i> 2019</p>
                </main>
            </div>
        </div>
        <%@include file="../layout/scripts.jsp" %>
        <link href="../../bootstrap/css/jquery.flexdatalist.css" rel="stylesheet" type="text/css"/>
        <script src="../../bootstrap/js/jquery.flexdatalist.min.js" type="text/javascript"></script>
        <script>

                                            var ingredients;

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
                                                // clone
                                                $('.flexdatalist:first').clone().appendTo('#ingredientList');
                                                $('.ingreQuantity:first').clone().appendTo('#ingredientList');

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
        </script>
    </body>
</html>