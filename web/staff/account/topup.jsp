<!doctype html>
<html lang="en">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <%@include file="../layout/css.jsp" %>
        <title>Staff | Top-up</title>
    </head>
    <body>
        <!-- Fixed-top Navs -->
        <%@include file="../layout/topnavbar.jsp" %>

        <div class="container-fluid">
            <div class="row">
                <%@include file="../layout/sidebar.jsp" %>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">

                    <!--        Reload Form-->
                    <div class="container mt-5 p-5" style="max-width: 420px; margin: auto;">
                        <form class="form-reload" action="topup" method="post">
                            <div class="text-center mb-5">
                                <h1>Top-up</h1>
                            </div>
                            <%  String status = request.getParameter("status");
                                String message;
                                String type;
                                if (status == null) {
                                } else {
                                    char code = status.charAt(0);
                                    if (code == '1') {
                                        type = "success";
                                        message = "Top-up Successfully !";
                                    } else if(code == 'U') {
                                        type = "warning";
                                        message = "Student ID not found !";
                                    }else {
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
                            <div class="row">
                                <label for="inputStudid">Student ID</label>
                                <div class="input-group">
                                    <input name="studid" type="text" class="form-control" id="inputStudid" placeholder="Student ID" required>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <label for="inputEmail">Top-up Amount</label>
                                <div class="input-group">
                                    <input name="amount" type="number" class="form-control" id="inputAmount" placeholder="Top-up Amount" required>
                                </div>
                            </div>
                            <div class="row" hidden>
                                <label for="inputStaffID">Staff ID</label>
                                <div class="input-group">
                                    <input name="staffid" type="text" class="form-control" id="inputStaffid" placeholder="Staff ID" value="<%= staff.getStaffId() %>">
                                </div>
                            </div>
                            <hr>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">Reload</button>
                            <p class="mt-5 mb-3 text-muted text-center">Bricks © 2019</p>
                        </form>
                    </div>
                </main>
            </div>
        </div>

        <%@include file="../layout/scripts.jsp" %>
    </body>
</html>