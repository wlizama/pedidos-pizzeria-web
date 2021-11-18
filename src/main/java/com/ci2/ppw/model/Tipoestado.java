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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author wilderlizama
 */
@Entity
@Table(name = "tipoestado")
public class Tipoestado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdTipoEstado")
    private Integer idTipoEstado;

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "nombre")
    private String nombre;

    public Tipoestado() {
    }

    public Tipoestado(Integer idTipoEstado) {
        this.idTipoEstado = idTipoEstado;
    }

    public Tipoestado(Integer idTipoEstado, String nombre) {
        this.idTipoEstado = idTipoEstado;
        this.nombre = nombre;
    }

    public Integer getIdTipoEstado() {
        return idTipoEstado;
    }

    public void setIdTipoEstado(Integer idTipoEstado) {
        this.idTipoEstado = idTipoEstado;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipoEstado != null ? idTipoEstado.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tipoestado)) {
            return false;
        }
        Tipoestado other = (Tipoestado) object;
        if ((this.idTipoEstado == null && other.idTipoEstado != null) || (this.idTipoEstado != null && !this.idTipoEstado.equals(other.idTipoEstado))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ci2.ppw.model.Tipoestado[ idTipoEstado=" + idTipoEstado + " ]";
    }
    
}
