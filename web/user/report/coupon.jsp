<!doctype html>
<html lang="en" style="position: relative; min-height: 100%;">
    <head>
        <%@include file="../layout/meta.jsp" %>
        <title>Bricks | Coupon</title>
        <style>
            .dropdown-item:nth-child(3){
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

                        <% for (int i = 0; i < 10; i++) {%>
                        <div class="card col-6">
                            <div class="card-body">
                                <h5 class="card-title">Coupon Number : <%= i + 10000%></h5>
                                <div class="row">
                                    <p class="card-text col-6">Meal : Chicken Rice <br>Price : RM 5.00 <br>Food Stall : Chicken Rice <br>Redeem Date & Time : dd/mm/yyyy Lunch</p>
                                    <p class="card-text col-6">Qty : 1 <br>Type : Single Day<br>Barcode : <span class="barcode" ><i class="fas fa-barcode"></i></span></p>
                                </div>
                            </div>
                        </div>
                        <% }%>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="../layout/footer.jsp" %>
        <%@include file="../layout/scripts.jsp" %>
    </body>
</html>
