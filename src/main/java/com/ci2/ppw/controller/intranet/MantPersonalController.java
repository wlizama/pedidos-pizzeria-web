/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.controller.intranet;

import com.ci2.ppw.dao.RolesDAO;
import com.ci2.ppw.model.Roles;
import com.ci2.ppw.services.RolesService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author wilderlizama
 */
@Controller
@RequestMapping("/intranet")
public class MantPersonalController {
    
    @Autowired
    private RolesService rolesServices;
    
    @RequestMapping("/mant-personal")
    public String getListas(Model model) {
        
        List<Roles> lstRoles = rolesServices.getRoles();
        
        model.addAttribute("roles", lstRoles);
        
        return "intranet/mantPersonalView";
    }
    
}
