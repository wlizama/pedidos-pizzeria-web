/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function buscarListaPersona(evt) {
    if (evt) evt.preventDefault();
    
    xhrSession({
            url: "mant-personal/list-personal", // URL solicitada
            type: "POST" // Método de solicitud
        },
        function (rpt) { // done
            if (rpt.length > 0) {
                var tbodyLstPersona = document.getElementById("tbodyLstPersona");
                tbodyLstPersona.innerHTML = "";
                for (var i = 0; i < rpt.length; i++) {
                    tbodyLstPersona.innerHTML += 
                        "<tr>" +
                            "<td>" +
                                "<button type=\"button\" class=\"btn btn-light\" data-toggle=\"modal\" data-target=\"#mPersonal\" data-id=\"" + rpt[i].idPersona + "\" data-op=\"edit\" >" +
                                    "<i class=\"fas fa-pen\"></i>" +
                                "</button>" +
                            "</td>" +
                            "<th>" + rpt[i].idPersona + "</th>" +
                            "<td>" + rpt[i].nombres + "</td>" +
                            "<td>" + rpt[i].telefono + "</td>" +
                            "<td>" + rpt[i].estado.nombre + "</td>" +
                        "</tr>";
                }
            }
        }
    );
}

function mostrarmPersonal(event) {
    var dataset = event.relatedTarget.dataset;
    document.getElementById("txtPersonaOp").value = dataset.op;
    document.getElementById("frmPersonal").reset();
    if(dataset.op === OP.NEW) {
        document.getElementById("mPersonalLabel").innerHTML = "Personal - Nuevo";
    }
    else if(dataset.op === OP.EDIT) {
        document.getElementById("mPersonalLabel").innerHTML = "Personal - Modificar";
        getPersona(dataset.id);
    }
}

function getPersona(idPersona) {
    
    xhrSession({
        url: "mant-personal/persona/" + idPersona, // URL solicitada
        type: "GET" // Método de solicitud
    },
    function (rpt) { // done
        if (rpt) {
            document.getElementById("txtPersonaId").value = rpt.idPersona;
            document.getElementById("txtPersonaNombres").value = rpt.nombres;
            document.getElementById("txtPersonaApellidos").value = rpt.apellidos;
            document.getElementById("txtPersonaTelefono").value = rpt.telefono;
            document.getElementById("txtPersonaCelular").value = rpt.celular;
            document.getElementById("cboPersonaTipoDocumento").value = rpt.documentoIdentidad.tipoDocumentoIdentidad.idTipoDocIdentidad;
            document.getElementById("txtPersonaDocumento").value = rpt.documentoIdentidad.numero;
            document.getElementById("cboPersonaTipoPersona").value = rpt.tipoPersona.idTipoPersona;
            document.getElementById("cboPersonaEstado").value = rpt.estado.idEstado;
        }
    });
}

function guardarPersona(evt) {
    if (evt) evt.preventDefault();
    
    var op = document.getElementById("txtPersonaOp").value;
//    if(op === OP.NEW)
//        guardarNuevaPersona();
//    else if(op === OP.EDIT)
//        guardarEditarPersona();

    var idPersona = document.getElementById("txtPersonaId").value;
    var nombres = document.getElementById("txtPersonaNombres").value;
    var apellidos = document.getElementById("txtPersonaApellidos").value;
    var telefono = document.getElementById("txtPersonaTelefono").value;
    var celular = document.getElementById("txtPersonaCelular").value;
    var idTipoDocIdentidad = document.getElementById("cboPersonaTipoDocumento").value;
    var numero = document.getElementById("txtPersonaDocumento").value;
    var idTipoPersona = document.getElementById("cboPersonaTipoPersona").value;
    var idEstado = document.getElementById("cboPersonaEstado").value;
    
    xhrSession({
        url: "mant-personal/persona/" + op, // URL solicitada
        type: "POST", // Método de solicitud
        data: {
            idPersona: idPersona,
            nombres: nombres,
            apellidos: apellidos,
            telefono: telefono,
            celular: celular,
            idTipoDocIdentidad: idTipoDocIdentidad,
            numero: numero,
            idTipoPersona: idTipoPersona,
            idEstado: idEstado
        }
    },
    function (rpt, state, xhr) { // done
        if (xhr.status === 200) {
            showConfirmMsg("Guardado correctamente");
            $('#mPersonal').modal("hide");
            buscarListaPersona();
        }
    });
}

function guardarNuevaPersona() {
    console.log("guardar nuevo persona");
//    xhrSession({
//        url: "mant-personal/persona/new", // URL solicitada
//        type: "GET" // Método de solicitud
//    },
//    function (rpt) { // done
//        if (rpt) {
//            document.getElementById("txtPersonaId").value = rpt.idPersona;
//            document.getElementById("txtPersonaNombres").value = rpt.nombres;
//            document.getElementById("txtPersonaApellidos").value = rpt.apellidos;
//            document.getElementById("txtPersonaTelefono").value = rpt.telefono;
//            document.getElementById("txtPersonaCelular").value = rpt.celular;
//            document.getElementById("cboPersonaTipoDocumento").value = rpt.documentoIdentidad.tipoDocumentoIdentidad.idTipoDocIdentidad;
//            document.getElementById("txtPersonaDocumento").value = rpt.documentoIdentidad.numero;
//            document.getElementById("cboPersonaTipoPersona").value = rpt.tipoPersona.idTipoPersona;
//            document.getElementById("cboPersonaEstado").value = rpt.estado.idEstado;
//        }
//    });
}

function guardarEditarPersona() {
    
    var idPersona = document.getElementById("txtPersonaId").value;
    var nombres = document.getElementById("txtPersonaNombres").value;
    var apellidos = document.getElementById("txtPersonaApellidos").value;
    var telefono = document.getElementById("txtPersonaTelefono").value;
    var celular = document.getElementById("txtPersonaCelular").value;
    var idTipoDocIdentidad = document.getElementById("cboPersonaTipoDocumento").value;
    var numero = document.getElementById("txtPersonaDocumento").value;
    var idTipoPersona = document.getElementById("cboPersonaTipoPersona").value;
    var idEstado = document.getElementById("cboPersonaEstado").value;
    
    xhrSession({
        url: "mant-personal/persona/edit", // URL solicitada
        type: "POST", // Método de solicitud
        data: {
            idPersona: idPersona,
            nombres: nombres,
            apellidos: apellidos,
            telefono: telefono,
            celular: celular,
            idTipoDocIdentidad: idTipoDocIdentidad,
            numero: numero,
            idTipoPersona: idTipoPersona,
            idEstado: idEstado
        }
    },
    function (rpt, state, xhr) { // done
        if (xhr.status === 200) {
            showConfirmMsg("Guardado correctamente");
            $('#mPersonal').modal("hide");
            buscarListaPersona();
        }
    });
}

function init() {
    
    buscarListaPersona();
    
    // eventos
    $("#frmPLBusqueda").submit(buscarListaPersona);
    
    $('#mPersonal').on('show.bs.modal', mostrarmPersonal);
    
    $('#btnPersonaGuardar').on('click', guardarPersona);
}

$(document).ready(init);