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
             <h1>Novo Cadastro</h1>
             <form action="gerenciar_menu.do" method="POST">
                 <input type="hidden" name="idMenu" id="idMenu" value="${menu.idMenu}"/>
                 <div class="row">
                     <div class="form-group col-sm-8">
                         <label for="nome" class="control-label">Nome Menu</label>
                         <input type="text" class="form-control" id="nome" name="nome" required="" maxlength="45" value="${menu.nome}"/>
                     </div>
                     <div class="form-group col-sm-8">
                         <label for="link" class="control-label">Link</label>
                         <input type="text" class="form-control" id="link" name="link" required="" maxlength="45" value="${menu.link}"/>
                     </div> 
                     <div class="form-group col-sm-8">
                         <label for="icone" class="control-label">Icone</label>
                         <input type="text" class="form-control" id="icone" name="icone" maxlength="45" value="${menu.icone}"/>
                     </div> 
                     <div class="form-group col-sm-8">
                         <label for="exibir" class="control-label">Exibir</label>
                         <select class="form-control" name="exibir">
                             <option value="1" <c:if test="${menu.exibir==1}">selected="" </c:if >>Sim</option>
                             <option value="2" <c:if test="${menu.exibir==2}">selected="" </c:if >>Não</option>
                         </select>
                     </div> 
                 </div>
                 <div class="row">
                     <button class="btn btn-success">Gravar</button>
                     <a href="listar_menu.jsp" class="btn btn-warning">
                         Voltar
                     </a>    
                 </div>    
             </form>    
        </div>    
       
    </body>
</html>