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
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputName">Name</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputName" 
                                                   placeholder="Name" required>
                                        </div>
                                    </div>

                                    <div class="col">
                                        <label for="inputCategory">Category</label>
                                        <div class="input-group">
                                            <!-- I will get value from session. But not now. -->
                                            <input id="inputCategory" type="text" class="form-control"  
                                                   value="Noodles" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputDesc">Description</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputDesc" 
                                                   placeholder="Description">
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputPrice">Price</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputPrice" 
                                                   placeholder="Price RM :" required>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label for="inputAvailability">Availability</label>
                                        <div class="input-group">
                                            <select class="custom-select" id="inputGroupSelect" required>
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
                                            <input type="text" class="form-control" id="inputCal" 
                                                   placeholder="Calories" required>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label for="inputImage">Image</label>
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" id="inputGroupFile02">
                                                <label class="form-control custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file</label>
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
                                                <input type="text" class="flexdatalist form-control col-10" name='ingredients' placeholder="Ingredient">
                                                <input type="number" class="ingreQuantity form-control col-2" placeholder="Quantity" min="1" max="10">
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
                    <p class="mt-5 mb-3 text-muted text-center">Bricks � 2019</p>
                </main>
            </div>
        </div>
        <%@include file="../layout/scripts.jsp" %>
        <link href="../../bootstrap/css/jquery.flexdatalist.css" rel="stylesheet" type="text/css"/>
        <script src="../../bootstrap/js/jquery.flexdatalist.min.js" type="text/javascript"></script>
        <script>

                                            let ingredients = [
                                                {
                                                    name: "apple",
                                                    id: 1
                                                },
                                                {
                                                    name: "orange",
                                                    id: 2
                                                },
                                                {
                                                    name: "grape",
                                                    id: 3
                                                }
                                            ];

                                            $(document).ready(function () {
                                                $('.flexdatalist').flexdatalist({
                                                    minLength: 1,
                                                    valueProperty: 'id',
                                                    searchIn: 'name',
                                                    data: ingredients
                                                });
                                            });

                                            function add_fields() {
                                                // clone
                                                $('.flexdatalist:first').clone().appendTo('#ingredientList');
                                                $('.ingreQuantity:first').clone().appendTo('#ingredientList');

                                                //re-initialise
                                                $('.flexdatalist:last').flexdatalist({
                                                    minLength: 1,
                                                    valueProperty: 'id',
                                                    searchIn: 'name',
                                                    data: ingredients
                                                });
                                            }
        </script>
    </body>
</html>