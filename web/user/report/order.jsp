<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entity.Ordermeal"%>
<%@page import="javax.persistence.criteria.Order"%>
<%@page import="java.util.List"%>
<%@page import="service.CustomerService"%>
<!doctype html>
<html lang="en" style="position: relative; min-height: 100%;">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <title>Reload</title>
        <style>
            a.dropdown-item:nth-of-type(2){
                color: #fff;
                text-decoration: none;
                background-color: #007bff;
            }

            .table {
                margin-bottom: 0;
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
                    <h1 class="display-2">Order History</h1>
                    <a href="#" class="btn btn-primary my-2">Print
                        <i class="fas fa-print"></i>
                    </a>
                </div>
            </section>

            <div class="album py-5 bg-light">
                <div class="container">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Reloads (Monthly)</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Reloads (Annual)</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card shadow mb-4 w-100">
                                <div class="card-header py-3 d-flex mb-3">
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
                                <div class="card-body row">
                                    <div class="col-sm-12">
                                        <table class="table" width="100%" cellspacing="0" role="grid" style="width: 100%;">
                                            <thead class="thead-light">
                                                <tr role="row">
                                                    <th rowspan="1" colspan="1" style="width: 10%;">Order #</th>
                                                    <th rowspan="1" colspan="1" style="width: 25%;">Type</th>
                                                    <th rowspan="1" colspan="1" style="width: 25%;">Order Date</th>
                                                    <th rowspan="1" colspan="1" style="width: 20%;">Status</th>
                                                    <th rowspan="1" colspan="1" style="width: 20%;">Subtotal</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%  CustomerService cs = new CustomerService();
                                                    customer = cs.findCustByID(customer.getCustId());
                                                    List<Ordermeal> list = customer.getOrdermealList();

                                                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-YYYY");

                                                    double amount;
                                                    double totalAmount = 0;
                                                    for (Ordermeal order : list) {
                                                        amount = order.getPaymentId().getAmount();
                                                %>
                                                <tr role="row">
                                                    <td><%= order.getOrderId()%></td>
                                                    <td><%= order.getType()%></td>
                                                    <td><%= dateFormat.format(order.getPaymentId().getDate())%></td>
                                                    <td><%= order.getStatus()%></td>
                                                    <td>RM <%= String.format("%.2f", amount)%></td>
                                                </tr>
                                                <%
                                                        totalAmount = totalAmount + amount;
                                                    }
                                                %>
                                            </tbody>
                                            <tfoot>
                                                <tr role="row">
                                                    <td colspan="4"><strong>Total</strong></td>
                                                    <td>RM <%= String.format("%.2f", totalAmount)%></td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
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
                format: "mm-yyyy",
                startView: 1,
                minViewMode: 1,
                maxViewMode: 2
            });
        </script>
    </body>
</html>
