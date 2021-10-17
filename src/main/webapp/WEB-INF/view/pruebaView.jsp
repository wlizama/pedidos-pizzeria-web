<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Pruebas</h1>
        <form:form action="procesarPrueba" modelAttribute="prueba">
            ID <form:input path="idPrueba" disabled="disabled" />
            <br/>
            Nombre <form:input path="nombre" />
            <br/>
            Descripción <form:textarea path="descripcion" />
            <br/>
            Es correcto? <form:checkbox path="isOk" />
            <br/>
            <%--Tipo de prueba <form:select>
                <form:option value="" ></form:option>
            </form:select> --%>
             <input type="submit" value="Submit" />  
        </form:form>
    </body>
</html>
