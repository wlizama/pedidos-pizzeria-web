/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.dao;

import com.ci2.ppw.model.Acceso;
import java.util.List;

/**
 *
 * @author wilderlizama
 */
public interface AccesoDAO {
    public List<Acceso> getListaAccesoByIdRol(int idRol);
    public void insertarAcceso(Acceso acceso);
    public int modificarAcceso(int idAcceso, short acceso);
}
