/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.controller.intranet;


import com.ci2.ppw.dao.TamanhoDAO;
import com.ci2.ppw.model.Tamanho;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
/**
 *
 * @author jonas
 */
@Controller
@RequestMapping("/intranet")
public class MantTamanhoController {
    
    @Autowired
    private TamanhoDAO tamanhoDAO;
    
    @RequestMapping(value = "/mant-pizza/list-tamanho", method = RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Tamanho> getListaTamanho(@RequestParam Map<String, String> params) {
        
        List<Tamanho> lstResult = tamanhoDAO.getListaTamanho();
        return lstResult;
    }
}
