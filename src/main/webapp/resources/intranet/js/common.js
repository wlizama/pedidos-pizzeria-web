
var xhrSession = function (config, done, fail, always) {
    $("#loading").css("display", "flex");
    $.ajax(config)
    .done((done ? done : function(){}))
    .fail(function (jqXHR, ex){
        
        if(jqXHR.status === 401) // no autorizado
            window.location.href = "intranet/login";
        else {
            $("#error")
                .show()
                .html("<b>XHR Error: </b>" + ex + "<br>"
                    + "<b>Status: </b>" + jqXHR.status + ", "
                    + ((jqXHR.status === 0 ) ? "No conectado, verificar red." : jqXHR.responseText)
                );

            if (fail) fail(jqXHR, ex);
        }
    })
    .always(function (){
        $("#loading").css("display", "none");
        if (always) always();
    });
};