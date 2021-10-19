/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author wilderlizama
 */
@Controller
public class MainPageController {

    /**
     * Creates a new instance of NewJSFManagedBean
     */
//    public MainPageController() {
//        
//    }
    
    @RequestMapping
    public String mainPage() {
        return "mainPageView";
    }
    
    @RequestMapping("/nosotros")
    public String nosotros() {
        return "web/nosotrosView";
    }
    
    @RequestMapping("/pizzas")
    public String pizzas() {
        return "web/pizzasView";
    }
    
    @RequestMapping("/productos")
    public String productos() {
        return "web/productosView";
    }
    
    @RequestMapping("/registro")
    public String registro() {
        return "web/registroView";
    }
}
