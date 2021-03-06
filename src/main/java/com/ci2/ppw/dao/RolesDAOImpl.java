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
    public List<Roles> getListaRoles() {
        Session  session  = sessionFactory.getCurrentSession();
        Query<Roles> query = session.createQuery("from Roles", Roles.class);
        List<Roles> lstResult = query.getResultList();
        
        return lstResult;
    }

    @Override
    @Transactional
    public Roles getRolById(int idRol) {
        Session  session  = sessionFactory.getCurrentSession();
        Query<Roles> query = session.createQuery("from Roles r where r.idRol=:idRol", Roles.class);
        query.setParameter("idRol", idRol);
        
        return query.getSingleResult();
    }

    @Override
    @Transactional
    public void insertarRol(Roles rol) {
        Session  session  = sessionFactory.getCurrentSession();
        session.save(rol);
    }

    @Override
    @Transactional
    public void modificarRol(Roles rol) {
        Session  session  = sessionFactory.getCurrentSession();
        session.update(rol);
    }
    
}
