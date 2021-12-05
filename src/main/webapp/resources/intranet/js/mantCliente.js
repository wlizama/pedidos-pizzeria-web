
function buscarListaCliente(evt) {
    if (evt) evt.preventDefault();
    
    var idTipoDocIdentidad = document.getElementById("cboCLTipoDocumento").value;
    var numero = document.getElementById("txtCLDocumento").value;
    
    xhrSession({
            url: "mant-clientes/list-cliente", // URL solicitada
            type: "POST", // Método de solicitud
            data: {
                idTipoDocIdentidad: idTipoDocIdentidad,
                numero: numero
            }
        },
        function (rpt) { // done
            var tbodyLstCliente = document.getElementById("tbodyLstCliente");
            tbodyLstCliente.innerHTML = "";
            if (rpt.length > 0) {
                for (var i = 0; i < rpt.length; i++) {
                    tbodyLstCliente.innerHTML += 
                        "<tr>" +
                            "<td>" +
                                "<button type='button' class='btn btn-light' data-id='" + rpt[i].idCliente + "' data-op='edit' >" +
                                    "<i class='fas fa-pen'></i>" +
                                "</button>" +
                            "</td>" +
                            "<td>" + rpt[i].idCliente + "</td>" +
                            "<td>" + rpt[i].persona.nombres + " " + rpt[i].persona.apellidos + "</td>" +
                            "<td>" + rpt[i].persona.telefono + "</td>" +
                            "<td>" + rpt[i].persona.estado.nombre + "</td>" +
                        "</tr>";
                }
            }
            else {
                tbodyLstCliente.innerHTML = 
                    "<tr class='text-center'>" +
                        "<td colspan='5'>No hay datos</td>" +
                    "</tr>";
            }
        }
    );
}

function mostrarmCliente(event) {
    var dataset = event.relatedTarget.dataset;
    document.getElementById("txtClienteOp").value = dataset.op;
    document.getElementById("frmCliente").reset();
    if(dataset.op === OP.NEW) {
        document.getElementById("mClienteLabel").innerHTML = "Cliente - Nuevo";
    }
    else if(dataset.op === OP.EDIT) {
        document.getElementById("mClienteLabel").innerHTML = "Cliente - Modificar";
        getCliente(dataset.id);
    }
}

function getCliente(idCliente) {
    
    xhrSession({
        url: "mant-clientes/" + idCliente, // URL solicitada
        type: "GET" // Método de solicitud
    },
    function (rpt) { // done
        if (rpt) {
            document.getElementById("txtClienteId").value = rpt.idCliente;
            document.getElementById("txtClienteNombres").value = rpt.nombres;
            document.getElementById("txtClienteApellidos").value = rpt.apellidos;
            document.getElementById("txtClienteTelefono").value = rpt.telefono;
            document.getElementById("txtClienteCelular").value = rpt.celular;
            document.getElementById("cboClienteTipoDocumento").value = rpt.documentoIdentidad.tipoDocumentoIdentidad.idTipoDocIdentidad;
            document.getElementById("txtClienteDocumento").value = rpt.documentoIdentidad.numero;
            document.getElementById("cboClienteTipoCliente").value = rpt.tipoCliente.idTipoCliente;
            document.getElementById("cboClienteEstado").value = rpt.estado.idEstado;
        }
    });
}

function guardarCliente(evt) {
    if (evt) evt.preventDefault();
    
    var op = document.getElementById("txtClienteOp").value;

    var idCliente = document.getElementById("txtClienteId").value;
    var nombres = document.getElementById("txtNombres").value;
    var apellidos = document.getElementById("txtApellidos").value;
    var telefono = document.getElementById("txtTelefono").value;
    var celular = document.getElementById("txtCelular").value;
    var idTipoDocIdentidad = document.getElementById("cboTipoDocumento").value;
    var numero = document.getElementById("txtDocumento").value;
    var idEstado = document.getElementById("cboEstado").value;
    
    xhrSession({
        url: "mant-clientes/" + op, // URL solicitada
        type: "POST", // Método de solicitud
        data: {
            idCliente: idCliente,
            nombres: nombres,
            apellidos: apellidos,
            telefono: telefono,
            celular: celular,
            idTipoDocIdentidad: idTipoDocIdentidad,
            numero: numero,
            idEstado: idEstado
        }
    },
    function (rpt, state, xhr) { // done
        if (xhr.status === 200) {
            showConfirmMsg("Guardado correctamente");
            $('#mCliente').modal("hide");
            buscarListaCliente();
        }
    });
}

function init() {
    
//    buscarListaCliente();
//    
//    // eventos
//    $("#frmPLBusqueda").submit(buscarListaCliente);
//    
    $('#mCliente').on('show.bs.modal', mostrarmCliente);
//    
    $('#btnClienteGuardar').on('click', guardarCliente);
}

$(document).ready(init);