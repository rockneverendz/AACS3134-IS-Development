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

                    <!--        Reload Form-->
                    <div class="container mt-5 p-5" style="max-width: 420px; margin: auto;">
                        <form class="form-reload" >
                            <div class="text-center mb-5">
                                <h1>Redeem Coupon</h1>
                            </div>

                            <div class="row">
                                <label for="inputCoupon">Coupon</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="inputCoupon" placeholder="Coupon ID">
                                </div>
                            </div>
                            <div class="row ">
                                <button class="btn btn-lg btn-primary btn-block mt-5" type="submit">Redeem</button>
                            </div>

                            <p class="mt-5 mb-3 text-muted text-center">Bricks � 2019</p>
                        </form>
                    </div>
                </main>
            </div>
        </div>

        <%@include file="../layout/scripts.jsp" %>
    </body>
</html>