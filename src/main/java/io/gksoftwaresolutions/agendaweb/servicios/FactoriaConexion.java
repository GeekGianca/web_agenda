/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package io.gksoftwaresolutions.agendaweb.servicios;

/**
 *
 * @author 
 */
public class FactoriaConexion {
    public static final int POSTGRESQL = 1;
    
    public static ParentConexion getInstance(int tipo, String params[]){
        switch (tipo) {
            case FactoriaConexion.POSTGRESQL:
                return new Conexion(params);
            default:
                System.out.println("Conexion abierta.");
        }
        return null;
    }
}
