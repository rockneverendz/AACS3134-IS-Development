<!doctype html>
<html lang="en">
    <head>
        <%@include file="../Layout/meta.html" %>
        <%@include file="../Layout/css.html" %>
        <title>Staff | Manage Meals</title>
    </head>

    <body>
        <!-- Fixed-top Navs -->
        <%@include file="../Layout/topnavbar.html" %>

        <div class="container-fluid">
            <div class="row">
                <!-- Fixed-Sidebar Navs -->
                <%@include file="../Layout/sidebar.html" %>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <div class="container mt-4">
                        <h3>Manage Meals</h3>

                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">Food</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (int i = 0; i < 10; i++) {%>
                                <tr>
                                    <th scope="row"><%= i + 1%></th>
                                    <td>    
                                        Chicken Rice
                                    </td>
                                    <td>
                                        <%= i + 1%>
                                    </td>
                                    <td>RM <%= i + 2%></td>
                                    <td><strong>RM <%= i * 2%></strong></td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>

                        <div class="row">
                            <div class="col-sm-2">
                                <a class="btn btn-dark btn-lg" href="add.jsp" role="button">Add Item</a>
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
                                <a class="btn btn-dark btn-lg" href="modify.jsp" role="button">Modify Item</a>
                            </div>
                            <div class="col-sm-2">
                                <a class="btn btn-dark btn-lg" href="delete.jsp" role="button">Delete Item</a>
                            </div>
                        </div>
                    </div>
                    <p class="mt-5 mb-3 text-muted text-center">Bricks © 2019</p>
                </main>
            </div>
        </div>
        <%@include file="../Layout/scripts.html" %>
    </body>
</html>