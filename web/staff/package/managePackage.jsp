<!doctype html>
<html lang="en">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <%@include file="../layout/css.jsp" %>
        <title>Staff | Manage Packages</title>
    </head>
    <body>
        <!-- Fixed-top Navs -->
        <%@include file="../layout/topnavbar.jsp" %>

        <div class="container-fluid">
            <div class="row">
                <!-- Fixed-Sidebar Navs -->
                <%@include file="../layout/sidebar.jsp" %>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <div class="container mt-5">
                        <h3>Manage Packages</h3>

                        <div class="row mt-5">
                            <%
                                for (int i = 0; i < 6; i++) {
                            %>
                            <div class="col-md-4">
                                <div class="card mb-4 shadow-sm">
                                    <img src="..." class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Package ID</h5>
                                        <p class="card-text">Descriptions // Lunch or Breakfast</p>
                                    </div>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">Meal 1</li>
                                        <li class="list-group-item">Meal 2</li>
                                        <li class="list-group-item">Meal 3</li>
                                    </ul>

                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>

                        <div class="row mt-5">
                            <div class="col-sm-2">
                                <a class="btn btn-dark btn-lg" href="addPackage.jsp" role="button">Add Item</a>
                            </div>
                            <div class="col-sm-5">
                                <form>
                                    <div class="input-group mt-1">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Search Item</span>
                                        </div>
                                        <input type="text" class="form-control col-5" id="itemid" placeholder="Item ID">
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-success" type="submit" id="search">Search</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-sm-2">
                                <a class="btn btn-dark btn-lg" href="modifyPackage.jsp" role="button">Modify Item</a>
                            </div>
                            <div class="col-sm-2">
                                <a class="btn btn-dark btn-lg" href="deletePackage.jsp" role="button">Delete Item</a>
                            </div>
                        </div>

                    </div>
                    <p class="mt-5 mb-3 text-muted text-center">Bricks � 2019</p>
                </main>
            </div>
        </div>
                        
        <%@include file="../layout/scripts.jsp" %>
    </body>
</html>