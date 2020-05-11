/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package io.gksoftwaresolutions.agendaweb.servicios;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 
 */
public class Conexion extends ParentConexion{

    
    public Conexion(String params[]) {
        this.params = params;
        this.abrirConexion();
    }

    @Override
    Connection abrirConexion() {
        try{
            Class.forName(this.params[0]);
            connection = DriverManager.getConnection(String.format("%s", this.params[1]), this.params[2], this.params[3]);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return this.connection;
    }
    
}
