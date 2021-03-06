<%@page import="entity.Package" %>
<%@page import="entity.Packageist"%>
<%@page import="service.PackageService"%>
<%@page import="entity.Meal"%>
<%@page import="service.MealService"%>
<%@page import="java.util.List"%>
<%
    Package mealPackage = (Package) session.getAttribute("MealPackage");
    PackageService ps = new PackageService();
    mealPackage = ps.findPackageByID(mealPackage.getPackageId());
    List<Packageist> mealPackageList = ps.findPackageistByPackage(mealPackage.getPackageId());
    int[] mealOfWeekOfDays = new int[5];

    //this part is to convert the 6 dayOfWeekMeal's ID in to a Array
    int j = 0;
    for (Packageist mealList : mealPackageList) {

        mealOfWeekOfDays[j] = mealList.getMealId().getMealId();
//        System.out.println(mealList.getMeal().getMealId()); // Testing oni
        System.out.println(mealOfWeekOfDays[j]);
    }

    MealService mealService = new MealService();
    List<Meal> MealList = mealService.findMealByAvailability(true);

    String dayOfWeeks[] = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
    String colorClass[] = {"bg-primary", "bg-info", "bg-success ", "bg-danger ", "bg-warning ", "bg-dark "};
%>


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
                    <div class="container mt-4">
                        <!--        Add New Package Form-->
                        <div class=" mt-5" style="max-width: 1000px; margin: auto">
                            <div class="row m-2">
                                <h3>Update Package</h3>
                                <form action="RemovePackage" method="get" class="ml-auto">
                                    <button type="button" class="btn btn-outline-danger btn-block" data-toggle="modal" data-target="#exampleModalCenter">
                                        Remove Package
                                    </button>                                     
                                    <!-- Modal -->
                                    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLongTitle">Confirmation to remove package</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <input value="<%= mealPackage.getPackageId()%>" name="packageid" hidden>
                                                    <p>Are you sure you want to remove this package ?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-outline-danger">Yes</button>
                                                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">No</button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </form>
                            </div>
                            <hr>
                            
                            <form action="UpdatePackage" method="get">
                                <div class="row form-group">
                                    <label class="col-form-label col-sm-2">Package ID : </label>
                                    <input name="packageId" type="text" class="form-group form-control col-sm-5 mr-auto" value="<%= mealPackage.getPackageId()%>"  readonly >
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-4">
                                        <label>Select Time : </label>
                                        <select name="maelTime" class="custom-select" required>
                                            <option value="Breakfast"
                                                    <% if (mealPackage.getPackageTime() == "Breakfast") { %>selected<% } %>
                                                    >Breakfast</option>
                                            <option value="Lunch"
                                                    <% if (mealPackage.getPackageTime() == "Lunch") { %>selected<% } %>
                                                    >Lunch</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-4 ml-5">
                                        <label>Availability : </label>
                                        <select name="availability" class="custom-select" required>
                                            <option value="true"
                                                    <% if (mealPackage.getAvailability() == true) { %>
                                                    selected
                                                    <% } %>
                                                    >Active</option>
                                            <option value="false"
                                                    <% if (mealPackage.getAvailability() == false) { %>
                                                    selected
                                                    <% }%>
                                                    >Disable</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>Description :</label>
                                    <textarea name="desc" class="form-control w-50" rows="3" placeholder="Please enter some description for this package" required><%= mealPackage.getDescription()%></textarea>
                                </div> 
                                <div class="row mt-4">
                                    <%
                                        int i = 0;
                                        for (Packageist mealList : mealPackageList) {
                                    %>

                                    <div class="col-md-4">
                                        <div class="<%= colorClass[i]%> text-white card mb-4 rounded shadow">
                                            <div class="card-body">
                                                <h5 class="card-title"><%= dayOfWeeks[i]%></h5>
                                                <hr>
                                                <h6>Current Meal : <%= mealList.getMealId().getName()%></h6>
                                            </div>
                                            <div class="card-footer text-right">
                                                <select name="maelArr" class="custom-select" required="true">
                                                    <option value="" selected="true" disabled="true">Choose...</option>
                                                    <% for (Meal meal : MealList) {%>
                                                    <option value="<%= meal.getMealId()%>" 
                                                            <% if (meal.getMealId() == mealList.getMealId().getMealId()) {%>
                                                            selected
                                                            <% }%>
                                                            >
                                                        <%= meal.getName()%>
                                                    </option>
                                                    <% } %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                            i++;
                                        }
                                    %>
                                </div>
                                <div class="row m-2">
                                    <div class="mr-auto">
                                        <a class="btn btn-lg btn-secondary" href="managePackage.jsp">Back</a>
                                    </div>
                                    <div class="ml-auto">
                                        <button class="btn btn-lg btn-outline-primary" type="submit">Update Package</button>
                                    </div>
                                </div>
                            </form>
                            <hr>

                        </div>
                    </div>
                    <hr>
                    <p class="mb-3 text-muted text-center">Bricks &copy; 2019</p>
                </main>
            </div>
        </div>

        <%@include file="../layout/scripts.jsp" %>
        <script>


        </script>


    </body>
</html>