<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/intranet" %>

<t:mainLayout pageTitle="Pizzeria - Mantenimiento Personal">
    <jsp:attribute name="pageScripts">
        <script src="<c:url value="/resources/intranet/js/mantPersonalPersona.js" />"></script>
        <script src="<c:url value="/resources/intranet/js/mantPersonalTipoPersona.js" />"></script>
        <script src="<c:url value="/resources/intranet/js/mantPersonalRoles.js" />"></script>
    </jsp:attribute>
    <jsp:body>
        <t:mainWrapper contentTitle="Mantenimiento">

            <ul class="nav nav-tabs" id="tMantenimiento" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="fPersonal" data-toggle="tab" href="#personal" role="tab" aria-controls="personal" aria-selected="true">Personal</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="fTipoPersona" data-toggle="tab" href="#tipo-persona" role="tab" aria-controls="tipo-persona" aria-selected="false">Tipo Persona</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="fRoles" data-toggle="tab" href="#roles" role="tab" aria-controls="roles" aria-selected="false">Roles</a>
                </li>
            </ul>
            <div class="tab-content mt-3" id="myTabContent">
                <div class="tab-pane fade show active" id="personal" role="tabpanel" aria-labelledby="fPersonal">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-8">
                                <h4>Lista de Personal</h4>
                            </div>
                            <div class="col-4">
                                <button class="btn btn-success float-right" data-toggle="modal" data-target="#mPersonal" data-op="new">+ Agregar Nuevo</button>
                            </div>
                        </div>

                        <form id="frmPLBusqueda" class="form-inline my-3">
                            <div class="row">
                                <div class="col">
                                    <label class="my-1">Documento</label>
                                </div>
                                <div class="col">
                                    <select id="cboPLTipoDocumento" class="custom-select mr-2">
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
                                    <input type="text" id="txtPLDocumento" class="form-control mr-2" maxlength="15" />
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
                                        <th scope="col">#</th>
                                        <th scope="col">Nombres</th>
                                        <th scope="col">Teléfono</th>
                                        <th scope="col">Estado</th>
                                    </tr>
                                </thead>
                                <tbody id="tbodyLstPersona"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="tipo-persona" role="tabpanel" aria-labelledby="fTipoPersona">
                    <div class="container-fluid">
                        <div class="row my-2">
                            <div class="col-md-8">
                                <h4>Tipo de Personal</h4>
                            </div>
                            <div class="col-4">
                                <button class="btn btn-success float-right" data-toggle="modal" data-target="#mTipoPersonal" data-op="new">+ Agregar Nuevo</button>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">#</th>
                                        <th scope="col">Nombre</th>
                                    </tr>
                                </thead>
                                <tbody id="tbodyLstTipoPersona"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="roles" role="tabpanel" aria-labelledby="fRoles">

                    <div class="container-fluid">
                        <div class="row my-2">
                            <div class="col-md-8">
                                <h4>Roles</h4>
                            </div>
                            <div class="col-4">
                                <button class="btn btn-success float-right" data-toggle="modal" data-target="#mRoles" data-op="new">+ Agregar Nuevo</button>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">#</th>
                                        <th scope="col">Nombre</th>
                                    </tr>
                                </thead>
                                <tbody id="tbodyLstRol"></tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>

            <!--###
                Modals
            ###-->

            <!-- Personal -->
            <div class="modal fade" id="mPersonal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="mPersonalLabel" aria-hidden="true">
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
                                <input type="hidden" id="txtPersonaId" />
                                <input type="hidden" id="txtPersonaOp" />
                                <div class="form-group row">
                                    <label for="txtPersonaNombres" class="col-sm-4 col-form-label">Nombres</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtPersonaNombres" maxlength="150" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="txtPersonaApellidos" class="col-sm-4 col-form-label">Apellidos</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtPersonaApellidos" maxlength="150" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="txtPersonaTelefono" class="col-sm-4 col-form-label">Teléfono</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtPersonaTelefono" maxlength="150" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="txtPersonaCelular" class="col-sm-4 col-form-label">Celular</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtPersonaCelular" maxlength="15" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="cboPersonaTipoDocumento" class="col-sm-4 col-form-label">Tipo de documento</label>
                                    <div class="col-sm-8">
                                        <select id="cboPersonaTipoDocumento" class="custom-select">
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
                                    <label for="txtPersonaDocumento" class="col-sm-4 col-form-label">Nro. documento</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtPersonaDocumento" maxlength="15" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="cboPersonaTipoPersona" class="col-sm-4 col-form-label">Tipo Persona</label>
                                    <div class="col-sm-8">
                                        <select id="cboPersonaTipoPersona" class="custom-select">
                                            <c:forEach
                                                items="${tpers}"
                                                var="tper"
                                                >
                                                <option value="${tper.idTipoPersona}">${tper.nombre}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="cboPersonaEstado" class="col-sm-4 col-form-label">Estado</label>
                                    <div class="col-sm-8">
                                        <select id="cboPersonaEstado" class="custom-select">
                                            <c:forEach
                                                items="${epers}"
                                                var="eper"
                                                >
                                                <option value="${eper.idEstado}">${eper.nombre}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">x Close</button>
                            <button type="button" class="btn btn-primary" id="btnPersonaGuardar" >Guardar</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Tipo Persona -->
            <div class="modal fade" id="mTipoPersonal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="mTipoPersonallLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="mTipoPersonalLabel">Tipo Personal</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="frmTipoPersonal" >
                                <input type="hidden" id="txtTipoPersonaId" />
                                <input type="hidden" id="txtTipoPersonaOp" />
                                <div class="form-group row">
                                    <label for="txtTipoPersonaNombres" class="col-sm-4 col-form-label">Nombres</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtTipoPersonaNombres" maxlength="50" />
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">x Close</button>
                            <button type="button" class="btn btn-primary" id="btnTipoPersonaGuardar" >Guardar</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Roles -->
            <div class="modal fade" id="mRoles" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="mRoleslLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="mRolesLabel">Roles</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <form id="frmRol">
                                    <input type="hidden" id="txtRolId" />
                                    <input type="hidden" id="txtRolOp" />
                                    <div class="form-group row">
                                        <label for="txtRol" class="col-sm-2 col-form-label">Nombre</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="txtRolNombres">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Formularios</label>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-sm-2"></div>
                                        <label class="col-sm-10 col-form-label">check</label>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">x Close</button>
                            <button type="button" class="btn btn-primary" id="btnRolGuardar">Guardar</button>
                        </div>
                    </div>
                </div>
            </div>
        </t:mainWrapper>
    </jsp:body>
</t:mainLayout>