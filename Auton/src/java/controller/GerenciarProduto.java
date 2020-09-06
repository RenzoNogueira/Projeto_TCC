/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Produto;
import model.ProdutoDAO;

/**
 *
 * @author pfela
 */
public class GerenciarProduto extends HttpServlet {

   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String acao = request.getParameter("acao");
        
        String idProduto = request.getParameter("idProduto");
        String mensagem = "";
        try{
            Produto p = new Produto();
            ProdutoDAO pDAO = new ProdutoDAO();
            if(acao.equals("alterar")){
                if(GerenciarLogin.verificarPermissao(request, response)){
                    p = pDAO.getCarregaPorID(Integer.parseInt(idProduto));
                    if(p.getIdProduto()>0){
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_produto.jsp");
                        request.setAttribute("produto", p);
                        disp.forward(request, response);
                    }else{
                        mensagem = "Produto não encontrado";
                    }
                }else{
                    mensagem = "Acesso Negado";
                }
            }
            if(acao.equals("deletar")){
                if(GerenciarLogin.verificarPermissao(request, response)){
                    p.setIdProduto(Integer.parseInt(idProduto));
                    if(pDAO.deletar(p)){
                        mensagem = "Produto deletado com sucesso";
                    }else{
                        mensagem = "Erro ao deletar o produto do banco de dados";
                    }
                }else{
                    mensagem = "Acesso Negado!";
                }
            }
        
        }catch(Exception e){
            out.print(e);
            mensagem = "Erro ao executar";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_produto.jsp';");
        out.println("</script>");
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String idProduto = request.getParameter("idProduto");
        String nome = request.getParameter("nome");
        String qtd = request.getParameter("qtd");
        String valor = request.getParameter("valor");
        String mensagem = "";
        
        Produto p = new Produto();
        if(!idProduto.isEmpty()){
            p.setIdProduto(Integer.parseInt(idProduto));
        }
        if(nome.equals("")||qtd.equals("")||valor.equals("")){
            mensagem = "Campos obrigatórios deverão ser preenchidos!";
        }else{
            p.setNome(nome);
            p.setQtd(Integer.parseInt(qtd));
            double novovalor=0;
            if(!valor.isEmpty()){
                novovalor = Double.parseDouble(valor.replace(".","").replace(",", "."));
            }
            p.setValor(novovalor);
            try{
                ProdutoDAO pDAO = new ProdutoDAO();
                if(pDAO.gravar(p)){
                    mensagem = "Gravado com sucesso";
                }else{
                    mensagem = "Erro ao gravar o produto no banco de dados";
                }
            }catch(Exception e){
                out.print(e);
                mensagem = "Erro ao executar!";
            }
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_produto.jsp';");
        out.println("</script>");
        
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
