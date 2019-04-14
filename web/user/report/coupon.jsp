<%@page import="service.CouponService"%>
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
            html{
                background-color: #f8f9fa;
            }

            a.dropdown-item:nth-of-type(1){
                color: #fff;
                text-decoration: none;
                background-color: #007bff;
            }

            .card{
                margin-bottom: -1px;
                border-radius: 0;
            }

            .border-left-single {
                border-left: 1.25rem solid #4e73df!important;
            }

            .border-left-weekly {
                border-left: 1.25rem solid #17a2b8!important;
            }

            .border-left-monthly {
                border-left: 1.25rem solid #1cc88a!important;
            }

            .color-single g{
                fill: #4e73df!important;
            }

            .color-weekly g{
                fill: #17a2b8!important;
            }

            .color-monthly g{
                fill: #1cc88a!important;
            }
        </style>

    </head>
    <body style="margin-bottom: 60px;">
        <%@include file="../layout/navbar.jsp" %>
        <main role="main">

            <section class="text-center d-print-none">
                <div class="container d-flex justify-content-between align-items-center">
                    <h1 class="display-2">Coupon List</h1>
                    <button class="btn btn-primary my-2" onclick="printFn()" >Print
                        <i class="fas fa-print"></i>
                    </button>
                </div>
            </section>

            <div class="album py-5 bg-light">
                <div class="container">
                    <div class="container-fluid">

                        <%  OrderService os = new OrderService();
                            SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
                            SimpleDateFormat dateJS = new SimpleDateFormat("yyyy, MM-1, dd");
                            StringBuilder stringBuilder = new StringBuilder();
                            List<Orderlist> list = os.findOrderlistByCustPaid(customer.getCustId());
                            Ordermeal ordermeal;
                            Coupon coupon;
                            if (list.isEmpty()) {
                        %>
                        <p class="display-1 text-muted text-center"> You have no coupon. :( </p>
                        <p class="display-4 text-muted text-right"><a href="../meal/main.jsp"> Go order some! </a></p>
                        <%
                        } else {
                        %>
                        <div class="calendar mb-4 d-print-none"></div>
                        <div class="row">
                            <%
                                for (Orderlist orderlist : list) {
                                    coupon = orderlist.getCoupon();
                                    ordermeal = orderlist.getOrdermeal();
                            %>
                            <div class="card col-6 border-left-<%= ordermeal.getType().toLowerCase()%>">
                                <div class="card-body">
                                    <h5 class="card-title">Coupon Number : <%= coupon.getCouponId()%></h5>
                                    <div class="row">
                                        <p class="card-text col-6">
                                            Meal : <%= orderlist.getMeal().getName()%> 
                                            <br>Food Stall : <%= orderlist.getMeal().getCategoryId().getName()%> 
                                            <br>Redeem Date & Time : 
                                            <br><%= df.format(coupon.getRedeemDate())%> <%= coupon.getRedeemTime()%>
                                        </p>
                                        <p class="card-text col-6">
                                            Qty : <%= orderlist.getQuantity()%> 
                                            <br>Price : RM <%= orderlist.getPriceeach()%>
                                            <br>
                                            <svg class="barcode color-<%= ordermeal.getType().toLowerCase()%> mx-auto" jsbarcode-value="<%= coupon.getCouponId()%>">
                                            </svg>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <%
                                        stringBuilder.append(
                                                "\n{"
                                                + "name: " + coupon.getCouponId() + ","
                                                + "time: '" + coupon.getRedeemTime() + "',"
                                                + "startDate: new Date(" + dateJS.format(coupon.getRedeemDate()) + "), "
                                                + "endDate: new Date(" + dateJS.format(coupon.getRedeemDate()) + ")"
                                                + "},");
                                    }
                                    stringBuilder.deleteCharAt(stringBuilder.length() - 1);
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="../layout/footer.jsp" %>
        <%@include file="../layout/scripts.jsp" %>
        <script src="../../bootstrap/js/JsBarcode.all.js" type="text/javascript"></script>
        <link href="../../bootstrap/css/bootstrap-year-calendar.css" rel="stylesheet" type="text/css"/>
        <script src="../../bootstrap/js/bootstrap-year-calendar.js" type="text/javascript"></script>
        <script>

                        JsBarcode(".barcode")
                                .options({
                                    lineColor: "#343a40",
                                    width: 2,
                                    height: 40,
                                    displayValue: false
                                }).init();

                        $(document).ready(function () {
                            $(".ordermeal").click(function (e) {
                                e.preventDefault();
                                $('.cat' + $(this).attr('data-prod-cat')).toggle();
                            });
                            $('.calendar').calendar({
                                mouseOnDay: function (e) {
                                    if (e.events.length > 0) {
                                        var content = '';

                                        for (var i in e.events) {
                                            content += '<div class="event-tooltip-content">'
                                                    + '<div class="event-name"> Coupon #' + e.events[i].name + ' : ' + e.events[i].time + '</div>'
                                                    + '</div>';
                                        }

                                        $(e.element).popover({
                                            trigger: 'manual',
                                            container: 'body',
                                            html: true,
                                            content: content
                                        });

                                        $(e.element).popover('show');
                                    }
                                },
                                mouseOutDay: function (e) {
                                    if (e.events.length > 0) {
                                        $(e.element).popover('hide');
                                    }
                                },
                                dataSource: [
            <%= stringBuilder.toString()%>
                                ]
                            });
                        });



                        function printFn() {
                            window.print();
                        }
        </script>
    </body>
</html>