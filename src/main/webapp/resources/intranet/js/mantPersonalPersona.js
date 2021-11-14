/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function buscarListaPersona(evt) {
    evt.preventDefault();
    $("#loading").css("display", "flex");
    $.ajax({
        url:"https://pokeapi.co/api/v2/pokemon/ditto", // URL solicitada
        type:"GET" // Método de solicitud
    })
    .done(function (rpt){
        console.log(rpt);
    })
    .fail(function (jqXHR, ex){
        $("#error")
            .show()
            .html("<b>XHR Error: </b>" + ex + "<br>"
                + "<b>Status: </b>" + jqXHR.status + ", "
                + ((jqXHR.status === 0 ) ? "No conectado, verificar red." : jqXHR.responseText)
            );
    })
    .always(function (){
        $("#loading").css("display", "none");
    });
}

function initEvents() {
    $("#frmPLBusqueda").submit(buscarListaPersona)
}

$(document).ready(initEvents);