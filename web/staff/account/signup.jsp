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
        <script src="../../bootstrap/js/bootstrap.bundle.min.js"></script>

        <title>Create Staff Account</title>
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

            .form-label-group > select,
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

            .form-label-group select::-webkit-input-placeholder {
                color: transparent;
            }

            .form-label-group select:-ms-input-placeholder {
                color: transparent;
            }

            .form-label-group select::-ms-input-placeholder {
                color: transparent;
            }

            .form-label-group select::-moz-placeholder {
                color: transparent;
            }

            .form-label-group select::placeholder {
                color: transparent;
            }

            .form-label-group select:not(:placeholder-shown) {
                padding-top: 1.25rem;
                padding-bottom: .25rem;
            }

            .form-label-group select:not(:placeholder-shown) ~ label {
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
        <form class="form-signup" >
            <div class="text-center mb-4">
                <img class="mb-4 img-fluid" src="../../resource/Logo1.png" alt="logo" width="80%">
                <h1 class="h3 mb-3 font-weight-normal">Create Staff Account</h1>
            </div>
            <div class="form-label-group">
                <input type="name" id="inputUsername" class="form-control" placeholder="Username" required autofocus>
                <label for="inputUsername">Username*</label>
            </div>
            <div class="form-label-group">
                <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required>
                <label for="inputEmail">Email address*</label>
            </div>
            <div class="form-label-group">
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" data-toggle="tooltip" data-placement="right" title="At least 8 Alpanumeric characters with at least one uppercase and lowercase letter" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required >
                <label for="inputPassword">Password*</label>
            </div>
            <div class="form-label-group">
                <input type="password" id="inputConfirmPass" class="form-control" placeholder=" Confirm Password" required>
                <label for="inputConfirmPass">Confirm Password*</label>
            </div>
            <div class="form-label-group input-group">
                <select class="custom-select" id="inputGroupSelect" data-toggle="tooltip" data-placement="right" title="Please select your category" required>
                    <option selected>Choose...</option>
                    <option value="1">Chicken Rice</option>
                    <option value="2">Masakan Malaysia</option>
                    <option value="3">Noodles</option>
                    <option value="4">IndoDeli</option>
                    <option value="5">Vegetarian Cuisine</option>
                </select>
                <label for="inputCategory">Category*</label>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Create New Account</button>
            <a href="signin.jsp" class="btn btn-lg btn-secondary btn-block" style="color: white;">Back to Sign in</a>
            <p class="mt-5 mb-3 text-muted text-center">Bricks © 2019</p>
        </form>

        
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script>
            var password = document.getElementById("inputPassword"),
                    confirm_password = document.getElementById("inputConfirmPass");

            function validatePassword() {
                if (password.value != confirm_password.value) {
                    confirm_password.setCustomValidity("Passwords Don't Match");
                } else {
                    confirm_password.setCustomValidity('');
                }
            }

            password.onchange = validatePassword;
            confirm_password.onkeyup = validatePassword;

            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
        </script>

    </body>
</html>