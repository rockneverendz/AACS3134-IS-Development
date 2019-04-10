<%@page import="java.text.SimpleDateFormat"%>
<%@page import="service.CustomerService"%>
<%@page import="entity.Reload"%>
<%@page import="java.util.List"%>
<!doctype html>
<html lang="en" style="position: relative; min-height: 100%;">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <title>Reload History</title>
        <style>
            a.dropdown-item:nth-of-type(3){
                color: #fff;
                text-decoration: none;
                background-color: #007bff;
            }

            html{
                background-color: #f8f9fa;
            }

            .table {
                margin-bottom: 0;
            }
            
            .table > thead > tr > th:first-child,
            .table > tbody > tr > td:first-child
            {
                padding-left: 2.25rem;
                text-align: center;
            }

            .table > thead > tr > th:last-child,
            .table > tbody > tr > td:last-child
            {                
                padding-right: 2.25rem;
            }

            .border-left-success {
                border-left: .25rem solid #1cc88a!important;
            }

            .border-left-primary {
                border-left: .25rem solid #4e73df!important;
            }

        </style>
    </head>
    <body style="margin-bottom: 60px;">
        <%@include file="../layout/navbar.jsp" %>
        <main role="main">

            <section class="text-center">
                <div class="container d-flex justify-content-between align-items-center">
                    <h1 class="display-2">Reload History</h1>
                    <a href="#" class="btn btn-primary my-2">Print
                        <i class="fas fa-print"></i>
                    </a>
                </div>
            </section>

            <div class="album py-5 bg-light">
                <div class="container">
                    <div class="container-fluid">
                        <div class="card shadow mb-4 w-100">
                            <div class="card-header py-3 d-flex">
                                <h6 class="my-auto text-primary">Reload Report</h6>
                                <div class="ml-auto">
                                    <form>
                                        <div class="input-group datepicker">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Year</span>
                                            </div>
                                            <input type="text" class="form-control" value="2019">
                                            <div class="input-group-append">
                                                <button class="btn btn-outline-success" type="submit" id="search">Search</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="card-body p-0">
                                <table class="table" width="100%" cellspacing="0" role="grid" style="width: 100%;">
                                    <thead class="thead-light">
                                        <tr role="row">
                                            <th rowspan="1" colspan="1" style="width: 12.5%;">Reload #</th>
                                            <th rowspan="1" colspan="1" style="width: 22.5%;">Date</th>
                                            <th rowspan="1" colspan="1" style="width: 22.5%;">Time</th>
                                            <th rowspan="1" colspan="1" style="width: 20%;">Staff</th>
                                            <th rowspan="1" colspan="1" style="width: 22.5%;">Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%                                                    //TODO Year Parameter
                                            //request.getAttribute("year");
                                            CustomerService cs = new CustomerService();
                                            customer = cs.findCustByID(customer.getCustId());
                                            List<Reload> list = customer.getReloadList();

                                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-YYYY");
                                            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

                                            double totalAmount = 0;
                                            for (Reload reload : list) {
                                        %>
                                        <tr role="row">
                                            <td><%= reload.getReloadId()%></td>
                                            <td><%= dateFormat.format(reload.getDate())%></td>
                                            <td><%= timeFormat.format(reload.getTime())%></td>
                                            <td><%= reload.getStaffId().getUsername()%></td>
                                            <td>RM <%= String.format("%.2f", reload.getAmount())%></td>
                                        </tr>
                                        <%
                                                totalAmount = totalAmount + reload.getAmount();
                                            }
                                        %>
                                    </tbody>
                                    <tfoot>
                                        <tr role="row" class="table-primary">
                                            <td colspan="4" class="text-right"><strong>Total</strong></td>
                                            <td>RM <%= String.format("%.2f", totalAmount)%></td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="../layout/footer.jsp" %>
        <%@include file="../layout/scripts.jsp" %>
        <link href="../../bootstrap/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../bootstrap/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <script>
            $('.datepicker input').datepicker({
                format: "yyyy",
                startView: 2,
                minViewMode: 2,
                maxViewMode: 2
            });
        </script>
    </body>
</html>
