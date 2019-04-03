<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entity.Category"%>
<%@page import="service.CategoryService"%>
<%@page import="entity.Meal"%>
<%@page import="service.MealService"%>
<!doctype html>
<html lang="en" style="position: relative; min-height: 100%;">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <title>Bricks | Meals</title>
        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }

            .jumbotron {
                padding-top: 3rem;
                padding-bottom: 3rem;
                margin-bottom: 0;
                background-color: #fff;
            }
            @media (min-width: 768px) {
                .jumbotron {
                    padding-top: 6rem;
                    padding-bottom: 6rem;
                }
            }

            .jumbotron p:last-child {
                margin-bottom: 0;
            }

            .jumbotron-heading {
                font-weight: 300;
            }

            .jumbotron .container {
                max-width: 40rem;
            }

            .form-signup {
                width: 100%;
                max-width: 420px;
                padding: 15px;
                margin: auto;
            }

            .form-label-group {
                position: relative;
                margin-bottom: 1rem;
            }
        </style>

    </head>
    <body style="margin-bottom: 60px;">
        <%@include file="../layout/navbar.jsp" %>
        <main role="main">
            <%  String categoryId = request.getParameter("CategoryId");
                MealService ms = new MealService();
                CategoryService cs = new CategoryService();
                Category category = cs.findCategoryByID(Integer.parseInt(categoryId));

                SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                Date today = new Date();

                Calendar calendar = Calendar.getInstance();
                calendar.setTime(today);
                calendar.add(Calendar.DATE, 2);
                Date todayAdd2 = calendar.getTime();
            %>
            <section class="jumbotron text-center">
                <div class="container">
                    <h1 class="jumbotron-heading"><%= category.getName()%></h1>
                    <p class="lead text-muted"><%= category.getDescription()%></p>

                </div>
            </section>

            <div class="album py-5 bg-light">
                <div class="container">
                    <%
                        //If no object are recieved, create a new object.
                        String username = (String) request.getAttribute("username");
                        if (username == null) {
                            username = "";
                        }

                        String status = request.getParameter("status");
                        String message;
                        String type;
                        if (status == null) {
                            message = "";
                        } else {
                            char code = status.charAt(0);
                            if (code == '1') {
                                type = "success";
                                message = "Successfully added to cart!";
                            } else if (code == '2') {
                                type = "warning";
                                message = "Already existed in cart!";
                            } else {
                                type = "danger";
                                message = "An error has occured";
                            }
                    %>            
                    <div class="alert alert-<%= type%>" role="alert">
                        <%= message%>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <%
                        }
                    %>

                    <div class="row">
                        <% for (Meal meal : ms.findMealByCategoryID(category)) {
                        %>
                        <div class="col-md-4">
                            <div class="card mb-4 shadow-sm">
                                <%
                                    byte[] image = meal.getImage();
                                    if (image != null) { //Image found
                                %>
                                <!--Insert Image here-->
                                <%
                                } else { //No image found
                                %>
                                <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                                <%
                                    }
                                %>
                                <div class="card-body">
                                    <h5 class="card-title"><%= meal.getName()%></h5>
                                    <p class="card-text"><%= meal.getDescription()%></p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <small class="text-muted"><%= meal.getPrice()%> points</small>
                                        <button type="button" class="btn btn-primary" 
                                                data-toggle="modal" data-target="#orderModal" 
                                                data-mealid="<%= meal.getMealId()%>"
                                                data-mealname="<%= meal.getName()%>">Order</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="orderModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="orderModalLabel">Order</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form class="form-meal" action="../order/addMeal">
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-6 form-label-group">
                                                <label for="mealName" class="col-form-label">Meal</label>
                                                <input name="CategoryId" type="text" value="<%= categoryId%>" hidden>
                                                <input id="mealId" name="mealId" type="text" hidden>
                                                <input id="mealName" type="text" class="form-control" disabled>
                                            </div>
                                            <div class="col-6 form-label-group">
                                                <label for="mealQty" class="col-form-label">Quantity</label>
                                                <input id="mealQty" name="mealQty" type="number" class="form-control" required>
                                            </div>
                                            <div class="col-6 form-label-group">
                                                <label for="mealDate" class="col-form-label">Date</label>
                                                <input id="mealDate" name="mealDate" type="text" class="form-control" required>
                                            </div>
                                            <div class="col-6 form-label-group" data-toggle="buttons">
                                                <label class="col-form-label">Time</label>
                                                <div class="btn-group btn-group-toggle btn-block">
                                                    <label class="btn btn-outline-primary w-50">
                                                        <input name="mealTime" value="B" type="radio" required> Breakfast
                                                    </label>
                                                    <label class="btn btn-outline-primary w-50">
                                                        <input name="mealTime" value="L" type="radio" required> Lunch
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Add Meal</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="../layout/footer.jsp" %>
        <%@include file="../layout/scripts.jsp" %>
        <link href="../../bootstrap/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../bootstrap/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <script>
            $('#orderModal').on('show.bs.modal', function (event) {
                if (event.namespace === 'bs.modal') {
                    var button = $(event.relatedTarget); // Button that triggered the modal
                    $('#mealId').val(button.data('mealid'));
                    $('#mealName').val(button.data('mealname'));
                }
            });

            $('#mealDate').datepicker({
                format: "dd-mm-yyyy",
                startDate: "<%= dateFormat.format(todayAdd2)%>",
                maxViewMode: 0,
                daysOfWeekDisabled: "0",
                todayHighlight: true
            });
        </script>
    </body>
</html>
