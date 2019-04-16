<%@page import="entity.Meal"%>
<%@page import="entity.Ordermeal"%>
<%@page import="service.OrderService"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
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

        </style>
    </head>
    <body style="margin-bottom: 60px;">
        <%@include file="../layout/navbar.jsp" %>
        <main role="main">
            <section class="text-center d-print-none">
                <div class="container d-flex justify-content-between align-items-center">
                    <h1 class="display-2">Intake History</h1>
                    <button id="printBtn" class="btn btn-primary my-2">Print
                        <i class="fas fa-print"></i>
                    </button>
                </div>
            </section>

            <%  String dateString = request.getParameter("date");
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                Calendar cal = Calendar.getInstance();
                int[] totalCaloriesDays = new int[6];
                double[] totalExpensesDays = new double[6];
                Date[] days = new Date[7];
                Date date = new Date();
                double grandTotalExpense = 0;
                int grandTotalCalories = 0;

                if (dateString == null) {
                    cal.setTime(date);
                    cal.add(Calendar.DATE, -7);

                    // Remove time
                    cal.set(Calendar.HOUR_OF_DAY, 0);
                    cal.set(Calendar.MINUTE, 0);
                    cal.set(Calendar.SECOND, 0);
                    cal.set(Calendar.MILLISECOND, 0);

                } else {
                    cal.setTime(dateFormat.parse(dateString)); //Requested Date
                }

                cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
                System.out.println(cal.getTime());

                for (int i = 0; i < 6; i++) { //Get every date of the week into array
                    days[i] = cal.getTime();
                    cal.add(Calendar.DATE, 1);
                }

                OrderService os = new OrderService();
                List<Orderlist> list = os.findOrderByCustDateRange(customer.getCustId(), days[0], days[5]);
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
                                <div class="card-header py-3 d-flex">
                                    <h6 class="my-auto text-primary">Intake Report</h6>
                                    <div class="ml-auto">
                                        <form class="input-group d-print-none" action="./intake.jsp">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Week</span>
                                            </div>
                                            <input id="datepicker" name="date" type="text" class="form-control" value="<%= dateFormat.format(days[0])%>">
                                            <div class="input-group-append">
                                                <button class="btn btn-outline-success" type="submit" id="search">Search</button>
                                            </div>
                                        </form>
                                        <h6 class="my-auto text-info d-none d-print-block">Summary report of <%= dateFormat.format(days[0])%> generated on <%= date%></h6>
                                    </div>
                                </div>
                                <div class="card-body p-0">
                                    <table class="table table-hover w-100" cellspacing="0" role="grid">
                                        <thead class="thead-light">
                                            <tr role="row">
                                                <th colspan="1" style="width: 10%;"></th>
                                                <th colspan="2" style="width: 50%;">Date</th>
                                                <th colspan="1" style="width: 20%;">Expenses</th>
                                                <th colspan="1" style="width: 20%;">Calories</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Date groupByDate = new Date();
                                                int j = -1;
                                                for (int i = 0; i < list.size(); i++) {
                                                    Orderlist ol = list.get(i);
                                                    Ordermeal om = ol.getOrdermeal();
                                                    int calories = 0;
                                                    double expenses = 0;

                                                    if (!groupByDate.equals(ol.getCoupon().getRedeemDate())) {
                                                        groupByDate = ol.getCoupon().getRedeemDate();
                                                        j++;
                                            %>
                                            <tr role="row" class="ordermeal" data-prod-cat="<%= j%>">
                                                <td></td>
                                                <td colspan="2"><%= dateFormat.format(ol.getCoupon().getRedeemDate())%></td>
                                                <td id="totalExpenses<%= j%>"></td>
                                                <td id="totalCalories<%= j%>"></td>
                                            </tr>

                                            <tr role="row" class="table-secondary cat<%= j%>" style="display:none">
                                                <td style="font-weight: bold;">Order #</td>
                                                <th>Meal</th>
                                                <th>Quantity</th>
                                                <th>Price Each</th>
                                                <th>Calories</th>
                                            </tr>
                                            <%
                                                }
                                                Meal meal = ol.getMeal();
                                            %>
                                            <tr role="row" class="cat<%= j%>" style="display:none">
                                                <td><%= om.getOrderId()%></td>
                                                <td><%= meal.getName()%></td>
                                                <td><%= ol.getQuantity()%></td>
                                                <td><%= String.format("%.2f", ol.getPriceeach())%></td>
                                                <td><%= meal.getCalories()%></td>
                                            </tr>
                                            <%      // For Graph.js
                                                    // Find the difference between Day0 and the OrderDate,
                                                    // and the calories to the day.
                                                    long diff = ol.getCoupon().getRedeemDate().getTime() - days[0].getTime();
                                                    int daydiff = (int) TimeUnit.MILLISECONDS.toDays(diff);

                                                    calories += meal.getCalories();
                                                    expenses += ol.getPriceeach() * ol.getQuantity();
                                                    totalCaloriesDays[daydiff] += calories;
                                                    totalExpensesDays[daydiff] += expenses;

                                                    // Grand Total
                                                    grandTotalExpense += expenses;
                                                    grandTotalCalories += calories;
                                                }
                                            %>
                                        </tbody>
                                        <tfoot>
                                            <tr role="row" class="table-primary">
                                                <td colspan="3" class="text-right"><strong>Total</strong></td>
                                                <td><%= String.format("%.2f", grandTotalExpense)%> points</td>
                                                <td><%= grandTotalCalories%> kcal</td>
                                            </tr>
                                        </tfoot>
                                    </table>
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

            var labels = [
            <% dateFormat.applyPattern("dd-MM");%>
                '<%= dateFormat.format(days[0])%>',
                '<%= dateFormat.format(days[1])%>',
                '<%= dateFormat.format(days[2])%>',
                '<%= dateFormat.format(days[3])%>',
                '<%= dateFormat.format(days[4])%>',
                        '<%= dateFormat.format(days[5])%>'
            ];

            var dataCalories = [
            <%=totalCaloriesDays[0]%>,
            <%=totalCaloriesDays[1]%>,
            <%=totalCaloriesDays[2]%>,
            <%=totalCaloriesDays[3]%>,
            <%=totalCaloriesDays[4]%>,
            <%=totalCaloriesDays[5]%>
            ];

            var dataExpenses = [
            <%=String.format("'%.2f'", totalExpensesDays[0])%>,
            <%=String.format("'%.2f'", totalExpensesDays[1])%>,
            <%=String.format("'%.2f'", totalExpensesDays[2])%>,
            <%=String.format("'%.2f'", totalExpensesDays[3])%>,
            <%=String.format("'%.2f'", totalExpensesDays[4])%>,
            <%=String.format("'%.2f'", totalExpensesDays[5])%>
            ];

            var ctx = document.getElementById('myChart');
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                            label: 'Calories (kcal)',
                            data: dataCalories,
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

            <%
                int mean = grandTotalCalories / 6;
                int max = totalCaloriesDays[0];
                int min = totalCaloriesDays[0];

                for (int num : totalCaloriesDays) {
                    if (max < num) {
                        max = num;
                    }
                    if (num < min) {
                        min = num;
                    }
                }
            %>

            $(document).ready(function () {
                $(".ordermeal").click(function (e) {
                    e.preventDefault();
                    $('.cat' + $(this).attr('data-prod-cat')).toggle();
                });
                $("#printBtn").click(function () {
                    window.print();
                });

                for (var i = 0; i < 6; i++) {
                    $('#totalExpenses' + i).html(dataExpenses[i] + " points");
                    $('#totalCalories' + i).html(dataCalories[i] + " kcal");
                }

                $('#total').html("<%= grandTotalCalories%> kcal");
                $('#range').html("<%= min%> ~ <%= max%> kcal");
                $('#mean').html("<%= mean%> kcal");
            });

        </script>
    </body>
</html>
