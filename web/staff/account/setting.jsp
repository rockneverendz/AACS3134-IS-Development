<!doctype html>
<html lang="en">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <title>Staff Portal</title>

        <!--CSS-->
        <%@include file="../layout/css.jsp" %>

    </head>

    <body>
        <!-- Fixed-top Navs -->
        <%@include file="../layout/topnavbar.jsp" %>

        <div class="container-fluid">
            <div class="row">
                <!-- Fixed-Sidebar Navs -->
                <%@include file="../layout/sidebar.jsp" %>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <!--        Settings Form-->
                    <div class="form-container col-md-9 mt-5" style="max-width: 800px; margin: auto;">
                        <form class="form-signup" >
                            <div class="text-center mb-4">
                                <h1 class="h1 mb-3">Settings</h1>
                            </div>

                            <div class="row mb-4">
                                <div class="col">
                                    <label for="inputUsername">Username</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="inputUsername" placeholder="Username">
                                    </div>
                                </div>
                                <div class="col">
                                    <label for="inputEmail">Email address</label>
                                    <div class="input-group">
                                        <input type="email" class="form-control" id="inputEmail" placeholder="Email address">
                                    </div>
                                </div>
                            </div>
                            <div class="row col-7 mb-4">
                                <label for="inputCategory">Category</label>
                                <div class="input-group">
                                    <select class="custom-select" id="inputGroupSelect" data-toggle="tooltip" data-placement="right" title="Please select your category">
                                        <option selected>Choose...</option>
                                        <option value="1">Chicken Rice</option>
                                        <option value="2">Masakan Malaysia</option>
                                        <option value="3">Noodles</option>
                                        <option value="4">IndoDeli</option>
                                        <option value="5">Vegetarian Cuisine</option>
                                    </select>
                                </div>
                            </div>
                            <hr>
                            <div class="row mb-4">
                                <div class="col">
                                    <label for="inputPassword">New Password</label>
                                    <div class="input-group">
                                        <input type="password" id="inputPassword" class="form-control" placeholder="Password" data-toggle="tooltip" data-placement="right" title="At least 8 Alpanumeric characters with at least one uppercase and lowercase letter" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required >
                                    </div>
                                </div>
                                <div class="col">
                                    <label for="inputPassword">Confirm Password</label>
                                    <div class="input-group">
                                        <input type="password" id="inputConfirmPass" class="form-control" placeholder=" Confirm Password" required>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row mb-4">
                                <div class="col">
                                    <label for="inputPassword">Current Password</label>
                                    <div class="input-group">
                                        <input type="password" id="inputPassword" class="form-control" placeholder="Password" data-toggle="tooltip" data-placement="right" title="Enter Current Password to save Settings" required >
                                    </div>
                                </div>
                            </div>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">Save Settings</button>
                            <a href="topup.jsp" class="btn btn-lg btn-secondary btn-block" style="color: white;">Back</a>
                            <p class="mt-5 mb-3 text-muted text-center">Bricks � 2019</p>
                        </form>
                    </div>
                </main>
            </div>
        </div>


        <%@include file="../layout/scripts.jsp" %>
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
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>

    </body>
</html>