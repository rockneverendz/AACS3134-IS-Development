<%@page import="entity.Packageist"%>
<%@page import="service.PackageService"%>
<%@page import="java.util.List"%>
<!doctype html>
<html lang="en" style="position: relative; min-height: 100%;">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <title>Bricks | Packages</title>
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

            <section class="jumbotron text-center">
                <div class="container">
                    <h1 class="jumbotron-heading">Packages</h1>
                    <p class="lead text-muted">Are you lazy to think what to eat during every meal time??<br>
                        Then why don't just choose a meal packages from us!<br>
                        We provide various sets of meal packages and you can just order and pay per week or monthly!!</p>

                </div>
            </section>

            <div class="album py-5 bg-light">
                <div class="container">
                    <div class="row">
                        <%  PackageService ps = new PackageService();
                            List<entity.Package> list = ps.findAll();
                            for (entity.Package packagee : list) {
                        %>
                        <div class="col-md-4">
                            <div class="card mb-4 shadow-sm">
                                <img src="..." class="card-img-top" alt="...">
                                <div class="card-body">
                                    <p class="card-text"><%= packagee.getDescription()%></p>
                                </div>
                                <ul class="list-group list-group-flush">
                                    <%
                                        for (Packageist packagelist : packagee.getPackageistList()) {
                                    %>
                                    <li class="list-group-item"><%= packagelist.getMeal().getName()%></li>
                                        <%
                                            }
                                        %>
                                </ul>
                                <div class="card-body">
                                    <div class="btn-group float-right">
                                        <a class="btn btn-outline-primary" href="../meal/viewpackagelistweekly.jsp?packageId=<%= packagee.getPackageId()%>" role="button">Weekly</a>
                                        <a class="btn btn-outline-primary" href="../meal/viewpackagelistmonthly.jsp?packageId=<%= packagee.getPackageId()%>" role="button">Monthly</a>
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
