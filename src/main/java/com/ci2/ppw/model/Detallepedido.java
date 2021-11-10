/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.model;

import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 *
 * @author wilderlizama
 */
@Entity
@Table(name = "detallepedido")
public class Detallepedido {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdDetallePedido")
    private Integer idDetallePedido;

    @Basic(optional = false)
    @NotNull
    @Column(name = "cantidad")
    private int cantidad;

    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "precio")
    private BigDecimal precio;

    @JoinColumn(name = "IdPedido", referencedColumnName = "IdPedido")
    @ManyToOne(optional = false)
    private Pedido pedido;

    @JoinColumn(name = "idProducto", referencedColumnName = "idProducto")
    @ManyToOne(optional = false)
    private Producto producto;

    public Detallepedido() {
    }

    public Detallepedido(Integer idDetallePedido) {
        this.idDetallePedido = idDetallePedido;
    }

    public Detallepedido(Integer idDetallePedido, int cantidad) {
        this.idDetallePedido = idDetallePedido;
        this.cantidad = cantidad;
    }

    public Integer getIdDetallePedido() {
        return idDetallePedido;
    }

    public void setIdDetallePedido(Integer idDetallePedido) {
        this.idDetallePedido = idDetallePedido;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public BigDecimal getPrecio() {
        return precio;
    }

    public void setPrecio(BigDecimal precio) {
        this.precio = precio;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDetallePedido != null ? idDetallePedido.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Detallepedido)) {
            return false;
        }
        Detallepedido other = (Detallepedido) object;
        if ((this.idDetallePedido == null && other.idDetallePedido != null) || (this.idDetallePedido != null && !this.idDetallePedido.equals(other.idDetallePedido))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ci2.ppw.model.Detallepedido[ idDetallePedido=" + idDetallePedido + " ]";
    }
    
}
