<%-- 
    Document   : clienteView
    Created on : 05/11/2021, 10:09:15 PM
    Author     : jonas
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/intranet" %>

<t:mainLayout pageTitle="Pizzeria - Mantenimiento Producto">
    <jsp:attribute name="pageScripts">
        <script src="<c:url value='/resources/intranet/js/mantProducto.js' />"></script>
    </jsp:attribute>
    <jsp:body>
        <t:mainWrapper contentTitle="Mantenimiento">       

            <div class="tab-content mt-3" id="myTabContent">
                <div class="tab-pane fade show active" id="producto" role="tabpanel" aria-labelledby="fProducto">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-8">
                                <h4>Lista de Productos</h4>
                            </div>
                            <div class="col-4">
                                <button class="btn btn-success float-right" data-toggle="modal" data-target="#mProducto" data-op="new">+ Agregar Nuevo</button>
                            </div>
                        </div>

                        <form id="frmPLBusqueda" class="form-inline my-3">
                            <div class="row">
                                <div class="col">
                                    <label class="my-1">Tipo</label>
                                </div>
                                <div class="col">
                                    <select id="cboPLTipoProducto" class="custom-select mr-2">
                                        <option value="0" selected>( Todos )</option>
                                        <c:forEach
                                            items="${tprod}"
                                            var="tdo"
                                            >
                                            <option value="${tdo.idTipoProducto}">${tdo.nombre}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col">
                                    <label class="my-1">Nombre</label>
                                </div>
                                <div class="col">
                                    <input type="text" class="form-control" id="txtProductoNombre2" maxlength="150" />
                                </div>
                                <div class="col">
                                    <button id="btnPLBuscar" type="submit" class="btn btn-primary">Buscar</button>
                                </div>
                            </div>
                        </form>

                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead class="thead-dark">
                                    <tr>                                        
                                        <th scope="col"></th>
                                        <th scope="col">Id</th>
                                        <th scope="col">Nombre</th>
                                        <th scope="col">Descripción</th>
                                        <th scope="col">Precio</th>
                                        <th scope="col">Tipo</th>
                                        <th scope="col">Estado</th>
                                    </tr>
                                </thead>
                                <tbody id="tbodyLstProducto"></tbody>
                            </table>
                        </div>
                    </div>
                </div>                                
            </div>

            <!--###
                Modals
            ###-->

            <!-- Producto -->
            <div class="modal fade" id="mProducto" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="mProductoLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="mProductoLabel">Producto</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="frmProducto" >
                                <input type="hidden" id="txtProductoId" />
                                <input type="hidden" id="txtProductoOp" />
                                <div class="form-group row">
                                    <label for="txtProductoNombre" class="col-sm-4 col-form-label">Nombre</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtProductoNombre" maxlength="150" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="txtProductoDescripcion" class="col-sm-4 col-form-label">Descripción</label>
                                    <div class="col-sm-8">
                                        <textarea class="form-control" id="txtProductoDescripcion" rows="3" maxlength="350"></textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="txtProductoPrecio" class="col-sm-4 col-form-label">Precio</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtProductoPrecio" maxlength="150" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="cboProductoTipoProducto" class="col-sm-4 col-form-label">Tipo</label>
                                    <div class="col-sm-8">
                                       <select id="cboProductoTipoProducto" class="custom-select">
                                            <c:forEach
                                                items="${tprod}"
                                                var="tdo"
                                                >
                                                <option value="${tdo.idTipoProducto}">${tdo.nombre}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>                                
                                <div class="form-group row">
                                    <label for="cboProductoEstado" class="col-sm-4 col-form-label">Estado</label>
                                    <div class="col-sm-8">
                                        <select id="cboProductoEstado" class="custom-select">
                                            <c:forEach
                                                items="${eprod}"
                                                var="eper"
                                                >
                                                <option value="${eper.idEstado}">${eper.nombre}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="txtProductoImagen" class="col-sm-4 col-form-label">Imagen Url</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtProductoImagen" maxlength="350" onKeyUp="cargarImagen()"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-12">
                                        <img id="imgProductoImagen" class="img-fluid" src="https://www.themgroup.co.uk/wp-content/uploads/2020/12/landscape-placeholder.png" onerror="this.src = 'https://fotografias-compromiso.atresmedia.com/clipping/cmsimages01/2019/05/29/9B89AC82-4176-4127-89A2-F38F13E0A84E/69.jpg'" />
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">x Close</button>
                            <button type="button" class="btn btn-primary" id="btnProductoGuardar" >Guardar</button>
                        </div>
                    </div>
                </div>
            </div>    
            <script type="text/javascript">

            function cargarImagen(){
              imagen=document.getElementById("txtProductoImagen").value;
              document.getElementById("ProductoImagen").src=imagen;
              if(imagen===""){
                  document.getElementById("ProductoImagen").src="https://www.themgroup.co.uk/wp-content/uploads/2020/12/landscape-placeholder.png";
              }
            }            
            </script>
        </t:mainWrapper>
    </jsp:body>
</t:mainLayout>