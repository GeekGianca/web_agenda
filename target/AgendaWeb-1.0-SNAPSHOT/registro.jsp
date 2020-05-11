<%-- 
    Document   : registro
    Created on : Apr 30, 2020, 7:31:42 PM
    Author     : ###GKSoftware Solutions###
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/loginestilo.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/modern-business.css" rel="stylesheet">
        <title>Autenticacion</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">
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
                            <h5 class="card-title text-center">Autenticacion</h5>
                            <form action="registro.do" class="form-signin">
                                <div class="form-label-group">
                                    <input type="text" id="inputNombre" name="inputNombre" class="form-control" placeholder="Nombres" required autofocus>
                                    <label for="inputNombre">Nombres</label>
                                </div>

                                <div class="form-label-group">
                                    <input type="text" id="inputApellidos" name="inputApellidos" class="form-control" placeholder="Apellidos" required autofocus>
                                    <label for="inputApellidos">Apellidos</label>
                                </div>

                                <div class="form-label-group">
                                    <input type="text" id="inputDireccion" name="inputDireccion" class="form-control" placeholder="Direccion" required autofocus>
                                    <label for="inputDireccion">Direccion</label>
                                </div>

                                <div class="form-label-group">
                                    <input type="text" id="inputTelefono" name="inputTelefono" class="form-control" placeholder="Telefono" required autofocus>
                                    <label for="inputTelefono">Telefono</label>
                                </div>

                                <div class="form-label-group">
                                    <input type="text" id="inputUsuario" name="inputUsuario" class="form-control" placeholder="Usuario" required autofocus>
                                    <label for="inputUsuario">Usuario</label>
                                </div>

                                <div class="form-label-group">
                                    <input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Contraseña" required>
                                    <label for="inputPassword">Contraseña</label>
                                </div>
                                <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Registrarme</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
