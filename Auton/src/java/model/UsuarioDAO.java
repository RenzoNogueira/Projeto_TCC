/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Unidade II
 *
 * @author Renzo Nogueira.
 */
public class UsuarioDAO extends DataBaseDAO {

    public UsuarioDAO() throws Exception {
    }

    public ArrayList<Usuario> getLista() throws Exception {
        ArrayList<Usuario> lista = new ArrayList<Usuario>();
        String sql = "SELECT u.* p.nome FROM usuario "
                + "INNER JOIN perfil p ON p.idPerfil = u.idPerfil";

        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            Usuario u = new Usuario();
            u.setIdUsuario(rs.getInt("u.idUsuario"));
            u.setNome(rs.getString("u.nome"));
            u.setLogin(rs.getString("u.login"));
            u.setSenha(rs.getString("u.senha"));
            u.setStatus(rs.getInt("u.status"));

            Perfil p = new Perfil();
            p.setIdPefil(rs.getInt("u.idPerfil"));
            p.setIdNome(rs.getString("u.nome"));
            p.setPefil(p);
            lista.add(u);
        }

        this.desconectar();
        return lista;
    }

}
