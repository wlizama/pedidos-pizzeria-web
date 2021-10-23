/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.controller.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class WebController {

    @RequestMapping
    public String inicio() {
        return "web/inicioView";
    }
    
    @RequestMapping("/menu")
    public String menu() {
        return "web/menuView";
    }
    
    
    @RequestMapping("/nosotros")
    public String nosotros() {
        return "web/nosotrosView";
    }
    
    @RequestMapping("/contactanos")
    public String contactanos() {
        return "web/contactanosView";
    }
    
    @RequestMapping("/ingresar")
    public String ingresar() {
        return "web/ingresarView";
    }
    
    @RequestMapping("/carrito")
    public String carrito() {
        return "web/carritoView";
    }
}
