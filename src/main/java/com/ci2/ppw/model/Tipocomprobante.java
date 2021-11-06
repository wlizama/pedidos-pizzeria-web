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
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
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
@Table(name = "tipocomprobante")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tipocomprobante.findAll", query = "SELECT t FROM Tipocomprobante t"),
    @NamedQuery(name = "Tipocomprobante.findByIdTipoComprobante", query = "SELECT t FROM Tipocomprobante t WHERE t.idTipoComprobante = :idTipoComprobante"),
    @NamedQuery(name = "Tipocomprobante.findByNombre", query = "SELECT t FROM Tipocomprobante t WHERE t.nombre = :nombre")})
public class Tipocomprobante implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdTipoComprobante")
    private Integer idTipoComprobante;
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipocomprobante")
    private List<Comprobante> comprobanteList;
    @JoinColumns({
        @JoinColumn(name = "IdEstado", referencedColumnName = "IdEstado"),
        @JoinColumn(name = "IdEstado", referencedColumnName = "IdEstado")})
    @ManyToOne(optional = false)
    private Estado estado;

    public Tipocomprobante() {
    }

    public Tipocomprobante(Integer idTipoComprobante) {
        this.idTipoComprobante = idTipoComprobante;
    }

    public Tipocomprobante(Integer idTipoComprobante, String nombre) {
        this.idTipoComprobante = idTipoComprobante;
        this.nombre = nombre;
    }

    public Integer getIdTipoComprobante() {
        return idTipoComprobante;
    }

    public void setIdTipoComprobante(Integer idTipoComprobante) {
        this.idTipoComprobante = idTipoComprobante;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @XmlTransient
    public List<Comprobante> getComprobanteList() {
        return comprobanteList;
    }

    public void setComprobanteList(List<Comprobante> comprobanteList) {
        this.comprobanteList = comprobanteList;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipoComprobante != null ? idTipoComprobante.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tipocomprobante)) {
            return false;
        }
        Tipocomprobante other = (Tipocomprobante) object;
        if ((this.idTipoComprobante == null && other.idTipoComprobante != null) || (this.idTipoComprobante != null && !this.idTipoComprobante.equals(other.idTipoComprobante))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ci2.ppw.model.Tipocomprobante[ idTipoComprobante=" + idTipoComprobante + " ]";
    }
    
}
