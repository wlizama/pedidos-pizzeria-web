<%-- 
    Document   : clienteView
    Created on : 05/11/2021, 10:09:15 PM
    Author     : jonas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/intranet" %>

<t:mainLayout pageTitle="Pizzeria - Mantenimiento Cliente">
    <t:mainWrapper contentTitle="Mantenimiento">       
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <div class="row justify-content-start">
                        <div class="col-md-8"><h4>Lista de Clientes</h4></div>
                    </div>
                    <form class="form-inline my-3">
                        <div class="row">
                            <div class="col">
                                <label class="my-1">Cliente</label>
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
                                    <th scope="col">Doc</th>
                                    <th scope="col">Cliente</th>
                                    <th scope="col"></th>
                                    <th scope="col">Telefono</th>
                                    <th scope="col">Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th>1</th>
                                    <td>Mark</td>
                                    <td colspan="2">Otto</td>
                                    <td>Otto</td>
                                    <td><button type="button" class="btn btn-light"><i class="fas fa-pen"></i></button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>                    
                </div>                
                <div class="col-sm-6 border-left-secondary">
                    <div class="col-md-12">
                        <h4>Datos del Cliente</h4>
                    </div>
                    <div class="col-sm-12">
                        <form class="my-3">                            
                            <div class="row mb-3">
                                <label for="inputEmail3" class="col-sm-3 col-form-label">Nombre</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="inputEmail3">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputEmail3" class="col-sm-3 col-form-label">Apellido</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="inputEmail3">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputEmail3" class="col-sm-3 col-form-label">Telefono</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="inputEmail3">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputEmail3" class="col-sm-3 col-form-label">Tipo de Doc.</label>
                                <div class="col-sm-3">
                                    <select class="custom-select mr-2">
                                        <option selected>Seleccionar</option>
                                        <option value="1">One</option>
                                        <option value="2">Two</option>
                                        <option value="3">Three</option>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="inputEmail3">
                                </div>
                            </div>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <button type="button" class="btn btn-lg" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"><i class="fas fa-plus"></i></button>
                            </div>                            
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
                                                <button type="button" class="btn btn-light" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"><i class="fas fa-pen"></i></button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>                            
                            <button type="submit" class="btn btn-primary">Guardar</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>       

        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
</t:mainLayout>