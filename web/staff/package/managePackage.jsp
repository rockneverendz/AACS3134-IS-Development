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
                        <%                            
                            String dayOdWeeksString[] = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
                            String colorClass[] = {"text-primary", "text-info", "text-success ", "text-danger ", "text-warning ", "text-sdark "};
                            PackageService ps = new PackageService();
                            List<Package> PackageList = ps.findAll();

                        %>

                        <div class="row mt-5">
                            <%  for (Package apackage : PackageList) {%>
                            <div class="col-md-4">
                                <div class="card mb-4 shadow-sm border-dark">

                                    <div class="card-body">
                                        <h5 class="card-title">Package ID : <%= apackage.getPackageId()%></h5>
                                        <p class="card-text"><%= apackage.getDescription()%></p>
                                        <p class="card-text">Meal Time : <%= apackage.getPackageTime()%></p>
                                    </div>
                                    <%
                                        List<Packageist> MealList = apackage.getPackageistList();
                                        int i = 0;
                                    %>

                                    <ul class="list-group list-group-flush">
                                        <% for (Packageist packList : MealList) {%>

                                        <li class="list-group-item <%= colorClass[i] %>"><%= dayOdWeeksString[i] %> : <%= packList.getMeal().getName() %></li>
                                            <%
                                                    i++;
                                                }
                                            %>
                                    </ul>
                                </div>
                            </div>
                            <% } %>
                        </div>

                        <div class="row mt-5">
                            <div class="col-sm-2">
                                <a class="btn btn-dark btn-lg" href="addPackage.jsp" role="button">Add Item</a>
                            </div>
                            <form action="SearchPackage" method="get" class="row col-sm-10 ml-auto">
                                <div class="col ">
                                    <div class="input-group mt-1">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Search Item</span>
                                        </div>
                                        <input name="packageid" type="text" class="form-control col-5" id="itemid" placeholder="Item ID" required>
                                        
                                    </div>
                                </div>
                                <div class="col">
                                    <button class="btn btn-dark btn-lg" type="submit">Modify Item</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <hr>
                    <p class="mb-3 text-muted text-center">Bricks © 2019</p>
                </main>
            </div>
        </div>

        <%@include file="../layout/scripts.jsp" %>
    </body>
</html>