<nav class="navbar navbar-dark bg-dark navbar-expand-lg">
    <div class="container">
        <a href="../meal/main.jsp">
            <img src="../../resource/Logo3.png" alt="logo" width="150px">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="../cart/cart.jsp"><i class="fas fa-shopping-cart"></i> Cart</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../meal/main.jsp"><i class="fas fa-edit"></i> Order</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle dropdown-menu-left" href="#" id="navbardrop" data-toggle="dropdown"><i class="fas fa-user"></i> Account</a>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <%@page import="entity.Customer"%>
                        <%
                            Customer customer = (Customer) session.getAttribute("customer");
                            if (customer == null) {
                                response.sendRedirect("../account/signin.jsp?status=N");
                                return;
                            }
                        %>
                        <div class="btn dropdown-item"> Points : <%= customer.getCreditpoints()%> </div>
                        <a class="btn dropdown-item" href="../report/coupon.jsp" role="button"><i class="float-right fas fa-money-check-alt" style="line-height:inherit"></i>Coupons</a>
                        <div class="dropdown-divider"></div>
                        <h6 class="dropdown-header">Reports</h6>
                        <a class="btn dropdown-item" href="../report/order.jsp" role="button"><i class="float-right fas fa-history" style="line-height:inherit"></i>Order</a>
                        <a class="btn dropdown-item" href="../report/reload.jsp" role="button"><i class="float-right fas fa-coins" style="line-height:inherit"></i>Reload</a>
                        <a class="btn dropdown-item" href="../report/intake.jsp" role="button"><i class="float-right fas fa-file-contract" style="line-height:inherit"></i>Intake</a>
                        <div class="dropdown-divider"></div>
                        <a class="btn dropdown-item" href="../account/settings.jsp" role="button"><i class="float-right fas fa-cog" style="line-height:inherit"></i>Settings</a>
                        <a class="btn dropdown-item" href="../account/signout" role="button"><i class="float-right fas fa-sign-out-alt" style="line-height:inherit"></i>Sign Out</a>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>