<!doctype html>
<html lang="en">
    <head>
        <%@include file="../layout/meta.html" %>
        <title>Reload</title>
        <style>
            .dropdown-item:nth-child(6){
                color: #fff;
                text-decoration: none;
                background-color: #007bff;
            }

            .table {
                margin-bottom: 0;
            }

            footer {
                padding-top: 3rem;
                padding-bottom: 3rem;
            }

            footer p {
                margin-bottom: .25rem;
            }

            .border-left-success {
                border-left: .25rem solid #1cc88a!important;
            }

            .border-left-primary {
                border-left: .25rem solid #4e73df!important;
            }

        </style>
    </head>
    <body>
        <%@include file="../layout/navbar.html" %>
        <main role="main">

            <section class="text-center">
                <div class="container d-flex justify-content-between align-items-center">
                    <h1 class="display-2">Intake List</h1>
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
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Calories (Monthly)</div>
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
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Calories (Annual)</div>
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
                                    <h6 class="m-0 font-weight-bold text-primary">Intake Report</h6>
                                    <div class="ml-auto">
                                        <form>
                                            <div class="input-group datepicker">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Month</span>
                                                </div>
                                                <input type="text" class="form-control" value="03-2019">
                                                <div class="input-group-append">
                                                    <button class="btn btn-outline-success" type="submit" id="search">Search</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="card-body row">
                                    <div class="col-sm-12">
                                        <table class="table table-bordered" width="100%" cellspacing="0" role="grid" style="width: 100%;">
                                            <thead>
                                                <tr role="row">
                                                    <th rowspan="1" colspan="1" style="width: 5%;">No.</th>
                                                    <th rowspan="1" colspan="1" style="width: 15%;">Date</th>
                                                    <th rowspan="1" colspan="1" style="width: 10%;">Expenses </th>
                                                    <th rowspan="1" colspan="1" style="width: 10%;">Calories</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (int i = 1; i <= 26; i++) {
                                                %>
                                                <tr role="row">
                                                    <td><%= i%></td>
                                                    <td><%= i%>-3-2019</td>
                                                    <td><%= i * 2%> points</td>
                                                    <td><%= i * 40%></td>
                                                </tr>
                                                <%
                                                    }
                                                %>
                                            </tbody>
                                            <tfoot>
                                                <tr role="row">
                                                    <td></td>
                                                    <td><strong>Total</strong></td>
                                                    <td>9999 points</td>
                                                    <td>9999</td>
                                                </tr>
                                            </tfood>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>      
                </div>
            </div>
        </main>
        <%@include file="../layout/footer.html" %>
        <%@include file="../layout/scripts.html" %>
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
