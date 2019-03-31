<!doctype html>
<html lang="en" style="position: relative; min-height: 100%;">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <title>Bricks | Cart</title>
    </head>
    <body style="margin-bottom: 60px;">
        <%@include file="../layout/navbar.jsp" %>
        <main role="main">
            <div class="container" style="padding: 25px;">


                <h1>Order summary</h1>

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
                            </td>
                            <td>
                                <%= i + 1%>
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
                    <div class="row font-weight-bold">
                        <div class="col-sm-4">
                            <label>Redeem Date:</label>
                            <div class="input-group col-sm-6">
                                <div class="input-daterange input-group" id="datepicker">
                                    <input type="text" class="input-sm form-control-plaintext" name="redeem_date" readonly value="dd/mm/yyyy"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-4 ">
                            <label>Redeem Time: </label>
                            <input type="text" class="input-sm form-control-plaintext" name="redeem_time" readonly value="Breakfast/Lunch"/>
                        </div>
                    </div>
                </form>

                <div id="checkoutBtn">
                    <a href="checkout.jsp">
                        <button class="btn btn-dark btn-lg float-right" type="submit" id="cekOut">Place Order</button>
                    </a>
                </div>
            </div>
        </main>
        <%@include file="../layout/scripts.jsp" %>
    </body>
</html>
