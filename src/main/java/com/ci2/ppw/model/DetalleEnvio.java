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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author wilderlizama
 */
@Entity
@Table(name = "detalleEnvio")
@NamedQueries({
    @NamedQuery(name = "DetalleEnvio.findAll", query = "SELECT d FROM DetalleEnvio d")})
public class DetalleEnvio implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdDetalleEnvio")
    private Integer idDetalleEnvio;
    @Basic(optional = false)
    @NotNull
    @Column(name = "hora_entrega")
    @Temporal(TemporalType.TIMESTAMP)
    private Date horaEntrega;
    @Size(max = 500)
    @Column(name = "observaciones")
    private String observaciones;
    @JoinColumn(name = "IdEnvio", referencedColumnName = "IdEnvio")
    @ManyToOne(optional = false)
    private Envio envio;
    @JoinColumn(name = "IdEstado", referencedColumnName = "IdEstado")
    @ManyToOne(optional = false)
    private Estado estado;
    @JoinColumn(name = "IdPedido", referencedColumnName = "IdPedido")
    @ManyToOne(optional = false)
    private Pedido pedido;

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

    public Envio getEnvio() {
        return envio;
    }

    public void setEnvio(Envio envio) {
        this.envio = envio;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
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
