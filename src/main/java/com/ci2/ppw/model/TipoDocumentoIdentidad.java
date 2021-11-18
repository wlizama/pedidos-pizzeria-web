/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 *
 * @author wilderlizama
 */
@Entity
@Table(name = "tipoDocumentoIdentidad")
public class TipoDocumentoIdentidad {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdTipoDocIdentidad")
    private Integer idTipoDocIdentidad;

    @Size(max = 30)
    @Column(name = "nombre")
    private String nombre;

    @Column(name = "cantidad_caracteres")
    private Integer cantidadCaracteres;

    public TipoDocumentoIdentidad() {
    }

    public TipoDocumentoIdentidad(Integer idTipoDocIdentidad) {
        this.idTipoDocIdentidad = idTipoDocIdentidad;
    }

    public Integer getIdTipoDocIdentidad() {
        return idTipoDocIdentidad;
    }

    public void setIdTipoDocIdentidad(Integer idTipoDocIdentidad) {
        this.idTipoDocIdentidad = idTipoDocIdentidad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getCantidadCaracteres() {
        return cantidadCaracteres;
    }

    public void setCantidadCaracteres(Integer cantidadCaracteres) {
        this.cantidadCaracteres = cantidadCaracteres;
    }
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipoDocIdentidad != null ? idTipoDocIdentidad.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoDocumentoIdentidad)) {
            return false;
        }
        TipoDocumentoIdentidad other = (TipoDocumentoIdentidad) object;
        if ((this.idTipoDocIdentidad == null && other.idTipoDocIdentidad != null) || (this.idTipoDocIdentidad != null && !this.idTipoDocIdentidad.equals(other.idTipoDocIdentidad))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ci2.ppw.model.TipoDocumentoIdentidad[ idTipoDocIdentidad=" + idTipoDocIdentidad + " ]";
    }
    
}
