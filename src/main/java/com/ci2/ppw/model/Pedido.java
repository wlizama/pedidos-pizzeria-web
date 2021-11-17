/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.model;

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
import javax.validation.constraints.Size;

/**
 *
 * @author wilderlizama
 */
@Entity
@Table(name = "pedido")
public class Pedido {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdPedido")
    private Integer idPedido;

    @Basic(optional = false)
    @NotNull
    @Column(name = "numero")
    private int numero;

    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha_creacion")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaCreacion;

    @Size(max = 50)
    @Column(name = "observaciones")
    private String observaciones;

    @Column(name = "fecha_preparacion")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaPreparacion;

    @Column(name = "fecha_entrega")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaEntrega;

    @JoinColumn(name = "IdCliente", referencedColumnName = "IdCliente")
    @ManyToOne(optional = false)
    private Cliente cliente;

    @JoinColumn(name = "idDireccionEnvio", referencedColumnName = "iddireccionCliente")
    @ManyToOne(optional = false)
    private DireccionCliente direccionCliente;

    @JoinColumn(name = "IdEstado", referencedColumnName = "IdEstado")
    @ManyToOne(optional = false)
    private Estado estado;

    public Pedido() {
    }

    public Pedido(Integer idPedido) {
        this.idPedido = idPedido;
    }

    public Pedido(Integer idPedido, int numero, Date fechaCreacion) {
        this.idPedido = idPedido;
        this.numero = numero;
        this.fechaCreacion = fechaCreacion;
    }

    public Integer getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(Integer idPedido) {
        this.idPedido = idPedido;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Date getFechaPreparacion() {
        return fechaPreparacion;
    }

    public void setFechaPreparacion(Date fechaPreparacion) {
        this.fechaPreparacion = fechaPreparacion;
    }

    public Date getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(Date fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public DireccionCliente getDireccionCliente() {
        return direccionCliente;
    }

    public void setDireccionCliente(DireccionCliente direccionCliente) {
        this.direccionCliente = direccionCliente;
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
        hash += (idPedido != null ? idPedido.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pedido)) {
            return false;
        }
        Pedido other = (Pedido) object;
        if ((this.idPedido == null && other.idPedido != null) || (this.idPedido != null && !this.idPedido.equals(other.idPedido))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ci2.ppw.model.Pedido[ idPedido=" + idPedido + " ]";
    }
    
}
