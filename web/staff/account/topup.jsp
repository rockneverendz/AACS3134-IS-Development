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
                                    } else if (code == 'U') {
                                        type = "warning";
                                        message = "Student ID not found !";
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
                            <label for="inputStudid">Student ID</label>
                            <div class="input-group">
                                <input name="studid" type="text" class="form-control" id="inputStudid" placeholder="Student ID" required>
                            </div>
                            <br>
                            <label for="inputEmail">Top-up Amount</label>
                            <div class="input-group">
                                <select name="amount" class="custom-select" id="inputAmount" placeholder="Top-up Amount" required>
                                    <option value="" selected="" disabled="">Choose...</option>
                                    <option value="5">5</option>
                                    <option value="10">10</option>
                                    <option value="15">15</option>
                                    <option value="30">30</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                    <option value="500">500</option>
                                </select>
                            </div>
                            <input name="staffid" type="text" class="form-control" id="inputStaffid" 
                                   placeholder="Staff ID" value="<%= staff.getStaffId()%>" hidden>
                            <hr>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">Reload</button>
                            <p class="mt-5 mb-3 text-muted text-center">Bricks &copy; 2019</p>
                        </form>
                    </div>
                </main>
            </div>
        </div>

        <%@include file="../layout/scripts.jsp" %>
    </body>
</html>