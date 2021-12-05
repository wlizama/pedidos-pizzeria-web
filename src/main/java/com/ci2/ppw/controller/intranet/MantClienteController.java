/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.controller.intranet;

import com.ci2.ppw.dao.ClienteDAO;
import com.ci2.ppw.dao.DocumentoIdentidadDAO;
import com.ci2.ppw.dao.EstadoDAO;
import com.ci2.ppw.dao.PersonaDAO;
import com.ci2.ppw.dao.TipoDocumentoIdentidadDAO;
import com.ci2.ppw.model.Cliente;
import com.ci2.ppw.model.DocumentoIdentidad;
import com.ci2.ppw.model.Estado;
import com.ci2.ppw.model.Persona;
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
public class MantClienteController {
    
    @Autowired
    private ClienteDAO clienteDAO;
    
    @Autowired
    private DocumentoIdentidadDAO docidentDAO;
    
    @Autowired
    private TipoDocumentoIdentidadDAO tdocDAO;
    
    @Autowired
    private PersonaDAO personaDAO;
    
    @Autowired
    private EstadoDAO estadoDAO;
    
    @RequestMapping("/mant-clientes")
    public String getDatos(Model model) {
//        
        List<TipoDocumentoIdentidad> tdocs = tdocDAO.getListaTipoDocumentoIdentidad();
//        List<TipoCliente> tpers = tipoClienteDAO.getListaTipoCliente();
        List<Estado> eclis = estadoDAO.getListaEstadoByTipo(Constants.TEPERSONA);        
//
        model.addAttribute("tdocs", tdocs);
//        model.addAttribute("tpers", tpers);
        model.addAttribute("eclis", eclis);
//        
        return "intranet/mantClienteView";
    }
    
    @RequestMapping(value = "/mant-clientes/list-cliente", method = RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Cliente> getListaCliente(@RequestParam Map<String, String> params) {
        
        int idTipoDocIdentidad = Integer.parseInt(params.get("idTipoDocIdentidad"));
        String numero = params.get("numero").trim();
        
        List<Cliente> lstResult = clienteDAO.getListaCliente(idTipoDocIdentidad, numero);
        return lstResult;
    }
    
    
//    @RequestMapping(value = "/mant-clientes/{idCliente}", method = RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
//    public @ResponseBody Cliente getClienteById(@PathVariable int idCliente) {
//        
//        Cliente result = personaDAO.getClienteById(idCliente);
//        return result;
//    }
    
    @RequestMapping(value = "/mant-clientes/new", method = RequestMethod.POST)
    public ResponseEntity<Cliente> insertarCliente(@RequestParam Map<String, String> params) {
    
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
            new TipoPersona(Constants.TPCLIENTE)
        );
        
        personaDAO.insertarPersona(persona);
        
        Cliente cliente = new Cliente(
            0,
            params.get("nombres"),
            params.get("apellidos"),
            persona
        );

        clienteDAO.insertarCliente(cliente);
        return new ResponseEntity<>(cliente, HttpStatus.OK);
    }
    
//    @RequestMapping(value = "/mant-cliente/edit", method = RequestMethod.POST)
//    public ResponseEntity<Cliente> modificarCliente(@RequestParam Map<String, String> params) {
//        
//        Cliente persona_ant = personaDAO.getClienteById(Integer.parseInt(params.get("idCliente")));
//        
//        Cliente cliente = new Cliente(
//            Integer.parseInt(params.get("idCliente")),
//            params.get("nombres"),
//            params.get("apellidos"),
//            params.get("telefono"),
//            params.get("celular"),
//            new DocumentoIdentidad(
//                persona_ant.getDocumentoIdentidad().getIdDocumentoIdentidad(),
//                params.get("numero"),
//                new TipoDocumentoIdentidad(
//                    Integer.parseInt(params.get("idTipoDocIdentidad"))
//                )
//            ),
//            new Estado(Integer.parseInt(params.get("idEstado"))),
//            new TipoCliente(Integer.parseInt(params.get("idTipoCliente")))
//        );
//
//        personaDAO.modificarCliente(cliente);
//        return new ResponseEntity<>(cliente, HttpStatus.OK);
//    }
}
