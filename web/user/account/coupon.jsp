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
        <title>Bricks | Coupon</title>
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

                <h1>Coupon</h1><br>
                <div class="row">

                    <% for (int i = 0; i < 10; i++) {%>
                    <div class="card col-sm-6">
                        <div class="card-body">
                            <h5 class="card-title">Coupon Number : <%= i + 10000%></h5>
                            <div class="row">
                                <p class="card-text col-6">Meal : Chicken Rice <br>Price : RM 5.00 <br>Food Stall : Chicken Rice <br>Redeem Date & Time : dd/mm/yyyy Lunch</p>
                                <p class="card-text col-6">Qty : 1 <br>Type : Single Day<br>Barcode : <span class="barcode" ><i class="fas fa-barcode"></i></span></p>
                            </div>
                        </div>
                    </div>
                    <% }%>

                </div>
            </div>
        </main>

        <!--	Footer-->
        <footer class="bg-dark text-center" style="margin-top: 100px; padding: 10px 10px;">
            <span class="text-muted">Cover template for <a href="#">Bricks</a>, by <a href="#">St. Freya University</a>.</span>
        </footer>
        <script src="../../bootstrap/js/jquery.min.js"></script>
        <script src="../../bootstrap/js/popper.min.js"></script>
        <script src="../../bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
