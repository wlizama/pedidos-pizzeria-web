/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.dao;

import com.ci2.ppw.model.TipoProducto;
import java.util.List;

/**
 *
 * @author JoseGaGu
 */
public interface TipoProductoDAO {
    public List<TipoProducto> getListaTipoProducto();
    
    //public List<TipoProducto> getListaTipoProductoByTipo(int IdTipoProducto);
}
