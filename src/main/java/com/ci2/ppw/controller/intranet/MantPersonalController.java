/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.controller.intranet;

import com.ci2.ppw.dao.EstadoDAO;
import com.ci2.ppw.dao.PersonaDAO;
import com.ci2.ppw.dao.RolesDAO;
import com.ci2.ppw.dao.TipoDocumentoIdentidadDAO;
import com.ci2.ppw.dao.TipoPersonaDAO;
import com.ci2.ppw.model.Estado;
import com.ci2.ppw.model.Persona;
import com.ci2.ppw.model.Roles;
import com.ci2.ppw.model.TipoDocumentoIdentidad;
import com.ci2.ppw.model.TipoPersona;
import com.ci2.ppw.utils.Constants;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
public class MantPersonalController {
    
    @Autowired
    private RolesDAO rolesDAO;
    
    @Autowired
    private PersonaDAO personaDAO;
    
    @Autowired
    private TipoPersonaDAO tipoPersonaDAO;
    
    @Autowired
    private TipoDocumentoIdentidadDAO tdocDAO;
    
    @Autowired
    private EstadoDAO estadoDAO;
    
    @RequestMapping("/mant-personal")
    public String getDatos(Model model) {
        
        List<Roles> roles = rolesDAO.getListaRoles();
        List<TipoDocumentoIdentidad> tdocs = tdocDAO.getListaTipoDocumentoIdentidad();
        List<TipoPersona> tpers = tipoPersonaDAO.getListaTipoPersona();
        List<Estado> epers = estadoDAO.getListaEstadoByTipo(Constants.TEPERSONA);

        model.addAttribute("tdocs", tdocs);
        model.addAttribute("roles", roles);
        model.addAttribute("tpers", tpers);
        model.addAttribute("epers", epers);
        
        return "intranet/mantPersonalView";
    }
    
    @RequestMapping(value = "/mant-personal/list-personal", method = RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Persona> getListas() {
        
        List<Persona> lstResult = personaDAO.getListaPersona();
        return lstResult;
    }
    
    @RequestMapping(value = "/mant-personal/persona/{idPersona}", method = RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody Persona getPersona(@PathVariable int idPersona) {
        
        Persona result = personaDAO.getPersonaById(idPersona);
        return result;
    }
    
}
