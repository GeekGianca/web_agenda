/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package io.gksoftwaresolutions.agendaweb.modelos;

/**
 *
 * @author 
 */
public class Tarea {
    private String idUsuarioTarea;
    private String descripcionTarea;
    private String fechaTarea;
    private String horaTarea;

    public Tarea() {
    }

    public Tarea(String idUsuarioTarea, String descripcionTarea, String fechaTarea, String horaTarea) {
        this.idUsuarioTarea = idUsuarioTarea;
        this.descripcionTarea = descripcionTarea;
        this.fechaTarea = fechaTarea;
        this.horaTarea = horaTarea;
    }

    public String getIdUsuarioTarea() {
        return idUsuarioTarea;
    }

    public void setIdUsuarioTarea(String idUsuarioTarea) {
        this.idUsuarioTarea = idUsuarioTarea;
    }

    public String getDescripcionTarea() {
        return descripcionTarea;
    }

    public void setDescripcionTarea(String descripcionTarea) {
        this.descripcionTarea = descripcionTarea;
    }

    public String getFechaTarea() {
        return fechaTarea;
    }

    public void setFechaTarea(String fechaTarea) {
        this.fechaTarea = fechaTarea;
    }

    public String getHoraTarea() {
        return horaTarea;
    }

    public void setHoraTarea(String horaTarea) {
        this.horaTarea = horaTarea;
    }
    
}
