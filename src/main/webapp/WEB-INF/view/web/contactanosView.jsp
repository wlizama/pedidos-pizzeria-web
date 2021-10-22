<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/web" %>

<t:mainLayout pageTitle="Pizzeria - Contáctanos">
    <section class="home-slider owl-carousel img" style="background-image: url(resources/images/bg_1.jpg);">
      <div class="slider-item" style="background-image: url(resources/images/bg_3.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            	<h1 class="mb-3 mt-5 bread">Contáctanos</h1>
	            <p class="breadcrumbs"><span class="mr-2"><a href="./">Inicio</a></span> <span>Contáctanos</span></p>
            </div>

          </div>
        </div>
      </div>
    </section>
    
    <section class="ftco-section contact-section">
        <div class="container mt-5">
            <div class="row block-9">
                <div class="col-md-4 contact-info ftco-animate">
                    <div class="row">
                        <div class="col-md-12 mb-4">
                            <h2 class="h4">Información de contacto</h2>
                        </div>
                        <div class="col-md-12 mb-3">
                            <p><span>Dirección:</span> 198 West 21th Street, Suite 721 New York NY 10016</p>
                        </div>
                        <div class="col-md-12 mb-3">
                            <p><span>Celular:</span> <a href="tel://1234567920">+ 1235 2355 98</a></p>
                        </div>
                        <div class="col-md-12 mb-3">
                            <p><span>Correo:</span> <a href="mailto:info@yoursite.com">info@yoursite.com</a></p>
                        </div>
                        <div class="col-md-12 mb-3">
                            <p><span>Website:</span> <a href="#">yoursite.com</a></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-6 ftco-animate">
                    <form action="#" class="contact-form">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Nombre">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Correo">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Asunto">
                        </div>
                        <div class="form-group">
                            <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Mensaje"></textarea>
                        </div>
                        <div class="form-group">
                            <input type="submit" value="Enviar mensaje" class="btn btn-primary py-3 px-5">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <div id="map"></div>
    
</t:mainLayout>