/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.controller;

import com.ci2.ppw.model.Prueba;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author wilderlizama
 */
@Controller
//@RequestMapping("/example")
public class PruebaController {
    
    @RequestMapping("/prueba")
    public String prueba(Model model) {
        
        Prueba objPrueba = new Prueba();
        model.addAttribute("prueba", objPrueba);
        
        return "pruebaView";
    }
    
    @RequestMapping("/procesarPrueba")
    public String procesarPrueba(@ModelAttribute("prueba") Prueba objPrueba) {
        return "pruebaResultView";
    }
}
