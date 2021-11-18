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
            console.log(rpt);
        }
    );
}

function initEvents() {
    $("#frmPLBusqueda").submit(buscarListaPersona);
}

$(document).ready(initEvents);