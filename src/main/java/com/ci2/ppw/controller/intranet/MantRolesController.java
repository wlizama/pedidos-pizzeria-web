/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.controller.intranet;

import com.ci2.ppw.dao.AccesoDAO;
import com.ci2.ppw.dao.RolesDAO;
import com.ci2.ppw.model.Acceso;
import com.ci2.ppw.model.Roles;
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
public class MantRolesController {
    
    @Autowired
    private RolesDAO rolesDAO;
    
    @Autowired
    private AccesoDAO accesoDAO;
    
    @RequestMapping(value = "/mant-personal/list-roles", method = RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Roles> getListaRoles(@RequestParam Map<String, String> params) {
        
        List<Roles> lstResult = rolesDAO.getListaRoles();
        return lstResult;
    }
    
    @RequestMapping(value = "/mant-personal/rol/{idRol}", method = RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody Roles getPersonaById(@PathVariable int idRol) {
        
        Roles result = rolesDAO.getRolById(idRol);
        return result;
    }
    
    @RequestMapping(value = "/mant-personal/rol/new", method = RequestMethod.POST)
    public ResponseEntity<Roles> insertarRol(@RequestParam Map<String, String> params) {
    
        Roles rol = new Roles(
            0,
            params.get("nombre")
        );

        rolesDAO.insertarRol(rol);
        return new ResponseEntity<>(rol, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/mant-personal/rol/edit", method = RequestMethod.POST)
    public ResponseEntity<Roles> modificarRol(@RequestParam Map<String, String> params) {
        
        Roles rol =  new Roles(
            Integer.parseInt(params.get("idRol")),
            params.get("nombre")
        );
        
        String [] accesos = params.get("accesos").split(",");
        
        for (int i = 0; i < accesos.length; i++) {
            String [] acceso = accesos[i].split("\\|");
            
            int idAcceso = Integer.parseInt(acceso[0]);
            short is_acceso = Short.parseShort(acceso[1]);
            
            accesoDAO.modificarAcceso(idAcceso, is_acceso);
        }

        rolesDAO.modificarRol(rol);
        return new ResponseEntity<>(rol, HttpStatus.OK);
    }
    
}
