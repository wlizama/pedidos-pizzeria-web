
function buscarListaCobertura(evt) {
    if (evt) evt.preventDefault();
    
return   
    xhrSession({
            url: "mant-cobertura/list-personal", // URL solicitada
            type: "POST", // Método de solicitud
            data: {
                idTipoDocIdentidad: idTipoDocIdentidad,
                numero: numero
            }
        },
        function (rpt) { // done
            var tbodyLstPersona = document.getElementById("tbodyLstPersona");
            tbodyLstPersona.innerHTML = "";
            if (rpt.length > 0) {
                for (var i = 0; i < rpt.length; i++) {
                    tbodyLstPersona.innerHTML += 
                        "<tr>" +
                            "<td>" +
                                "<button type='button' class='btn btn-light' data-toggle='modal' data-target='#mPersonal' data-id='" + rpt[i].idPersona + "' data-op='edit' >" +
                                    "<i class='fas fa-pen'></i>" +
                                "</button>" +
                            "</td>" +
                            "<td>" + rpt[i].idPersona + "</td>" +
                            "<td>" + rpt[i].nombres + "</td>" +
                            "<td>" + rpt[i].telefono + "</td>" +
                            "<td>" + rpt[i].estado.nombre + "</td>" +
                        "</tr>";
                }
            }
            else {
                tbodyLstDistrito.innerHTML = 
                    "<tr class='text-center'>" +
                        "<td colspan='4'>No hay datos</td>" +
                    "</tr>";
            }
        }
    );
}

function mostrarmCobertura(event) {
    var dataset = event.relatedTarget.dataset;
    document.getElementById("txtPersonaOp").value = dataset.op;
    document.getElementById("frmCobertura").reset();
    if(dataset.op === OP.NEW) {
        document.getElementById("mCoberturaLabel").innerHTML = "Cobertura - Nuevo";
    }
    else if(dataset.op === OP.EDIT) {
        document.getElementById("mCoberturaLabel").innerHTML = "Cobertura - Modificar";
        getPersona(dataset.id);
    }
}

function getPersona(idPersona) {
    
    xhrSession({
        url: "mant-cobertura/persona/" + idPersona, // URL solicitada
        type: "GET" // Método de solicitudPersonal - Nuevo
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

function guardarCobertura(evt) {
    if (evt) evt.preventDefault();
    
    var op = document.getElementById("txtPersonaOp").value;

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
        url: "mant-cobertura/persona/" + op, // URL solicitada
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
            $('#mCobertura').modal("hide");
            buscarListaCobertura();
        }
    });
}

function init() {
    
    buscarListaCobertura();
    
    // eventos
    $("#frmPLBusqueda").submit(buscarListaCobertura);
    
    $('#mCobertura').on('show.bs.modal', mostrarmCobertura);
    
    $('#btnCoberturaGuardar').on('click', guardarCobertura);
}

$(document).ready(init);