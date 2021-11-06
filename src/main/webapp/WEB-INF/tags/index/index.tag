<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@tag description="Layout principal" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="pageTitle" required="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container col-lg-3">
            <form action="Controlador2" method = "POST">
                <div class ="form-group">
                    <img scr="img/user.png" hidden="80" width="80">
                    <p><strong>Bienvenido a Pizzeria Bssongiorno</strong></p>
                </div>
                <div class ="form-group">
                    <label>Nombres:</label>
                    <input class="form-control" type="text" name="txtnom2" placeholder="Ingrese Nombres">
                </div>
                <div class ="form-group">
                    <label>Contraseña:</label>
                    <input type="password" name="txtPwd2" placeholder="Ingrese Contraseña" class="form-control">
                </div>
                <input type="submit" name ="btnIniciar" value="Ingresar">
            </form>
           
            <% 
                HttpSession sesion = request.getSession();
                int nivel = 0;
                if(request.getAttribute("nivel")!=null){
                    nivel = (Integer)request.getAttribute("nivel");
                    if (nivel==1){
                        sesion.setAttribute("nombre", request.getAttribute("nombre"));
                        sesion.setAttribute("nivel", nivel);
                        response.sendRedirect("./intranet");
                    }

                }
            %>
        </div>
    </body>
</html>