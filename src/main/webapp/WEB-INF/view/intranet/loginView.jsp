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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>

    <body class="text-center">

            <section class="vh-100" style="background-color: #b4b6b4;">
                <div class="container py-5 h-100">
                  <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-xl-10">
                      <div class="card" style="border-radius: 1rem;">
                        <div class="row g-0">
                          <div class="col-md-6 col-lg-5 d-none d-md-block">
                            <img
                              src="https://i.pinimg.com/originals/58/04/63/58046306d18ae00be1e677f3da96fd4e.png"
                              alt="login form"
                              class="img-fluid" style="border-radius: 1rem 0 0 1rem;"
                            />
                          </div>
                          <div class="col-md-6 col-lg-7 d-flex align-items-center">
                            <div class="card-body p-4 p-lg-5 text-black">

                              <form class="form-signin" action="${pageContext.request.contextPath}/intranet/j_spring_security_check" method='POST'>

                                <div class="d-flex align-items-center mb-3 pb-1">
                                  <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                                  <span class="h1 fw-bold mb-0">Pizzeria Bongiorno</span>
                                </div>

                                <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Ingresa tus credenciales</h5>

                                <div class="form-outline mb-4">
                                  <input type="text" id="txtUsuario" name="username" class="form-control form-control-lg" placeholder="Usuario" />                                  
                                </div>

                                <div class="form-outline mb-4">
                                  <input type="password" id="txtPassword" name="password" class="form-control form-control-lg" placeholder="Contraseña" />                                  
                                </div>

                                <div class="pt-1 mb-4">
                                  <button class="btn btn-dark btn-lg btn-block" type="submit">Login</button>
                                </div>
                                <p class="mt-5 mb-3 text-muted">&copy; 2021-2021</p>    
                                <c:if test="${param.error == 'true'}">
                                    <div class="alert alert-danger" role="alert">                                        
                                        <strong>Error de inicio de sesion, 
                                          ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</strong>
                                    </div>
                                </c:if>                                
                              </form>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
            </section>            
    </body>
</html>
