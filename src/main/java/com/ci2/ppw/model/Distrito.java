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
@Table(name = "distrito")
public class Distrito {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdDistrito")
    private Integer idDistrito;

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "nombre")
    private String nombre;

    @Basic(optional = false)
    @NotNull
    @Column(name = "cobertura")
    private boolean cobertura;

    public Distrito() {
    }

    public Distrito(Integer idDistrito) {
        this.idDistrito = idDistrito;
    }

    public Distrito(Integer idDistrito, String nombre, boolean cobertura) {
        this.idDistrito = idDistrito;
        this.nombre = nombre;
        this.cobertura = cobertura;
    }

    public Integer getIdDistrito() {
        return idDistrito;
    }

    public void setIdDistrito(Integer idDistrito) {
        this.idDistrito = idDistrito;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean getCobertura() {
        return cobertura;
    }

    public void setCobertura(boolean cobertura) {
        this.cobertura = cobertura;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDistrito != null ? idDistrito.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Distrito)) {
            return false;
        }
        Distrito other = (Distrito) object;
        if ((this.idDistrito == null && other.idDistrito != null) || (this.idDistrito != null && !this.idDistrito.equals(other.idDistrito))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ci2.ppw.model.Distrito[ idDistrito=" + idDistrito + " ]";
    }
    
}
