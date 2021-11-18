/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.dao;

import com.ci2.ppw.model.Estado;
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
public class EstadoDAOImpl implements EstadoDAO {
    
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Estado> getListaEstado() {
        Session session  = sessionFactory.getCurrentSession();
        Query<Estado> query = session.createQuery("from Estado", Estado.class);
        List<Estado> lstResult = query.getResultList();
        
        return lstResult;
    }

    @Override
    @Transactional
    public List<Estado> getListaEstadoByTipo(int IdTipoEstado) {
        Session session  = sessionFactory.getCurrentSession();
        Query<Estado> query = session.createQuery("from Estado e where e.tipoestado.idTipoEstado=:IdTipoEstado", Estado.class);
        query.setParameter("IdTipoEstado", IdTipoEstado);
        System.err.println("IdTipoEstado:" + IdTipoEstado);
        List<Estado> lstResult = query.getResultList();
        return lstResult;
    }
    
    
}
