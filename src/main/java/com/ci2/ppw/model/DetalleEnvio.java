/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author wilderlizama
 */
@Entity
@Table(name = "detalleEnvio")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DetalleEnvio.findAll", query = "SELECT d FROM DetalleEnvio d"),
    @NamedQuery(name = "DetalleEnvio.findByIdDetalleEnvio", query = "SELECT d FROM DetalleEnvio d WHERE d.idDetalleEnvio = :idDetalleEnvio"),
    @NamedQuery(name = "DetalleEnvio.findByHoraEntrega", query = "SELECT d FROM DetalleEnvio d WHERE d.horaEntrega = :horaEntrega"),
    @NamedQuery(name = "DetalleEnvio.findByObservaciones", query = "SELECT d FROM DetalleEnvio d WHERE d.observaciones = :observaciones")})
public class DetalleEnvio implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdDetalleEnvio")
    private Integer idDetalleEnvio;
    @Basic(optional = false)
    @Column(name = "hora_entrega")
    @Temporal(TemporalType.TIMESTAMP)
    private Date horaEntrega;
    @Column(name = "observaciones")
    private String observaciones;
    @JoinColumn(name = "IdEnvio", referencedColumnName = "IdEnvio")
    @ManyToOne(optional = false)
    private Envio idEnvio;
    @JoinColumn(name = "IdEstado", referencedColumnName = "IdEstado")
    @ManyToOne(optional = false)
    private Estado idEstado;
    @JoinColumn(name = "IdPedido", referencedColumnName = "IdPedido")
    @ManyToOne(optional = false)
    private Pedido idPedido;

    public DetalleEnvio() {
    }

    public DetalleEnvio(Integer idDetalleEnvio) {
        this.idDetalleEnvio = idDetalleEnvio;
    }

    public DetalleEnvio(Integer idDetalleEnvio, Date horaEntrega) {
        this.idDetalleEnvio = idDetalleEnvio;
        this.horaEntrega = horaEntrega;
    }

    public Integer getIdDetalleEnvio() {
        return idDetalleEnvio;
    }

    public void setIdDetalleEnvio(Integer idDetalleEnvio) {
        this.idDetalleEnvio = idDetalleEnvio;
    }

    public Date getHoraEntrega() {
        return horaEntrega;
    }

    public void setHoraEntrega(Date horaEntrega) {
        this.horaEntrega = horaEntrega;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Envio getIdEnvio() {
        return idEnvio;
    }

    public void setIdEnvio(Envio idEnvio) {
        this.idEnvio = idEnvio;
    }

    public Estado getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(Estado idEstado) {
        this.idEstado = idEstado;
    }

    public Pedido getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(Pedido idPedido) {
        this.idPedido = idPedido;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDetalleEnvio != null ? idDetalleEnvio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DetalleEnvio)) {
            return false;
        }
        DetalleEnvio other = (DetalleEnvio) object;
        if ((this.idDetalleEnvio == null && other.idDetalleEnvio != null) || (this.idDetalleEnvio != null && !this.idDetalleEnvio.equals(other.idDetalleEnvio))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ci2.ppw.model.DetalleEnvio[ idDetalleEnvio=" + idDetalleEnvio + " ]";
    }
    
}
