<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/web" %>

<t:mainLayout pageTitle="Pizzeria - Carrito">
    <div class="container">
        <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
                <h1 class="mb-3 mt-5 bread text-uppercase">Carrito</h1>
                <p class="breadcrumbs text-uppercase"><span class="mr-2"><a href="./">Inicio</a></span> <span>Carrito</span></p>
            </div>

        </div>
    </div>

    <section class="ftco-section contact-section">
        <div class="container mt-5">
            <div class="row block-9">
                <div class="col-md-4 contact-info ftco-animate">
                    <div class="row">
                        <div class="col-md-12 mb-4">
                            <h2 class="h4">Información de contacto</h2>
                        </div>
                        <div class="col-md-12 mb-3">
                            <p class="breadcrumbs"><span>¿Aun no haz iniciado sesión? </span><span class="mr-2"><a href="./ingresar">Iniciar Sesión</a></span></p>
                        </div>
                        <div class="col-md-12 mb-3">
                            <p><span>Nombres:</span> David Jefferson</p>
                        </div>
                        <div class="col-md-12 mb-3">
                            <p><span>Apellidos:</span> Vidal Agui</p>
                        </div>
                        <div class="col-md-12 mb-3">
                            <p><span>Correo Electronico:</span> djvidagui@gmail.com</p>
                        </div>

                        <div class="col-md-12 mb-4">
                            <h2 class="h4">Dirección de Envio</h2>
                        </div>
                        <div class="col-md-12 mb-3">
                            <p><span>Telefono:</span> <input type="number" class="form-control" placeholder="Ingrese un numero de contacto"></p>
                        </div>
                        <div class="col-md-12 mb-3">
                            <p><span>Distrito:</span> </p>
                            <select class="btn btn-primary text-left" name="select">
                                <option value="value1" disabled selected>--Seleccionar Distrito--</option>
                                <option value="value2">Cercado de Lima</option>
                                <option value="value3">Jesus Maria</option>
                                <option value="value3">Pueblo Libre</option>
                                <option value="value3">Breña</option>
                            </select>
                        </div>
                        <div class="col-md-12 mb-3">
                            <p><span>Dirección:</span> <input type="text" class="form-control" placeholder="Ingrese direccion completa"></p>
                        </div>

                    </div>
                </div>

                <div class="col-md-1"></div>
                <div class="col-md-6 ftco-animate">

                    <div class="mb-4">
                        <h2 class="h4">Información de Pedido</h2>
                    </div>
                    <form action="#" class="contact-form">
                        <div class="row">
                            <div class="col-md-10">
                                <div class="pricing-entry d-flex ftco-animate">
                                    <div class="img" style="background-image: url(resources/web/images/pizza-1.jpg);"></div>
                                    <div class="desc pl-3">
                                        <div class="d-flex text align-items-center">
                                            <h3><span>Pizza italiana</span></h3>
                                            <span class="price">$20.00</span>

                                        </div>
                                        <div class="d-block">
                                            <p>An ius ludus dolorem, consetetur intellegebat cum eu melius</p>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="col-md-2">
                                <input type="number" class="btn btn-primary p-2 px-xl-0 py-xl-3" placeholder="1" min="1">
                            </div>

                            <div class="col-md-10">
                                <div class="pricing-entry d-flex ftco-animate">
                                    <div class="img" style="background-image: url(resources/web/images/pizza-1.jpg);"></div>
                                    <div class="desc pl-3">
                                        <div class="d-flex text align-items-center">
                                            <h3><span>Pizza italiana</span></h3>
                                            <span class="price">$20.00</span>

                                        </div>
                                        <div class="d-block">
                                            <p>An ius ludus dolorem, consetetur intellegebat cum eu melius</p>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="col-md-2">
                                <input type="number" class="btn btn-primary p-2 px-xl-0 py-xl-3" placeholder="1" min="1">
                            </div>

                        </div>

                        <div class="col-md-12 heading-section text-center ftco-animate">
                            <p class="flip"><span class="deg1"></span><span class="deg2"></span><span class="deg3"></span></p>
                        </div>


                        <div class="pricing-entry d-flex ftco-animate">

                            <div class="desc pl-3">
                                <div class="d-flex text align-items-center">
                                    <h3><span>Sub Total: </span></h3>
                                    <span class="price">$20.00</span>
                                </div>
                            </div>
                        </div>
                        <div class="pricing-entry d-flex ftco-animate">

                            <div class="desc pl-3">
                                <div class="d-flex text align-items-center">
                                    <h3><span>IGV 18%: </span></h3>
                                    <span class="price">$2.00</span>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 heading-section text-center ftco-animate">
                            <p class="flip"><span class="deg1"></span><span class="deg2"></span><span class="deg3"></span></p>
                        </div>


                        <div class="pricing-entry d-flex ftco-animate">

                            <div class="desc pl-3">
                                <div class="d-flex text align-items-center">
                                    <h3><span>Total: </span></h3>
                                    <span class="price">$22.00</span>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <input type="submit" value="Finalizar Pedido" class="btn btn-primary py-3 px-5">
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </section>
</t:mainLayout>