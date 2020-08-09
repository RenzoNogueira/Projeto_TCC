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
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1" media="(device-height: 568px)">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="HandheldFriendly" content="True">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- Style Sheets -->
    <%@include file="importes_css.html" %>
    <!--        <link rel="stylesheet" type="text/css" media="all" href="css/reset.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/trunk.css" />-->

</head>

<body>

    <%--<%@ include file="banner.jsp" %>--%>
    <%@ include file="menu.jsp" %>


    <div class="content container">
        <header>Cabeçalho</header>
        <main>Corpo</main>
        <footer>Rodapé</footer>
    </div>

    <!-- Scripts -->
    <script type="text/javascript">
        if (typeof jQuery == 'undefined')
            document.write(unescape("%3Cscript src='js/jquery-1.9.js'" +
                "type='text/javascript'%3E%3C/script%3E"))
    </script>
    <script type="text/javascript" language="javascript" src="js/trunk.js"></script>

    <script src="frameworks/jquery/jquery.min.js"></script>
    <script src="frameworks/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>