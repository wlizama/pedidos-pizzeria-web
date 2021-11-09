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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 *
 * @author wilderlizama
 */
@Entity
@Table(name = "acceso")
public class Acceso {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdAcceso")
    private Integer idAcceso;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "acceso")
    private short acceso;
    
    @JoinColumn(name = "IdFormulario", referencedColumnName = "IdFormulario")
    @ManyToOne(optional = false)
    private Formulario formulario;
    
    @JoinColumn(name = "IdRol", referencedColumnName = "IdRol")
    @ManyToOne(optional = false)
    private Roles roles;

    public Acceso() {
    }

    public Acceso(Integer idAcceso) {
        this.idAcceso = idAcceso;
    }

    public Acceso(Integer idAcceso, short acceso) {
        this.idAcceso = idAcceso;
        this.acceso = acceso;
    }

    public Integer getIdAcceso() {
        return idAcceso;
    }

    public void setIdAcceso(Integer idAcceso) {
        this.idAcceso = idAcceso;
    }

    public short getAcceso() {
        return acceso;
    }

    public void setAcceso(short acceso) {
        this.acceso = acceso;
    }

    public Formulario getFormulario() {
        return formulario;
    }

    public void setFormulario(Formulario formulario) {
        this.formulario = formulario;
    }

    public Roles getRoles() {
        return roles;
    }

    public void setRoles(Roles roles) {
        this.roles = roles;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idAcceso != null ? idAcceso.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Acceso)) {
            return false;
        }
        Acceso other = (Acceso) object;
        if ((this.idAcceso == null && other.idAcceso != null) || (this.idAcceso != null && !this.idAcceso.equals(other.idAcceso))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ci2.ppw.model.Acceso[ idAcceso=" + idAcceso + " ]";
    }
    
}
