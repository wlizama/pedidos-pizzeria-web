/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.controller.intranet;

import com.ci2.ppw.dao.DocumentoIdentidadDAO;
import com.ci2.ppw.dao.EstadoDAO;
import com.ci2.ppw.dao.CoberturasDAO;
import com.ci2.ppw.dao.RolesDAO;
import com.ci2.ppw.dao.TipoDocumentoIdentidadDAO;
import com.ci2.ppw.dao.TipoPersonaDAO;
import com.ci2.ppw.model.Distrito;
import com.ci2.ppw.model.DocumentoIdentidad;
import com.ci2.ppw.model.Estado;
import com.ci2.ppw.model.Roles;
import com.ci2.ppw.model.TipoDocumentoIdentidad;
import com.ci2.ppw.model.TipoPersona;
import com.ci2.ppw.utils.Constants;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author JoseGaGu
 */
@Controller
@RequestMapping("/intranet")
public class MantCoberturasController {
    
    @Autowired
    private CoberturasDAO coberturasDAO;
    
    @Autowired
    private TipoPersonaDAO tipoPersonaDAO;
    
    @Autowired
    private EstadoDAO estadoDAO;
    
    @RequestMapping("/mant-cobertura")
    public String getDatos(Model model) {
        
        List<TipoPersona> tpers = tipoPersonaDAO.getListaTipoPersona();
        List<Estado> epers = estadoDAO.getListaEstadoByTipo(Constants.TEPERSONA);        

        model.addAttribute("tpers", tpers);
        model.addAttribute("epers", epers);
        
        return "intranet/mantCoberturasView";
    }
    
    @RequestMapping(value = "/mant-cobertura/list-cobertura", method = RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE)
    /**public @ResponseBody List<Distrito> getListaCoberturas(@RequestParam Map<String, String> params) {**/
    public @ResponseBody List<Distrito> getListaCobertura(@RequestParam Map<Integer, String> params)        {
        //int idDistrito = Integer.parseInt(params.get("IdDistrito"));
        
        List<Distrito> lstResult = coberturasDAO.getListaCobertura();
        return lstResult;
    }
    
    @RequestMapping(value = "/mant-cobertura/cobertura/{idDistrito}", method = RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody Distrito getCoberturasById(@PathVariable int idDistrito) {
        
        Distrito result = coberturasDAO.getCoberturaById(idDistrito);
        return result;
    }
    
    @RequestMapping(value = "/mant-cobertura/cobertura/new", method = RequestMethod.POST)
    public ResponseEntity<Distrito> insertarCobertura(@RequestParam Map<String, String> params) {
    
        Distrito distrito = new Distrito(
            0,
            params.get("nombre"),
            params.get("cobertura").equals("1")
        );
//System.out.println(Boolean.parseBoolean(params.get("cobertura")) );
        coberturasDAO.insertarCobertura(distrito);
        return new ResponseEntity<>(distrito, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/mant-cobertura/cobertura/edit", method = RequestMethod.POST)
    public ResponseEntity<Distrito> modificarCobertura(@RequestParam Map<String, String> params) {
        
        /**Distrito distrito_ant = coberturasDAO.getCoberturaById(Integer.parseInt(params.get("idDistrito")));**/
        
        Distrito distrito = new Distrito(
            Integer.parseInt(params.get("idDistrito")),
            params.get("nombre"),
            params.get("cobertura").equals("1")
        );

        coberturasDAO.modificarCobertura(distrito);
        return new ResponseEntity<>(distrito, HttpStatus.OK);
    }
    
}
