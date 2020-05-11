<%-- 
    Document   : inicio
    Created on : Apr 30, 2020, 7:23:25 PM
    Author     : 
--%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="io.gksoftwaresolutions.agendaweb.modelos.Usuario"%>
<%@page import="io.gksoftwaresolutions.agendaweb.modelos.Tarea"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (request.getSession().getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
    }
    List<Tarea> tareas = new ArrayList<>();
    if (request.getSession().getAttribute("tareas") != null) {
        tareas = ((List<Tarea>) request.getSession().getAttribute("tareas"));
    }
%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Agenda Web</title>
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/modern-business.css" rel="stylesheet">

    </head>

    <body>
        <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container">
                <a class="navbar-brand" href="index.html">Agenda Web</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="mostrarformulariotarea.do">Agregar tarea</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="mostrartareas.do">Tareas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="salir.do">Salir</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><%=((Usuario) request.getSession().getAttribute("usuario")).getNombreApellido()%></a>    
                        </li>
                        <li class="nav-item">
                            <img class="d-flex mr-3 rounded-circle" src="img/image.jpg" width="40px" height="40px" alt="">
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page Content -->
        <div class="container">

            <h2 class="my-4">
                Agenda del d&iacute;a <%=request.getSession().getAttribute("fecha")%> 
            </h2>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <%
                        if (tareas.size() > 0) {
                    %>
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Descripcion</th>
                                <th scope="col">Hora</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Tarea t : tareas) {
                            %>
                            <tr>
                                <th scope="row"><%=t.getIdUsuarioTarea()%></th>
                                <td><%=t.getDescripcionTarea()%></td>
                                <td><%=t.getHoraTarea()%></td>
                            </tr>
                            <%
                                }
                                request.removeAttribute("fecha");
                                request.removeAttribute("tareas");
                            %>
                        </tbody>
                    </table>
                    <%
                    } else {
                    %>
                    <div class="alert alert-danger" role="alert">
                        No hay tareas registradas.
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>

        </div>

        <footer class="py-2 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Universidad de Cordoba 2020</p>
            </div>
        </footer>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>

