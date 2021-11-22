/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.controller.intranet;


import java.security.Principal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class IntranetController {
    
    @RequestMapping("/intranet")
    public String inicio() {
        return "intranet/inicioView";
    }
    
    
    @RequestMapping(value = "/intranet/403", method = RequestMethod.GET)
    public String accessDenied(Model model, Principal principal) {

        if (principal != null) {
            model.addAttribute("message", "Hola " + principal.getName()
                    + "<br> No tienes permiso para acceder a esta página!");
        } else {
            model.addAttribute("msg",
                    "No tienes permiso para acceder a esta página!");
        }
        return "intranet/403View";
    }
}
