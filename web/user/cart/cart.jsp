<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="entity.Coupon"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entity.Orderlist"%>
<%@page import="java.util.List"%>
<!doctype html>
<html lang="en" style="position: relative; min-height: 100%;">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap-datepicker3.min.css">
        <title>Bricks | Cart</title>
    </head>
    <body style="margin-bottom: 60px;">
        <%@include file="../layout/navbar.jsp" %>
        <main role="main">
            <div class="container" style="padding: 25px;">
                <h1>Your Cart</h1>
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th rowspan="1" colspan="1" style="width: 5%;">No.</th>
                            <th rowspan="1" colspan="1" style="width: 30%;">Food</th>
                            <th rowspan="1" colspan="1" style="width: 15%;">Date</th>
                            <th rowspan="1" colspan="1" style="width: 10%;">Time</th>
                            <th rowspan="1" colspan="1" style="width: 5%;">Quantity</th>
                            <th rowspan="1" colspan="1" style="width: 5%;"></th>
                            <th rowspan="1" colspan="1" style="width: 15%;">Price</th>
                            <th rowspan="1" colspan="1" style="width: 15%;">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  List<Orderlist> order = (List<Orderlist>) session.getAttribute("order");
                            Orderlist orderlist;
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

                            for (int i = 0; i < order.size(); i++) {
                                orderlist = order.get(i);
                                coupon = orderlist.getCouponId();

                                priceEach = orderlist.getPriceeach();
                                quantity = orderlist.getQuantity();
                                total = priceEach * quantity;
                                grandTotal += total;
                        %>
                        <tr>
                            <td id="row<%= i%>"><%= i + 1%></td>
                            <td><%= orderlist.getMeal().getName()%></td>
                            <td><%= dateFormat.format(coupon.getRedeemDate())%></td>
                            <td><%= coupon.getRedeemTime()%></td>
                            <td><%= orderlist.getQuantity()%></td>
                            <td>
                                <a href="#">
                                    <button type="button" class="btn btn-outline-info"
                                            data-toggle="modal" data-target="#orderModal"
                                            data-index="<%= i%>">
                                        <i class="fas fa-pencil-alt"></i>
                                    </button>
                                </a>
                            </td>
                            <td>RM <%= String.format("%.2f", priceEach)%></td>
                            <td><strong>RM <%= String.format("%.2f", total)%></strong></td>
                        </tr>
                        <%
                            }
                        %>
                        <tr scope="row">
                            <td colspan="7"><strong>Subtotal:</strong></td>
                            <td><strong>RM <%= String.format("%.2f", grandTotal)%></strong></td>
                        </tr>
                    </tbody>
                </table>

                <form>
                    <div class="row">
                        <div class="col-sm-5">
                            <label>Please select a <span class="font-weight-bold">Date</span> you which to redeem your meal </label>
                            <div class="input-group col-sm-6">
                                <div class="input-daterange input-group" id="datepicker">
                                    <input type="text" class="input-sm form-control" name="start" />
                                    <div class="input-group-append">
                                        <span class="input-group-text"><i class="far fa-calendar-alt"></i>  </span>                          
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="col-sm-6">
                            <label>Please select the <span class="font-weight-bold">Time</span> you which to redeem your meal </label>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="radio" class="form-check-input" name="optradio">Breakfast
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="radio" class="form-check-input" name="optradio">Lunch
                                </label>
                            </div>
                        </div>
                    </div>
                </form>

                <div id="checkoutBtn">
                    <a href="checkout.jsp">
                        <button class="btn btn-dark btn-lg float-right" type="submit" id="cekOut">Proceed to Checkout</button>
                    </a>
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
                            <form class="form-meal" action="../order/addMeal">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-6 form-label-group">
                                            <label for="mealName" class="col-form-label">Meal</label>
                                            <input id="mealId" name="mealId" type="text" hidden>
                                            <input id="mealName" type="text" class="form-control" disabled>
                                        </div>
                                        <div class="col-6 form-label-group">
                                            <label for="mealQty" class="col-form-label">Quantity</label>
                                            <input id="mealQty" name="mealQty" type="number" class="form-control" required>
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
        </main>
        <%@include file="../layout/footer.jsp" %>
        <%@include file="../layout/scripts.jsp" %>
        <script src="../../bootstrap/js/bootstrap-datepicker.min.js"></script>
        <script>
            $('#orderModal').on('show.bs.modal', function (event) {
                if (event.namespace === 'bs.modal') {
                    var button = $(event.relatedTarget); // Button that triggered the modal
                    var index = button.data('index');
                    $('#mealIndex').val(index);
                    $('#mealName').val($('#row' + index).next().html());
                    $('#mealDate').val($('#row' + index).next().next().html());
                    var mealTime = $('#row' + index).next().next().next().html();
                    $('#mealQty').val($('#row' + index).next().next().next().next().html());

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
                startDate: "<%= dateFormat.format(todayAdd2)%>",
                maxViewMode: 0,
                daysOfWeekDisabled: "0",
                todayHighlight: true
            });
        </script>

    </body>
</html>
