<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/web" %>

<t:mainLayout pageTitle="Pizzeria - Registrar">
        <div class="container">
        <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
                <h1 class="mb-3 mt-5 bread text-uppercase">Registrar</h1>
                <p class="breadcrumbs text-uppercase"><span class="mr-2"><a href="./">Inicio</a></span> <span>Registrar</span></p>
            </div>

        </div>
    </div>
    <div class ="ftco-section">
        <div class="container">
            <div class="row slider-text justify-content-center align-items-center">
                <div class="col-md-6 ftco-animate">
                    <form action="#" class="contact-form">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Ingrese Nombres">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Ingrese Apellidos">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" placeholder="Ingrese un Correo Electronico">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Ingrese una Contraseña">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Vuelve a ingresar Contraseña">
                        </div>
                        <div class="form-group">
                            <input type="submit" value="Crear Cuenta" class="btn btn-primary py-3 px-5 w-100">
                        </div>
                        
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
</t:mainLayout>