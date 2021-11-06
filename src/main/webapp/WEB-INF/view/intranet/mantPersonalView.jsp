<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/intranet" %>

<t:mainLayout pageTitle="Pizzeria - Mantenimiento Personal">
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
                            <button class="btn btn-success float-right" data-toggle="modal" data-target="#mPersonal">+ Agregar Nuevo</button>
                        </div>
                    </div>
                    
                    <form class="form-inline my-3">
                        <div class="row">
                            <div class="col">
                                <label class="my-1">Personal</label>
                            </div>
                            <div class="col">
                                <select class="custom-select mr-2">
                                    <option selected>Open this select menu</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                                </select>
                            </div>
                            <div class="col">
                                <input type="text" id="txtDocumento" class="form-control mr-2" />
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
                                    <th scope="col"></th>
                                    <th scope="col">#</th>
                                    <th scope="col">Nombres</th>
                                    <th scope="col">Teléfono</th>
                                    <th scope="col">Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <button type="button" class="btn btn-light" data-toggle="modal" data-target="#mPersonal"><i class="fas fa-pen"></i></button>
                                    </td>
                                    <th>1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>Otto</td>
                                </tr>
                                <tr>
                                    <td>
                                        <button type="button" class="btn btn-light" data-toggle="modal" data-target="#mPersonal"><i class="fas fa-pen"></i></button>
                                    </td>
                                    <th>1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>Otto</td>
                                </tr>
                                <tr>
                                    <td>
                                        <button type="button" class="btn btn-light" data-toggle="modal" data-target="#mPersonal"><i class="fas fa-pen"></i></button>
                                    </td>
                                    <th>1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>Otto</td>
                                </tr>
                            </tbody>
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
                            <button class="btn btn-success float-right" data-toggle="modal" data-target="#mTipoPersonal">+ Agregar Nuevo</button>
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
                            <tbody>
                                <tr>
                                    <td>
                                        <button type="button" class="btn btn-light" data-toggle="modal" data-target="#mTipoPersonal"><i class="fas fa-pen"></i></button>
                                    </td>
                                    <th>1</th>
                                    <td>rr</td>
                                </tr>
                            </tbody>
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
                            <button class="btn btn-success float-right" data-toggle="modal" data-target="#mRoles">+ Agregar Nuevo</button>
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
                            <tbody>
                                <tr>
                                    <td>
                                        <button type="button" class="btn btn-light" data-toggle="modal" data-target="#mRoles"><i class="fas fa-pen"></i></button>
                                    </td>
                                    <th>1</th>
                                    <td>dd</td>
                                </tr>
                                <tr>
                                    <td>
                                        <button type="button" class="btn btn-light" data-toggle="modal" data-target="#mRoles"><i class="fas fa-pen"></i></button>
                                    </td>
                                    <th>2</th>
                                    <td>dd</td>
                                </tr>
                                <tr>
                                    <td>
                                        <button type="button" class="btn btn-light" data-toggle="modal" data-target="#mRoles"><i class="fas fa-pen"></i></button>
                                    </td>
                                    <th>3</th>
                                    <td>dd</td>
                                </tr>
                            </tbody>
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
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">x Close</button>
                        <button type="button" class="btn btn-primary">Guardar</button>
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
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">x Close</button>
                        <button type="button" class="btn btn-primary">Guardar</button>
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
                            <form>
                                <div class="form-group row">
                                    <label for="txtRol" class="col-sm-2 col-form-label">Nombre</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="txtRol">
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
                        <button type="button" class="btn btn-primary">Guardar</button>
                    </div>
                </div>
            </div>
        </div>
        
    </t:mainWrapper>
</t:mainLayout>