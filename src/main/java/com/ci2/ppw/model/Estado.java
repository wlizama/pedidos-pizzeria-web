/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.model;

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
import javax.validation.constraints.Size;

/**
 *
 * @author wilderlizama
 */
@Entity
@Table(name = "estado")
public class Estado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdEstado")
    private Integer idEstado;

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "nombre")
    private String nombre;

    @JoinColumn(name = "IdTipoEstado", referencedColumnName = "IdTipoEstado")
    @ManyToOne(optional = false)
    private Tipoestado tipoestado;

    public Estado() {
    }

    public Estado(Integer idEstado) {
        this.idEstado = idEstado;
    }

    public Estado(Integer idEstado, String nombre) {
        this.idEstado = idEstado;
        this.nombre = nombre;
    }

    public Integer getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(Integer idEstado) {
        this.idEstado = idEstado;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Tipoestado getTipoestado() {
        return tipoestado;
    }

    public void setTipoestado(Tipoestado tipoestado) {
        this.tipoestado = tipoestado;
    }

//    public List<Persona> getPersonaList() {
//        return personaList;
//    }
//
//    public void setPersonaList(List<Persona> personaList) {
//        this.personaList = personaList;
//    }
//
//    public List<Comprobante> getComprobanteList() {
//        return comprobanteList;
//    }
//
//    public void setComprobanteList(List<Comprobante> comprobanteList) {
//        this.comprobanteList = comprobanteList;
//    }
//
//    public List<Producto> getProductoList() {
//        return productoList;
//    }
//
//    public void setProductoList(List<Producto> productoList) {
//        this.productoList = productoList;
//    }
//
//    public List<Envio> getEnvioList() {
//        return envioList;
//    }
//
//    public void setEnvioList(List<Envio> envioList) {
//        this.envioList = envioList;
//    }
//
//    public List<Tipocomprobante> getTipocomprobanteList() {
//        return tipocomprobanteList;
//    }
//
//    public void setTipocomprobanteList(List<Tipocomprobante> tipocomprobanteList) {
//        this.tipocomprobanteList = tipocomprobanteList;
//    }
//
//    public List<DetalleEnvio> getDetalleEnvioList() {
//        return detalleEnvioList;
//    }
//
//    public void setDetalleEnvioList(List<DetalleEnvio> detalleEnvioList) {
//        this.detalleEnvioList = detalleEnvioList;
//    }
//
//    public List<Pizza> getPizzaList() {
//        return pizzaList;
//    }
//
//    public void setPizzaList(List<Pizza> pizzaList) {
//        this.pizzaList = pizzaList;
//    }
//
//    public List<Pedido> getPedidoList() {
//        return pedidoList;
//    }
//
//    public void setPedidoList(List<Pedido> pedidoList) {
//        this.pedidoList = pedidoList;
//    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEstado != null ? idEstado.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Estado)) {
            return false;
        }
        Estado other = (Estado) object;
        if ((this.idEstado == null && other.idEstado != null) || (this.idEstado != null && !this.idEstado.equals(other.idEstado))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ci2.ppw.model.Estado[ idEstado=" + idEstado + " ]";
    }
    
}
