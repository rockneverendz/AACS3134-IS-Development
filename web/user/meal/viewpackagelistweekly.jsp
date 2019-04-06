<%@page import="java.util.ArrayList"%>
<%@page import="entity.Packageist"%>
<%@page import="service.PackageService"%>
<%@page import="entity.Coupon"%>
<%@page import="entity.Orderlist"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<!doctype html>
<html lang="en" style="position: relative; min-height: 100%;">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <title>Package List</title>
        <style>
            html{
                background-color: #f8f9fa;
            }

            td, th {
                vertical-align: middle!important;
            }

            .table > thead > tr > th:first-child,
            .table > tbody > tr > td:first-child
            {
                padding-left: 2.25rem;
            }

            .table > thead > tr > th:nth-last-child(2),
            .table > tbody > tr > td:nth-last-child(2)
            {
                text-align: right;
            }

            .table > thead > tr > th:last-child,
            .table > tbody > tr > td:last-child
            {                
                padding-right: 2.25rem;
                text-align: right;
            }
        </style>
    </head>
    <body style="margin-bottom: 60px;">
        <%@include file="../layout/navbar.jsp" %>
        <main role="main">
            <section class="text-center">
                <div class="container d-flex justify-content-between align-items-center">
                    <h1 class="display-2">Package List - Weekly</h1>
                </div>
            </section>
            <div class="album py-5 bg-light">
                <div class="container">
                    <div class="container-fluid">
                        <div class="card shadow mb-4 w-100">
                            <div class="card-body p-0">
                                <table class="table table-hover">
                                    <thead class="thead-light">
                                        <tr>
                                            <th style="width: 5%;">#</th>
                                            <th style="width: 27.5%;">Food</th>
                                            <th style="width: 12.5%;">Quantity</th>
                                            <th style="width: 12.5%;">Date</th>
                                            <th style="width: 12.5%;">Time</th>
                                            <th style="width: 12.5%;">Price</th>
                                            <th style="width: 12.5%;">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%  String packageId = request.getParameter("packageId");

                                            // Check if there's a parameter
                                            if (packageId == null) {
                                                response.sendRedirect("../meal/main.jsp");
                                                return;
                                            }

                                            // Find the package
                                            PackageService ps = new PackageService();
                                            entity.Package packagee = ps.findPackageByID(Integer.parseInt(packageId));

                                            // Check if the package exists
                                            if (packagee == null) {
                                                response.sendRedirect("../meal/main.jsp");
                                                return;
                                            }

                                            // Initialize Variables
                                            List<Packageist> packageList = packagee.getPackageistList();
                                            String mealTime = packagee.getPackageTime();
                                            Packageist pl;
                                            double priceEach;
                                            int quantity;
                                            double total;
                                            double grandTotal = 0;

                                            // Get next week's monday
                                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                                            Calendar calendar = Calendar.getInstance();
                                            Date today = new Date();
                                            calendar.setTime(today);
                                            calendar.add(Calendar.DATE, 7);
                                            calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
                                            Date nextWeekMonday = calendar.getTime();

                                            // Loop the packagelist
                                            for (int i = 0; i < 6; i++) {
                                                pl = packageList.get(i);

                                                priceEach = pl.getPriceeach();
                                                quantity = pl.getQuantity();
                                                total = priceEach * quantity;
                                                grandTotal += total;
                                        %>
                                        <tr>
                                            <td><%= i + 1%></td>
                                            <td><%= pl.getMeal().getName()%></td>
                                            <td><%= quantity%></td>
                                            <td id="row<%= i + 1%>"></td>
                                            <td><%= mealTime%></td>
                                            <td><%= String.format("%.2f", priceEach)%></td>
                                            <td><strong><%= String.format("%.2f", total)%></strong></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                        <tr scope="row">
                                            <td colspan="6"><strong>Subtotal:</strong></td>
                                            <td><strong><%= String.format("%.2f", grandTotal)%></strong></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer">
                                <form class="form-row" action="./intake.jsp">
                                    <div class="input-group col-md-4">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Week</span>
                                        </div>
                                        <input id="datepicker" name="date" type="text" 
                                               class="form-control form-control-lg input-group-append" 
                                               value="<%= dateFormat.format(nextWeekMonday)%>">
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-lg offset-md-4 col-md-4">
                                        Proceed to Checkout</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="../layout/footer.jsp" %>
        <%@include file="../layout/scripts.jsp" %>
        <script src="../../bootstrap/js/moment.js" type="text/javascript"></script>
        <script src="../../bootstrap/js/bootstrap-datepicker.min.js"></script>
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap-datepicker3.min.css">
        <script>
            var date = moment("<%= dateFormat.format(nextWeekMonday)%>", "DD-MM-YYYY");
            date.add(-1, 'd');
            for (var i = 1; i <= 6; i++) {
                $('#row' + (i)).html(date.add(1, 'd').format("DD-MM-YYYY"));
            }

            $('#datepicker').datepicker({
                format: "dd-mm-yyyy",
                startDate: "<%= dateFormat.format(nextWeekMonday)%>",
                maxViewMode: 1,
                daysOfWeekDisabled: "0,2,3,4,5,6",
                daysOfWeekHighlighted: "1",
                todayHighlight: true
            }).on('changeDate', function (e) {
                date = moment($('#datepicker').val(), "DD-MM-YYYY");
                date.add(-1, 'd');
                for (var i = 1; i <= 6; i++) {
                    $('#row' + (i)).html(date.add(1, 'd').format("DD-MM-YYYY"));
                }
            });
        </script>
    </body>
</html>
