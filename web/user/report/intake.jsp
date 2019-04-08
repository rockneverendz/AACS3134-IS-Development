<%@page import="entity.Meal"%>
<%@page import="entity.Orderlist"%>
<%@page import="entity.Ordermeal"%>
<%@page import="service.OrderService"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<!doctype html>
<html lang="en" style="position: relative; min-height: 100%;">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <title>Intake History</title>
        <style>
            a.dropdown-item:nth-of-type(4){
                color: #fff;
                text-decoration: none;
                background-color: #007bff;
            }

            .table {
                margin-bottom: 0;
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

            .ordermeal {
                background-color: rgba(0,0,0,.05);
                cursor: pointer;
            }
            
        </style>
    </head>
    <body style="margin-bottom: 60px;">
        <%@include file="../layout/navbar.jsp" %>
        <main role="main">
            <section class="text-center">
                <div class="container d-flex justify-content-between align-items-center">
                    <h1 class="display-2">Intake History</h1>
                    <a href="#" class="btn btn-primary my-2">Print
                        <i class="fas fa-print"></i>
                    </a>
                </div>
            </section>

            <%  String dateString = request.getParameter("date");
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                Calendar cal = Calendar.getInstance();
                int[] totalcaloriesDays = new int[7];
                Date[] days = new Date[7];
                Date date = new Date();
                double grandTotalExpense = 0;
                int grandTotalCalories = 0;

                if (dateString == null) {
                    cal.setTime(date);
                    cal.add(Calendar.DATE, -7);
                } else {
                    cal.setTime(dateFormat.parse(dateString)); //Requested Date
                }

                cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);

                for (int i = 0; i < 6; i++) { //Get every date of the week into array
                    days[i] = cal.getTime();
                    cal.add(Calendar.DATE, 1);
                }

                OrderService os = new OrderService();
                List<Ordermeal> list = os.findOrderByCustDateRange(customer.getCustId(), days[0], days[5]);
                int[] totalCaloriesOrder = new int[list.size()];
            %>

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
                                                <div class="h5 mb-0 font-weight-bold" id="total"></div>
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
                                                <div class="h5 mb-0 font-weight-bold" id="mean"></div>
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
                                                <div class="h5 mb-0 font-weight-bold" id="range"></div>
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
                                    <h6 class="my-auto text-primary">Intake Report</h6>
                                    <div class="ml-auto">
                                        <form class="input-group" action="./intake.jsp">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Week</span>
                                            </div>
                                            <input id="datepicker" name="date" type="text" class="form-control" value="<%= dateFormat.format(days[0])%>">
                                            <div class="input-group-append">
                                                <button class="btn btn-outline-success" type="submit" id="search">Search</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="col-sm-12">
                                        <table class="table table-hover w-100" cellspacing="0" role="grid">
                                            <thead class="thead-light">
                                                <tr role="row">
                                                    <th rowspan="1" colspan="1" style="width: 10%;">Order #</th>
                                                    <th rowspan="1" colspan="2" style="width: 50%;">Date</th>
                                                    <th rowspan="1" colspan="1" style="width: 20%;">Expenses</th>
                                                    <th rowspan="1" colspan="1" style="width: 20%;">Calories</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (int i = 0; i < list.size(); i++) {
                                                        Ordermeal om = list.get(i);
                                                        int calories = 0;
                                                %>
                                                <tr role="row" class="ordermeal" data-prod-cat="<%= i%>">
                                                    <td><%= om.getOrderId()%></td>
                                                    <td colspan="2"><%= dateFormat.format(om.getPaymentId().getDate())%></td>
                                                    <td><%= om.getPaymentId().getAmount()%></td>
                                                    <td id="totalCalories<%= i%>"></td>
                                                </tr>

                                                <tr role="row" class="table-secondary cat<%= i%>" style="display:none">
                                                    <th rowspan="1" colspan="1"></th>
                                                    <th rowspan="1" colspan="1">Meal</th>
                                                    <th rowspan="1" colspan="1">Quantity</th>
                                                    <th rowspan="1" colspan="1">Price Each</th>
                                                    <th rowspan="1" colspan="1">Calories</th>
                                                </tr>
                                                <%
                                                    for (Orderlist ol : om.getOrderlistList()) {
                                                        Meal meal = ol.getMeal();
                                                        calories += meal.getCalories();
                                                %>
                                                <tr role="row" class="cat<%= i%>" style="display:none">
                                                    <td></td>
                                                    <td><%= meal.getName()%></td>
                                                    <td><%= ol.getQuantity()%></td>
                                                    <td><%= String.format("%.2f", ol.getPriceeach())%></td>
                                                    <td><%= meal.getCalories()%></td>
                                                </tr>
                                                <%
                                                        }
                                                        // inject to innerHTML later.
                                                        totalCaloriesOrder[i] = calories;

                                                        // For Graph.js
                                                        // Find the difference between Day0 and the OrderDate,
                                                        // and the calories to the day.
                                                        long diff = om.getPaymentId().getDate().getTime() - days[0].getTime();
                                                        int daydiff = (int) TimeUnit.MILLISECONDS.toDays(diff);
                                                        totalcaloriesDays[daydiff] += calories;

                                                        // Grand Total
                                                        grandTotalExpense += om.getPaymentId().getAmount();
                                                        grandTotalCalories += calories;
                                                    }
                                                %>
                                            </tbody>
                                            <tfoot>
                                                <tr role="row">
                                                    <td colspan="3"><strong>Total</strong></td>
                                                    <td><%= String.format("%.2f", grandTotalExpense)%></td>
                                                    <td><%= grandTotalCalories%></td>
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
            $('#datepicker').datepicker({
                format: "dd-mm-yyyy",
                endDate: "<%= dateFormat.format(date)%>",
                maxViewMode: 1,
                daysOfWeekDisabled: "0",
                daysOfWeekHighlighted: "1",
                todayHighlight: true
            });

            var ctx = document.getElementById('myChart');
            var labels = [
                '<%= dateFormat.format(days[0])%>',
                '<%= dateFormat.format(days[1])%>',
                '<%= dateFormat.format(days[2])%>',
                '<%= dateFormat.format(days[3])%>',
                '<%= dateFormat.format(days[4])%>',
                '<%= dateFormat.format(days[5])%>'
            ];
            var data = [
            <%=totalcaloriesDays[0]%>,
            <%=totalcaloriesDays[1]%>,
            <%=totalcaloriesDays[2]%>,
            <%=totalcaloriesDays[3]%>,
            <%=totalcaloriesDays[4]%>,
            <%=totalcaloriesDays[5]%>
            ];
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                            label: 'Calories (kcal)',
                            data: data,
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

            $(document).ready(function () {
                $(".ordermeal").click(function (e) {
                    e.preventDefault();
                    $('.cat' + $(this).attr('data-prod-cat')).toggle();
                });
            });

            // Fill out holes in the pages
            <%
                for (int i = 0; i < totalCaloriesOrder.length; i++) {
            %>
            $('#totalCalories<%= i%>').html(<%= totalCaloriesOrder[i]%>);
            <%
                }
                int mean = grandTotalCalories / 6;
                int max = totalcaloriesDays[1];
                int min = totalcaloriesDays[1];

                for (int num : totalcaloriesDays) {
                    if (max < num) {
                        max = num;
                    }
                    if (num < min) {
                        min = num;
                    }
                }
            %>

            $('#total').html("<%= grandTotalCalories%> kcal");
            $('#range').html("<%= min%> ~ <%= max%> kcal");
            $('#mean').html("<%= mean%> kcal");

        </script>
    </body>
</html>
