<!doctype html>
<html lang="en">
    <head>
        <%@include file="../layout/meta.html" %>
        <title>Bricks | Packages</title>
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

        </style>
    </head>
    <body>
        <%@include file="../layout/navbar.html" %>
        <main role="main">

            <section class="jumbotron text-center">
                <div class="container">
                    <h1 class="jumbotron-heading">Packages</h1>
                    <p class="lead text-muted">Are you lazy to think what to eat during every meal time??<br>
                        Then why don't just choose a meal packages from us!<br>
                        We provide various sets of meal packages and you can just order and pay per week or monthly!!</p>

                </div>
            </section>

            <div class="album py-5 bg-light">
                <div class="container">
                    <div class="row">
                        <%
                            for (int i = 0; i < 6; i++) {
                        %>
                        <div class="col-md-4">
                            <div class="card mb-4 shadow-sm">
                                <img src="..." class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">Cras justo odio</li>
                                    <li class="list-group-item">Dapibus ac facilisis in</li>
                                    <li class="list-group-item">Vestibulum at eros</li>
                                </ul>
                                <div class="card-body">
                                    <a href="#" class="btn btn-dark float-right">Order</a>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="../layout/footer.html" %>
        <%@include file="../layout/scripts.html" %>
    </body>
</html>
