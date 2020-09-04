
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
            function confirmarExclusao(id, nome) {
                if (confirm('Deseja realmete excluir o usuário ' + nome + ' ?')) {
                    location.href = 'gerenciar_usuario.do?acao=excluir&idUsuario=' + id;
                }

            }
        </script>    
    </head>
    <body>
        <div class="container">
            <%@include file="banner.jsp" %>
            <%@include file="menu.jsp" %>
            <h1>Lista de Usuários</h1>
            <a href="form_usuario.jsp" class="btn btn-primary">
                Novo Cadastro
            </a>
            <table class="table table-hover table-striped 
                   table-bordered display" id="listarUsuario">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome Usuário</th>
                        <th>Login</th>
                        <th>Status</th>
                        <th>Perfil</th>
                        <th>Opções</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>ID</th>
                        <th>Nome Menu</th>
                        <th>Link</th>
                        <th>Icone</th>
                        <th>Exibir</th>
                        <th>Opções</th>
                    </tr>
                </tfoot>
                <jsp:useBean class="model.UsuarioDAO" id="uDAO"/>
                <tbody>
                    <c:forEach var="u" items="${uDAO.lista}">

                        <tr>
                            <td>${u.idUsuario}</td>
                            <td>${u.nome}</td>
                            <td>${u.login}</td>
                            <td>
                                <c:if test="${m.exibir==1}"> Ativo </c:if>
                                <c:if test="${m.exibir==2}"> Inativo </c:if>

                                </td>
                                <td>${u.perfil.nome}</td>
                                <td>
                                    <a class="btn btn-primary" href="gerenciar_usuario.do?acao=alterar&idUsuario=${u.idUsuario}">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                </a>
                                <button class="btn btn-danger" onclick="confirmarExclusao(${u.idUsuario}, '${u.nome}')">
                                    <i class="glyphicon glyphicon-trash"></i>
                                </button>

                            </td>
                        </tr>

                    </c:forEach>
                </tbody>
            </table>    
        </div>    
        <script type="text/javascript" src="datatables/jquery.js"></script>
        <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
        <script type="text/javascript">
                                    $(document).ready(function () {
                                        $("#listarUsuario").dataTable({
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