/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.dao;

import com.ci2.ppw.model.TipoPersona;
import java.util.List;

/**
 *
 * @author wilderlizama
 */
public interface TipoPersonaDAO {
    public List<TipoPersona> getListaTipoPersona();
    public TipoPersona getTipoPersonaById(int idTipoPersona);
    public void insertarTipoPersona(TipoPersona tipopersona);
    public void modificarTipoPersona(TipoPersona tipopersona);
}
