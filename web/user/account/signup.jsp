<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="St._Freya_Emblem.png" rel="icon" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
        
        <title>Create Account</title>
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

            html,
            body {
                height: 100%;
            }

            body {
                display: -ms-flexbox;
                display: flex;
                -ms-flex-align: center;
                align-items: center;
                padding-top: 40px;
                padding-bottom: 40px;
                background-color: #f5f5f5;
            }

            .form-signup {
                width: 100%;
                max-width: 420px;
                padding: 15px;
                margin: auto;
            }

            .form-label-group {
                position: relative;
                margin-bottom: 1rem;
            }

            .form-label-group > input,
            .form-label-group > label {
                height: 3.125rem;
                padding: .75rem;
            }

            .form-label-group > label {
                position: absolute;
                top: 0;
                left: 0;
                display: block;
                width: 100%;
                margin-bottom: 0; /* Override default `<label>` margin */
                line-height: 1.5;
                color: #495057;
                pointer-events: none;
                cursor: text; /* Match the input under the label */
                border: 1px solid transparent;
                border-radius: .25rem;
                transition: all .1s ease-in-out;
            }

            .form-label-group input::-webkit-input-placeholder {
                color: transparent;
            }

            .form-label-group input:-ms-input-placeholder {
                color: transparent;
            }

            .form-label-group input::-ms-input-placeholder {
                color: transparent;
            }

            .form-label-group input::-moz-placeholder {
                color: transparent;
            }

            .form-label-group input::placeholder {
                color: transparent;
            }

            .form-label-group input:not(:placeholder-shown) {
                padding-top: 1.25rem;
                padding-bottom: .25rem;
            }

            .form-label-group input:not(:placeholder-shown) ~ label {
                padding-top: .25rem;
                padding-bottom: .25rem;
                font-size: 12px;
                color: #777;
            }

            /* Fallback for Edge
            -------------------------------------------------- */
            @supports (-ms-ime-align: auto) {
                .form-label-group > label {
                    display: none;
                }
                .form-label-group input::-ms-input-placeholder {
                    color: #777;
                }
            }

            /* Fallback for IE
            -------------------------------------------------- */
            @media all and (-ms-high-contrast: none), (-ms-high-contrast: active) {
                .form-label-group > label {
                    display: none;
                }
                .form-label-group input:-ms-input-placeholder {
                    color: #777;
                }
            }
        </style>
    </head>

    <body>
        <form class="form-signup">           
            <div class="text-center mb-4">
                <img class="mb-4" src="../../resource/St._Freya_Emblem.png" alt="logo" width="100px">
                <h1 class="display-3">Create Account</h1>
            </div>
            <div class="form-label-group">
                <input id="inputUsername" type="text" class="form-control"  placeholder="Username" required autofocus>
                <label for="inputUsername">Username</label>
            </div>
            <div class="form-label-group">
                <input id="inputEmail" type="email" class="form-control" placeholder="E-mail" required>
                <label for="inputEmail">Email</label>
            </div>
            <div class="form-label-group">
                <input id="inputPassword" type="password" class="form-control" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required 
                       data-toggle="tooltip" data-placement="left" 
                       title="At least 8 Alpanumeric characters with at least one uppercase and lowercase letter">
                <label for="inputPassword">Password</label>
            </div>
            <div class="form-label-group">
                <input id="inputCPassword" type="password" class="form-control" placeholder="Re-type password" required>
                <label for="inputCPassword">Confirm Password</label>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Create Account</button>
            <a class="btn btn-lg btn-secondary btn-block" style="color: white;" href="./signin.jsp">Back to Sign-In</a>
            <p class="mt-5 mb-3 text-muted text-center">© 2019</p>
        </form>

        <script src="../../bootstrap/js/jquery.min.js"></script>
        <script src="../../bootstrap/js/popper.min.js"></script>
        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <script>
            var inputPassword = document.getElementById("inputPassword"),
                    inputCPassword = document.getElementById("inputCPassword");

            function validatePassword() {
                if (inputPassword.value !== inputCPassword.value) {
                    inputCPassword.setCustomValidity("Passwords Don't Match");
                } else {
                    inputCPassword.setCustomValidity('');
                }
            }

            inputPassword.onchange = validatePassword;
            inputCPassword.onkeyup = validatePassword;

            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </body>

</html>
