<%@page import="entity.Coupon" %>
<%@page import="service.CouponService" %>
<!doctype html>
<html lang="en">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <%@include file="../layout/css.jsp" %>
        <title>Staff | Redeem Coupon</title>
    </head>
    <body>
        <!-- Fixed-top Navs -->
        <%@include file="../layout/topnavbar.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <%@include file="../layout/sidebar.jsp" %>
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">

                    <!-- Reload Form-->
                    <div class="container mt-5 p-5" style="max-width: 420px; margin: auto;">
                        <form action="redeemCoupon" method="get">
                            <div class="text-center mb-5">
                                <h1>Redeem Coupon</h1>
                            </div>
                            <%  String status = request.getParameter("status");
                                String message;
                                String type;
                                if (status == null) {
                                } else {
                                    char code = status.charAt(0);
                                    if (code == '1') {
                                        type = "success";
                                        message = "Coupon successfully redeemed!";
                                    } else if (code == 'R') {
                                        type = "warning";
                                        message = "This Coupon has been redeemed!";
                                    } else if (code == 'E') {
                                        type = "warning";
                                        message = "This Coupon has expired!";
                                    } else if (code == 'D') {
                                        type = "warning";
                                        message = "Invalid date for redeem the coupon!";
                                    } else if (code == 'O') {
                                        type = "warning";
                                        message = "Order already completed!";
                                    } else if (code == 'C') {
                                        type = "warning";
                                        message = "Order already canceled!";
                                    } else if (code == 'U') {
                                        type = "danger";
                                        message = "Coupon ID not found!";
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
                            <div class="row">
                                <label for="inputCoupon">Coupon</label>
                                <div class="input-group">
                                    <input name="couponid" type="text" class="form-control" id="inputCoupon" placeholder="Coupon ID" required>
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-form-label">Time</label>
                                <div class="btn-group btn-group-toggle btn-block">
                                    <label class="btn btn-outline-primary w-50">
                                        <input name="redeemTime" value="Breakfast" type="radio" required> Breakfast
                                    </label>
                                    <label class="btn btn-outline-primary w-50">
                                        <input name="redeemTime" value="Lunch" type="radio" required> Lunch
                                    </label>
                                </div>
                            </div>
                            <div class="row ">
                                <button class="btn btn-lg btn-primary btn-block mt-5" type="submit">Redeem</button>
                            </div>

                            <p class="mt-5 mb-3 text-muted text-center">Bricks <i class="far fa-copyright"></i> 2019</p>
                        </form>
                    </div>
                </main>
            </div>
        </div>

        <%@include file="../layout/scripts.jsp" %>
    </body>
</html>