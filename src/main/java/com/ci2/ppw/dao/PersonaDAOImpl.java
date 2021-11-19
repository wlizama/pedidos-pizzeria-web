/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.dao;

import com.ci2.ppw.model.Persona;
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
public class PersonaDAOImpl implements PersonaDAO {
    
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Persona> getListaPersona() {
        Session  session  = sessionFactory.getCurrentSession();
        Query<Persona> query = session.createQuery("from Persona", Persona.class);
        List<Persona> lstResult = query.getResultList();
        
        return lstResult;
    }

    @Override
    public List<Persona> getListaPersonaByDocumento() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public Persona getPersonaById(int idPersona) {
        Session  session  = sessionFactory.getCurrentSession();
        Query<Persona> query = session.createQuery("from Persona p where p.idPersona=:idPersona", Persona.class);
        query.setParameter("idPersona", idPersona);
        
        return query.getSingleResult();
    }

    @Override
    @Transactional
    public void insertarPersona(Persona prsn) {
        Session  session  = sessionFactory.getCurrentSession();
        session.save(prsn);
    }
    
    @Override
    @Transactional
    public void modificarPersona(Persona prsn) {
        Session  session  = sessionFactory.getCurrentSession();
        session.update(prsn);
    }
    
}
