/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.dao;

import com.ci2.ppw.model.Tamanho;
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
public class TamanhoDAOImpl implements TamanhoDAO {
    
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Tamanho> getListaTamanho() {
        Session  session  = sessionFactory.getCurrentSession();
        Query<Tamanho> query = session.createQuery("from Tamanho", Tamanho.class);
        List<Tamanho> lstResult = query.getResultList();
        
        return lstResult;
    }    
    
}
