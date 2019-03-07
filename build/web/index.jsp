<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<%@page import="java.util.Base64"%>
<%@ page import = "java.sql.Blob" %>
<%@ page import = "entity.Product" %>
<%@ page import = "service.ProductService" %>
<%  ProductService productService = new ProductService();
    Product product = new Product();
    product = productService.findProdByID(1);
    String base64Image = Base64.getEncoder().encodeToString(product.getImage());
%>

<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>TODO write content</div>
        <div><%= product.getName() %></div>
        <img src = "data:image/png;base64,<%= base64Image %>"/>
    </body>
</html>

<%
    productService.close();
%>