/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.dao;

import com.ci2.ppw.model.Distrito;
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
public class CoberturasDAOImpl implements CoberturasDAO{
    
    @Autowired
    private SessionFactory sessionFactory;
    
    @Override
    @Transactional
        public List<Distrito> getListaCobertura(int idDistrito, String numero) {
        
        Session  session  = sessionFactory.getCurrentSession();
        Query<Distrito> query = session.createQuery(
            "from Distrito p where " +
            "p.idDistrito between :idDistrito_ini and :idDistrito_fin and " +
            "p.nombre between :numero_ini and :numero_fin and ", 
            Distrito.class
        );
        int idDistrito_ini = idDistrito;
        int idDistrito_fin = idDistrito;
        String numero_ini = numero;
        String numero_fin = numero;
        if (idDistrito == Constants.MIN_INT_FILTER) {
            idDistrito_ini = Constants.MIN_INT_FILTER;
            idDistrito_fin = Constants.MAX_INT_FILTER;
        }
        
        if (numero.equals(Constants.MIN_STRING_FILTER)) {
            numero_ini = Constants.MIN_STRING_FILTER;
            numero_fin = Constants.MAX_STRING_FILTER;
        }
        
        query.setParameter("idDistrito_ini", idDistrito_ini);
        query.setParameter("idDistrito_fin", idDistrito_fin);
        query.setParameter("numero_ini", numero_ini);
        query.setParameter("numero_fin", numero_fin);
        query.setParameter("idsuuser", Constants.IDPERSONA_SUUSER);
        
        List<Distrito> lstResult = query.getResultList();
        
        return lstResult;
    }

    @Override
    @Transactional
    public Distrito getCoberturaById(int idDistrito) {
        Session  session  = sessionFactory.getCurrentSession();
        Query<Distrito> query = session.createQuery("from Distrito p where p.idDistrito=:idDistrito", Distrito.class);
        query.setParameter("idDistrito", idDistrito);
        
        return query.getSingleResult();
    }

    @Override
    @Transactional
    public void insertarCobertura(Distrito dist) {
        Session  session  = sessionFactory.getCurrentSession();
        session.save(dist);
    }
    
    @Override
    @Transactional
    public void modificarCobertura(Distrito dist) {
        Session  session  = sessionFactory.getCurrentSession();
        session.update(dist);
    }
    
}
