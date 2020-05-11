/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package io.gksoftwaresolutions.agendaweb.controlador;

import io.gksoftwaresolutions.agendaweb.modelos.Tarea;
import io.gksoftwaresolutions.agendaweb.modelos.Usuario;
import io.gksoftwaresolutions.agendaweb.servicios.Conexion;
import io.gksoftwaresolutions.agendaweb.servicios.FactoriaConexion;
import io.gksoftwaresolutions.agendaweb.servicios.ParentConexion;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author
 */
public class SvtControlador extends HttpServlet {

    private ParentConexion conexion;
    private final Date hoy = new Date();

    @Override
    public void init(ServletConfig config) throws ServletException {
        try {
            String params[] = new String[4];
            params[0] = config.getInitParameter("driverBd");
            params[1] = config.getInitParameter("urlBd");
            params[2] = config.getInitParameter("usuario");
            params[3] = config.getInitParameter("password");
            conexion = FactoriaConexion.getInstance(FactoriaConexion.POSTGRESQL, params);
        } catch (Exception e) {
            Logger.getLogger(SvtControlador.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getRequestURL().substring(request.getRequestURL().lastIndexOf("/") + 1);
        if (request.getSession().getAttribute("usuario") != null || accion.equals("registrarse.do") || accion.equals("registro.do") || accion.equals("autenticar.do")) {
            switch (accion) {
                case "autenticar.do":
                    autenticar(request, response);
                    break;
                case "registrarse.do":
                    registro(request, response);
                    break;
                case "registro.do":
                    registrarse(request, response);
                    break;
                case "mostrarformulariotarea.do":
                    agregarTarea(request, response);
                    break;
                case "mostrartareas.do":
                    mostrarTareas(request, response);
                    break;
                case "registrartarea.do":
                    registrarTarea(request, response);
                    break;
                case "salir.do":
                    salir(request, response);
                    break;
                default:
                    break;
            }
        } else {
            autenticar(request, response);
        }
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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

    private void autenticar(HttpServletRequest request, HttpServletResponse response) {
        try {
            String sql = String.format("SELECT * FROM Usuario WHERE loginUsuario = '%s' AND passwordUsuario = '%s';", request.getParameter("inputUsuario"), request.getParameter("inputPassword"));
            ResultSet rs = conexion.query(sql);
            Usuario usuario;
            if (rs.next()) {
                usuario = new Usuario(
                        rs.getString("idUsuario"),
                        rs.getString("nombreUsuario"),
                        rs.getString("apellidosUsuario"),
                        rs.getString("direccionUsuario"),
                        rs.getString("telefonoUsuario"),
                        rs.getString("loginUsuario"),
                        rs.getString("passwordUsuario")
                );
                rs.close();
                //Carga el listado de otras tareas de otros dias diferentes a la de hoy
                /*<%=String.format("%tI:%tM:%tS %Tp", fechaActual, fechaActual, fechaActual, fechaActual)%>*/
                String sqlTareas = String.format("SELECT idusuariotarea, descripciontarea, fechatarea, horatarea FROM public.tarea WHERE fechatarea <> '%tY-%tm-%td' AND idusuariotarea = %s;", hoy, hoy, hoy, usuario.getIdUsuario());
                List<Tarea> tareasviejas = new ArrayList<>();
                rs = conexion.query(sqlTareas);
                while (rs.next()) {
                    tareasviejas.add(
                            new Tarea(
                                    rs.getString("idUsuarioTarea"),
                                    rs.getString("descripcionTarea"),
                                    rs.getString("fechaTarea"),
                                    rs.getString("horaTarea")
                            )
                    );
                }
                request.getSession().setAttribute("tareasViejas", tareasviejas);
                response.sendRedirect("inicio.jsp");
                request.getSession().setAttribute("usuario", usuario);
            } else {
                request.getSession().setAttribute("error", "Usuario o contraseña invalido.");
                response.sendRedirect(String.format("index.jsp"));
            }
        } catch (IOException | SQLException e) {
            Logger.getLogger(SvtControlador.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    private void registro(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("registro.jsp");
        } catch (IOException ex) {
            Logger.getLogger(SvtControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void registrarse(HttpServletRequest request, HttpServletResponse response) {
        try {
            String nombres = request.getParameter("inputNombre");
            String apellidos = request.getParameter("inputApellidos");
            String direccion = request.getParameter("inputDireccion");
            String telefono = request.getParameter("inputTelefono");
            String usuario = request.getParameter("inputUsuario");
            String contrasena = request.getParameter("inputPassword");
            String sql = String.format("INSERT INTO public.usuario(nombreusuario, apellidosusuario, direccionusuario, telefonousuario, loginusuario, passwordusuario) VALUES ('%s', '%s', '%s', '%s', '%s', '%s');", nombres, apellidos, direccion, telefono, usuario, contrasena);
            if (conexion.execute(sql)) {
                System.out.println(sql);
                response.sendRedirect("index.jsp");
            } else {
                request.getSession().setAttribute("error", "Se produjo un error al intentar registrar.");
                response.sendRedirect(String.format("registro.jsp"));
            }
        } catch (IOException ex) {
            Logger.getLogger(SvtControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void mostrarTareas(HttpServletRequest request, HttpServletResponse response) {

        try {
            String sqlTareas = String.format("SELECT idusuariotarea, descripciontarea, fechatarea, horatarea FROM public.tarea WHERE idusuariotarea = %s;", ((Usuario)request.getSession().getAttribute("usuario")).getIdUsuario());
            List<Tarea> tareas = new ArrayList<>();
            ResultSet rs = conexion.query(sqlTareas);
            while (rs.next()) {
                tareas.add(
                        new Tarea(
                                rs.getString("idUsuarioTarea"),
                                rs.getString("descripcionTarea"),
                                rs.getString("fechaTarea"),
                                rs.getString("horaTarea")
                        )
                );
            }
            request.getSession().setAttribute("tareas", tareas);
            request.getSession().setAttribute("fecha", String.format("%tY-%tm-%td", hoy, hoy, hoy));
            response.sendRedirect("tareas.jsp");
        } catch (SQLException | IOException ex) {
            Logger.getLogger(SvtControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void agregarTarea(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getSession().setAttribute("fecha", String.format("%tY-%tm-%td", hoy, hoy, hoy));
            response.sendRedirect("agregartarea.jsp");
        } catch (IOException ex) {
            Logger.getLogger(SvtControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void registrarTarea(HttpServletRequest request, HttpServletResponse response) {
        try {
            Tarea tarea = new Tarea(((Usuario) request.getSession().getAttribute("usuario")).getIdUsuario(), request.getParameter("descripcionTarea"), request.getParameter("fechaTarea"), request.getParameter("horaTarea"));
            String sql = String.format("INSERT INTO public.tarea(idusuariotarea, descripciontarea, fechatarea, horatarea) VALUES (%s, '%s', '%s', '%s');", tarea.getIdUsuarioTarea(), tarea.getDescripcionTarea(), tarea.getFechaTarea(), tarea.getHoraTarea());
            if (conexion.execute(sql)) {
                response.sendRedirect("inicio.jsp");
            } else {
                request.getSession().setAttribute("error", "La tarea no se ingreso correctamente.");
                response.sendRedirect("agregartarea.jsp");
            }
        } catch (IOException ex) {
            Logger.getLogger(SvtControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void salir(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getSession().removeAttribute("usuario");
            request.getSession().setAttribute("grettings", "Gracias por elegir nuestros servicios.");
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
        }
    }

}
