<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="../../resource/Icon.png" rel="icon" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">


        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.0/css/all.css" integrity="sha384-Mmxa0mLqhmOeaE8vgOSbKacftZcsNYDjQzuCOm6D02luYSzBG8vpaOykv9lFQ51Y" crossorigin="anonymous">


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
        <%@include file="../layout/navbar.html" %>
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
        <%@include file="../layout/scripts.html" %>
    </body>
</html>
