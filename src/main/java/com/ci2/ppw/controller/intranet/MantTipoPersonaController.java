/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.controller.intranet;

import com.ci2.ppw.dao.TipoPersonaDAO;
import com.ci2.ppw.model.DocumentoIdentidad;
import com.ci2.ppw.model.Estado;
import com.ci2.ppw.model.Persona;
import com.ci2.ppw.model.TipoDocumentoIdentidad;
import com.ci2.ppw.model.TipoPersona;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author wilderlizama
 */
@Controller
@RequestMapping("/intranet")
public class MantTipoPersonaController {
    
    @Autowired
    private TipoPersonaDAO tipoPersonaDAO;
    
    @RequestMapping(value = "/mant-personal/list-tipopersonal", method = RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<TipoPersona> getListaTipoPersona(@RequestParam Map<String, String> params) {
        
        List<TipoPersona> lstResult = tipoPersonaDAO.getListaTipoPersona();
        return lstResult;
    }
    
    @RequestMapping(value = "/mant-personal/tipopersona/{idTipoPersona}", method = RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody TipoPersona getTipoPersonaById(@PathVariable int idTipoPersona) {
        
        TipoPersona result = tipoPersonaDAO.getTipoPersonaById(idTipoPersona);
        return result;
    }
    
    @RequestMapping(value = "/mant-personal/tipopersona/new", method = RequestMethod.POST)
    public ResponseEntity<TipoPersona> insertarTipoPersona(@RequestParam Map<String, String> params) {
   
        TipoPersona tipopersona = new TipoPersona(
            0,
            params.get("nombre")
        );

        tipoPersonaDAO.insertarTipoPersona(tipopersona);
        return new ResponseEntity<>(tipopersona, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/mant-personal/tipopersona/edit", method = RequestMethod.POST)
    public ResponseEntity<TipoPersona> modificarTipoPersona(@RequestParam Map<String, String> params) {
        
        TipoPersona tipopersona = new TipoPersona(
            Integer.parseInt(params.get("idTipoPersona")),
            params.get("nombre")
        );

        tipoPersonaDAO.modificarTipoPersona(tipopersona);
        return new ResponseEntity<>(tipopersona, HttpStatus.OK);
    }
}
