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
@Table(name = "repartidor")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Repartidor.findAll", query = "SELECT r FROM Repartidor r"),
    @NamedQuery(name = "Repartidor.findByIdRepartidor", query = "SELECT r FROM Repartidor r WHERE r.idRepartidor = :idRepartidor"),
    @NamedQuery(name = "Repartidor.findByPlacaUnidad", query = "SELECT r FROM Repartidor r WHERE r.placaUnidad = :placaUnidad")})
public class Repartidor implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idRepartidor")
    private Integer idRepartidor;
    @Column(name = "placa_unidad")
    private String placaUnidad;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idRepartidor")
    private List<Envio> envioList;
    @JoinColumn(name = "IdPersona", referencedColumnName = "IdPersona")
    @ManyToOne(optional = false)
    private Persona idPersona;

    public Repartidor() {
    }

    public Repartidor(Integer idRepartidor) {
        this.idRepartidor = idRepartidor;
    }

    public Integer getIdRepartidor() {
        return idRepartidor;
    }

    public void setIdRepartidor(Integer idRepartidor) {
        this.idRepartidor = idRepartidor;
    }

    public String getPlacaUnidad() {
        return placaUnidad;
    }

    public void setPlacaUnidad(String placaUnidad) {
        this.placaUnidad = placaUnidad;
    }

    @XmlTransient
    public List<Envio> getEnvioList() {
        return envioList;
    }

    public void setEnvioList(List<Envio> envioList) {
        this.envioList = envioList;
    }

    public Persona getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(Persona idPersona) {
        this.idPersona = idPersona;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idRepartidor != null ? idRepartidor.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Repartidor)) {
            return false;
        }
        Repartidor other = (Repartidor) object;
        if ((this.idRepartidor == null && other.idRepartidor != null) || (this.idRepartidor != null && !this.idRepartidor.equals(other.idRepartidor))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ci2.ppw.model.Repartidor[ idRepartidor=" + idRepartidor + " ]";
    }
    
}
