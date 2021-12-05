
function buscarListaTamanho(evt) {
    if (evt) evt.preventDefault();        
    
    xhrSession({
            url: "mant-pizza/list-tamanho", // URL solicitada
            type: "POST" // Método de solicitud
        },
        function (rpt) { // done
            var tbodyLstTamanho = document.getElementById("tbodyLstTamanho");
            tbodyLstTamanho.innerHTML = "";
            if (rpt.length > 0) {
                for (var i = 0; i < rpt.length; i++) {
                    tbodyLstTamanho.innerHTML += 
                        "<tr>" +
                            "<td>" +
                                "<button type='button' class='btn btn-light' data-toggle='modal' data-target='#mTamanho' data-id='" + rpt[i].idTamanho + "' data-op='edit' >" +
                                    "<i class='fas fa-pen'></i>" +
                                "</button>" +
                            "</td>" +
                            "<td>" + rpt[i].idTamanho + "</td>" +
                            "<td>" + rpt[i].nombre + "</td>" +
                            "<td>" + rpt[i].cantidadPorciones + "</td>" +
                        "</tr>";
                }
            }
            else {
                tbodyLstTamanho.innerHTML = 
                    "<tr class='text-center'>" +
                        "<td colspan='4'>No hay datos</td>" +
                    "</tr>";
            }
        }
    );
}
/*
function mostrarmTipoPersonal(event) {
    var dataset = event.relatedTarget.dataset;
    document.getElementById("txtTipoPersonaOp").value = dataset.op;
    document.getElementById("frmTipoPersonal").reset();
    if(dataset.op === OP.NEW) {
        document.getElementById("mTipoPersonalLabel").innerHTML = "Tipo Personal - Nuevo";
    }
    else if(dataset.op === OP.EDIT) {
        document.getElementById("mTipoPersonalLabel").innerHTML = "Tipo Personal - Modificar";
        getTipoPersona(dataset.id);
    }
}

function getTipoPersona(idTipoPersona) {
    
    xhrSession({
        url: "mant-personal/tipopersona/" + idTipoPersona, // URL solicitada
        type: "GET" // Método de solicitud
    },
    function (rpt) { // done
        if (rpt) {
            document.getElementById("txtTipoPersonaId").value = rpt.idTipoPersona;
            document.getElementById("txtTipoPersonaNombres").value = rpt.nombre;
        }
    });
}

function guardarTipoPersona(evt) {
    if (evt) evt.preventDefault();
    
    var op = document.getElementById("txtTipoPersonaOp").value;

    var idTipoPersona = document.getElementById("txtTipoPersonaId").value;
    var nombre = document.getElementById("txtTipoPersonaNombres").value;
    
    xhrSession({
        url: "mant-personal/tipopersona/" + op, // URL solicitada
        type: "POST", // Método de solicitud
        data: {
            idTipoPersona: idTipoPersona,
            nombre: nombre
        }
    },
    function (rpt, state, xhr) { // done
        if (xhr.status === 200) {
            showConfirmMsg("Guardado correctamente");
            $('#mTipoPersonal').modal("hide");
            buscarListaTipoPersona();
        }
    });
}
*/
function initTamanho() {
    
    buscarListaTamanho();
    
    // eventos
    
    $('#mTamanho').on('show.bs.modal', mostrarmTamanho);
    
    $('#btnTamanhoGuardar').on('click', guardarTamanho);
}

$(document).ready(initTamanho);