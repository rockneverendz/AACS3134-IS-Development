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
        </style>

    </head>
    <body style="margin-bottom: 60px;">
        <%@include file="../layout/navbar.jsp" %>
        <main role="main">
            <%                String categoryId = request.getParameter("CategoryId");
                MealService ms = new MealService();
                CategoryService cs = new CategoryService();
                Category category = cs.findCategoryByID(Integer.parseInt(categoryId));
            %>
            <section class="jumbotron text-center">
                <div class="container">
                    <h1 class="jumbotron-heading"><%= category.getName()%></h1>
                    <p class="lead text-muted"><%= category.getDescription()%></p>

                </div>
            </section>

            <div class="album py-5 bg-light">
                <div class="container">
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
                                    <p class="card-text"><%= meal.getName()%></p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <small class="text-muted"><%= meal.getPrice()%> points</small>
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#orderModal" data-mealid="<%= meal.getMealId()%>">Order</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="orderModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="orderModalLabel">Order</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="mealId" class="col-form-label">Meal ID:</label>
                                            <input id="mealId" type="text" class="form-control" disabled>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group date" id="datepicker">
                                                <label for="mealDate" class="col-form-label">Meal Date:</label>
                                                <input id="mealDate" type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="recipient-name" class="col-form-label">Meal Time:</label>
                                            Breakfast
                                            <input type="radio" name="time" value="Breakfast" />
                                            Lunch
                                            <input type="radio" name="time" value="Lunch" />
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Add Meal</button>
                                </div>
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
                var button = $(event.relatedTarget); // Button that triggered the modal
                var id = button.data('mealid'); // Extract info from data-* attributes
                var modal = $(this);
                modal.find('#mealId').val(id);
            });

            $('#datepicker').datepicker({
                format: "dd-mm-yyyy",
                startDate: "04/04/2019",
                maxViewMode: 0
            });
        </script>
    </body>
</html>
