<!doctype html>
<html lang="en">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <%@include file="../layout/css.jsp" %>
        <title>Report | Cancellation Report</title>
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
                        <h3>Cancellations Report</h3>

                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">#ID</th>
                                    <th scope="col">Customer Name</th>
                                    <th scope="col">Order ID</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Refunded Credits</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (int i = 0; i < 10; i++) {%>
                                <tr>
                                    <th scope="row"><%= i + 1%></th>
                                    <td>    
                                        Name*
                                    </td>
                                    <td>
                                        <%= i + 1000%>
                                    </td>
                                    <td>dd/mm/yyyy</td>
                                    <td><strong>hh:mm</strong></td>
                                    <td><strong>Credits Points</strong></td>
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
                                        <input type="date" class="form-control col-5" id="itemid" placeholder="Date">
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-success" type="submit" id="search">Search</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-sm-6">
                                <button class="btn btn-outline-primary d-print-none" onclick="printFn()" id="print"><i class="fas fa-print"></i> Print</button>
                            </div>
                        </div>
                    </div>
                    <p class="mt-5 mb-3 text-muted text-center">Bricks � 2019</p>
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
        </script>

    </body>
</html>