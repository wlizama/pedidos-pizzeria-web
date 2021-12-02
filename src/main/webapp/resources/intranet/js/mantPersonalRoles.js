
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
        getRol(dataset.id);
    }
}

function getRol(idRol) {
    
    xhrSession({
        url: "mant-personal/rol/" + idRol, // URL solicitada
        type: "GET" // Método de solicitud
    },
    function (rpt) { // done
        if (rpt) {
            document.getElementById("txtRolId").value = rpt.idRol;
            document.getElementById("txtRolNombres").value = rpt.nombre;
            
            xhrSession({
                url: "acceso/list-by-rol/" + idRol, // URL solicitada
                type: "GET" // Método de solicitud
            },
            function (rpt2) { // done
                if (rpt2) {
                    var divAccesos = document.getElementById("divAccesos");
                    divAccesos.innerHTML = "";
                    if (rpt2.length > 0) {
                        for (var i = 0; i < rpt2.length; i++) {
                            divAccesos.innerHTML += 
                                "<div class='form-check'>" +
                                    "<input class='form-check-input' type='checkbox' value='" + rpt2[i].idAcceso + "' id='lblRolAcceso" + rpt2[i].idAcceso + "' " + (rpt2[i].acceso ? "checked" : "") + " >" +
                                    "<label class='form-check-label' for='lblRolAcceso" + rpt2[i].idAcceso + "'>" +
                                        rpt2[i].formulario.nombre +
                                    "</label>" +
                                "</div>";
                        }
                    }
                    else {
                        divAccesos.innerHTML = "<label>No hay Accesos</label>";
                    }
                }
            });
            
        }
    });
}

function guardarRol(evt) {
    if (evt) evt.preventDefault();
    
    var op = document.getElementById("txtRolOp").value;

    var idRol = document.getElementById("txtRolId").value;
    var nombre = document.getElementById("txtRolNombres").value;
    
    var chkAccesos = document.querySelectorAll(".form-check-input");
    
    var accesos = [];
    for (var i = 0; i < chkAccesos.length; i++) {
        accesos.push(chkAccesos[i].value + "|" + (chkAccesos[i].checked ? 1 : 0));
    }
    
    xhrSession({
        url: "mant-personal/rol/" + op, // URL solicitada
        type: "POST", // Método de solicitud
        data: {
            idRol: idRol,
            nombre: nombre,
            accesos: accesos.join()
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