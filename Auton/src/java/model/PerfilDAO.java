/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Administrador
 */
public class PerfilDAO extends DataBaseDAO{
    
    public PerfilDAO() throws Exception{}
    
    public ArrayList<Perfil> getLista() throws Exception{
        
        ArrayList<Perfil> lista = new ArrayList<Perfil>();
        String sql = "SELECT * FROM perfil";
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(sql);
        while(rs.next()){
            Perfil p = new Perfil();
            p.setIdPerfil(rs.getInt("idPerfil"));
            p.setNome(rs.getString("nome"));
            lista.add(p);
        }
        this.desconectar();
        return lista;
    }
    
     public boolean gravar(Perfil p){
        try{
            String sql;
            this.conectar();//abre a conexao
            if(p.getIdPerfil()==0){
                sql = "INSERT INTO perfil(perfil) VALUES (?)";
            }else{
                sql = "UPDATE perfil SET perfil=? WHERE idperfil=?";
            }
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1,p.getNome());
            
            if(p.getIdPerfil()>0)
                pstm.setInt(2,p.getIdPerfil());
            pstm.execute();
            this.desconectar();
            return true;
            
        }catch(Exception e){
            System.out.println(e);
            return false;
        }
}
     public Perfil getCarregaPorId(int idperfil) throws Exception{
        Perfil p = new Perfil();
        String sql ="SELECT * FROM perfil WHERE idperfil=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1,idperfil);
        ResultSet rs = pstm.executeQuery();
        if(rs.next()){
            p.setIdPerfil(rs.getInt("idPerfil"));
            p.setNome(rs.getString("nome"));
        }
        this.desconectar();
        return p;
    }
    
    public boolean excluir(Perfil p){
        try{
            this.conectar();
            String sql = "DELETE FROM perfil WHERE idperfil=?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1,p.getIdPerfil());
            pstm.execute();
            this.desconectar();
            return true;
        
        }catch(Exception e){
            System.out.println(e);
            return false;
        }
    
    }
}
