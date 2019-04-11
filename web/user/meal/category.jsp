<%@page import="java.util.Base64"%>
<%@page import="entity.Category"%>
<%@page import="service.CategoryService"%>
<!DOCTYPE html>
<html lang="en" style="position: relative; min-height: 100%;">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <title>Category</title>

        <!-- CSS-->
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

            .card-deck > a{
                color: black;
            }

            .card-deck > a:hover{
                color: black;
                text-decoration: none;
            }

            .card-title{
                background-color: #0000004d;
            }

            .card-img{
                height: 300px;
                object-fit: cover;
            }

            h5 {
                color: white;
                text-shadow: 1px 1px 2px black, 0 0 25px gray, 0 0 5px darkgray;
            }

        </style>
    </head>
    <body style="margin-bottom: 60px;" class="text-center">
        <%@include file="../layout/navbar.jsp" %>
        <!--	Main Content-->
        <section class="jumbotron text-center">
            <div class="container">
                <h1 class="jumbotron-heading">Category</h1>
                <p class="lead text-muted">Please Select a Category.</p>

            </div>
        </section>
        <div class="album py-5 bg-light">
            <div class="container">
                <div class="container-fluid">
                    <div class="row">
                        <%                    CategoryService cs = new CategoryService();
                            for (Category category : cs.findAll()) {
                        %>
                        <a href="../meal/viewmeal.jsp?CategoryId=<%= category.getCategoryId()%>" class="card col-6 border-0 rounded-0 p-0">
                            <div>
                                <%
                                    byte[] image = category.getImage();
                                    if (image != null) { //Image found
                                        String base64Image = Base64.getEncoder().encodeToString(image);
                                %>
                                <img class="card-img border-0 rounded-0" src="data:image/jpg;base64,<%= base64Image%>"/>
                                <%
                                } else { //No image found
                                %>
                                <svg class="bd-placeholder-img card-img" width="600" height="300" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
                                <title>Category Thumbnail</title>
                                <rect width="100%" height="100%" fill="#55595c"></rect>
                                <text x="50%" y="50%" fill="#eceeef" dy=".3em">Category Thumbnail</text>
                                </svg>
                                <%
                                    }
                                %>
                                <div class="card-img-overlay p-0">
                                    <h5 class="card-title display-4 p-2"><%= category.getName()%></h5>
                                </div>
                            </div>
                        </a>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../layout/footer.jsp" %>
        <%@include file="../layout/scripts.jsp" %>
    </body>
</html>
