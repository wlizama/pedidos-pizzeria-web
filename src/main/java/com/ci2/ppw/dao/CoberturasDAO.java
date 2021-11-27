/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.dao;

import com.ci2.ppw.model.Distrito;
import java.util.List;

/**
 *
 * @author JoseGaGu
 */
public interface CoberturasDAO {
    public List<Distrito> getListaCobertura(int idTipoDocIdentidad, String numero);
    public Distrito getCoberturaById(int idDistrito);
    public void insertarCobertura(Distrito distrito);
    public void modificarCobertura(Distrito distrito);
}
