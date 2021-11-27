<%-- 
    Document   : clienteView
    Created on : 05/11/2021, 10:09:15 PM
    Author     : jonas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/intranet" %>

<t:mainLayout pageTitle="Pizzeria - Mantenimiento Pizza">
    <jsp:body>
        <t:mainWrapper contentTitle="Mantenimiento">       

            <div class="tab-content mt-3" id="myTabContent">
                <div class="tab-pane fade show active" id="pizza" role="tabpanel" aria-labelledby="fProducto">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-8">
                                <h4>Lista de Productos</h4>
                            </div>
                            <div class="col-4">
                                <button class="btn btn-success float-right" data-toggle="modal" data-target="#mProducto" data-op="new">+ Agregar Nuevo</button>
                            </div>
                        </div>

                        <form id="frmPABusqueda" class="form-inline my-3">
                            <div class="row">
                                <div class="col">
                                    <label class="my-1">Tipo</label>
                                </div>
                                <div class="col">
                                    <select id="cboPRTipo" class="custom-select mr-2">
                                        <option value="0" selected>Elegir el tipo de producto</option>
                                    </select>
                                </div>
                                <div class="col">
                                    <label class="my-1">Nombre</label>
                                </div>
                                <div class="col">
                                    <input type="text" class="form-control" id="txtProductoNombre" maxlength="150" />
                                </div>
                                <div class="col">
                                    <button id="btnPABuscar" type="submit" class="btn btn-primary">Buscar</button>
                                </div>
                            </div>
                        </form>

                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead class="thead-dark">
                                    <tr>                                        
                                        <th scope="col"></th>
                                        <th scope="col">Id</th>
                                        <th scope="col">Nombres</th>
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
                                    <label for="cboProductoTipo" class="col-sm-4 col-form-label">Tipo</label>
                                    <div class="col-sm-8">
                                        <select id="cboProductoTipo" class="custom-select">
                                            <option selected>Seleccionar tipo de pizza</option>                                            
                                        </select>
                                    </div>
                                </div>                                
                                <div class="form-group row">
                                    <label for="cboProductoEstado" class="col-sm-4 col-form-label">Estado</label>
                                    <div class="col-sm-8">
                                        <select id="cboProductoEstado" class="custom-select">
                                            <option selected>Seleccionar estado</option>
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
                                        <img id="ProductoImagen" class="img-fluid" src="" />
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">x Close</button>
                            <button type="button" class="btn btn-primary" id="btnPizzaGuardar" >Guardar</button>
                        </div>
                    </div>
                </div>
            </div>    
            <script type="text/javascript">
            var imagen;
            function cargarImagen(){
              imagen=document.getElementById("txtProductoImagen").value;
              document.getElementById("ProductoImagen").src=imagen;
            }            
            </script>
        </t:mainWrapper>
    </jsp:body>
</t:mainLayout>