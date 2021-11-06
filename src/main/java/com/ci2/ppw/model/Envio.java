/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.model;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author wilderlizama
 */
@Entity
@Table(name = "envio")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Envio.findAll", query = "SELECT e FROM Envio e"),
    @NamedQuery(name = "Envio.findByIdEnvio", query = "SELECT e FROM Envio e WHERE e.idEnvio = :idEnvio"),
    @NamedQuery(name = "Envio.findByHoraInicio", query = "SELECT e FROM Envio e WHERE e.horaInicio = :horaInicio"),
    @NamedQuery(name = "Envio.findByHoraFin", query = "SELECT e FROM Envio e WHERE e.horaFin = :horaFin"),
    @NamedQuery(name = "Envio.findByNumero", query = "SELECT e FROM Envio e WHERE e.numero = :numero")})
public class Envio implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdEnvio")
    private Integer idEnvio;
    @Basic(optional = false)
    @Column(name = "hora_inicio")
    @Temporal(TemporalType.TIMESTAMP)
    private Date horaInicio;
    @Basic(optional = false)
    @Column(name = "hora_fin")
    @Temporal(TemporalType.TIMESTAMP)
    private Date horaFin;
    @Basic(optional = false)
    @Column(name = "numero")
    private int numero;
    @JoinColumns({
        @JoinColumn(name = "IdEstado", referencedColumnName = "IdEstado"),
        @JoinColumn(name = "IdEstado", referencedColumnName = "IdEstado")})
    @ManyToOne(optional = false)
    private Estado estado;
    @JoinColumn(name = "idRepartidor", referencedColumnName = "idRepartidor")
    @ManyToOne(optional = false)
    private Repartidor idRepartidor;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idEnvio")
    private List<DetalleEnvio> detalleEnvioList;

    public Envio() {
    }

    public Envio(Integer idEnvio) {
        this.idEnvio = idEnvio;
    }

    public Envio(Integer idEnvio, Date horaInicio, Date horaFin, int numero) {
        this.idEnvio = idEnvio;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.numero = numero;
    }

    public Integer getIdEnvio() {
        return idEnvio;
    }

    public void setIdEnvio(Integer idEnvio) {
        this.idEnvio = idEnvio;
    }

    public Date getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(Date horaInicio) {
        this.horaInicio = horaInicio;
    }

    public Date getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(Date horaFin) {
        this.horaFin = horaFin;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public Repartidor getIdRepartidor() {
        return idRepartidor;
    }

    public void setIdRepartidor(Repartidor idRepartidor) {
        this.idRepartidor = idRepartidor;
    }

    @XmlTransient
    public List<DetalleEnvio> getDetalleEnvioList() {
        return detalleEnvioList;
    }

    public void setDetalleEnvioList(List<DetalleEnvio> detalleEnvioList) {
        this.detalleEnvioList = detalleEnvioList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEnvio != null ? idEnvio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Envio)) {
            return false;
        }
        Envio other = (Envio) object;
        if ((this.idEnvio == null && other.idEnvio != null) || (this.idEnvio != null && !this.idEnvio.equals(other.idEnvio))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ci2.ppw.model.Envio[ idEnvio=" + idEnvio + " ]";
    }
    
}
