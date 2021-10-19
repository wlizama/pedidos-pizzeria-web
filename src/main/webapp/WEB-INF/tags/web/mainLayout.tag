<%@tag description="Layout principal" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="pageTitle" required="true"%>


<%-- https://stackoverflow.com/questions/1296235/jsp-tricks-to-make-templating-easier --%>


<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>${pageTitle}</title>
    <head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container">
                    <a  href="./" class="navbar-brand">
                        <img src="https://via.placeholder.com/140x100" alt="" />
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#nvToggler" aria-controls="nvToggler" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    
                    <div class="collapse navbar-collapse" id="nvToggler">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active"><a href="./" class="nav-link">Home</a></li>
                            <li class="nav-item"><a href="./pizzas" class="nav-link">Pizzas</a></li>
                            <li class="nav-item"><a href="./productos" class="nav-link">Productos</a></li>
                            <li class="nav-item"><a href="./nosotros" class="nav-link">Nosotros</a></li>
                            <li class="nav-item"><a href="./registro" class="nav-link">Registrarme / Login</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        
        <main>
            <jsp:doBody />
        </main>
        
        <footer class="text-center text-white fixed-bottom bg-dark">
            <div class="container p-4">
                <section class="mb-4">
                    <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button" style="background-color: #3b5998;">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button" style="background-color: #55acee;">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button" style="background-color: #EA0C5F;">
                        <i class="fab fa-instagram"></i>
                    </a>
                </section>
            </div>

            <div class="text-center p-3">
                © 2021 Copyright. All rights reserved.
            </div>
        </footer>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    </body>
</html>