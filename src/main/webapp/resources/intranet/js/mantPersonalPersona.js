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
                                "<button type=\"button\" class=\"btn btn-light\" data-toggle=\"modal\" data-target=\"#mPersonal\" data-id=\"" + rpt[i].idPersona + "\">" +
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

function getPersona(event) {
    
    var dataset = event.relatedTarget.dataset;
    
    xhrSession({
            url: "mant-personal/persona/" + dataset.id, // URL solicitada
            type: "GET" // Método de solicitud
        },
        function (rpt) { // done
            if (rpt) {
                console.log(event.relatedTarget.dataset, rpt);
                
            }
        }
    );
}

function init() {
    
    buscarListaPersona();
    
    // eventos
    $("#frmPLBusqueda").submit(buscarListaPersona);
    
    $('#mPersonal').on('show.bs.modal', getPersona);
}

$(document).ready(init);