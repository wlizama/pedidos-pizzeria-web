<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Pizzeria - Login</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="<c:url value="/resources/intranet/css/sb-admin-2.min.css" />" >
        
        <link rel="stylesheet" href="<c:url value="/resources/intranet/css/login.css" />" >

    </head>

    <body class="text-center">
        <form class="form-signin" action="${pageContext.request.contextPath}/j_spring_security_check" method='POST'>
            <img class="mb-4" src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
            <h1 class="h3 mb-3 font-weight-normal">Pizzeria Intranet</h1>
            <label for="txtUsuario" class="sr-only">Usuario</label>
            <input type="text" id="txtUsuario" name="username"  class="form-control" placeholder="Usuario" required autofocus>
            <label for="txtPassword" class="sr-only">Password</label>
            <input type="password" id="txtPassword" name="password" class="form-control" placeholder="Password" required>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            <p class="mt-5 mb-3 text-muted">&copy; 2021-2021</p>
            <c:if test="${param.error == 'true'}">
                <div style="color:red;margin:10px 0px;">
                    Error de inicio de sesion!!!<br />
                    Reason :  ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
                </div>
            </c:if>
        </form>
    </body>
</html>
