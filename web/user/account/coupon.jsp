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
        <!--	Nav Bar-->
        <nav class="navbar navbar-dark bg-dark navbar-expand-lg">
            <div class="container">
                <a class="navbar-brand" href="#"><img src="../../resource/Logo3.png" alt="logo" width="150px"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">

                    <!-- Float Right use ml-auto-->
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="../cart/cart.jsp"><i class="fas fa-shopping-cart"></i> Cart</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="coupon.jsp"><i class="fas fa-money-check-alt"></i> Coupon</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../meal/main.jsp"><i class="fas fa-edit"></i> Order</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle dropdown-menu-left" href="#" id="navbardrop" data-toggle="dropdown"><i class="fas fa-user"></i> Account</a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <a class="btn dropdown-item" href="#" role="button"><i class="fas fa-edit"></i> Order List</a>
                                <a class="btn dropdown-item" href="#" role="button"><i class="fas fa-coins"></i> Reload List</a>
                                <a class="btn dropdown-item" href="#" role="button"><i class="fas fa-file-contract"></i> Intake List</a>
                                <div class="dropdown-divider"></div>
                                <a class="btn dropdown-item" href="#" role="button"><i class="fas fa-cog"></i> Settings</a>
                                <a class="btn dropdown-item" href="../account/signout" role="button"><i class="fas fa-sign-out-alt"></i> Sign Out</a>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

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
