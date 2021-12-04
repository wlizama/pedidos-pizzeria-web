/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.controller.intranet;

import com.ci2.ppw.dao.EstadoDAO;
import com.ci2.ppw.dao.ProductoDAO;
import com.ci2.ppw.dao.TipoProductoDAO;
import com.ci2.ppw.model.Estado;
import com.ci2.ppw.model.Producto;
import com.ci2.ppw.model.TipoProducto;
import com.ci2.ppw.utils.Constants;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author jonas
 */
@Controller
@RequestMapping("/intranet")
public class MantProductoController {

    @Autowired
    private ProductoDAO productoDAO;
    
    @Autowired
    private TipoProductoDAO tipoProductoDAO;
    
    @Autowired
    private EstadoDAO estadoDAO;
    
    @RequestMapping("/mant-producto")
    public String getDatos(Model model) {
        
        List<TipoProducto> tprod = tipoProductoDAO.getListaTipoProducto();
        List<Estado> eprod = estadoDAO.getListaEstadoByTipo(Constants.TEPERSONA);        

        model.addAttribute("tprod", tprod);
        model.addAttribute("eprod", eprod);
        
        return "intranet/mantProductoView";
    }
    
    @RequestMapping(value = "/mant-producto/list-producto", method = RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Producto> getListaProducto(@RequestParam Map<String, String> params) {
        
        int idTipoProducto = Integer.parseInt(params.get("idTipoProducto"));
        String nombre = params.getOrDefault("nombre","");
        
        List<Producto> lstResult = productoDAO.getListaProducto(idTipoProducto, nombre);
        return lstResult;
    }

    @RequestMapping(value = "/mant-producto/producto/{idProducto}", method = RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody Producto getProductoById(@PathVariable int idProducto) {
        
        Producto result = productoDAO.getProductoById(idProducto);
        return result;
    }

    @RequestMapping(value = "/mant-producto/producto/new", method = RequestMethod.POST)
    public ResponseEntity<Producto> insertarProducto(@RequestParam Map<String, String> params) {
    
       
        Producto producto = new Producto(
            0,
            params.get("nombre"),
            params.get("descripcion"),
            BigDecimal.valueOf(Double.valueOf(params.get("precio"))),
            params.get("imagen"),
            new Estado(Integer.parseInt(params.get("idEstado"))),
            new TipoProducto(Integer.parseInt(params.get("idTipoProducto")))
        );

        productoDAO.insertarProducto(producto);
        return new ResponseEntity<>(producto, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/mant-producto/producto/edit", method = RequestMethod.POST)
    public ResponseEntity<Producto> modificarProducto(@RequestParam Map<String, String> params) {
      
        Producto producto = new Producto(
            Integer.parseInt(params.get("idProducto")),
            params.get("nombre"),
            params.get("descripcion"),
            BigDecimal.valueOf(Double.valueOf(params.get("precio"))),
            params.get("imagen"),
            new Estado(Integer.parseInt(params.get("idEstado"))),
            new TipoProducto(Integer.parseInt(params.get("idTipoProducto")))
        );

        productoDAO.modificarProducto(producto);
        return new ResponseEntity<>(producto, HttpStatus.OK);
    }
}
