<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entity.Coupon"%>
<%@page import="entity.Orderlist"%>
<%@page import="entity.Ordermeal"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="service.OrderService"%>
<!doctype html>
<html lang="en" style="position: relative; min-height: 100%;">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <title>Coupon</title>
        <style>
            a.dropdown-item:nth-of-type(1){
                color: #fff;
                text-decoration: none;
                background-color: #007bff;
            }

            .card{
                height: 200px;
                margin-bottom: -1px;
                margin-left: -1px;
                border-radius: 0;
            }
        </style>

    </head>
    <body style="margin-bottom: 60px;">
        <%@include file="../layout/navbar.jsp" %>
        <main role="main">

            <section class="text-center">
                <div class="container d-flex justify-content-between align-items-center">
                    <h1 class="display-2">Coupon List</h1>
                    <a href="#" class="btn btn-primary my-2">Print
                        <i class="fas fa-print"></i>
                    </a>
                </div>
            </section>

            <div class="album py-5 bg-light">
                <div class="container">
                    <div class="row">

                        <%  OrderService os = new OrderService();
                            List<Ordermeal> list = os.findOrderByCustPaid(customer.getCustId());
                            SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
                            Coupon coupon;

                            for (Ordermeal ordermeal : list) {
                                for (Orderlist orderlist : ordermeal.getOrderlistList()) {
                                    coupon = orderlist.getCouponId();
                                    if (coupon.getStatus().equals("Active")) {

                        %>
                        <div class="card col-6">
                            <div class="card-body">
                                <h5 class="card-title">Coupon Number : <%= coupon.getCouponId()%></h5>
                                <div class="row">
                                    <p class="card-text col-6">Meal : <%= orderlist.getMeal()%> 
                                        <br>Price : RM <%= orderlist.getPriceeach()%> 
                                        <br>Food Stall : <%= orderlist.getMeal().getCategoryId().getName()%> 
                                        <br>Redeem Date & Time : 
                                        <br><%= df.format(coupon.getRedeemDate())%> <%= coupon.getRedeemTime()%>
                                    </p>
                                    <p class="card-text col-6">Qty : <%= orderlist.getQuantity()%> 
                                        <br>Type : <%= ordermeal.getType()%>
                                        <br>Barcode : 
                                        <span class="barcode" ><i class="fas fa-barcode"></i></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <%
                                    }
                                }
                            }
                        %>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="../layout/footer.jsp" %>
        <%@include file="../layout/scripts.jsp" %>
    </body>
</html>
