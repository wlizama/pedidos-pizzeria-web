/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.dao;

import com.ci2.ppw.model.TipoPersona;
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
public class TipoPersonaDAOImpl implements TipoPersonaDAO {
    
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<TipoPersona> getListaTipoPersona() {
        Session  session  = sessionFactory.getCurrentSession();
        Query<TipoPersona> query = session.createQuery("from TipoPersona", TipoPersona.class);
        List<TipoPersona> lstResult = query.getResultList();
        
        return lstResult;
    }

    @Override
    @Transactional
    public TipoPersona getTipoPersonaById(int idTipoPersona) {
        Session  session  = sessionFactory.getCurrentSession();
        Query<TipoPersona> query = session.createQuery("from TipoPersona tp where tp.idTipoPersona=:idTipoPersona", TipoPersona.class);
        query.setParameter("idTipoPersona", idTipoPersona);
        
        return query.getSingleResult();
    }

    @Override
    @Transactional
    public void insertarTipoPersona(TipoPersona tipopersona) {
        Session  session  = sessionFactory.getCurrentSession();
        session.save(tipopersona);
    }

    @Override
    @Transactional
    public void modificarTipoPersona(TipoPersona tipopersona) {
        Session  session  = sessionFactory.getCurrentSession();
        session.update(tipopersona);
    }
    
}
