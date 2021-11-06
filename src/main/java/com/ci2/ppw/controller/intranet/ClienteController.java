/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.controller.intranet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author jonas
 */
@Controller
@RequestMapping("/intranet")
public class ClienteController {    
    @RequestMapping("/mant-clientes")
    public String inicio() {
        return "intranet/mantClienteView";
    }    
}
