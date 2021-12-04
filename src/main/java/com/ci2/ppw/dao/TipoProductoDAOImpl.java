/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.dao;

import com.ci2.ppw.model.TipoProducto;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author JoseGaGu
 */
@Repository
public class TipoProductoDAOImpl implements TipoProductoDAO{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<TipoProducto> getListaTipoProducto() {
        Session session  = sessionFactory.getCurrentSession();
        Query<TipoProducto> query = session.createQuery("from TipoProducto", TipoProducto.class);
        System.err.println("Iquery:" + query);
        List<TipoProducto> lstResult = query.getResultList();
        
        return lstResult;
    }
/**
   @Override
    @Transactional
    public List<TipoProducto> getListaTipoProductoByTipo(int IdTipoProducto) {
        Session session  = sessionFactory.getCurrentSession();
        Query<TipoProducto> query = session.createQuery("from tipoproducto e where e.IdTipoProducto=:IdTipoProducto", TipoProducto.class);
        query.setParameter("IdTipoProducto", IdTipoProducto);
        System.err.println("IdTipoProducto:" + IdTipoProducto);
        List<TipoProducto> lstResult = query.getResultList();
        return lstResult;
    }**/
    
}
