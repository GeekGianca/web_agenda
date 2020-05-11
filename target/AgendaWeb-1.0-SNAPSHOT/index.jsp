<%-- 
    Document   : index
    Created on : Apr 30, 2020, 6:06:44 PM
    Author     : 
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/loginestilo.css" rel="stylesheet">
        <title>Autenticacion</title>
    </head>
    <body <%=request.getParameter("onload")%>>
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">
                            <h5 class="card-title text-center">Autenticacion</h5>
                            <form action="autenticar.do" class="form-signin">
                                <div class="form-label-group">
                                    <input type="text" id="inputUsuario" name="inputUsuario" class="form-control" placeholder="Usuario" required autofocus>
                                    <label for="inputUsuario">Usuario</label>
                                </div>

                                <div class="form-label-group">
                                    <input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Contraseña" required>
                                    <label for="inputPassword">Contraseña</label>
                                </div>
                                <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Acceder</button>
                                <div class="text-center">
                                    ¿Aun no estas registrado?, <a href="registrarse.do">Registrarme</a></div>
                            </form>
                            <%
                                if (request.getSession().getAttribute("grettings") != null) {
                            %>
                            <div class="alert alert-success" role="alert">
                                <%=request.getSession().getAttribute("grettings")%>
                            </div>
                            <%
                                request.removeAttribute("grettings");
                            } else if (request.getSession().getAttribute("error") != null) {
                            %>
                            <div class="alert alert-danger" role="alert">
                                <%=request.getSession().getAttribute("error")%>
                            </div>
                            <%
                                request.removeAttribute("error");
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
