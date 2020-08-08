<%-- 
    Document   : index
    Created on : 30/07/2020, 13:09:32
    Author     : Renzo Nogueira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Exemplo de aplicação erb em Java</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="frameworks/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/main.css">
    </head>

    <body>
        <header>
            <nav>
                <%--<%@ include file="banner.jsp" %>--%>
                <%@ include file="menu.jsp" %>
            </nav>
        </header>
            <div><h1>Hello World</h1></div>
        <script src="frameworks/jquery/jquery.min.js"></script>
        <script src="frameworks/bootstrap/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>