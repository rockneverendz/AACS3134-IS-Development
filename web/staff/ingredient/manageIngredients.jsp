<%@page import="entity.Ingredient"%>
<%@page import="entity.Ingredientlist"%>
<%@page import="service.IngredientService"%>
<%@page import="java.util.List"%>

<!doctype html>
<html lang="en">
    <!-- retrieve session object, MealList -->

    <head>
        <%@include file="../layout/meta.jsp" %>
        <%@include file="../layout/css.jsp" %>
        <title>Staff | Manage Ingredient</title>
    </head>

    <body>
        <!-- Fixed-top Navs -->
        <%@include file="../layout/topnavbar.jsp" %>

        <div class="container-fluid">
            <div class="row">
                <!-- Fixed-Sidebar Navs -->
                <%@include file="../layout/sidebar.jsp" %>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <div class="container mt-4" style="max-width: 850px;">

                        <h3>Manage Ingredients</h3>
                        <%                            String status = request.getParameter("status");
                            String message;
                            String type;
                            if (status == null) {
                            } else {
                                char code = status.charAt(0);
                                if (code == '1') {
                                    type = "success";
                                    message = "Added New Ingredient !";
                                } else if (code == 'R') {
                                    type = "success";
                                    message = "Ingredient Removed !";
                                } else {
                                    type = "danger";
                                    message = "An error has occured ";
                                }
                        %>            
                        <div class="alert alert-<%= type%>" role="alert">
                            <%= message%>
                        </div>
                        <%
                            }
                        %>
                        <table id="myTable" class="table table-bordered table-hover table-sm">
                            <thead>
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">Ingredient</th>
                                </tr>
                            </thead>
                            <%  
                                IngredientService ingredientService = new IngredientService();
                                List<Ingredient> IngredientList = ingredientService.findAllWithoutList();

                            %>
                            <tbody>
                                <% for (Ingredient ingredients : IngredientList) {%>
                                <tr>
                                    <td scope="row"><%= ingredients.getIngredientId()%></td>
                                    <td><%= ingredients.getIngredientName()%></td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>


                        <!-- Modal -->
                        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <form action="addIngredient" method="get">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLongTitle">Add Ingredient</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row mb-4">
                                                <div class="col">
                                                    <label for="inputPassword">Ingredient name</label>
                                                    <div class="input-group">
                                                        <input name="ingredient" type="text" id="inputIngred" class="form-control" placeholder="Ingredient name" required >
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-primary">Add</button>
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-4">
                                <!-- Button trigger modal -->
                                <button class="btn btn-dark btn-block" data-toggle="modal" data-target="#exampleModalCenter">Add item</button>
                            </div>
                            <div class="col-8">
                                <form class="row" action="removeIngredient" method="get">
                                    <div class="col input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Search</span>
                                        </div>
                                        <input type="text" name="ingredientid" class="form-control " id="itemid" placeholder="Item ID" onkeyup="myFunction()">
                                    </div>
                                    <div class="col">
                                        <button type="submit" class="btn btn-dark btn-block white" role="button">Remove Item</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <p class="mt-5 mb-3 text-muted text-center">Bricks © 2019</p>
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