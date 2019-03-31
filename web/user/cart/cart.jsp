<!doctype html>
<html lang="en">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap-datepicker3.min.css">
        <title>Bricks | Cart</title>
        <style>

            footer > span > a{
                color: aliceblue;
            }

            footer > span :hover{
                color: aliceblue;
            }

        </style>
    </head>
    <body>
        <%@include file="../layout/navbar.jsp" %>
        <main role="main">
            <div class="container" style="padding: 25px;">


                <h1>Your Cart</h1>

                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th scope="col">No.</th>
                            <th scope="col">Food</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price</th>
                            <th scope="col">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < 5; i++) {%>
                        <tr>
                            <th scope="row"><%= i + 1%></th>
                            <td>    
                                Chicken Rice
                                <a href="#" class="float-right">
                                    <button class="btn btn-light" type="submit" id="bin" onclick="return window.confirm('Are you sure you want to delete this item?')"><i class="fas fa-trash-alt"></i></button>
                                </a>
                            </td>
                            <td>
                                <form action="UpdateItem" method="POST">
                                    <input type="hidden" name="indexNumber" value="<%= i%>" />

                                    <div class="input-group mb-3">
                                        <button class="btn btn-light" type="submit"  id="qty" ><i class="fas fa-minus"></i></button>
                                        <input type="text" name="qty"  step="1" min="1" max="15" value="1" autocomplete="off" style="width: 35px;" />
                                        <button class="btn btn-light" type="submit"  id="qty" ><i class="fas fa-plus"></i></button>
                                    </div>
                                </form>
                            </td>
                            <td>RM <%= i + 2%></td>
                            <td><strong>RM <%= i * 2%></strong></td>

                        </tr>
                        <% }%>

                        <tr scope="row">
                            <td colspan="4"><strong>Subtotal:</strong></td>
                            <td><strong>RM 9999.99</strong></td>
                        </tr>
                    </tbody>
                </table>

                <form >
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
            </div>
        </main>
        <%@include file="../layout/scripts.jsp" %>
        <script src="../../bootstrap/js/bootstrap-datepicker.min.js"></script>

        <script>
                                        $('#datepicker').datepicker({
                                            format: "dd/mm/yyyy",
                                            todayBtn: "linked",
                                            calendarWeeks: true,
                                            todayHighlight: true,
                                            daysOfWeekDisabled: [0],
                                        });

        </script>

    </body>
</html>
