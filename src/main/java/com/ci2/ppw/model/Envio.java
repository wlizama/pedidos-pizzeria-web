/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.model;

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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

/**
 *
 * @author wilderlizama
 */
@Entity
@Table(name = "envio")
public class Envio {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdEnvio")
    private Integer idEnvio;

    @Basic(optional = false)
    @NotNull
    @Column(name = "hora_inicio")
    @Temporal(TemporalType.TIMESTAMP)
    private Date horaInicio;

    @Basic(optional = false)
    @NotNull
    @Column(name = "hora_fin")
    @Temporal(TemporalType.TIMESTAMP)
    private Date horaFin;

    @Basic(optional = false)
    @NotNull
    @Column(name = "numero")
    private int numero;

    @JoinColumn(name = "IdEstado", referencedColumnName = "IdEstado")
    @ManyToOne(optional = false)
    private Estado estado;

    @JoinColumn(name = "idRepartidor", referencedColumnName = "idRepartidor")
    @ManyToOne(optional = false)
    private Repartidor repartidor;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "envio")
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

    public Repartidor getRepartidor() {
        return repartidor;
    }

    public void setRepartidor(Repartidor repartidor) {
        this.repartidor = repartidor;
    }

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
