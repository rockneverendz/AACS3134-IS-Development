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
            .nav-item:nth-child(2) .nav-link { 
                color: #fff; /* Highlights the 2nd child (Order) of the nav-item */ 
            }

            .nav-item .dropdown-menu .dropdown-item i { 
                float: right; /* equal to the Bootstrap class 'float-right' */
                line-height:inherit; /* makes the icon float in the middle */
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
        <%@include file="../layout/navbar.html" %>
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
