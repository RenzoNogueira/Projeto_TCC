<%--<%@page import="model.Usuario"%>
<%@page import="controller.GerenciarLogin"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Usuario ulogado = GerenciarLogin.verificarAcesso(request, response);
    request.setAttribute("ulogado", ulogado);
%>--%>
<div>
    <header>
        <!--	Add "slideRight" class to items that move right when viewing Nav Drawer  -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                    aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="">Auton</a>
            <div class="collapse navbar-collapse bg-light" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="usuarios.jsp">Usuário</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="vendas.jsp">Vendas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="clientes.jsp">Clientes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="fornecedores.jsp">Fornecedores</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="produtos.jsp">Produtos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="relatorios.jsp">Relatórios</a>
                    </li>
                </ul>
                <!-- <form class="form-inline mt-2 mt-md-0">
                        <input class="form-control mr-sm-2" type="text" placeholder="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form> -->
            </div>
        </nav>
    </header>
</div>