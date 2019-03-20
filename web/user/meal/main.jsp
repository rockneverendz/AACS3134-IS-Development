<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="../../resource/St._Freya_Emblem.png" rel="icon" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
        <script src="../../bootstrap/js/bootstrap.min.js"></script>

        <title>Bricks</title>
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

            /* Globals */
            /* Links */
            a,
            a:focus,
            a:hover {
                color: #fff;
            }

            /* Custom default button */
            .btn-secondary,
            .btn-secondary:hover,
            .btn-secondary:focus {
                color: #333;
                background-color: #fff;
                border: .05rem solid #fff;
            }
            
            .btn {
                text-shadow: none; /* Prevent inheritance from `body` */
            }
            
            .dropdown-divider {
                margin-left: 10%;
                margin-right: 10%;
            }

            /* Base structure */
            html,
            body {
                height: 100%;
                background-color: #333;
                background-image: url("../../resource/bg.jpg");
            }

            img[src="../../resource/bg.png"]{
                filter: brightness(50%);
            }

            body {
                display: -ms-flexbox;
                display: flex;
                color: #fff;
                text-shadow: 0 .05rem .1rem rgba(0, 0, 0, .5);
                box-shadow: inset 0 0 5rem rgba(0, 0, 0, .5);
            }

            .cover-container {
                max-width: 42em;
            }

            /* Header */
            .masthead {
                margin-bottom: 2rem;
            }

            .masthead-brand {
                margin-bottom: 0;
            }

            .nav-masthead .nav-link {
                padding: .25rem 0;
                font-weight: 700;
                color: rgba(255, 255, 255, .5);
                background-color: transparent;
                border-bottom: .25rem solid transparent;
            }

            .nav-masthead .nav-link:hover,
            .nav-masthead .nav-link:focus {
                border-bottom-color: rgba(255, 255, 255, .25);
            }

            .nav-masthead .nav-link + .btn-group {
                margin-left: 1rem;
            }

            .nav-masthead .active {
                color: #fff;
                border-bottom-color: #fff;
            }

            @media (min-width: 48em) {
                .masthead-brand {
                    float: left;
                }
                .nav-masthead {
                    float: right;
                }
            }

            /* Cover */
            .cover {
                padding: 0 1.5rem;
            }
            .cover .btn-lg {
                padding: .75rem 1.25rem;
                font-weight: 700;
            }

            /* Footer */
            .mastfoot {
                color: rgba(255, 255, 255, .5);
            }

        </style>
    </head>
    <body class="text-center">
        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
            <header class="masthead mb-auto">
                <div class="inner">
                    <h3 class="masthead-brand">Bricks</h3>
                    <nav class="nav nav-masthead justify-content-center">
                        <a class="nav-link active">Order</a>
                        <div class="btn-group" onclick="toggle()">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Account
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="btn dropdown-item" href="#" role="button">Order List</a>
                                <a class="btn dropdown-item" href="#" role="button">Reload List</a>
                                <a class="btn dropdown-item" href="#" role="button">Intake List</a>
                                <div class="dropdown-divider"></div>
                                <a class="btn dropdown-item" href="#" role="button">Settings</a>
                                <a class="btn dropdown-item" href="../account/signout" role="button">Sign Out</a>
                            </div>
                        </div>
                    </nav>
                </div>
            </header>

            <main role="main" class="inner cover">
                <h1 class="cover-heading">Cover your page.</h1>
                <p class="lead">Cover is a one-page template for building simple and beautiful home pages. Download, edit the text, and add your own fullscreen background photo to make it your own.</p>
                <p class="lead">
                    <a href="#" class="btn btn-lg btn-secondary">Learn more</a>
                </p>
            </main>

            <footer class="mastfoot mt-auto">
                <div class="inner">
                    <p>Cover template for <a href="https://getbootstrap.com/">Bootstrap</a>, by <a href="https://twitter.com/mdo">@mdo</a>.</p>
                </div>
            </footer>
        </div>
        <script src="../../bootstrap/js/jquery.min.js"></script>
        <script src="../../bootstrap/js/popper.min.js"></script>
        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <script>
                            $('.dropdown-toggle').dropdown();
                            
                            function toggle() {
                                $('.dropdown-toggle').dropdown('toggle');
                            }
        </script>
    </body>
</html>
