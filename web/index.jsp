<%@page import="entity.Meal"%>
<%@page import="service.MealService"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<%@ page import = "java.util.Base64" %>
<%@ page import = "java.sql.Blob" %>
<%@ page import = "control.Test" %>



<html>
    <head>
        <title>DySpee</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
        <script src="./bootstrap/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>TODO write content</div>
        <main role="main">
            <!-- Main jumbotron for a primary marketing message or call to action -->
            <div class="jumbotron">
                <div class="container">
                    <h1 class="display-3">Hello, world!</h1>
                    <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
                    <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more »</a></p>
                </div>
            </div>

            <div class="container">
                <!-- Example row of columns -->
                <div class="row">
                    <div class="col-md-4">
                        <h2>Heading</h2>
                        <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                        <p><a class="btn btn-secondary" href="#" role="button">View details »</a></p>
                    </div>
                    <div class="col-md-4">
                        <h2>Heading</h2>
                        <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                        <p><a class="btn btn-secondary" href="#" role="button">View details »</a></p>
                    </div>
                    <div class="col-md-4">
                        <h2>Heading</h2>
                        <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
                        <p><a class="btn btn-secondary" href="#" role="button">View details »</a></p>
                    </div>
                </div>

                <hr>
                
                <form action="./SendMail">
                    From: <%= System.getProperty("mail")%> <br/>
                    To: <input type="text" name="email" > <br/>
                    Subject: <input type="text" name="subject" value="Sample Text"> <br/>
                    Content: <textarea name="content" rows="4" cols="50"></textarea> <br/>
                    <input type="submit" value="Send" >
                </form>

            </div> <!-- /container -->

        </main>
    </body>
</html>