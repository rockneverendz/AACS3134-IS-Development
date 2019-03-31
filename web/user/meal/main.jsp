<!doctype html>
<html lang="en">

    <head>
        <%@include file="../layout/meta.jsp" %>
        <title>Bricks</title>
        <style>
            body{
                background-image: url(../../resource/bg.jpg);
                background-size: cover;
            }
            
            .bg-dark {
                background-color: unset!important;
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

        <%@include file="../layout/navbar.jsp" %>
        <!-- Main Content -->
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
        <footer class="fixed-bottom">
            <p class="text-muted">Cover template for <a href="#">Bricks</a>, by <a href="#">St. Freya University</a>.</p>
        </footer>
        <%@include file="../layout/scripts.jsp" %>
    </body>

</html>
