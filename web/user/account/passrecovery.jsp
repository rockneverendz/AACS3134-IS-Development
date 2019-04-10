<!doctype html>
<html lang="en" style="position: relative; min-height: 100%;">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <title>Password Recovery</title>
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

            .form-recovery {
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
        <form class="form-recovery" action="recovery">
            <div class="text-center mb-4">
                <img class="img-fluid" src="../../resource/Logo1.png" alt="logo" width="75%"/>
                <h1>Password Recovery</h1>
            </div>
            <%
                //If no object are recieved, create a new object.
                String idcard = (String) request.getAttribute("idcard");
                String email = (String) request.getAttribute("email");
                if (idcard == null) {
                    idcard = "";
                }
                if (email == null) {
                    email = "";
                }

                String status = request.getParameter("status");
                String message;
                String type;
                if (status == null) {
                    message = "";
                } else {
                    char code = status.charAt(0);
                    if (code == '0') {
                        type = "success";
                        message = "Success! Please check your email.";
                    } else if (code == 'U') {
                        type = "warning";
                        message = "Sorry, we couldn't find an account with that ID.";
                    } else if (code == 'E') {
                        type = "warning";
                        message = "Sorry, that email isn't right.";
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
            <div class="form-label-group">
                <input id="inputUserID" name="UserIDCard" type="text" class="form-control" 
                       placeholder="User ID Card" value="<%= idcard %>" required autofocus>
                <label for="inputUserID">User ID Card</label>
            </div>
            <div class="form-label-group">
                <input id="inputEmail" name="Email" type="email" class="form-control" 
                       placeholder="E-mail" value="<%= email%>" required autofocus>
                <label for="inputEmail">E-mail</label>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Proceed Password Recovery</button>
            <hr/>
            <a class="btn btn-lg btn-secondary btn-block" style="color: white;" href="./signin.jsp">Back to login</a>
            <p class="mt-5 mb-3 text-muted text-center">© 2019</p>
        </form>
    </body>
</html>
