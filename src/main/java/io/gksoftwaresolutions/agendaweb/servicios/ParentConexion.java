/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package io.gksoftwaresolutions.agendaweb.servicios;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ###GKSoftware Solutions###
 */
public abstract class ParentConexion {
    protected String params[];//driver, url, base de datos, usuario, contraseña
    protected Connection connection;
    
    abstract Connection abrirConexion();
    
    /**
     * Recibe un parametro String que debe coincidir a una consulta SQL
     * @param query Consulta
     * @return ResultSet para obtener los datos
     */
    public ResultSet query(String query) {
        Statement estatuto;
        ResultSet rs = null;
        try {
            estatuto = connection.createStatement();
            rs = estatuto.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(ParentConexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public boolean execute(String query) {
        Statement estatuto;
        boolean guardar = true;
        try {
            estatuto = connection.createStatement();
            estatuto.executeUpdate(query);
        } catch (SQLException ex) {
            guardar = false;
            Logger.getLogger(ParentConexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return guardar;
    }
    
    public boolean close(){
        boolean ok = true;
        try {
            connection.close();
        } catch (SQLException ex) {
            ok = false;
            Logger.getLogger(ParentConexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ok;
    }
}
