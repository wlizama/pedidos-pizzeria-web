
function buscarListaCobertura(evt) {
    if (evt) evt.preventDefault();
 
    xhrSession({
            url: "mant-cobertura/list-cobertura", // URL solicitada
            type: "POST" // Método de solicitud
        },
        function (rpt) { // done
            var tbodyLstCobertura = document.getElementById("tbodyLstCobertura");
            tbodyLstCobertura.innerHTML = "";
            if (rpt.length > 0) {
                for (var i = 0; i < rpt.length; i++) {
                    tbodyLstCobertura.innerHTML += 
                        "<tr>" +
                            "<td>" +
                                "<button type='button' class='btn btn-light' data-toggle='modal' data-target='#mCobertura' data-id='" + rpt[i].idDistrito + "' data-op='edit' >" +
                                    "<i class='fas fa-pen'></i>" +
                                "</button>" +
                            "</td>" +
                            "<td>" + rpt[i].idDistrito + "</td>" +
                            "<td>" + rpt[i].nombre + "</td>" +
                            "<td>" + rpt[i].cobertura + "</td>" +
                        "</tr>";
                }
            }
            else {
                tbodyLstCobertura.innerHTML = 
                    "<tr class='text-center'>" +
                        "<td colspan='4'>No hay datos</td>" +
                    "</tr>";
            }
        }
    );
}

function mostrarmCobertura(event) {
    var dataset = event.relatedTarget.dataset;
    document.getElementById("txtCoberturaOp").value = dataset.op;
    document.getElementById("frmCobertura").reset();
    if(dataset.op === OP.NEW) {
        document.getElementById("mCoberturaLabel").innerHTML = "Cobertura - Nuevo";
    }
    else if(dataset.op === OP.EDIT) {
        document.getElementById("mCoberturaLabel").innerHTML = "Cobertura - Modificar";
        getCobertura(dataset.id);
    }
}

function getCobertura(idDistrito) {
    
    xhrSession({
        url: "mant-cobertura/cobertura/" + idDistrito, // URL solicitada
        type: "GET" // Método de solicitudPersonal - Nuevo
    },
    function (rpt) { // done
        if (rpt) {
            document.getElementById("txtCoberturaId").value = rpt.idDistrito;
            document.getElementById("txtDistritoNombres").value = rpt.nombre;
            document.getElementById("chkCobertura").checked = rpt.cobertura;
        }
    });
}

function guardarCobertura(evt) {
    if (evt) evt.preventDefault();
    
    var op = document.getElementById("txtCoberturaOp").value;

    var idDistrito = document.getElementById("txtCoberturaId").value;
    var nombre = document.getElementById("txtDistritoNombres").value;
    var cobertura = document.getElementById("chkCobertura").checked ? 1: 0;
    
    xhrSession({
        url: "mant-cobertura/cobertura/" + op, // URL solicitada
        type: "POST", // Método de solicitud
        data: {
            idDistrito: idDistrito,
            nombre: nombre,
            cobertura: cobertura
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
    //$("#frmPLBusqueda").submit(buscarListaCobertura);
    
    $('#mCobertura').on('show.bs.modal', mostrarmCobertura);
    
    $('#btnCoberturaGuardar').on('click', guardarCobertura);
}

$(document).ready(init);