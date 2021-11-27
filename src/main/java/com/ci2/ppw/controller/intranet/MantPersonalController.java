/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.controller.intranet;

import com.ci2.ppw.dao.DocumentoIdentidadDAO;
import com.ci2.ppw.dao.EstadoDAO;
import com.ci2.ppw.dao.PersonaDAO;
import com.ci2.ppw.dao.RolesDAO;
import com.ci2.ppw.dao.TipoDocumentoIdentidadDAO;
import com.ci2.ppw.dao.TipoPersonaDAO;
import com.ci2.ppw.model.DocumentoIdentidad;
import com.ci2.ppw.model.Estado;
import com.ci2.ppw.model.Persona;
import com.ci2.ppw.model.Roles;
import com.ci2.ppw.model.TipoDocumentoIdentidad;
import com.ci2.ppw.model.TipoPersona;
import com.ci2.ppw.utils.Constants;
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
    private DocumentoIdentidadDAO docidentDAO;
    
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
        model.addAttribute("tpers", tpers);
        model.addAttribute("epers", epers);
        
        return "intranet/mantPersonalView";
    }
    
    @RequestMapping(value = "/mant-personal/list-personal", method = RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Persona> getListaPersona(@RequestParam Map<String, String> params) {
        
        int idTipoDocIdentidad = Integer.parseInt(params.get("idTipoDocIdentidad"));
        String numero = params.get("numero").trim();
        
        List<Persona> lstResult = personaDAO.getListaPersona(idTipoDocIdentidad, numero);
        return lstResult;
    }
     
    @RequestMapping(value = "/mant-personal/persona/{idPersona}", method = RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody Persona getPersonaById(@PathVariable int idPersona) {
        
        Persona result = personaDAO.getPersonaById(idPersona);
        return result;
    }
    
    @RequestMapping(value = "/mant-personal/persona/new", method = RequestMethod.POST)
    public ResponseEntity<Persona> insertarPersona(@RequestParam Map<String, String> params) {
    
        DocumentoIdentidad docident = docidentDAO.insertarDocumentoIdentidad(
            new DocumentoIdentidad(
                0,
                params.get("numero"),
                new TipoDocumentoIdentidad(
                    Integer.parseInt(params.get("idTipoDocIdentidad"))
                )
            )
        );
        
        Persona persona = new Persona(
            0,
            params.get("nombres"),
            params.get("apellidos"),
            params.get("telefono"),
            params.get("celular"),
            docident,
            new Estado(Integer.parseInt(params.get("idEstado"))),
            new TipoPersona(Integer.parseInt(params.get("idTipoPersona")))
        );

        personaDAO.insertarPersona(persona);
        return new ResponseEntity<>(persona, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/mant-personal/persona/edit", method = RequestMethod.POST)
    public ResponseEntity<Persona> modificarPersona(@RequestParam Map<String, String> params) {
        
        Persona persona_ant = personaDAO.getPersonaById(Integer.parseInt(params.get("idPersona")));
        
        Persona persona = new Persona(
            Integer.parseInt(params.get("idPersona")),
            params.get("nombres"),
            params.get("apellidos"),
            params.get("telefono"),
            params.get("celular"),
            new DocumentoIdentidad(
                persona_ant.getDocumentoIdentidad().getIdDocumentoIdentidad(),
                params.get("numero"),
                new TipoDocumentoIdentidad(
                    Integer.parseInt(params.get("idTipoDocIdentidad"))
                )
            ),
            new Estado(Integer.parseInt(params.get("idEstado"))),
            new TipoPersona(Integer.parseInt(params.get("idTipoPersona")))
        );

        personaDAO.modificarPersona(persona);
        return new ResponseEntity<>(persona, HttpStatus.OK);
    }
}
