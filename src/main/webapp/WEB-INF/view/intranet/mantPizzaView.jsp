<%-- 
    Document   : clienteView
    Created on : 05/11/2021, 10:09:15 PM
    Author     : jonas
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/intranet" %>

<t:mainLayout pageTitle="Pizzeria - Mantenimiento Pizza">
    <jsp:attribute name="pageScripts">        
        <script src="<c:url value="/resources/intranet/js/mantPizzaTipoPizza.js" />"></script>
        <script src="<c:url value="/resources/intranet/js/mantPizzaTamanho.js" />"></script>
    </jsp:attribute>
    <jsp:body>
        <t:mainWrapper contentTitle="Mantenimiento">       
            <ul class="nav nav-tabs" id="tMantenimiento" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="fPizza" data-toggle="tab" href="#pizza" role="tab" aria-controls="pizza" aria-selected="true">Pizza</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="fTamanho" data-toggle="tab" href="#tamanho" role="tab" aria-controls="tamanho" aria-selected="false">Tamaño</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="fTipo" data-toggle="tab" href="#tipo-pizza" role="tab" aria-controls="tipo-pizza" aria-selected="false">Tipo</a>
                </li>
            </ul>
            <div class="tab-content mt-3" id="myTabContent">
                <div class="tab-pane fade show active" id="pizza" role="tabpanel" aria-labelledby="fPizza">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-8">
                                <h4>Lista de Pizzas</h4>
                            </div>
                            <div class="col-4">
                                <button class="btn btn-success float-right" data-toggle="modal" data-target="#mPizza" data-op="new">+ Agregar Nuevo</button>
                            </div>
                        </div>

                        <form id="frmPABusqueda" class="form-inline my-3">
                            <div class="row">
                                <div class="col">
                                    <label class="my-1">Tipos</label>
                                </div>
                                <div class="col">
                                    <select id="cboPATipoPizza" class="custom-select mr-2">
                                        <option value="0" selected>Elegir el tipo de pizza</option>
                                    </select>
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
                                        <th scope="col">Id</th>
                                        <th scope="col">Nombres</th>
                                        <th scope="col">Tipo</th>
                                        <th scope="col">Tamaño</th>
                                        <th scope="col">Precio</th>
                                        <th scope="col">Estado</th>
                                    </tr>
                                </thead>
                                <tbody id="tbodyLstPizza"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="tamanho" role="tabpanel" aria-labelledby="fTamanho">
                    <div class="container-fluid">
                        <div class="row my-2">
                            <div class="col-md-8">
                                <h4>Tamaño</h4>
                            </div>
                            <div class="col-4">
                                <button class="btn btn-success float-right" data-toggle="modal" data-target="#mTamanho">+ Agregar Nuevo</button>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">Id</th>                                        
                                        <th scope="col">Nombre</th>
                                        <th scope="col">Porciones</th>
                                    </tr>
                                </thead>
                                <tbody id="tbodyLstTamanho">                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="tipo-pizza" role="tabpanel" aria-labelledby="fTipoPizza">

                    <div class="container-fluid">
                        <div class="row my-2">
                            <div class="col-md-8">
                                <h4>Tipo</h4>
                            </div>
                            <div class="col-4">
                                <button class="btn btn-success float-right" data-toggle="modal" data-target="#mTipoPizza">+ Agregar Nuevo</button>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">Id</th>
                                        <th scope="col">Nombre</th>
                                        <th scope="col">Descripción</th>
                                    </tr>
                                </thead>
                                <tbody id="tbodyLstTipoPizza"></tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>

            <!--###
                Modals
            ###-->

            <!-- Pizza -->
            <div class="modal fade" id="mPizza" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="mPizzaLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="mPizzaLabel">Pizzas</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="frmPizza" >
                                <input type="hidden" id="txtPizzaId" />
                                <input type="hidden" id="txtPizzaOp" />
                                <div class="form-group row">
                                    <label for="txtPizzaNombre" class="col-sm-4 col-form-label">Nombre</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtPizzaNombre" maxlength="150" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="txtPizzaPrecio" class="col-sm-4 col-form-label">Precio</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtPizzaPrecio" maxlength="150" />
                                    </div>
                                </div>                                
                                <div class="form-group row">
                                    <label for="cboPizzaTipo" class="col-sm-4 col-form-label">Tipo</label>
                                    <div class="col-sm-8">
                                        <select id="cboPizzaTipo" class="custom-select">
                                            <option selected>Seleccionar tipo de pizza</option>                                            
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="cboPizzaTamanho" class="col-sm-4 col-form-label">Tamaño</label>
                                    <div class="col-sm-8">
                                        <select id="cboPizzaTamanho" class="custom-select">
                                            <option selected>Seleccionar tamaño</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="cboPizzaEstado" class="col-sm-4 col-form-label">Estado</label>
                                    <div class="col-sm-8">
                                        <select id="cboPizzaEstado" class="custom-select">
                                            <option selected>Seleccionar estado</option>
                                        </select>
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

            <!-- Tamaño -->
            <div class="modal fade" id="mTamanho" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="mTamanhoLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="mTamanhoLabel">Tamaño</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="frmTamanho" >
                                <input type="hidden" id="txtTamanhoId" />
                                <input type="hidden" id="txtTamanhoOp" />
                                <div class="form-group row">
                                    <label for="txtTamanhoNombre" class="col-sm-4 col-form-label">Nombre</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtTamanhoNombre" maxlength="150" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="txtTamanhoPorciones" class="col-sm-4 col-form-label">Cant. Porciones</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtTamanhoPorciones" maxlength="150" />
                                    </div>
                                </div>                                
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">x Close</button>
                            <button type="button" class="btn btn-primary" id="btnTamanhoGuardar">Guardar</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Tipo -->
            <div class="modal fade" id="mTipoPizza" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="mTipooLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="mTipoLabel">Tipo</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <form id="frmTipo" >
                                <input type="hidden" id="txtTipoId" />
                                <input type="hidden" id="txtTipoOp" />
                                <div class="form-group row">
                                    <label for="txtTipoNombre" class="col-sm-4 col-form-label">Nombre</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtTipoNombre" maxlength="150" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="txtTipoDescripcion" class="col-sm-4 col-form-label">Descripción</label>
                                    <div class="col-sm-8">
                                        <textarea class="form-control" id="txtTipoDescripcion" rows="3" maxlength="350"></textarea>
                                    </div>
                                </div>                                
                            </form>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">x Close</button>
                            <button type="button" class="btn btn-primary" id="btnTipoPizzaGuardar">Guardar</button>
                        </div>
                    </div>
                </div>
            </div>               
        </t:mainWrapper>
    </jsp:body>
</t:mainLayout>