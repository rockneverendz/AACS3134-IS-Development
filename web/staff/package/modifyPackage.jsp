<!doctype html>
<html lang="en">
    <head>
        <%@include file="../layout/meta.html" %>
        <%@include file="../layout/css.html" %>
        <title>Staff | Manage Meals</title>
    </head>
    <body>
        <!-- Fixed-top Navs -->
        <%@include file="../layout/topnavbar.html" %>

        <div class="container-fluid">
            <div class="row">
                <!-- Fixed-Sidebar Navs -->
                <%@include file="../layout/sidebar.html" %>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <div class="container mt-4">
                        <!--        Add New Meal Form-->
                        <div class="form-container col-md-9 mt-5" style="max-width: 800px; margin: auto;">
                            <form class="form-signup" >
                                <div class="text-center mb-4">
                                    <h1 class="h1 mb-3">Update Meal Information</h1>
                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputName">Name</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputName" placeholder="Name">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label for="inputDesc">Description</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputDesc" placeholder="Description">
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputPrice">Price</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputPrice" placeholder="Price RM :">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label for="inputAvailability">Availability</label>
                                        <div class="input-group">
                                            <select class="custom-select" id="inputGroupSelect">
                                                <option selected>Available</option>
                                                <option value="2">Unavailable</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputIngred">Main Ingredient</label>
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
                                        <label for="inputCal">Calories</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputCal" placeholder="Calories">
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
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputCategory">Category</label>
                                        <div class="input-group">
                                            <select class="custom-select" id="inputGroupSelect" data-toggle="tooltip" data-placement="right" title="Please select your category">
                                                <option selected>Choose...</option>
                                                <option value="1">Chicken Rice</option>
                                                <option value="2">Masakan Malaysia</option>
                                                <option value="3">Noodles</option>
                                                <option value="4">IndoDeli</option>
                                                <option value="5">Vegetarian Cuisine</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <button class="btn btn-lg btn-primary btn-block" type="submit">Update Meal</button>
                                <a href="managePackage.jsp" class="btn btn-lg btn-secondary btn-block" style="color: white;">Back</a>
                            </form>
                        </div>
                    </div>
                    <p class="mt-5 mb-3 text-muted text-center">Bricks � 2019</p>
                </main>
            </div>
        </div>

        <%@include file="../layout/scripts.html" %>
    </body>
</html>