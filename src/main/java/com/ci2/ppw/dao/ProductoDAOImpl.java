/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.dao;

import com.ci2.ppw.model.Producto;
import com.ci2.ppw.utils.Constants;
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
public class ProductoDAOImpl implements ProductoDAO{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Producto> getListaProducto(int idTipoProducto, String nombre2) {
        
        Session  session  = sessionFactory.getCurrentSession();
        Query<Producto> query = session.createQuery(
            "from Producto p where "+
            " (p.tipoProducto.idTipoProducto between :idTipoProducto_ini and :idTipoProducto_fin) and "+
            " (p.nombre like :nombre_ini ) ",
            //"p.idPersona <> :idsuuser", 
            Producto.class
        );
        int idTipoProducto_ini = idTipoProducto;
        int idTipoProducto_fin = idTipoProducto;
        String nombre_ini = nombre2;
        if (idTipoProducto == Constants.MIN_INT_FILTER) {
            idTipoProducto_ini = Constants.MIN_INT_FILTER;
            idTipoProducto_fin = Constants.MAX_INT_FILTER;
        }
        
        if (nombre2.equals(Constants.MIN_STRING_FILTER)) {
            nombre_ini = "%%";
        }{nombre_ini = "%"+nombre_ini+"%";
        }
        
        query.setParameter("idTipoProducto_ini", idTipoProducto_ini);
        query.setParameter("idTipoProducto_fin", idTipoProducto_fin);
        query.setParameter("nombre_ini",nombre_ini);
       // query.setParameter("idsuuser", Constants.IDPERSONA_SUUSER);
        
        List<Producto> lstResult = query.getResultList();
        
        return lstResult;
    }
    
    @Override
    @Transactional
    public Producto getProductoById(int idProducto) {
        Session  session  = sessionFactory.getCurrentSession();
        Query<Producto> query = session.createQuery("from Producto p where p.idProducto=:idProducto", Producto.class);
        query.setParameter("idProducto", idProducto);
        
        return query.getSingleResult();
    }

    @Override
    @Transactional
    public void insertarProducto(Producto prod) {
        Session  session  = sessionFactory.getCurrentSession();
        session.save(prod);
    }
    
    @Override
    @Transactional
    public void modificarProducto(Producto prod) {
        Session  session  = sessionFactory.getCurrentSession();
        session.update(prod);
    }
}
