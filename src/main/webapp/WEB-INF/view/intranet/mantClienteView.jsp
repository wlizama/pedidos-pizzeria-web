<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/intranet" %>

<t:mainLayout pageTitle="Pizzeria - Mantenimiento Cliente">
    <jsp:attribute name="pageScripts">
        <script src="<c:url value="/resources/intranet/js/mantCliente.js" />"></script>
    </jsp:attribute>
    <jsp:body>
        <t:mainWrapper contentTitle="Mantenimiento">       
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="row">
                            <div class="col-md-8">
                                <h4>Lista de Clientes</h4>
                            </div>
                            <div class="col-md-4">
                                <button class="btn btn-success float-right" data-toggle="modal" data-target="#mCliente" data-op="new">+ Agregar Nuevo</button>
                            </div>
                        </div>
                        <form id="frmCLBusqueda" class="form-inline my-3">
                            <div class="row">
                                <div class="col">
                                    <label class="my-1">Documento</label>
                                </div>
                                <div class="col">
                                    <select id="cboCLTipoDocumento" class="custom-select mr-2">
                                        <option value="0" selected>( Todos )</option>
                                        <c:forEach
                                            items="${tdocs}"
                                            var="tdo"
                                            >
                                            <option value="${tdo.idTipoDocIdentidad}">${tdo.nombre}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col">
                                    <input type="text" id="txtCLDocumento" class="form-control mr-2" />
                                </div>
                                <div class="col">
                                    <button type="submit" class="btn btn-primary">Buscar</button>
                                </div>
                            </div>
                        </form>                
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Doc</th>
                                        <th scope="col">Cliente</th>
                                        <th scope="col">Telefono</th>
                                        <th scope="col">Estado</th>
                                    </tr>
                                </thead>
                                <tbody id="tbodyLstCliente"></tbody>
                            </table>
                        </div>                    
                    </div>                
                    
                </div>
            </div>
            
            <div class="modal fade" id="mCliente" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="mClienteLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="mPersonalLabel">Personal</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="frmPersonal" >
                                <input type="hidden" id="txtClienteId" />
                                <input type="hidden" id="txtClienteOp" />
                                <div class="form-group row">
                                    <label for="txtPersonaNombres" class="col-sm-4 col-form-label">Nombre</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtNombres" maxlength="150" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="txtApellidos" class="col-sm-4 col-form-label">Apellidos</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtApellidos" maxlength="150" >
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="txtTelefono" class="col-sm-4 col-form-label">Telefono</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtTelefono" maxlength="10" >
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="txtCelular" class="col-sm-4 col-form-label">Celular</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtCelular" maxlength="10" >
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="cboTipoDocumento" class="col-sm-4 col-form-label">Tipo de Doc.</label>
                                    <div class="col-sm-8">
                                        <select id="cboTipoDocumento" class="custom-select mr-2">
                                            <c:forEach
                                                items="${tdocs}"
                                                var="tdo"
                                                >
                                                <option value="${tdo.idTipoDocIdentidad}">${tdo.nombre}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="txtNroDocumento" class="col-sm-4 col-form-label">Nro de Doc.</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtNroDocumento">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <button type="button" class="btn btn-success d-inline-block " data-toggle="modal" data-target="#exampleModal" data-op="new"><i class="fas fa-plus"></i> Agregar dirección</button>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <div class="table-responsive">
                                            <table class="table table-striped">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Dirección</th>
                                                        <th scope="col">Referencia</th>
                                                        <th scope="col">Por defecto</th>
                                                        <th scope="col">Editar</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th scope="row">1</th>
                                                        <td>Av. San Luis 461</td>
                                                        <td>Cerca a un colegio</td>
                                                        <td>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-light" data-toggle="modal" data-target="#mClienteDireccion" data-whatever="@mdo"><i class="fas fa-pen"></i></button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                
                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="mClienteDireccion" tabindex="-1" aria-labelledby="mClienteDireccion" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Agregar/Modificar Dirección</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="mb-3">
                                    <label for="recipient-name" class="col-form-label">Cliente:</label>
                                    <input type="text" class="form-control" id="recipient-name">
                                </div>
                                <div class="mb-3">
                                    <label for="recipient-name" class="col-form-label">Dirección:</label>
                                    <input type="text" class="form-control" id="recipient-name">
                                </div>
                                <div class="mb-3">
                                    <label for="recipient-name" class="col-form-label">Referencia:</label>
                                    <input type="text" class="form-control" id="recipient-name">
                                </div>
                                <div class="mb-3">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
                                        <label class="form-check-label" for="flexSwitchCheckDefault">Dirección por defecto</label>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-primary">Guardar</button>
                        </div>
                    </div>
                </div>
            </div>                
        </t:mainWrapper>
    </jsp:body>
</t:mainLayout>