<%@page import="java.util.List"%>
<%@page import="entity.Package"%>
<%@page import="entity.Packageist"%>
<%@page import="service.PackageService"%>


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
                    <div class="container mt-5 mb-5">
                        <h3>Manage Packages</h3>
                        <hr>
                        <%                            String status = request.getParameter("status");
                            String message;
                            String type;
                            if (status == null) {
                            } else {
                                char code = status.charAt(0);
                                if (code == '1') {
                                    type = "success";
                                    message = "Successfully Added Package!";
                                } else if (code == '2') {
                                    type = "success";
                                    message = "Successfully Updated Package!";
                                } else if (code == 'R') {
                                    type = "success";
                                    message = "Successfully Removed Package!";
                                } else if (code == 'N') {
                                    type = "warning";
                                    message = "Package ID not found!";
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

                            String dayOdWeeksString[] = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
                            String colorClass[] = {"text-primary", "text-info", "text-success ", "text-danger ", "text-warning ", "text-dark "};
                            PackageService ps = new PackageService();
                            List<Package> PackageList = ps.findAll();
                        %>

                        <div class="row mt-5">
                            <%  for (Package apackage : PackageList) {%>
                            <div class="col-md-4">
                                <div class="card text-white bg-dark mb-4 shadow-sm">

                                    <div class="card-body">
                                        <h5 class="card-title">Package ID : <%= apackage.getPackageId()%></h5>
                                        <p class="card-text"><%= apackage.getDescription()%></p>
                                        <p class="card-text">Meal Time : <%= apackage.getPackageTime()%></p>
                                        <p class="card-text">Availability : <%= apackage.getAvailability()%></p>
                                    </div>
                                    <%
                                        List<Packageist> MealList = ps.findPackageistByPackage(apackage.getPackageId());
                                        int i = 0;
                                    %>

                                    <ul class="list-group list-group-flush">
                                        <% for (Packageist packList : MealList) {%>

                                        <li class="list-group-item bg-light <%= colorClass[i]%>"><%= dayOdWeeksString[i]%> : <%= packList.getMealId().getName()%></li>
                                            <%
                                                    i++;
                                                }
                                            %>
                                    </ul>
                                </div>
                            </div>
                            <% }%>
                        </div>

                        <div class="row m-3">
                            <a class="btn btn- btn-primary" href="addPackage.jsp" role="button">Add Package</a>

                            <div class="ml-auto">
                                <form action="SearchPackage" method="get">

                                    <div class="input-group mt-1">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Search Item</span>
                                        </div>
                                        <input name="packageid" type="text" class="form-control col-5" id="itemid" placeholder="Item ID" required>
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="submit" >Modify Package</button>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <p class="mb-3 text-muted text-center">Bricks &copy; 2019</p>
                </main>
            </div>
        </div>

        <%@include file="../layout/scripts.jsp" %>
    </body>
</html>