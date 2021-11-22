/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.dao;

import com.ci2.ppw.model.Persona;
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
 * @author wilderlizama
 */
@Repository
public class PersonaDAOImpl implements PersonaDAO {
    
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Persona> getListaPersona(int idTipoDocIdentidad, String numero) {
        
        Session  session  = sessionFactory.getCurrentSession();
        Query<Persona> query = session.createQuery(
            "from Persona p where " +
            "p.documentoIdentidad.tipoDocumentoIdentidad.idTipoDocIdentidad between :idTipoDocIdentidad_ini and :idTipoDocIdentidad_fin and " +
            "p.documentoIdentidad.numero between :numero_ini and :numero_fin and " +
            "p.idPersona <> :idsuuser", 
            Persona.class
        );
        int idTipoDocIdentidad_ini = idTipoDocIdentidad;
        int idTipoDocIdentidad_fin = idTipoDocIdentidad;
        String numero_ini = numero;
        String numero_fin = numero;
        if (idTipoDocIdentidad == Constants.MIN_INT_FILTER) {
            idTipoDocIdentidad_ini = Constants.MIN_INT_FILTER;
            idTipoDocIdentidad_fin = Constants.MAX_INT_FILTER;
        }
        
        if (numero.equals(Constants.MIN_STRING_FILTER)) {
            numero_ini = Constants.MIN_STRING_FILTER;
            numero_fin = Constants.MAX_STRING_FILTER;
        }
        
        query.setParameter("idTipoDocIdentidad_ini", idTipoDocIdentidad_ini);
        query.setParameter("idTipoDocIdentidad_fin", idTipoDocIdentidad_fin);
        query.setParameter("numero_ini", numero_ini);
        query.setParameter("numero_fin", numero_fin);
        query.setParameter("idsuuser", Constants.IDPERSONA_SUUSER);
        
        List<Persona> lstResult = query.getResultList();
        
        return lstResult;
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
