<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1,
              user-scalable=no" name="viewport"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <%@include file="banner.jsp" %>
            <%@include file="menu.jsp" %>
            <h1>Cadastrar Usuário</h1>
            <form action="gerenciar_usuario.do" method="POST">
                <input type="hidden" name="idUsuario" id="idMenu" value=""/>
                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="nome" class="control-label">Nome</label>
                        <input type="text" class="form-control" id="nome" name="nome" required="" maxlength="45" value=""/>
                    </div>
                    <div class="form-group col-sm-8">
                        <label for="login" class="control-label">Login</label>
                        <input type="text" class="form-control" id="login" name="login" required="" maxlength="45" value=""/>
                    </div> 
                    <div class="form-group col-sm-8">
                        <label for="senha" class="control-label">Senha</label>
                        <input type="password" class="form-control" id="icone" name="senha" required="" maxlength="45" value=""/>
                    </div> 
                    <div class="form-group col-sm-8">
                        <label for="status" class="control-label">Status</label>
                        <select class="form-control" name="status">
                            <option value="1" <c:if test="${usuario.status==1}">selected="" </c:if >>Ativo</option>
                            <option value="2" <c:if test="${usuario.status==2}">selected="" </c:if >>Inativo</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-8">
                            <label for="perfil" class="control-label">Perfil</label>
                            <select class="form-control" name="idPerfil">
                                <option value="">Selecione o perfil</option>
                            <jsp:useBean class="model.PerfilDAO" id="perfil"/>
                            <c:forEach var="p" items="${perfil.lista}">
                                <option value="${p.idPerfil}">${p.nome}</option>
                            </c:forEach>
                        </select>
                    </div> 
                </div>
                <div class="row">
                    <button class="btn btn-success">Gravar</button>
                    <a href="listar_usuario.jsp" class="btn btn-warning">
                        Voltar
                    </a>    
                </div>    
            </form>    
        </div>    

    </body>
</html>