<%@page import="java.util.List"%>
<%@page import="entity.Staff"%>
<%@page import="entity.Category"%>
<%@page import="service.CategoryService"%>

<%
    //If user is not logged in
    Staff staff = (Staff) session.getAttribute("staff");
    if (staff == null) {
        response.sendRedirect("../account/signin.jsp?status=N");
        return;
    }

    Category cat = staff.getCategoryId();
%>

<!-- Fixed-Sidebar Navs -->
<nav class="col-md-2 d-none d-md-block bg-light sidebar d-print-none">
    <div class="sidebar-sticky">
        <ul class="nav flex-column pt-2">
            <li class="nav-item">
                <a class="nav-link">
                    <h5><i class="fas fa-store"></i> Category</h5>
                </a>
            </li>
            <li class="nav-item">

                <a class="nav-link ml-4 text-muted">
                    <%= cat.getName()%>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link">
                    <h5><i class="fas fa-home"></i> Dashboard</h5>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../reports/mealPreparation.jsp">
                    <i class="fas fa-calendar-day feather"></i> View Meal Orders
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../account/topup.jsp">
                    <i class="fas fa-money-check-alt feather"></i> Top-Up and Reload
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../account/redeemCoupon.jsp">
                    <i class="fas fa-money-check-alt feather"></i> Redeem Coupon
                </a>
            </li>
            <li class="nav-item mt-3">
                <a class="nav-link">
                    <h5><i class="fas fa-tasks"></i> Manage</h5>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../ingredient/manageIngredients.jsp">
                    <i class="fas fa-fish feather"></i> Manage Ingredients
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../meal/manageMeal.jsp">
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
                    <i class="fas fa-file-alt feather"></i> Top Up History
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../reports/orderlist.jsp">
                    <i class="fas fa-file-alt feather"></i> Meal Order List
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../reports/cancelledOrders.jsp">
                    <i class="fas fa-file-alt feather"></i> Order Cancellations
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../reports/topSales.jsp">
                    <i class="fas fa-file-alt feather"></i> Sales Report
                </a>
            </li>
        </ul>
    </div>
</nav>