<%@page import="entity.Category"%>
<%@page import="service.CategoryService"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../layout/meta.jsp" %>
        <title>Category</title>

        <!--        CSS-->
        <style>
            .nav-item:nth-child(2) .nav-link { 
                color: #fff; /* Highlights the 2nd child (Order) of the nav-item */ 
            }

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

            .col-6 {
                padding-right: 0;
                padding-left: 0;
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

            .card{
                height: 300px;
                margin-bottom: -1px;
                margin-left: -1px;
                border-radius: 0;
            }

            .card-deck > a{
                color: black;
            }
            .card-deck > a:hover{
                color: black;
                text-decoration: none;
            }
        </style>
    </head>
    <body class="text-center">
        <%@include file="../layout/navbar.jsp" %>
        <!--	Main Content-->
        <div class="container" style="padding: 25px;">
            <section class="jumbotron text-center">
                <div class="container">
                    <h1 class="jumbotron-heading">Category</h1>
                    <p class="lead text-muted">Please Select a Category.</p>

                </div>
            </section>
            <div class="row">
                <%
                    CategoryService cs = new CategoryService();
                    for (Category category : cs.findAll()) {
                %>
                <a href="../meal/viewmeal.jsp?CategoryId=<%= category.getCategoryId()%>" class="card bg-dark text-white col-6">
                    <div>
                        <%
                            byte[] image = category.getImage();
                            if (image != null) {
                        %>

                        <img src="..." class="card-img" alt="...">

                        <%
                        } else {
                        %>
                        <svg class="bd-placeholder-img card-img" width="600" height="300" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
                        <title>Category Thumbnail</title>
                        <rect width="100%" height="100%" fill="#55595c"></rect>
                        <text x="50%" y="50%" fill="#eceeef" dy=".3em">Category Thumbnail</text>
                        </svg>
                        <%
                            }
                        %>
                        <div class="card-img-overlay">
                            <h5 class="card-title display-4"><%= category.getName()%></h5>
                        </div>
                    </div>
                </a>
                <%
                    }
                %>
            </div>
        </div>
        <%@include file="../layout/footer.jsp" %>
        <%@include file="../layout/scripts.jsp" %>
    </body>
</html>
