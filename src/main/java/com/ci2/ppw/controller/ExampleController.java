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
public class ExampleController {

    /**
     * Creates a new instance of NewJSFManagedBean
     */
//    public ExampleController() {
//        
//    }
    
    @RequestMapping
    public String muestraPagina() {
        return "mainPage";
    }
            
}
