<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Resultado</h1>
        ID: <label>${prueba.idPrueba}</label>
        <br/>
        Nombre: <label>${prueba.nombre}</label>
        <br/>
        Descripción: <label>${prueba.descripcion}</label>
        <br/>
        Es correcto? <label>${prueba.isOk}</label>
        <br/>
    </body>
</html>
