
function buscarListaRoles(evt) {
    if (evt) evt.preventDefault();

    xhrSession({
            url: "mant-personal/list-roles", // URL solicitada
            type: "POST" // Método de solicitud
        },
        function (rpt) { // done
            var tbodyLstRol = document.getElementById("tbodyLstRol");
            tbodyLstRol.innerHTML = "";
            if (rpt.length > 0) {
                for (var i = 0; i < rpt.length; i++) {
                    tbodyLstRol.innerHTML += 
                        "<tr>" +
                            "<td>" +
                                "<button type='button' class='btn btn-light' data-toggle='modal' data-target='#mRoles' data-id='" + rpt[i].idRol + "' data-op='edit' >" +
                                    "<i class='fas fa-pen'></i>" +
                                "</button>" +
                            "</td>" +
                            "<td>" + rpt[i].idRol + "</td>" +
                            "<td>" + rpt[i].nombre + "</td>" +
                        "</tr>";
                }
            }
            else {
                tbodyLstRol.innerHTML = 
                    "<tr class='text-center'>" +
                        "<td colspan='3'>No hay datos</td>" +
                    "</tr>";
            }
        }
    );
}

function mostrarmRoles(event) {
    var dataset = event.relatedTarget.dataset;
    document.getElementById("txtRolOp").value = dataset.op;
    document.getElementById("frmRol").reset();
    if(dataset.op === OP.NEW) {
        document.getElementById("mRolesLabel").innerHTML = "Rol - Nuevo";
    }
    else if(dataset.op === OP.EDIT) {
        document.getElementById("mRolesLabel").innerHTML = "Rol - Modificar";
        getRoles(dataset.id);
    }
}

function getRoles(idRol) {
    
    xhrSession({
        url: "mant-personal/rol/" + idRol, // URL solicitada
        type: "GET" // Método de solicitud
    },
    function (rpt) { // done
        if (rpt) {
            document.getElementById("txtRolId").value = rpt.idRol;
            document.getElementById("txtRolNombres").value = rpt.nombre;
        }
    });
}

function guardarRol(evt) {
    if (evt) evt.preventDefault();
    
    var op = document.getElementById("txtRolOp").value;

    var idRol = document.getElementById("txtRolId").value;
    var nombre = document.getElementById("txtRolNombres").value;
    
    xhrSession({
        url: "mant-personal/rol/" + op, // URL solicitada
        type: "POST", // Método de solicitud
        data: {
            idRol: idRol,
            nombre: nombre
        }
    },
    function (rpt, state, xhr) { // done
        if (xhr.status === 200) {
            showConfirmMsg("Guardado correctamente");
            $('#mRoles').modal("hide");
            buscarListaRoles();
        }
    });
}

function initRoles() {
    
    buscarListaRoles();
    
    // eventos
    
    $('#mRoles').on('show.bs.modal', mostrarmRoles);
    
    $('#btnRolGuardar').on('click', guardarRol);
}

$(document).ready(initRoles);