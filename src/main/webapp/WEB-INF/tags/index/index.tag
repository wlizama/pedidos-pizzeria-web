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
    <body style="background-color: #1E90FF;">
        <section class="vh-100" ">
          <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
              <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem;">
                  <div class="row g-0">
                    <div class="col-md-6 col-lg-5 d-none d-md-block">
                      <img
                        src="resources\web\images\about.jpg"
                        alt="login form"
                        class="img-responsive" style="border-radius: 1rem 0 0 1rem;"
                      />
                    </div>
                    <div class="col-md-6 col-lg-7 d-flex align-items-center">
                      <div style="background-color: #EBEBEB;" class="card-body p-4 p-lg-5 text-black" >

                        <form action="Controlador2" method = "POST" >

                          <div class="d-flex align-items-center mb-3 pb-1">
                            <i class="flaticon-pizza-1" style="color: #ff6219;" ></i>
                            <span class="h1 fw-bold mb-0">Pizzeria<br><small>Buongiorno</small></span>

                          </div>

                          <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Inicio de Sesión</h5>

                          <div class="form-outline mb-4">
                            <input type="text"  class="form-control form-control-lg" name="txtnom2" />
                            <label class="form-label" for="form2Example17">Nombre de Usuario</label>
                          </div>

                          <div class="form-outline mb-4">
                            <input type="password"  class="form-control form-control-lg"  name="txtPwd2" />
                            <label class="form-label" for="form2Example27">Password</label>
                          </div>

                          <div class="pt-1 mb-4">
                            <button class="btn btn-dark btn-lg btn-block" type="submit" name="btnIniciar">Ingresar</button>
                          </div>
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
                        if(request.getParameter("cerrar")!=null){
                            session.invalidate();
                        }
                    %>

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