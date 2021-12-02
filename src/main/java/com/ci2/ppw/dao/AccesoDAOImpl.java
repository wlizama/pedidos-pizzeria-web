/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.dao;

import com.ci2.ppw.model.Acceso;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author wilderlizama
 */
@Repository
public class AccesoDAOImpl implements AccesoDAO {
    
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Acceso> getListaAccesoByIdRol(int idRol) {
        Session  session  = sessionFactory.getCurrentSession();
        Query<Acceso> query = session.createQuery("from Acceso a where a.roles.idRol=:idRol", Acceso.class);
        query.setParameter("idRol", idRol);
        
        return query.getResultList();
    }

    @Override
    @Transactional
    public void insertarAcceso(Acceso acceso) {
        Session  session  = sessionFactory.getCurrentSession();
        session.save(acceso);
    }

    @Override
    @Transactional
    public int modificarAcceso(int idAcceso, short acceso) {
        
        Session  session  = sessionFactory.getCurrentSession();
        Query<Acceso> query = session.createQuery("update Acceso a set a.acceso=:acceso where a.idAcceso=:idAcceso");
        query.setParameter("acceso", acceso);
        query.setParameter("idAcceso", idAcceso);
        
        int status = query.executeUpdate();
        return status;
    }
    
}
