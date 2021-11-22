/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.dao;

import com.ci2.ppw.model.DocumentoIdentidad;
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
public class DocumentoIdentidadDAOImpl implements DocumentoIdentidadDAO {
    
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public DocumentoIdentidad insertarDocumentoIdentidad(DocumentoIdentidad documentoIdentidad) {
        Session session  = sessionFactory.getCurrentSession();
        session.save(documentoIdentidad);
        
        return documentoIdentidad;
    }
    
}
