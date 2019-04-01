<%@page import="entity.Staff"%>
<%@page import="entity.Customer"%>
<%@page import="entity.Reload"%>
<%@page import="service.ReloadService" %>
<%@page import="java.text.SimpleDateFormat"%>
<!doctype html>
<html lang="en">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <%@include file="../layout/css.jsp" %>
        <title>Report | Top Up History</title>
    </head>
    <body>
        <!-- Fixed-top Navs -->
        <%@include file="../layout/topnavbar.jsp" %>

        <div class="container-fluid">
            <div class="row">
                <!-- Fixed-Sidebar Navs -->
                <%@include file="../layout/sidebar.jsp" %>

                <main id="mainContainer" role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <div class="container mt-4">

                        <%                            ReloadService rs = new ReloadService();
                            List<Reload> reloadList = rs.findAll();

                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/YYYY");
                            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");

                        %>

                        <h3>Top Up History</h3>


                        <table id="myTable" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">#ID</th>
                                    <th scope="col">Customer Name</th>
                                    <th scope="col">Reload Amount</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Staff Name</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Reload reload : reloadList) {%>
                                <tr>
                                    <th scope="row"><%= reload.getReloadId()%></th>
                                    <td><%= reload.getCustId().getUsername()%></td>
                                    <td><%= reload.getAmount()%></td>
                                    <td><%= dateFormat.format(reload.getDate())%></td>
                                    <td><%= timeFormat.format(reload.getTime())%></td>
                                    <td><%= reload.getStaffId().getUsername()%></td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>

                        <div class="row mt-3 d-print-none">
                            <div class="col-sm-5">
                                <form>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Search by Date/Week</span>
                                        </div>
                                        <input type="date" class="form-control col-5" id="inputDate" placeholder="Date" onchange="myFunction()">
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-success" type="submit" id="search" >Search</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-sm-6">
                                <button class="btn btn-outline-primary d-print-none" onclick="printFn()" id="print"><i class="fas fa-print"></i> Print</button>
                            </div>
                        </div>
                    </div>
                    <p class="mt-5 mb-3 text-muted text-center">Bricks <i class="far fa-copyright"></i> 2019</p>
                </main>
            </div>
        </div>

        <%@include file="../layout/scripts.jsp" %>
        <script>
            function printFn() {

                $("#mainContainer").removeClass("col-md-9");
                $("#mainContainer").removeClass("ml-sm-auto");
                $("#mainContainer").removeClass("col-lg-10");
                $("#mainContainer").addClass("col-sm-12");
                window.print();
                $("#mainContainer").removeClass("col-sm-12");
                $("#mainContainer").addClass("col-md-9");
                $("#mainContainer").addClass("ml-sm-auto");
                $("#mainContainer").addClass("col-lg-10");
            }


            function myFunction() {
                var input, filter, table, tr, td, i, txtValue;
                input = document.getElementById("inputDate");
                filter = input.value.toUpperCase();
                table = document.getElementById("myTable");
                tr = table.getElementsByTagName("tr");
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[2];
                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
        </script>

    </body>
</html>