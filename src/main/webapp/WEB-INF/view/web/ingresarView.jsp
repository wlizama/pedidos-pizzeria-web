<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/web" %>

<t:mainLayout pageTitle="Pizzeria - Ingresar">

    <div class="container">
        <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
                <h1 class="mb-3 mt-5 bread text-uppercase">Ingresar</h1>
                <p class="breadcrumbs text-uppercase"><span class="mr-2"><a href="./">Inicio</a></span> <span>Ingresar</span></p>
            </div>

        </div>
    </div>
    <div class ="ftco-section">
        <div class="container">
            <div class="row slider-text justify-content-center align-items-center">
                <div class="col-md-6 ftco-animate">
                    <form action="#" class="contact-form">
                        <div class="form-group">
                            <input type="email" class="form-control" placeholder="Correo Electronico">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Contreseña">
                        </div>
                        <div class="form-group">
                            <input type="submit" value="Iniciar Sesion" class="btn btn-primary py-3 px-5 w-100">
                        </div>
                        <p class="mt-5 text-center">¿No tienes una?</p>
                        <div class="form-group">
                            <p><a href="./registrar" class="btn btn-primary py-3 px-5 w-100">Registrarse</a></p>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
</t:mainLayout>