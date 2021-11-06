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
                            <button class="btn btn-success float-right">+ Agregar Nuevo</button>
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
                                    <th scope="col">#</th>
                                    <th scope="col">Nombres</th>
                                    <th scope="col">Teléfono</th>
                                    <th scope="col">Estado</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th>1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>Otto</td>
                                    <td><button type="button" class="btn btn-light"><i class="fas fa-pen"></i></button></td>
                                </tr>
                                <tr>
                                    <th>1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>Otto</td>
                                    <td><button type="button" class="btn btn-light"><i class="fas fa-pen"></i></button></td>
                                </tr>
                                <tr>
                                    <th>1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>Otto</td>
                                    <td><button type="button" class="btn btn-light"><i class="fas fa-pen"></i></button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="tipo-persona" role="tabpanel" aria-labelledby="fTipoPersona">.2.</div>
            <div class="tab-pane fade" id="roles" role="tabpanel" aria-labelledby="fRoles">.3.</div>
        </div>
        
    </t:mainWrapper>
</t:mainLayout>