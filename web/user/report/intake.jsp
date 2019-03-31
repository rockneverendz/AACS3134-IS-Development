<!doctype html>
<html lang="en">
    <head>
        <%@include file="../layout/meta.jsp" %>
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

            .border-left-primary {
                border-left: .25rem solid #4e73df!important;
            }
            
            .border-left-info {
                border-left: .25rem solid #17a2b8!important;
            }
            
            .border-left-success {
                border-left: .25rem solid #1cc88a!important;
            }
        </style>
    </head>
    <body>
        <%@include file="../layout/navbar.jsp" %>
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
                            <div class="col-12 mb-4" style="position: relative; height:300px">
                                <canvas class="col-12" id="myChart"></canvas>
                            </div>
                            <div class="col-4 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="h6 text-primary mb-2">Total Calories</div>
                                                <div class="h5 mb-0 font-weight-bold">40,000 kcal</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-fire fa-2x text-black-50"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-4 mb-4">
                                <div class="card border-left-info shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="h6 text-info mb-2">Mean Calories</div>
                                                <div class="h5 mb-0 font-weight-bold">6,666 kcal</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-divide fa-2x text-black-50"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-4 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="h6 text-success mb-2">Calories Range</div>
                                                <div class="h5 mb-0 font-weight-bold">190~20 kcal</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar-week fa-2x text-black-50"></i>
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
                                                    <td>9999 kcal</td>
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
        <%@include file="../layout/footer.jsp" %>
        <%@include file="../layout/scripts.jsp" %>
        <link href="../../bootstrap/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../bootstrap/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <link href="../../bootstrap/css/Chart.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../bootstrap/js/Chart.min.js" type="text/javascript"></script>
        <script>
            $('.datepicker input').datepicker({
                format: "mm-yyyy",
                startView: 1,
                minViewMode: 1,
                maxViewMode: 2
            });

            var ctx = document.getElementById('myChart');
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['21-3-19', '22-3-19', '23-3-19', '24-3-19', '25-3-19', '26-3-19'],
                    datasets: [{
                            label: 'Calories (kcal)',
                            data: [120, 190, 30, 50, 20, 30],
                            borderWidth: 3,
                            lineTension: 0.3,
                            backgroundColor: "rgba(78, 115, 223, 0.05)",
                            borderColor: "rgba(78, 115, 223, 1)",
                            pointRadius: 3,
                            pointBackgroundColor: "rgba(78, 115, 223, 1)",
                            pointBorderColor: "rgba(78, 115, 223, 1)",
                            pointHoverRadius: 3,
                            pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
                            pointHoverBorderColor: "rgba(78, 115, 223, 1)",
                            pointHitRadius: 10,
                            pointBorderWidth: 2
                        }]
                },
                options: {
                    maintainAspectRatio: false,
                    scales: {
                        xAxes: [{
                                gridLines: {
                                    display: false,
                                    drawBorder: false
                                },
                                ticks: {
                                    maxTicksLimit: 6
                                }
                            }],
                        yAxes: [{
                                ticks: {
                                    beginAtZero: true,
                                    maxTicksLimit: 5
                                },
                                gridLines: {
                                    color: "rgb(234, 236, 244)",
                                    zeroLineColor: "rgb(234, 236, 244)",
                                    drawBorder: false,
                                    borderDash: [2],
                                    zeroLineBorderDash: [2]
                                }
                            }]
                    },
                    legend: {
                        display: false
                    },
                    tooltips: {
                        backgroundColor: "rgb(255,255,255)",
                        bodyFontColor: "#858796",
                        titleMarginBottom: 10,
                        titleFontColor: '#6e707e',
                        titleFontSize: 14,
                        borderColor: '#dddfeb',
                        borderWidth: 1,
                        xPadding: 15,
                        yPadding: 15,
                        displayColors: false,
                        intersect: false,
                        mode: 'index',
                        caretPadding: 10
                    }
                }
            });
        </script>
    </body>
</html>
