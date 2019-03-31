<!doctype html>
<html lang="en" style="position: relative; min-height: 100%;">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <title>Settings</title>
        <style>
            .dropdown-item:nth-child(8){
                color: #fff;
                text-decoration: none;
                background-color: #007bff;
            }

            html,body { 
                height:100%;
            }

            .container{
                height:90%;
                display:flex;
            }

            .form-settings{
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
        <%@include file="../layout/navbar.jsp" %>
        <!-- Main -->
        <div class="container">
            <form class="form-settings">
                <div class="text-center mb-4">
                    <h1 class="display-3">Settings</h1>
                </div>
                <div class="form-label-group">
                    <input id="inputNewPassword" name="NewPassword" type="password" class="form-control" placeholder="New Password" required>
                    <label for="inputNewPassword">New Password</label>
                </div>
                <div class="form-label-group">
                    <input id="inputNewCPassword" name="NewCPassword" type="password" class="form-control" placeholder="Confirm Password" required>
                    <label for="inputNewCPassword">Confirm Password</label>
                </div>
                <hr/>
                <div class="form-label-group">
                    <input id="inputCurrentPassword" name="CurrentPassword" type="password" class="form-control" placeholder="Current Password" required>
                    <label for="inputCurrentPassword">Current Password</label>
                    <p><small><a href="./passrecovery.jsp">Forget Password?</a></small></p>
                </div>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Change Password</button>
                <p class="mt-5 mb-3 text-muted text-center">Bricks � 2019</p>
            </form>
        </div>
        <%@include file="../layout/scripts.jsp" %>
    </body>
</html>
