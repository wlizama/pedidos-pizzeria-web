/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function buscarListaProducto(evt) {
    if (evt) evt.preventDefault();
    
    var idTipoProducto = document.getElementById("cboPLTipoProducto").value;
    var nombre = document.getElementById("txtProductoNombre2").value;
    
    xhrSession({
            url: "mant-producto/list-producto", // URL solicitada
            type: "POST", // MÃ©todo de solicitud
            data: {
                idTipoProducto: idTipoProducto,
                nombre: nombre
            }
        },
        function (rpt) { // done
            var tbodyLstProducto = document.getElementById("tbodyLstProducto");
            tbodyLstProducto.innerHTML = "";
            if (rpt.length > 0) {
                for (var i = 0; i < rpt.length; i++) {
                    tbodyLstProducto.innerHTML += 
                        "<tr>" +
                            "<td>" +
                                "<button type='button' class='btn btn-light' data-toggle='modal' data-target='#mProducto' data-id='" + rpt[i].idProducto + "' data-op='edit' >" +
                                    "<i class='fas fa-pen'></i>" +
                                "</button>" +
                            "</td>" +
                            "<td>" + rpt[i].idProducto + "</td>" +
                            "<td>" + rpt[i].nombre + "</td>" +
                            "<td>" + rpt[i].descripcion + "</td>" +
                            "<td>" + rpt[i].precio + "</td>" +
                          //  "<td>" + rpt[i].imagen + "</td>" +
                            "<td>" + rpt[i].tipoProducto.nombre + "</td>" +
                            "<td>" + rpt[i].estado.nombre + "</td>" +
                        "</tr>";
                }
            }
            else {
                tbodyLstProducto.innerHTML = 
                    "<tr class='text-center'>" +
                        "<td colspan='7'>No hay datos</td>" +
                    "</tr>";
            }
        }
    );
}

function mostrarmProducto(event) {
    var dataset = event.relatedTarget.dataset;
    document.getElementById("txtProductoOp").value = dataset.op;
    document.getElementById("frmProducto").reset();
    if(dataset.op === OP.NEW) {
        document.getElementById("mProductoLabel").innerHTML = "Producto - Nuevo";
    }
    else if(dataset.op === OP.EDIT) {
        document.getElementById("mProductoLabel").innerHTML = "Producto - Modificar";
        getProducto(dataset.id);
    }
}

function getProducto(idProducto) {
    
    xhrSession({
        url: "mant-producto/producto/" + idProducto, // URL solicitada
        type: "GET" // MÃ©todo de solicitud
    },
    function (rpt) { // done
        if (rpt) {
            document.getElementById("txtProductoId").value = rpt.idProducto;
            document.getElementById("txtProductoNombre").value = rpt.nombre;
            document.getElementById("txtProductoDescripcion").value = rpt.descripcion;
            document.getElementById("txtProductoPrecio").value = rpt.precio;
            document.getElementById("txtProductoImagen").value = rpt.imagen;
            document.getElementById("imgProductoImagen").src = rpt.imagen;
            document.getElementById("cboProductoTipoProducto").value = rpt.tipoProducto.idTipoProducto;
            document.getElementById("cboProductoEstado").value = rpt.estado.idEstado;
        }
    });
}

function guardarProducto(evt) {
    if (evt) evt.preventDefault();
    
    var op = document.getElementById("txtProductoOp").value;

    var idProducto = document.getElementById("txtProductoId").value;
    var nombre = document.getElementById("txtProductoNombre").value;
    var descripcion = document.getElementById("txtProductoDescripcion").value;
    var precio = document.getElementById("txtProductoPrecio").value;
    var imagen = document.getElementById("txtProductoImagen").value;
    var idTipoProducto = document.getElementById("cboProductoTipoProducto").value;
    var idEstado = document.getElementById("cboProductoEstado").value;
    
    xhrSession({
        url: "mant-producto/producto/" + op, // URL solicitada
        type: "POST", // MÃ©todo de solicitud
        data: {
            idProducto: idProducto,
            nombre: nombre,
            descripcion: descripcion,
            precio: precio,
            imagen: imagen,
            idTipoProducto: idTipoProducto,
            idEstado: idEstado
        }
    },
    function (rpt, state, xhr) { // done
        if (xhr.status === 200) {
            showConfirmMsg("Guardado correctamente");
            $('#mProducto').modal("hide");
            buscarListaProducto();
        }
    });
}

function init() {
    
    buscarListaProducto();
    
    // eventos
    $("#frmPLBusqueda").submit(buscarListaProducto);
    
    $('#mProducto').on('show.bs.modal', mostrarmProducto);
    
    $('#btnProductoGuardar').on('click', guardarProducto);
}

$(document).ready(init);