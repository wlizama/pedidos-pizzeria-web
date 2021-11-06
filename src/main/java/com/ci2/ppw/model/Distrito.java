/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author wilderlizama
 */
@Entity
@Table(name = "distrito")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Distrito.findAll", query = "SELECT d FROM Distrito d"),
    @NamedQuery(name = "Distrito.findByIdDistrito", query = "SELECT d FROM Distrito d WHERE d.idDistrito = :idDistrito"),
    @NamedQuery(name = "Distrito.findByNombre", query = "SELECT d FROM Distrito d WHERE d.nombre = :nombre"),
    @NamedQuery(name = "Distrito.findByCobertura", query = "SELECT d FROM Distrito d WHERE d.cobertura = :cobertura")})
public class Distrito implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdDistrito")
    private Integer idDistrito;
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @Column(name = "cobertura")
    private boolean cobertura;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idDistrito")
    private List<DireccionCliente> direccionClienteList;

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

    @XmlTransient
    public List<DireccionCliente> getDireccionClienteList() {
        return direccionClienteList;
    }

    public void setDireccionClienteList(List<DireccionCliente> direccionClienteList) {
        this.direccionClienteList = direccionClienteList;
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
