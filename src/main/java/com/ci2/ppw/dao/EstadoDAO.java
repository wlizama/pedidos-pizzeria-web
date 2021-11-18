/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.dao;

import com.ci2.ppw.model.Estado;
import java.util.List;

/**
 *
 * @author wilderlizama
 */
public interface EstadoDAO {
    public List<Estado> getListaEstado();
    
    public List<Estado> getListaEstadoByTipo(int IdTipoEstado);
}
