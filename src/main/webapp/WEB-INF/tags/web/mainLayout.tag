<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@tag description="Layout principal" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="pageTitle" required="true"%>


<%-- https://stackoverflow.com/questions/1296235/jsp-tricks-to-make-templating-easier --%>


<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Nothing+You+Could+Do" rel="stylesheet">

        <link rel="stylesheet" href="<c:url value="/resources/web/css/open-iconic-bootstrap.min.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/web/css/animate.css" />" />

        <link rel="stylesheet" href="<c:url value="/resources/web/css/owl.carousel.min.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/web/css/owl.theme.default.min.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/web/css/magnific-popup.css" />">

        <link rel="stylesheet" href="<c:url value="/resources/web/css/aos.css" />">

        <link rel="stylesheet" href="<c:url value="/resources/web/css/ionicons.min.css" />">

        <link rel="stylesheet" href="<c:url value="/resources/web/css/bootstrap-datepicker.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/web/css/jquery.timepicker.css" />">

        <link rel="stylesheet" href="<c:url value="/resources/web/css/flaticon.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/web/css/icomoon.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/web/css/style.css" />">        
        
        <title>${pageTitle}</title>
    <head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="./"><span class="flaticon-pizza-1 mr-1"></span>Pizzeria<br><small>Buongiorno</small></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>
                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="./" class="nav-link">Inicio</a></li>
                        <li class="nav-item"><a href="./menu" class="nav-link">Menu</a></li>
                        <li class="nav-item"><a href="./nosotros" class="nav-link">Nosotros</a></li>
                        <li class="nav-item"><a href="./contactanos" class="nav-link">Contáctanos</a></li>
                        <li class="nav-item"><a href="./ingresar" class="nav-link"><span class="icon-person"></span> Ingresar</a></li>
                        <li class="nav-item"><a href="./carrito" class="nav-link"><span class="icon-shopping-cart"></span> Mi carrito</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <main>
            <jsp:doBody />
        </main>
        
        <footer class="ftco-footer ftco-section img">
            <div class="overlay"></div>
            <div class="container">
                <div class="row mb-5">
                    <div class="col-lg-3 col-md-6 mb-5 mb-md-5">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Sobre nosotros</h2>
                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                            <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="col-lg-2 col-md-6 mb-5 mb-md-5">
                        <div class="ftco-footer-widget mb-4 ml-md-4">
                            <h2 class="ftco-heading-2">Servicios</h2>
                            <ul class="list-unstyled">
                                <li>Cooked</li>
                                <li>Delive</li>
                                <li>Quality Foods</li>
                                <li>Mixed</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 mb-5 mb-md-5">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">¿Tienes preguntas?</h2>
                            <div class="block-23 mb-3">
                                <ul>
                                    <li><span class="icon icon-map-marker"></span><span class="text">Lorem Ipsum is simply dummy text of the printing and typesetting industry</span></li>
                                    <li><a href="#"><span class="icon icon-phone"></span><span class="text">+1 123 456 789</span></a></li>
                                    <li><a href="#"><span class="icon icon-envelope"></span><span class="text">super@correo.com</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">

                        <p>
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> Todos los derechos reservados</i>
                        </p>
                    </div>
                </div>
            </div>
        </footer>

        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

        <script type="text/javascript" src="<c:url value="/resources/web/js/jquery.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/web/js/jquery-migrate-3.0.1.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/web/js/popper.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/web/js/bootstrap.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/web/js/jquery.easing.1.3.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/web/js/jquery.waypoints.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/web/js/jquery.stellar.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/web/js/owl.carousel.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/web/js/jquery.magnific-popup.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/web/js/aos.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/web/js/jquery.animateNumber.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/web/js/bootstrap-datepicker.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/web/js/jquery.timepicker.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/web/js/scrollax.min.js" />"></script>
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script type="text/javascript" src="<c:url value="/resources/web/js/google-map.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/web/js/main.js" />"></script>
    </body>
</html>