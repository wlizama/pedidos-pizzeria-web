/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.model;

import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author wilderlizama
 */
@Entity
@Table(name = "roles")
public class Roles {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdRol")
    private Integer idRol;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "nombre")
    private String nombre;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "roles")
    private List<Acceso> accesoList;
    
//    @OneToMany(cascade = CascadeType.ALL, mappedBy = "roles")
//    private List<Usuario> usuarioList;

    public Roles() {
    }

    public Roles(Integer idRol) {
        this.idRol = idRol;
    }

    public Roles(Integer idRol, String nombre) {
        this.idRol = idRol;
        this.nombre = nombre;
    }

    public Integer getIdRol() {
        return idRol;
    }

    public void setIdRol(Integer idRol) {
        this.idRol = idRol;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public List<Acceso> getAccesoList() {
        return accesoList;
    }

    public void setAccesoList(List<Acceso> accesoList) {
        this.accesoList = accesoList;
    }

//    public List<Usuario> getUsuarioList() {
//        return usuarioList;
//    }
//
//    public void setUsuarioList(List<Usuario> usuarioList) {
//        this.usuarioList = usuarioList;
//    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idRol != null ? idRol.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Roles)) {
            return false;
        }
        Roles other = (Roles) object;
        if ((this.idRol == null && other.idRol != null) || (this.idRol != null && !this.idRol.equals(other.idRol))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ci2.ppw.model.Roles[ idRol=" + idRol + ", nombre=" + nombre + " ]";
    }
    
}
