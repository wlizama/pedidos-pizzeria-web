<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Pizzeria - Access Denied</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="<c:url value="/resources/intranet/css/sb-admin-2.min.css" />" >
        <style>
            html,
            body {
                height: 100%;
            }
            body {
                display: -ms-flexbox;
                display: -webkit-box;
                display: flex;
                -ms-flex-align: center;
                -ms-flex-pack: center;
                -webkit-box-align: center;
                align-items: center;
                -webkit-box-pack: center;
                justify-content: center;
                padding-top: 40px;
                padding-bottom: 40px;
                background-color: #f5f5f5;
            }
        </style>
    </head>

    <body class="text-center">
        <h3 style="color:red;">${message}</h3>
    </body>
</html>