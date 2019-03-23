<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="../../resource/Icon.png" rel="icon" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap-datepicker3.min.css">
        <!-- Font Awsome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.0/css/all.css" integrity="sha384-Mmxa0mLqhmOeaE8vgOSbKacftZcsNYDjQzuCOm6D02luYSzBG8vpaOykv9lFQ51Y" crossorigin="anonymous">


        <title>Bricks | Cart</title>
        <style>

            footer > span > a{
                color: aliceblue;
            }

            footer > span :hover{
                color: aliceblue;
            }




        </style>

    </head>
    <body>
        <!--	Nav Bar-->
        <nav class="navbar navbar-dark bg-dark navbar-expand-lg">
            <div class="container">
                <a class="navbar-brand" href="#"><img src="../../resource/Logo3.png" alt="logo" width="150px"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">

                    <!-- Float Right use ml-auto-->
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="cart.jsp"><i class="fas fa-shopping-cart"></i> Cart</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../account/coupon.jsp"><i class="fas fa-money-check-alt"></i> Coupon</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../meal/main.jsp"><i class="fas fa-edit"></i> Order</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle dropdown-menu-left" href="#" id="navbardrop" data-toggle="dropdown"><i class="fas fa-user"></i> Account</a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <a class="btn dropdown-item" href="#" role="button"><i class="fas fa-edit"></i> Order List</a>
                                <a class="btn dropdown-item" href="#" role="button"><i class="fas fa-coins"></i> Reload List</a>
                                <a class="btn dropdown-item" href="#" role="button"><i class="fas fa-file-contract"></i> Intake List</a>
                                <div class="dropdown-divider"></div>
                                <a class="btn dropdown-item" href="#" role="button"><i class="fas fa-cog"></i> Settings</a>
                                <a class="btn dropdown-item" href="../account/signout" role="button"><i class="fas fa-sign-out-alt"></i> Sign Out</a>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


        <main role="main">
            <div class="container" style="padding: 25px;">


                <h1>Your Cart</h1>

                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th scope="col">No.</th>
                            <th scope="col">Food</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price</th>
                            <th scope="col">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < 5; i++) {%>
                        <tr>
                            <th scope="row"><%= i + 1%></th>
                            <td>    
                                Chicken Rice
                                <a href="#" class="float-right">
                                    <button class="btn btn-light" type="submit" id="bin" onclick="return window.confirm('Are you sure you want to delete this item?')"><i class="fas fa-trash-alt"></i></button>
                                </a>
                            </td>
                            <td>
                                <form action="UpdateItem" method="POST">
                                    <input type="hidden" name="indexNumber" value="<%= i%>" />

                                    <div class="input-group mb-3">
                                        <button class="btn btn-light" type="submit"  id="qty" ><i class="fas fa-minus"></i></button>
                                        <input type="text" name="qty"  step="1" min="1" max="15" value="1" autocomplete="off" style="width: 35px;" />
                                        <button class="btn btn-light" type="submit"  id="qty" ><i class="fas fa-plus"></i></button>
                                    </div>
                                </form>
                            </td>
                            <td>RM <%= i + 2%></td>
                            <td><strong>RM <%= i * 2%></strong></td>

                        </tr>
                        <% }%>

                        <tr scope="row">
                            <td colspan="4"><strong>Subtotal:</strong></td>
                            <td><strong>RM 9999.99</strong></td>
                        </tr>
                    </tbody>
                </table>

                <form >
                    <div class="row">
                        <div class="col-sm-5">
                            <label>Please select a <span class="font-weight-bold">Date</span> you which to redeem your meal </label>
                            <div class="input-group col-sm-6">
                                <div class="input-daterange input-group" id="datepicker">
                                    <input type="text" class="input-sm form-control" name="start" />
                                    <div class="input-group-append">
                                        <span class="input-group-text"><i class="far fa-calendar-alt"></i>  </span>                          
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="col-sm-6">
                            <label>Please select the <span class="font-weight-bold">Time</span> you which to redeem your meal </label>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="radio" class="form-check-input" name="optradio">Breakfast
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="radio" class="form-check-input" name="optradio">Lunch
                                </label>
                            </div>
                        </div>
                    </div>
                </form>


                <div id="checkoutBtn">
                    <a href="checkout.jsp">
                        <button class="btn btn-dark btn-lg float-right" type="submit" id="cekOut">Proceed to Checkout</button>
                    </a>
                </div>
            </div>
        </main>

        <!--	Footer-->
        <footer class="bg-dark text-center" style="margin-top: 100px; padding: 10px 10px;">
            <span class="text-muted">Cover template for <a href="#">Bricks</a>, by <a href="#">St. Freya University</a>.</span>
        </footer>
        <script src="../../bootstrap/js/jquery.min.js"></script>
        <script src="../../bootstrap/js/popper.min.js"></script>
        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <script src="../../bootstrap/js/bootstrap-datepicker.min.js"></script>

        <script>
                                        $('#datepicker').datepicker({
                                            format: "dd/mm/yyyy",
                                            todayBtn: "linked",
                                            calendarWeeks: true,
                                            todayHighlight: true,
                                            daysOfWeekDisabled: [0],
                                        });

        </script>

    </body>
</html>
