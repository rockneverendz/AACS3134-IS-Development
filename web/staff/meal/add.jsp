<!doctype html>
<html lang="en">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <%@include file="../layout/css.jsp" %>
        <title>Staff | Manage Meals</title>
        <link href="../../bootstrap/select2.css" rel="stylesheet">
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
                                        <label for="inputCal">Image</label>
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" id="inputGroupFile02">
                                                <label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="ingredientList" class="row col-12 mb-4">

                                    <label for="inputIngredients">Ingredient List</label>
                                    <div id="addIngredient" class="input-group mb-2">
                                        <select id="selectIngre" class="form-control" name="ingredients">
                                            <option value="" selected disabled hidden>Choose here</option>
                                            <option value="1">Chicken</option>
                                            <option value="2">Mushroom</option>
                                            <option value="3">Ramen</option>
                                        </select>

                                        <input type="number" class="form-control">
                                        <div class="input-group-append" id="button-addon4">
                                            <button class="btn btn-outline-secondary" type="button" onclick="add_fields()"><i class="fas fa-plus"></i></button>
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
        <script src="../../bootstrap/select2.min.js"></script>
        <script>
                                                $(document).ready(function () {
                                                    //initialize Select2
                                                    $('#selectIngre').select2();
                                                });

                                                function add_fields() {
                                                    $('#addIngredient').clone().appendTo('#ingredientList');
                                                }
                                                ;
        </script>



    </body>
</html>