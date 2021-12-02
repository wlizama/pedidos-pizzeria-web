/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.controller.intranet;

import com.ci2.ppw.dao.AccesoDAO;
import com.ci2.ppw.model.Acceso;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author wilderlizama
 */
@Controller
@RequestMapping("/intranet")
public class AccesoController {
    
    @Autowired
    private AccesoDAO accesoDAO;
    
    @RequestMapping(value = "/acceso/list-by-rol/{idRol}", method = RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Acceso> getListaAccesoByIdRol(@PathVariable int idRol) {
        
        List<Acceso> lstResult = accesoDAO.getListaAccesoByIdRol(idRol);
        return lstResult;
    }
}
