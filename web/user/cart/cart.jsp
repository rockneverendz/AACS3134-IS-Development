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
        <title>Order</title>
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
                    <h1 class="display-2">Order List</h1>
                </div>
            </section>
            <div class="album py-5 bg-light">
                <div class="container">
                    <div class="container-fluid">
                        <%  Orderlist orderlist;
                            Coupon coupon;
                            double priceEach;
                            int quantity;
                            double total;
                            double grandTotal = 0;

                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                            Date today = new Date();

                            Calendar calendar = Calendar.getInstance();
                            calendar.setTime(today);
                            calendar.add(Calendar.DATE, 2);
                            Date todayAdd2 = calendar.getTime();

                            if (order == null || order.isEmpty()) { // Cart is empty
                        %>
                        <p class="display-1 text-muted text-center" > Your cart is empty! :( </p>
                        <%
                        } else { // Cart is not empty
                        %>
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
                                            <th style="width: 5%;">Edit</th>
                                            <th style="width: 12.5%;">Price</th>
                                            <th style="width: 12.5%;">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%  for (int i = 0; i < order.size(); i++) {
                                                orderlist = order.get(i);
                                                coupon = orderlist.getCoupon();

                                                priceEach = orderlist.getPriceeach();
                                                quantity = orderlist.getQuantity();
                                                total = priceEach * quantity;
                                                grandTotal += total;
                                        %>
                                        <tr>
                                            <td id="row<%= i%>"><%= i + 1%></td>
                                            <td><%= orderlist.getMeal().getName()%></td>
                                            <td><%= quantity%></td>
                                            <td><%= dateFormat.format(coupon.getRedeemDate())%></td>
                                            <td><%= coupon.getRedeemTime()%></td>
                                            <td>
                                                <button type="button" class="btn btn-outline-info"
                                                        data-toggle="modal" data-target="#orderModal"
                                                        data-index="<%= i%>">
                                                    <i class="fas fa-pencil-alt"></i>
                                                </button>
                                            </td>
                                            <td><%= String.format("%.2f", priceEach)%></td>
                                            <td><strong><%= String.format("%.2f", total)%></strong></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                        <tr scope="row">
                                            <td colspan="7"><strong>Subtotal:</strong></td>
                                            <td><strong><%= String.format("%.2f", grandTotal)%></strong></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer">
                                <a href="checkout.jsp" class="btn btn-primary btn-lg float-right" 
                                   role="button">Proceed to Checkout</a>
                            </div>

                        </div>

                        <div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="orderModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="orderModalLabel">Order</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form class="form-meal" action="../order/updateMeal">
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-6 form-label-group">
                                                    <label for="mealName" class="col-form-label">Meal</label>
                                                    <input id="mealIndex" name="mealIndex" type="text" hidden>
                                                    <input id="mealName" type="text" class="form-control" disabled>
                                                </div>
                                                <div class="col-6 form-label-group">
                                                    <label for="mealQty" class="col-form-label">Quantity</label>
                                                    <input id="mealQty" name="mealQty" type="number" class="form-control" min="1" max="10" required>
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
                                            <a id="delbutton" class="mr-auto btn btn-danger" href="#" role="button">Remove Meal</a>
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary">Update Meal</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="../layout/footer.jsp" %>
        <%@include file="../layout/scripts.jsp" %>
        <script src="../../bootstrap/js/bootstrap-datepicker.min.js"></script>
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap-datepicker3.min.css">
        <script>
            $('#orderModal').on('show.bs.modal', function (event) {
                if (event.namespace === 'bs.modal') {
                    // Button that triggered the modal
                    var button = $(event.relatedTarget);
                    var index = button.data('index');
                    var dellink = "../order/removeMeal?mealIndex=";

                    // Get value from the table and then insert it into the Bootstrap's Modal
                    $('#mealIndex').val(index);
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

                    $('#delbutton').prop("href", dellink + index);
                }
            });

            $('#mealDate').datepicker({
                format: "dd-mm-yyyy",
                startDate: "<%= dateFormat.format(todayAdd2)%>",
                maxViewMode: 0,
                daysOfWeekDisabled: "0",
                todayHighlight: true
            });
        </script>
    </body>
</html>
