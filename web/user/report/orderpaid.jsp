<%@page import="service.CouponService"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="service.OrderService"%>
<%@page import="entity.Coupon"%>
<%@page import="entity.Orderlist"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entity.Ordermeal"%>
<%@page import="javax.persistence.criteria.Order"%>
<%@page import="java.util.List"%>
<%@page import="service.CustomerService"%>
<!doctype html>
<html lang="en" style="position: relative; min-height: 100%;">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <title>Order History</title>
        <style>
            a.dropdown-item:nth-of-type(2){
                color: #fff;
                text-decoration: none;
                background-color: #007bff;
            }

            html{
                background-color: #f8f9fa;
            }

            .table > tbody > tr > td, 
            .table > tbody > tr > th {
                vertical-align: middle!important;
            }

            .table > thead > tr > th:first-child,
            .table > tbody > tr > td:first-child{
                padding-left: 2.25rem;
                text-align: center;
            }

            .table > thead > tr > th:last-child,
            .table > tbody > tr > td:last-child{                
                padding-right: 2.25rem;
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
                    <h1 class="display-2">Order History</h1>
                    <div class="btn-group">
                        <a class="btn btn-secondary btn-lg active" href="#" role="button">Paid</a>
                        <a class="btn btn-secondary btn-lg" href="./ordercompleted.jsp" role="button">Completed</a>
                    </div>
                    <a href="#" class="btn btn-primary my-2">Print
                        <i class="fas fa-print"></i>
                    </a>
                </div>
            </section>

            <div class="album py-5 bg-light">
                <div class="container">
                    <div class="container-fluid">
                        <%  String status = request.getParameter("status");
                            String message;
                            String type;
                            if (status != null) {
                                char code = status.charAt(0);
                                if (code == '1') {
                                    type = "success";
                                    message = "Successfully Canceled Order!";
                                } else if (code == '2') {
                                    type = "success";
                                    message = "Successfully Updated Order!";
                                } else if (code == 'L') {
                                    type = "warning";
                                    message = "Order cannot be canceled less than 1 day before the meal order!";
                                } else if (code == 'U') {
                                    type = "warning";
                                    message = "Order cannot be updated less than 1 day before the meal order!";
                                } else {
                                    type = "danger";
                                    message = "An error has occured";
                                }
                        %>            
                        <div class="alert alert-<%= type%>" role="alert">
                            <%= message%>
                        </div>
                        <%
                            }
                        %>

                        <div class="calendar mb-4"></div>

                        <div class="card shadow mb-4 w-100">
                            <div class="card-body p-0">
                                <table class="table mb-0" width="100%" cellspacing="0" role="grid" style="width: 100%;">
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
                                        <%  OrderService os = new OrderService();
                                            List<Ordermeal> list = os.findOrderByCustPaid(customer.getCustId());

                                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-YYYY");
                                            SimpleDateFormat dateJS = new SimpleDateFormat("yyyy, MM-1, dd");
                                            StringBuilder stringBuilder = new StringBuilder();
                                            Date today = new Date();
                                            Date startDate;
                                            Date endDate;

                                            Calendar calendar = Calendar.getInstance();
                                            calendar.setTime(today);
                                            calendar.add(Calendar.DATE, 2);
                                            startDate = calendar.getTime();
                                            calendar.add(Calendar.MONTH, 2);
                                            endDate = calendar.getTime();

                                            for (int i = 0; i < list.size(); i++) {
                                                Ordermeal ordermeal = list.get(i);
                                        %>
                                        <tr role="row" class="ordermeal" data-prod-cat="<%= i%>">
                                            <td><%= ordermeal.getOrderId()%></td>
                                            <td><%= ordermeal.getType()%></td>
                                            <td><%= dateFormat.format(ordermeal.getPaymentId().getDate())%></td>
                                            <td><%= ordermeal.getStatus()%></td>
                                            <td>RM <%= String.format("%.2f", ordermeal.getPaymentId().getAmount())%></td>
                                        </tr>
                                        <tr role="row" class="table-secondary cat<%= i%>" style="display:none">
                                            <td>
                                                <a class="btn btn-outline-danger btn-sm" role="button"
                                                   href="../order/cancelOrder?orderId=<%= ordermeal.getOrderId()%>">
                                                    <i class="fas fa-trash"></i>
                                                </a>
                                            </td>
                                            <th>Meal</th>
                                            <th>Quantity</th>
                                            <th>Date</th>
                                            <th>Time</th>
                                        </tr>
                                        <%
                                            List<Orderlist> orderlistList = os.findOrderlistByOrderId(ordermeal.getOrderId());
                                            for (Orderlist ol : orderlistList) {
                                                Coupon coupon = ol.getCoupon();
                                        %>
                                        <tr role="row" class="cat<%= i%>" style="display:none">
                                            <td id="row<%= coupon.getCouponId()%>">
                                                <%
                                                    if (ordermeal.getType().equals("Single")) {
                                                %>
                                                <button type="button" class="btn btn-outline-info btn-sm"
                                                        data-toggle="modal" data-target="#orderModal"
                                                        data-couponid="<%= coupon.getCouponId()%>">
                                                    <i class="fas fa-pencil-alt"></i>
                                                </button>
                                                <%
                                                        stringBuilder.append(
                                                                "\n{"
                                                                + "name: " + ordermeal.getOrderId() + ","
                                                                + "type: '" + ordermeal.getType() + "',"
                                                                + "startDate: new Date(" + dateJS.format(coupon.getRedeemDate()) + "), "
                                                                + "endDate: new Date(" + dateJS.format(coupon.getRedeemDate()) + ")"
                                                                + "},");
                                                    }
                                                %>
                                            </td>
                                            <td><%= ol.getMeal().getName()%></td>
                                            <td><%= ol.getQuantity()%></td>
                                            <td><%= dateFormat.format(coupon.getRedeemDate())%></td>
                                            <td><%= coupon.getRedeemTime()%></td>
                                        </tr>
                                        <%
                                                }

                                                // If the order is 'monthly' or 'weekly', insert earliest and lastest date of the order.
                                                if (!ordermeal.getType().equals("Single")) {
                                                    stringBuilder.append(
                                                            "\n{"
                                                            + "name: " + ordermeal.getOrderId() + ","
                                                            + "type: '" + ordermeal.getType() + "',"
                                                            + "startDate: new Date(" + dateJS.format(orderlistList.get(0).getCoupon().getRedeemDate()) + "), "
                                                            + "endDate: new Date(" + dateJS.format(orderlistList.get(orderlistList.size() - 1).getCoupon().getRedeemDate()) + ")"
                                                            + "},");
                                                }
                                            }

                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="orderModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="orderModalLabel">Update Meal</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form class="form-meal" action="../order/updateOrder">
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-6 form-label-group">
                                                    <label for="mealName" class="col-form-label">Meal</label>
                                                    <input id="couponId" name="couponId" type="text" hidden>
                                                    <input id="mealName" type="text" class="form-control" disabled>
                                                </div>
                                                <div class="col-6 form-label-group">
                                                    <label for="mealQty" class="col-form-label">Quantity</label>
                                                    <input id="mealQty" type="number" class="form-control" disabled>
                                                </div>
                                                <div class="col-6 form-label-group">
                                                    <label for="mealDate" class="col-form-label">Date</label>
                                                    <input id="mealDate" name="mealDate" type="text" class="form-control" required>
                                                </div>
                                                <div class="col-6 form-label-group" data-toggle="buttons">
                                                    <label class="col-form-label">Time</label>
                                                    <div class="btn-group btn-group-toggle btn-block">
                                                        <label class="btn btn-outline-primary w-50">
                                                            <input id="mealTimeB" name="mealTime" value="Breakfast" type="radio" checked="false" required> Breakfast
                                                        </label>
                                                        <label class="btn btn-outline-primary w-50">
                                                            <input id="mealTimeL" name="mealTime" value="Lunch" type="radio" checked="false" required> Lunch
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary">Update Meal</button>
                                        </div>
                                    </form>
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
    <link href="../../bootstrap/css/bootstrap-year-calendar.css" rel="stylesheet" type="text/css"/>
    <script src="../../bootstrap/js/bootstrap-year-calendar.js" type="text/javascript"></script>
    <script>
        $('#orderModal').on('show.bs.modal', function (event) {
            if (event.namespace === 'bs.modal') {
                // Button that triggered the modal
                var button = $(event.relatedTarget);
                var index = button.data('couponid');

                // Get value from the table and then insert it into the Bootstrap's Modal
                $('#couponId').val(index);
                $('#mealName').val($('#row' + index).next().html());
                $('#mealQty').val($('#row' + index).next().next().html());
                $('#mealDate').val($('#row' + index).next().next().next().html());
                var mealTime = $('#row' + index).next().next().next().next().html();

                if (mealTime === "Breakfast")
                {
                    $("#mealTimeB").prop("checked", true);
                    $("#mealTimeB").parent().button('toggle');
                } else
                {
                    $("#mealTimeL").prop("checked", true);
                    $("#mealTimeL").parent().button('toggle');
                }
            }
        });

        $('#mealDate').datepicker({
            format: "dd-mm-yyyy",
            startDate: "<%= dateFormat.format(startDate)%>",
            endDate: "<%= dateFormat.format(endDate)%>",
            maxViewMode: 0,
            daysOfWeekDisabled: "0",
            todayHighlight: true
        });

        $(document).ready(function () {
            $(".ordermeal").click(function (e) {
                e.preventDefault();
                $('.cat' + $(this).attr('data-prod-cat')).toggle();
            });
            $('.calendar').calendar({
                mouseOnDay: function (e) {
                    if (e.events.length > 0) {
                        var content = '';

                        for (var i in e.events) {
                            content += '<div class="event-tooltip-content">'
                                    + '<div class="event-name"> Order #' + e.events[i].name + ' : ' + e.events[i].type + '</div>'
                                    + '</div>';
                        }

                        $(e.element).popover({
                            trigger: 'manual',
                            container: 'body',
                            html: true,
                            content: content
                        });

                        $(e.element).popover('show');
                    }
                },
                mouseOutDay: function (e) {
                    if (e.events.length > 0) {
                        $(e.element).popover('hide');
                    }
                },
                dataSource: [
        <%= stringBuilder.toString()%>
                ]
            });
        });

    </script>
</body>
</html>
