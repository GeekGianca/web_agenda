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
    List<Tarea> tareasViejas = new ArrayList<>();
    if (request.getSession().getAttribute("tareasViejas") != null) {
        tareasViejas = ((List<Tarea>) request.getSession().getAttribute("tareasViejas"));
    }
    Date fechaActual = new Date();
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
                        <li class="nav-item">
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

            <h1 class="my-4">
                Registro de ultimas tareas.
            </h1>

            <div class="row">
                <%
                    if (tareasViejas.size() > 0) {
                        for (Tarea t : tareasViejas) {
                %>
                <div class="col-lg-4 mb-4">
                    <div class="card">
                        <h4 class="card-header">Usuario: <%=t.getIdUsuarioTarea()%></h4>
                        <div class="card-body">
                            <p class="card-text"><%=t.getDescripcionTarea()%></p>
                        </div>
                        <div class="card-footer">
                            <small><%=t.getFechaTarea() + ", " + t.getHoraTarea()%></small>
                        </div>
                    </div>
                </div>
                <%
                    }
                } else {
                %>
                <div class="alert alert-warning" role="alert">
                    No hay tareas registradas con anterioridad.
                </div>
                <%
                    }
                %>
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

