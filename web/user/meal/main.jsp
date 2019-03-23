<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="../../resource/Icon.png" rel="icon" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
        <script src="../../bootstrap/js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.0/css/all.css" integrity="sha384-Mmxa0mLqhmOeaE8vgOSbKacftZcsNYDjQzuCOm6D02luYSzBG8vpaOykv9lFQ51Y" crossorigin="anonymous">

        <title>Bricks</title>

        <style>
            body{
                background-image: url(../../resource/bg.jpg);
                background-size: cover;
            }

            .mainContainer{
                max-width: 800px;
                max-height: 500px;
                margin: auto;
                padding-top: 10%;
            }

            .card{
                height: 300px;
            }

            .card-deck > a{
                color: black;
            }
            .card-deck > a:hover{
                color: black;
                text-decoration: none;
            }

            a{
                color: aliceblue;
            }

            a:hover{
                color: aliceblue;
            }

            ul > li > a:hover{
                text-decoration: underline;
            }


        </style>

    </head>

    <body class="text-center">

        <!--	Nav Bar-->
        <nav class="navbar navbar-expand-lg text-white">

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
                            <a class="nav-link" href="../account/coupon.jsp"><i class="fas fa-money-check-alt"></i> Coupon</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="main.jsp"><i class="fas fa-edit"></i> Order</a>
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


        <!--	Main Content-->
        <div class="mainContainer row">

            <div class="card-deck">
                <a href="category.jsp" class="card">
                    <div class="card-body">
                        <h5 class="card-title display-4">Single Meal</h5>
                        <p class="card-text">Pre-order single-day meal so you can have your lunch or breakfast on desired date and time without waitng for long queuing </p>
                    </div>
                </a>
                <a href="viewpackage.jsp" class="card">
                    <div class="card-body">
                        <h5 class="card-title display-4">Packages</h5>
                        <p class="card-text">Are you lazy to think what to eat during every meal time?? Then why don't just choose a meal packages from us! We provide various sets of meal packages and you can just order and pay per week or monthly!!</p>
                    </div>
                </a>
            </div>
        </div>



        <!--	Footer-->
        <footer class="fixed-bottom">
            <p class="text-muted">Cover template for <a href="#">Bricks</a>, by <a href="#">St. Freya University</a>.</p>
        </footer>


        <script src="../../bootstrap/js/jquery.min.js"></script>
        <script src="../../bootstrap/js/popper.min.js"></script>
        <script src="../../bootstrap/js/bootstrap.min.js"></script>

    </body>

</html>
