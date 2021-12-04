/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.controller.intranet;

import com.ci2.ppw.dao.ClienteDAO;
import com.ci2.ppw.dao.DocumentoIdentidadDAO;
import com.ci2.ppw.dao.TipoDocumentoIdentidadDAO;
import com.ci2.ppw.model.Cliente;
import com.ci2.ppw.model.Estado;
import com.ci2.ppw.model.TipoDocumentoIdentidad;
import com.ci2.ppw.model.TipoPersona;
import com.ci2.ppw.utils.Constants;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
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
    
    @RequestMapping("/mant-clientes")
    public String getDatos(Model model) {
//        
        List<TipoDocumentoIdentidad> tdocs = tdocDAO.getListaTipoDocumentoIdentidad();
//        List<TipoPersona> tpers = tipoPersonaDAO.getListaTipoPersona();
//        List<Estado> epers = estadoDAO.getListaEstadoByTipo(Constants.TEPERSONA);        
//
        model.addAttribute("tdocs", tdocs);
//        model.addAttribute("tpers", tpers);
//        model.addAttribute("epers", epers);
//        
        return "intranet/mantClienteView";
    }
    
    @RequestMapping(value = "/mant-clientes/list-cliente", method = RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Cliente> getListaPersona(@RequestParam Map<String, String> params) {
        
        int idTipoDocIdentidad = Integer.parseInt(params.get("idTipoDocIdentidad"));
        String numero = params.get("numero").trim();
        
        List<Cliente> lstResult = clienteDAO.getListaCliente(idTipoDocIdentidad, numero);
        return lstResult;
    }
}
