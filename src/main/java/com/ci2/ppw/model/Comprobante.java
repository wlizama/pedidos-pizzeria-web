/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.model;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

/**
 *
 * @author wilderlizama
 */
@Entity
@Table(name = "comprobante")
public class Comprobante {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdComprobante")
    private Integer idComprobante;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "numero")
    private int numero;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha_emision")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaEmision;
    
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "subtotal")
    private BigDecimal subtotal;
    
    @Column(name = "total")
    private BigDecimal total;
    
    @JoinColumn(name = "IdEstado", referencedColumnName = "IdEstado")
    @ManyToOne(optional = false)
    private Estado estado;
    
    @JoinColumn(name = "IdPedido", referencedColumnName = "IdPedido")
    @ManyToOne(optional = false)
    private Pedido pedido;
    
    @JoinColumn(name = "IdTipoComprobante", referencedColumnName = "IdTipoComprobante")
    @ManyToOne(optional = false)
    private Tipocomprobante tipocomprobante;

    public Comprobante() {
    }

    public Comprobante(Integer idComprobante) {
        this.idComprobante = idComprobante;
    }

    public Comprobante(Integer idComprobante, int numero, Date fechaEmision, BigDecimal subtotal) {
        this.idComprobante = idComprobante;
        this.numero = numero;
        this.fechaEmision = fechaEmision;
        this.subtotal = subtotal;
    }

    public Integer getIdComprobante() {
        return idComprobante;
    }

    public void setIdComprobante(Integer idComprobante) {
        this.idComprobante = idComprobante;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public Date getFechaEmision() {
        return fechaEmision;
    }

    public void setFechaEmision(Date fechaEmision) {
        this.fechaEmision = fechaEmision;
    }

    public BigDecimal getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
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

    public Tipocomprobante getTipocomprobante() {
        return tipocomprobante;
    }

    public void setTipocomprobante(Tipocomprobante tipocomprobante) {
        this.tipocomprobante = tipocomprobante;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idComprobante != null ? idComprobante.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Comprobante)) {
            return false;
        }
        Comprobante other = (Comprobante) object;
        if ((this.idComprobante == null && other.idComprobante != null) || (this.idComprobante != null && !this.idComprobante.equals(other.idComprobante))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ci2.ppw.model.Comprobante[ idComprobante=" + idComprobante + " ]";
    }
    
}
