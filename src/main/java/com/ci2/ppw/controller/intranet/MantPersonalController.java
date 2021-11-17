/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.controller.intranet;

import com.ci2.ppw.dao.PersonaDAO;
import com.ci2.ppw.dao.RolesDAO;
import com.ci2.ppw.dao.TipoDocumentoIdentidadDAO;
import com.ci2.ppw.model.Persona;
import com.ci2.ppw.model.Roles;
import com.ci2.ppw.model.TipoDocumentoIdentidad;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author wilderlizama
 */
@Controller
@RequestMapping("/intranet")
public class MantPersonalController {
    
    @Autowired
    private RolesDAO rolesDAO;
    
    @Autowired
    private PersonaDAO personaDAO;
    
    @Autowired
    private TipoDocumentoIdentidadDAO tdocDAO;
    
    @RequestMapping("/mant-personal")
    public String getDatos(Model model) {
        
        List<Roles> roles = rolesDAO.getListaRoles();
        List<TipoDocumentoIdentidad> tdocs = tdocDAO.getListaTipoDocumentoIdentidad();
        List<Persona> personas = personaDAO.getListaPersona();

        model.addAttribute("tdocs", tdocs);
        model.addAttribute("roles", roles);
        model.addAttribute("personas", personas);
        
        return "intranet/mantPersonalView";
    }
    
    @RequestMapping(value = "/mant-personal/list-personal", method = RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Persona> getListas() {
        
        List<Persona> lstResult = personaDAO.getListaPersona();
        return lstResult;
    }
    
}
