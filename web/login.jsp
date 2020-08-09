<%-- 
    Document   : login
    Created on : 09/08/2020, 11:44:35
    Author     : Renzo
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
    <style>
        .form {
            width: 50%;
            border: 1px solid gray;
            padding: 2em;
            margin-top: 3em;
        }
    </style>

</head>

<body>
    <header>
        <!--	Add "slideRight" class to items that move right when viewing Nav Drawer  -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="">Auton</a>
        </nav>
    </header>
    <div class="form mx-auto">
        <form>
            <div class="form-group">
                <label for="name_user">Nome de usuário</label>
                <input type="email" class="form-control" id="name_user" aria-describedby="emailHelp">
            </div>
            <div class="form-group">
                <label for="password_user">Senha</label>
                <input type="password" class="form-control" id="password_user">
            </div>
            <button type="submit" class="btn btn-primary">Executar</button>
        </form>
    </div>
</body>

</html>