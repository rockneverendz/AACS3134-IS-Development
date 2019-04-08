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
                    <%  String status = request.getParameter("status");
                        String message;
                        String type;
                        if (status != null) {
                            char code = status.charAt(0);
                            if (code == 'C') {
                                type = "warning";
                                message = "Not enough credit points!";
                            } else {
                                type = "danger";
                                message = "An error has occured";
                            }
                    %>            
                    <div class="alert alert-<%= type%>" role="alert">
                        <%= message%>
                    </div>
                    <%
                        }
                    %>
                    <div class="row">
                        <%  String dayOdWeeksString[] = {"Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
                            
                            PackageService ps = new PackageService();
                            List<entity.Package> list = ps.findAll();
                            for (entity.Package packagee : list) {
                        %>
                        <div class="col-md-4">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-body">
                                    <h5 class="card-title"><%= packagee.getDescription()%></h5>
                                    <p class="card-text">Meal Time : <%= packagee.getPackageTime()%></p>
                                </div>
                                <ul class="list-group list-group-flush">
                                    <%
                                        int i = 0;
                                        for (Packageist packagelist : packagee.getPackageistList()) {
                                    %>
                                    <li class="list-group-item bg-light"><%= dayOdWeeksString[i]%> : <%= packagelist.getMeal().getName()%></li>
                                        <%
                                                i++;
                                            }
                                        %>
                                </ul>
                                <div class="card-body">
                                    <div class="btn-group float-right">
                                        <a class="btn btn-outline-primary" href="../package/viewpackagelistweekly.jsp?packageId=<%= packagee.getPackageId()%>" role="button">Weekly</a>
                                        <a class="btn btn-outline-primary" href="../package/viewpackagelistmonthly.jsp?packageId=<%= packagee.getPackageId()%>" role="button">Monthly</a>
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
