<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/intranet" %>

<t:mainLayout pageTitle="Pizzeria - Mantenimiento Coberturas">
    <jsp:attribute name="pageScripts">
        <script src="<c:url value="/resources/intranet/js/mantCoberturas.js" />"></script>
    </jsp:attribute>
    <jsp:body>
        <t:mainWrapper contentTitle="Mantenimiento">

            <ul class="nav nav-tabs" id="tMantenimiento" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="fCobertura" data-toggle="tab" href="#cobertura" role="tab" aria-controls="personal" aria-selected="true">Coberturas</a>
                </li>
            </ul>
            <div class="tab-content mt-3" id="myTabContent">
                <div class="tab-pane fade show active" id="cobertura" role="tabpanel" aria-labelledby="fCobertura">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-8">
                                <h4>Lista de Coberturas</h4>
                            </div>
                            <div class="col-4">
                                <button class="btn btn-success float-right" data-toggle="modal" data-target="#mCobertura" data-op="new">+ Agregar Nuevo</button>
                            </div>
                        </div>  
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">#</th>
                                        <th scope="col">Nombre</th>
                                        <th scope="col">Cobertura</th>
                                    </tr>
                                </thead>
                                <tbody id="tbodyLstCobertura"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!--###
                Modals
            ###-->

            <!-- Personal -->
            <div class="modal fade" id="mCobertura" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="mCoberturaLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="mCoberturaLabel">Cobertura</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="frmCobertura" >
                                <input type="hidden" id="txtCoberturaId" />
                                <input type="hidden" id="txtCoberturaOp" />
                                <div class="form-group row">
                                    <label for="txtDistritoNombres" class="col-sm-4 col-form-label">Distrito</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="txtDistritoNombres" maxlength="150" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Cobertura</label>
                                    <div class="col-sm-8">
                                       <input class="form-check-input" type="checkbox" value="" id="chkCobertura"  checked/>
                                       <label class="form-check-label" for="chkCobertura">Activo</label>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">x Close</button>
                            <button type="button" class="btn btn-primary" id="btnCoberturaGuardar" >Guardar</button>
                        </div>
                    </div>
                </div>
            </div>
        </t:mainWrapper>
    </jsp:body>
</t:mainLayout>