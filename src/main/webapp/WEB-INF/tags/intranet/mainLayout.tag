<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@tag description="Layout principal" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="pageTitle" required="true"%>
<% 
                HttpSession sesion = request.getSession();
            %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Custom fonts for this template-->
        <link rel="stylesheet" href="<c:url value="/resources/intranet/css/fontawesome-free-all.min.css" />" >
        <link rel="stylesheet" href="<c:url value="/resources/web/css/flaticon.css" />">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" >

        <!-- Custom styles for this template-->
        <link rel="stylesheet" href="<c:url value="/resources/intranet/css/sb-admin-2.min.css" />" >

        <title>${pageTitle}</title>
    </head>
    <body>

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value="/intranet" />">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <span class="flaticon-pizza-1"></span>
                    </div>
                    <div class="sidebar-brand-text mx-3">Pizzeria<br><small>Buongiorno</small></div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">
                
                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#mnpedidos"
                        aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-sticky-note"></i>
                        <span>Pedidos</span>
                    </a>
                    <div id="mnpedidos" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="<c:url value="/intranet/pedidos" />">Lista de pedidos</a>
                            <a class="collapse-item" href="<c:url value="/intranet/comprobantes" />">Comprobantes</a>
                        </div>
                    </div>
                </li>

                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#mndelivery"
                        aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-motorcycle"></i>
                        <span>Delivery</span>
                    </a>
                    <div id="mndelivery" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="<c:url value="/intranet/envios" />">Lista de envios</a>
                        </div>
                    </div>
                </li>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#mnmantenimiento"
                        aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-wrench"></i>
                        <span>Mantenimiento</span>
                    </a>
                    <div id="mnmantenimiento" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="<c:url value="/intranet/mant-clientes" />">Clientes</a>
                            <a class="collapse-item" href="<c:url value="/intranet/mant-productos" />">Productos</a>
                            <a class="collapse-item" href="<c:url value="/intranet/mant-personal" />">Personal</a>
                            <a class="collapse-item" href="<c:url value="/intranet/mant-cobertura" />">Cobertura</a>
                        </div>
                    </div>
                </li>
                
                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#mnreportes"
                        aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-list-ol"></i>
                        <span>Reportes</span>
                    </a>
                    <div id="mnreportes" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="<c:url value="/intranet/reporte-ventas" />">Reporte de ventas</a>
                            <a class="collapse-item" href="<c:url value="/intranet/reporte-productos" />">Reporte Productos</a>
                            <a class="collapse-item" href="<c:url value="/intranet/reporte-cobertura" />">Reporte de Cobertura</a>
                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%= sesion.getAttribute("nombre") %></span>
                                    <img class="img-profile rounded-circle"
                                         src="<c:url value="/resources/intranet/img/undraw_profile.svg" />">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    
                                    <div class="dropdown-divider"></div>
                                    
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>
                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <jsp:doBody />
                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; 2021 Todos los derechos reservados.</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="./login?cerrar=true">Logout</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JavaScript-->
        <script src="<c:url value="/resources/intranet/js/jquery.min.js" />"></script>
        <script src="<c:url value="/resources/intranet/js/bootstrap.bundle.min.js" />"></script>
        <script src="<c:url value="/resources/intranet/js/sb-admin-2.min.js" />"></script>

    </body>
</html>