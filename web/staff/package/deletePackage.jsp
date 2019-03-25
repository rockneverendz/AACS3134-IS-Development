<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="../../resource/Icon.png" rel="icon" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <!-- Font Awsome -->
        <script defer src="https://use.fontawesome.com/releases/v5.7.2/js/all.js" integrity="sha384-0pzryjIRos8mFBWMzSSZApWtPl/5++eIfzYmTgBBmXYdhvxPc+XcFEk+zJwDgWbP" crossorigin="anonymous"></script>

        <title>Staff | Manage Meals</title>

        <!--CSS-->
        <style>


            body {
                font-size: .875rem;
            }

            .feather {
                width: 16px;
                height: 16px;
                vertical-align: text-bottom;
            }

            /*
             * Sidebar
             */

            .sidebar {
                position: fixed;
                top: 0;
                bottom: 0;
                left: 0;
                z-index: 100; /* Behind the navbar */
                padding: 48px 0 0; /* Height of navbar */
                box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
            }

            .sidebar-sticky {
                position: relative;
                top: 0;
                height: calc(100vh - 48px);
                padding-top: .5rem;
                overflow-x: hidden;
                overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
            }

            @supports ((position: -webkit-sticky) or (position: sticky)) {
                .sidebar-sticky {
                    position: -webkit-sticky;
                    position: sticky;
                }
            }

            .sidebar .nav-link {
                font-weight: 500;
                color: #333;
            }

            .sidebar .nav-link .feather {
                margin-right: 4px;
                color: #999;
            }

            .sidebar .nav-link.active {
                color: #007bff;
            }

            .sidebar .nav-link:hover .feather,
            .sidebar .nav-link.active .feather {
                color: inherit;
            }

            .sidebar-heading {
                font-size: .75rem;
                text-transform: uppercase;
            }

            /*
             * Content
             */

            [role="main"] {
                padding-top: 133px; /* Space for fixed navbar */
            }

            @media (min-width: 768px) {
                [role="main"] {
                    padding-top: 48px; /* Space for fixed navbar */
                }
            }

            /*
             * Navbar
             */

            .navbar-brand {
                padding-top: .75rem;
                padding-bottom: .75rem;
            }



        </style>
    </head>

    <body>

        <!-- Fixed-top Navs -->
        <nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow navbar-expand-lg">
            <a class="navbar-brand pl-3" href="#"><img src="../../resource/Logo2.png" alt="logo" width="110px"></a>
            <div class="dropdown ml-auto">
                <a class="btn btn-dark dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user"></i> Account
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="../account/setting.jsp"><i class="fas fa-cog"></i> Settings</a>
                    <a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt"></i> Sign Out</a>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <!-- Fixed-Sidebar Navs -->
                <nav class="col-md-2 d-none d-md-block bg-light sidebar">
                    <div class="sidebar-sticky">
                        <ul class="nav flex-column pt-2">
                            <li class="nav-item">
                                <a class="nav-link">
                                    <h5><i class="fas fa-store"></i> Category</h5>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link ml-4 text-muted">
                                    Chicken Rice
                                </a>
                            </li>
                            <li class="nav-item mt-4">
                                <a class="nav-link">
                                    <h5><i class="fas fa-home"></i> Dashboard</h5>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../account/topup.jsp">
                                    <i class="fas fa-money-check-alt feather"></i> Top-Up and Reload
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="../meal/manageMeal.jsp">
                                    <i class="fas fa-hamburger feather"></i> Manage Meals
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../package/managePackage.jsp">
                                    <i class="fas fa-utensils feather"></i> Manage Packages
                                </a>
                            </li>
                        </ul>


                        <ul class="nav flex-column mb-2">
                            <li class="nav-item mt-4">
                                <a class="nav-link">
                                    <h5><i class="fas fa-chart-bar"></i> View Reports</h5>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../reports/transaction.jsp">
                                    <i class="fas fa-file-alt feather"></i> Transaction History
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../reports/orderlist.jsp">
                                    <i class="fas fa-file-alt feather"></i> Daily or Weekly Meals Ordered
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../reports/cancelledOrders.jsp">
                                    <i class="fas fa-file-alt feather"></i> Order Cancellations
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../reports/monthlyOrderlist.jsp">
                                    <i class="fas fa-file-alt feather"></i> Monthly Order List
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <div class="container mt-4">
                        <!--        Add New Meal Form-->
                        <div class="form-container col-md-9 mt-5" style="max-width: 800px; margin: auto;">
                            <form class="form-signup" >
                                <div class="mb-4">
                                    <h5 class="h1 mb-3">Delete This Meal?</h5>
                                </div>



                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputName">Name</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control-plaintext" id="inputName" placeholder="Name" readonly>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label for="inputDesc">Description</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control-plaintext" id="inputDesc" placeholder="Description" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputPrice">Price</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control-plaintext" id="inputPrice" placeholder="Price RM :" readonly>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label for="inputAvailability">Availability</label>
                                        <input type="text" class="form-control-plaintext" id="inputAvailability" placeholder="Available" readonly>

                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputIngred">Main Ingredient</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control-plaintext" id="inputIngred" placeholder="Ingredient" readonly>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label for="inputIngredQty">Ingredient Qty</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control-plaintext" id="inputIngredQty" placeholder="Quantity" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputCal">Calories</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control-plaintext" id="inputCal" placeholder="Calories" readonly>
                                        </div>
                                    </div>
                                    <!--                                    <div class="col">
                                                                            <label for="inputCal">Image</label>
                                                                            <div class="input-group">
                                                                                <div class="custom-file">
                                                                                    <input type="file" class="custom-file-input" id="inputGroupFile02">
                                                                                    <label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file</label>
                                                                                </div>
                                    
                                                                            </div>
                                                                        </div>-->
                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <label for="inputCategory">Category</label>
                                        <input type="text" class="form-control-plaintext" id="inputCategory" placeholder="Category" readonly>
                                    </div>
                                </div>
                                <hr>
                                <button class="btn btn-lg btn-primary btn-block" type="submit">Delete Meal</button>
                                <a href="manageMeal.jsp" class="btn btn-lg btn-secondary btn-block" style="color: white;">Back</a>
                            </form>
                        </div>

                    </div>
                    <p class="mt-5 mb-3 text-muted text-center">Bricks © 2019</p>



                </main>
            </div>
        </div>


        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>