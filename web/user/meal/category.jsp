<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="../../resource/Icon.png" rel="icon" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
        <script src="../../bootstrap/js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.0/css/all.css" integrity="sha384-Mmxa0mLqhmOeaE8vgOSbKacftZcsNYDjQzuCOm6D02luYSzBG8vpaOykv9lFQ51Y" crossorigin="anonymous">

        <title>Bricks | Category</title>

        <!--        CSS-->
        <style>
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
                            <a class="nav-link active" href="#"><i class="fas fa-edit"></i> Order</a>
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
        <div class="container">
            <h1 class="text-left" style="margin: 10px;">Please Select Food Stall...</h1>

            <div class="row">
                <a href="viewmeal.jsp" class="card bg-white text-dark col-sm-6">
                    <img src="..." class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <h1 class="display-4">Noodles</h1>
                    </div>
                </a>
                <a href="viewmeal.jsp" class="card bg-white text-dark col-sm-6">
                    <img src="..." class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <h1 class="display-4">Masakan Malaysia</h1>
                    </div>
                </a>
            </div>
            <div class="row">
                <a href="viewmeal.jsp" class="card bg-white text-dark col-sm-6">
                    <img src="..." class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <h1 class="display-4">Card title</h1>
                    </div>
                </a>
                <a href="viewmeal.jsp" class="card bg-white text-dark col-sm-6">
                    <img src="..." class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <h1 class="display-4">Card title</h1>
                    </div>
                </a>
            </div>
            <div class="row">
                <a href="viewmeal.jsp" class="card bg-white text-dark col-sm-6">
                    <img src="..." class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <h1 class="display-4">Card title</h1>
                    </div>
                </a>
                <a href="viewmeal.jsp" class="card bg-white text-dark col-sm-6">
                    <img src="..." class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <h1 class="display-4">Card title</h1>
                    </div>
                </a>
            </div>
        </div>
        
        <!--	Footer-->
        <footer class="footer bg-dark text-center" style="padding: 10px 10px;">
            <span class="text-muted">Cover template for <a href="#">Bricks</a>, by <a href="#">St. Freya University</a>.</span>
        </footer>
        <script src="../../bootstrap/js/jquery.min.js"></script>
        <script src="../../bootstrap/js/popper.min.js"></script>
        <script src="../../bootstrap/js/bootstrap.min.js"></script>

    </body>
</html>
