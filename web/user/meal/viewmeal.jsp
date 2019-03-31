<%@page import="entity.Category"%>
<%@page import="service.CategoryService"%>
<%@page import="entity.Meal"%>
<%@page import="service.MealService"%>
<!doctype html>
<html lang="en">
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

            footer > span > a{
                color: aliceblue;
            }

            footer > span :hover{
                color: aliceblue;
            }




        </style>

    </head>
    <body>
        <%@include file="../layout/navbar.jsp" %>
        <main role="main">
            <%
                String categoryId = request.getParameter("CategoryId");
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
                                    if (image != null) {
                                %>
                                <%
                                } else {
                                %>
                                <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                                <%
                                    }
                                %>
                                <div class="card-body">
                                    <p class="card-text"><%= meal.getName() %></p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <small class="text-muted"><%= meal.getPrice() %> points</small>
                                        <a href="#" class="btn btn-primary">Order</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="../layout/footer.jsp" %>
        <%@include file="../layout/scripts.jsp" %>
    </body>
</html>
