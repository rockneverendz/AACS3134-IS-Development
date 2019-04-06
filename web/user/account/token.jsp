<%@page import="entity.Customer"%>
<%@page import="service.CustomerService"%>
<%@page import="entity.Token"%>
<%@page import="service.TokenService"%>
<!doctype html>
<html lang="en" style="position: relative; min-height: 100%;">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <title>Token</title>
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

            .h1, h1 {
                font-weight: 300;
                line-height: 1.2;
            }

            .form-token {
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

    <body style="margin-bottom: 60px;">
        <form class="form-token" action="token">
            <div class="text-center mb-4">
                <img class="img-fluid" src="../../resource/Logo1.png" alt="logo" width="75%"/>
                <h1>Password Recovery</h1>
            </div>
            <%
                // If no token are recieved, redirect.
                String tokenS = request.getParameter("token");
                if (tokenS == null) {
                    response.sendRedirect("../account/signin.jsp?status=X");
                    return;
                }

                // Find token
                TokenService ts = new TokenService();
                Token token = ts.findTokenByToken(tokenS);

                // If Token not found
                if (token == null) {
                    response.sendRedirect("../account/signin.jsp?status=T");
                    return;
                }

                String status = request.getParameter("status");
                String message;
                String type;
                if (status != null) {
                    char code = status.charAt(0);
                    if (code == 'P') {
                        type = "warning";
                        message = "Retyped password does not match.";
                    } else {
                        type = "danger";
                        message = "An error has occured";
                    }
            %>            
            <div class="alert alert-<%= type%>" role="alert">
                <%= message%>
            </div>
            <%
                }
            %>
            <input name="token" type="text" hidden value="<%= tokenS%>"> 
            <div class="form-label-group">
                <input id="inputNewPassword" name="NewPassword" type="password" class="form-control" 
                       placeholder="New Password" required data-toggle="tooltip" data-placement="left" 
                       title="At least 8 Alpanumeric characters with at least one uppercase and lowercase letter"
                       pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                <label for="inputNewPassword">New Password</label>
            </div>
            <div class="form-label-group">
                <input id="inputNewCPassword" name="NewCPassword" type="password" class="form-control" 
                       placeholder="Confirm Password" required data-toggle="tooltip" data-placement="left" 
                       title="At least 8 Alpanumeric characters with at least one uppercase and lowercase letter"
                       pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                <label for="inputNewCPassword">Confirm Password</label>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Change Password</button>
            <p class="mt-5 mb-3 text-muted text-center">© 2019</p>
        </form>
        <%@include file="../layout/scripts.jsp" %>
        <script>
            var inputPassword = document.getElementById("inputNewPassword"),
                    inputCPassword = document.getElementById("inputNewCPassword");

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
