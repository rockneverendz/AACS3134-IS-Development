<%@page import="entity.Staff"%>
<%@page import="entity.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.CategoryService"%>
<!doctype html>
<html lang="en">
    <head>
        <%@include file="../layout/meta.html" %>
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
        <form class="form-signup" action="signup" method="POST">
            <div class="text-center mb-4">
                <img class="img-fluid" src="../../resource/Logo1.png" alt="logo" width="75%"/>
                <h1 class="h3 mb-3 font-weight-normal">Create Staff Account</h1>
            </div>
            <%
                //If no object are recieved, create a new object.
                Staff staff = (Staff) request.getAttribute("staff");
                if (staff == null) {
                    staff = new Staff();
                    staff.setUserIdCard("");
                    staff.setUsername("");
                    staff.setEmail("");
                }

                String status = request.getParameter("status");
                String message;
                String type;
                if (status == null) {
                    message = "";
                } else {
                    char code = status.charAt(0);
                    if (code == 'U') {
                        type = "warning";
                        message = "Account with that User ID Card already exists.";
                    } else if (code == 'N') {
                        type = "warning";
                        message = "Account with that Username already exists.";
                    } else if (code == 'E') {
                        type = "warning";
                        message = "Account with that E-mail already exists.";
                    } else if (code == 'P') {
                        type = "warning";
                        message = "Retyped password does not match.";
                    } else if (code == 'C') {
                        type = "warning";
                        message = "A valid category has to be selected.";
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
                <input id="inputStaffID" name="StaffID" type="text" class="form-control" placeholder="Staff ID" required autofocus>
                <label for="inputStaffID">Staff ID</label>
            </div>
            <div class="form-label-group">
                <input id="inputStaffUsername" name="StaffUsername" type="text" class="form-control" placeholder="Staff Username" required autofocus>
                <label for="inputStaffUsername">Staff Username</label>
            </div>
            <div class="form-label-group">
                <input id="inputEmail" name="Email" type="email" class="form-control" placeholder="Email address" required>
                <label for="inputEmail">Email address</label>
            </div>
            <div class="form-label-group">
                <input id="inputPassword" name="Password" type="password" class="form-control" placeholder="Password"
                       pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required data-toggle="tooltip" data-placement="left"
                       title="At least 8 Alpanumeric characters with at least one uppercase and lowercase letter">
                <label for="inputPassword">Password</label>
            </div>
            <div class="form-label-group">
                <input id="inputConfirmPass" type="password" class="form-control" placeholder=" Confirm Password" required>
                <label for="inputConfirmPass">Confirm Password</label>
            </div>
            <div class="form-label-group">
                <select id="inputCategory" name="Category" required class="form-control">
                    <optgroup label="Category">
                        <option value="" disabled selected hidden>Category</option>
                        <%
                            CategoryService cs = new CategoryService();
                            for (Category category : cs.findAll()) {
                        %>
                        <option value="<%= category.getCategoryId()%>">
                            <%= category.getName()%>
                        </option>
                        <%  }
                        %>
                    </optgroup>
                </select>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Create Account</button>
            <a class="btn btn-lg btn-secondary btn-block" style="color: white;" href="./signin.jsp">Back to Sign-In</a>
            <p class="mt-5 mb-3 text-muted text-center">Bricks © 2019</p>
        </form>
        <%@include file="../layout/scripts.html" %>
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