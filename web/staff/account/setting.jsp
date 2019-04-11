
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
                    <div class="form-container col-md-9 mt-5" style="max-width: 700px; margin: auto;">
                        <form action="setting" method="get" >
                            <div class="text-center mb-4">
                                <h1 class="h1 mb-3">Settings</h1>
                            </div>
                            <%                                String status = request.getParameter("status");
                                String message;
                                String type;
                                if (status == null) {
                                    staff = (Staff) session.getAttribute("staff");
                                } else {
                                    char code = status.charAt(0);
                                    if (code == '1') {
                                        type = "success";
                                        message = "Settings Saved Successfully !";
                                    } else if (code == 'U') {
                                        type = "warning";
                                        message = "An error has occured when saving your settings !";
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
                            <div class="input-group">
                                <input name="staffid" type="text" class="form-control " id="inputStaffId" value="<%= staff.getStaffId()%>" hidden>
                            </div>
                            <div class="row col-6 mb-4">
                                <label for="inputCategory">Category</label>
                                <div class="input-group">
                                    <input name="category" type="text" class="form-control " id="inputCategory" value="<%= cat.getName()%>" disabled>
                                </div>
                            </div>
                            <div class="row mb-5">
                                <div class="col">
                                    <label for="inputUsername">Username</label>
                                    <div class="input-group">
                                        <input name="username" type="text" class="form-control" id="inputUsername" value="<%= staff.getUsername()%>" required>
                                    </div>
                                </div>
                                <div class="col">
                                    <label for="inputEmail">Email address</label>
                                    <div class="input-group">
                                        <input name="email" type="email" class="form-control" id="inputEmail" pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" value="<%= staff.getEmail()%>" required>
                                    </div>
                                </div>
                            </div>




                            <button class="btn btn-lg btn-primary btn-block mb-3" type="submit">Save Settings</button>
                        </form>

                        <hr>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <form action="changePassword" method="post">
                                        <div class="input-group">
                                            <input name="staffid" type="text" class="form-control " id="inputStaffId" value="<%= staff.getStaffId()%>" hidden>
                                        </div>
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLongTitle">Change Password</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row mb-4">
                                                <div class="col">
                                                    <label for="inputPassword">New Password</label>
                                                    <div class="input-group">
                                                        <input name="newPass" type="password" id="inputPassword" class="form-control" placeholder="Password" data-toggle="tooltip" data-placement="right" title="At least 8 Alpanumeric characters with at least one uppercase and lowercase letter" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required >
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <label for="inputPassword">Confirm Password</label>
                                                    <div class="input-group">
                                                        <input name="confirmPass" type="password" id="inputConfirmPass" class="form-control" placeholder=" Confirm Password" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row mb-4">
                                                <div class="col">
                                                    <label for="inputPassword">Current Password</label>
                                                    <div class="input-group">
                                                        <input name="currentPass" type="password" id="inputPassword" class="form-control" placeholder="Password" data-toggle="tooltip" data-placement="right" title="Enter Current Password to save Settings" required >
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!-- Button trigger modal -->
                        <button class="btn btn-lg btn-outline-danger btn-block" data-toggle="modal" data-target="#exampleModalCenter">Change Password</button>
                        <p class="mt-5 mb-3 text-muted text-center">Bricks &copy; 2019</p>

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