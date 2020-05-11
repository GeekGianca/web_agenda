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
                        <li class="nav-item active">
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

            <h3 class="my-4">
                Registro de tarea
            </h3>

            <div class="container-fluid col-5">
                <form action="registrartarea.do" method="post">
                    <div class="form-group">
                        <label for="fechaTarea">Fecha(aaaa-mm-dd)</label>
                        <input type="text" id="fechaTarea" name="fechaTarea" class="form-control is-valid" value="<%=String.format("%tY-%tm-%td", fechaActual, fechaActual, fechaActual)%>" readonly="yes">
                    </div>
                    <div class="form-group">
                        <label for="horaTarea">Hora (hh:mm:ss AM/PM)</label>
                        <input type="text" id="horaTarea" name="horaTarea" class="form-control is-valid" value="<%=String.format("%tI:%tM:%tS %Tp", fechaActual, fechaActual, fechaActual, fechaActual)%>" readonly="yes">
                    </div>
                    <div class="mb-3">
                        <label for="descripcionTarea">Descripci&oacute;n</label>
                        <textarea class="form-control" id="descripcionTarea" name="descripcionTarea" placeholder="Detalle la descripcion de la tarea." required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Registrar</button>
                </form>
                <%
                    if (request.getSession().getAttribute("error") != null) {
                %>
                <div class="alert alert-danger" role="alert">
                    <%=request.getSession().getAttribute("error")%>
                </div>
                <%
                    request.removeAttribute("error");
                    }
                %>
            </div>
            <br>
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

