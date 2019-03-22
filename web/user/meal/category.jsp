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

            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }

            .jumbotron {
                padding-top: 3rem;
                padding-bottom: 3rem;
                margin-bottom: 0;
                background-color: #fff;
            }
            @media (min-width: 768px) {
                .jumbotron {
                    padding-top: 6rem;
                    padding-bottom: 6rem;
                }
            }

            .jumbotron p:last-child {
                margin-bottom: 0;
            }

            .jumbotron-heading {
                font-weight: 300;
            }

            .jumbotron .container {
                max-width: 40rem;
            }

            footer > span > a{
                color: aliceblue;
            }

            footer > span :hover{
                color: aliceblue;
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
        <div class="container" style="padding: 25px;">
            <section class="jumbotron text-center">
                <div class="container">
                    <h1 class="jumbotron-heading">Category</h1>
                    <p class="lead text-muted">Please Select a Category.</p>

                </div>
            </section>
            <div class="row">
                <% for (int i = 0; i < 6; i++) {%>
                <a href="viewmeal.jsp" class="card bg-white text-dark col-sm-6">
                    <img src="..." class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <div class="display-4">Category</div>
                    </div>
                </a>
                <% } %>
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
