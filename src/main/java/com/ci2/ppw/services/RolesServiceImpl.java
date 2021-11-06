/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.services;

import com.ci2.ppw.dao.RolesDAO;
import com.ci2.ppw.model.Roles;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RolesServiceImpl implements RolesService {
    
    @Autowired
    private RolesDAO rolesDAO;

    @Override
    @Transactional
    public List<Roles> getRoles() {
        return rolesDAO.getRoles();
    }
    
}
