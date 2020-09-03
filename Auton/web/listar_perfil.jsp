<%-- 
    Document   : index
    Created on : 22/08/2019, 21:13:35
    Author     : Administrador
--%>

<%@page import="model.PerfilDAO"%>
<%@page import="model.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1,
              user-scalable=no" name="viewport"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" href="datatables/jquery.dataTables.min.css"/>
        <title>JSP Page</title>
        <script type="text/javascript">
            function confirmarExclusao(id, nome){
                    if(confirm('Deseja realmete excluir o perfil '+nome+ ' ?')){
                        location.href='gerenciar_perfil.do?acao=excluir&idperfil='+id;
                    }
                
            }
        </script>    
    </head>
    <body>
        <div class="container">
            <%@include file="banner.jsp" %>
            <%@include file="menu.jsp" %>
             <h1>Lista de Perfis</h1>
             <a href="form_perfil.jsp" class="btn btn-primary">
                 Novo Cadastro
             </a>
             <table class="table table-hover table-striped 
                    table-bordered display" id="listaPerfil">
                 <thead>
                     <tr>
                         <th>ID</th>
                         <th>Perfil</th>
                         <th>Opções</th>
                     </tr>
                 </thead>
                 <tfoot>
                     <tr>
                         <th>ID</th>
                         <th>Perfil</th>
                         <th>Opções</th>
                     </tr>
                 </tfoot>
                 <jsp:useBean class="model.PerfilDAO" id="pDAO"/>
                 <tbody>
                 <c:forEach var="p" items="${pDAO.lista}">
                 
                 <tr>
                     <td>${p.idPerfil}</td>
                     <td>${p.nome}</td>
                     <td>
                         <a class="btn btn-primary" href="gerenciar_perfil.do?acao=alterar&idperfil=${p.idPerfil}">
                             <i class="glyphicon glyphicon-pencil"></i>
                         </a>
                         <button class="btn btn-danger" onclick="confirmarExclusao(${p.idPerfil},'${p.nome}')">
                             <i class="glyphicon glyphicon-trash"></i>
                         </button>
                             <a class="btn btn-default" href="gerenciar_menu_perfil.do?acao=gerenciar&idperfil=${p.idPerfil}">
                                 <i class="glyphicon">Acessos</i>
                             </a>    
                     </td>
                 </tr>
                 
                 </c:forEach>
                 </tbody>
             </table>    
        </div>    
    <script type="text/javascript" src="datatables/jquery.js"></script>
    <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#listaPerfil").dataTable({
                "bJQueryUI": true,
                "oLanguage": {
                    "sProcessing": "Processando...",
                    "sLengthMenu": "Mostrar _MENU_ registros",
                    "sZeroRecords": "Não foram encontrados resultados",
                    "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                    "sInfoEmpty": "Mostrando de 0 até 0 de 0 registros",
                    "sInfoFiltered": "",
                    "sInfoPostFix": "",
                    "sSearch": "Pesquisar",
                    "sUrl": "",
                    "oPaginate": {
                        "sFirst": "Primeiro",
                        "sPrevious": "Anterior",
                        "sNext": "Próximo",
                        "sLast": "Último"
                    }
                }
            })
        });
    </script>   
    </body>
</html>
