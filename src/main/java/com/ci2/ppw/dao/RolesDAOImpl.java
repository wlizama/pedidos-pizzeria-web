/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.dao;

import com.ci2.ppw.model.Roles;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class RolesDAOImpl implements RolesDAO {
    
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Roles> getRoles() {
        Session  session  = sessionFactory.getCurrentSession();
        Query<Roles> query = session.createQuery("from roles", Roles.class);
        List<Roles> lstRoles = query.getResultList();
        
        return lstRoles;
    }
    
}
