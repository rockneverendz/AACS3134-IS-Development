<!doctype html>
<html lang="en">
    <head>
        <%@include file="../layout/meta.html" %>
        <%@include file="../layout/css.html" %>
        <title>Staff | Top-up</title>
    </head>
    <body>
        <!-- Fixed-top Navs -->
        <%@include file="../layout/topnavbar.html" %>

        <div class="container-fluid">
            <div class="row">
                <%@include file="../layout/sidebar.html" %>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">

                    <!--        Reload Form-->
                    <div class="container mt-5 p-5" style="max-width: 420px; margin: auto;">
                        <form class="form-reload" >
                            <div class="text-center mb-5">
                                <h1>Top-up</h1>
                            </div>

                            <div class="row">
                                <label for="inputStudid">Student ID</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="inputStudid" placeholder="Student ID">
                                </div>
                            </div>
                            <br>

                            <div class="row">
                                <label for="inputEmail">Top-up Amount</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="inputAmount" placeholder="Top-up Amount">
                                </div>
                            </div>

                            <hr>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">Reload</button>
                            <p class="mt-5 mb-3 text-muted text-center">Bricks � 2019</p>
                        </form>
                    </div>
                </main>
            </div>
        </div>

        <%@include file="../layout/scripts.html" %>
    </body>
</html>