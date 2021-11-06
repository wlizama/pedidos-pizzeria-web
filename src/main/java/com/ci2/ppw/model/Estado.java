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
@Table(name = "estado")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Estado.findAll", query = "SELECT e FROM Estado e"),
    @NamedQuery(name = "Estado.findByIdEstado", query = "SELECT e FROM Estado e WHERE e.idEstado = :idEstado"),
    @NamedQuery(name = "Estado.findByNombre", query = "SELECT e FROM Estado e WHERE e.nombre = :nombre")})
public class Estado implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdEstado")
    private Integer idEstado;
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    @JoinColumns({
        @JoinColumn(name = "IdTipoEstado", referencedColumnName = "IdTipoEstado"),
        @JoinColumn(name = "IdTipoEstado", referencedColumnName = "IdTipoEstado")})
    @ManyToOne
    private Tipoestado tipoestado;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estado")
    private List<Comprobante> comprobanteList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idEstado")
    private List<Producto> productoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estado")
    private List<Envio> envioList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idEstado")
    private List<DetalleEnvio> detalleEnvioList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estado")
    private List<Pizza> pizzaList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estado")
    private List<Pedido> pedidoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estado")
    private List<Persona> personaList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estado")
    private List<Tipocomprobante> tipocomprobanteList;

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

    @XmlTransient
    public List<Comprobante> getComprobanteList() {
        return comprobanteList;
    }

    public void setComprobanteList(List<Comprobante> comprobanteList) {
        this.comprobanteList = comprobanteList;
    }

    @XmlTransient
    public List<Producto> getProductoList() {
        return productoList;
    }

    public void setProductoList(List<Producto> productoList) {
        this.productoList = productoList;
    }

    @XmlTransient
    public List<Envio> getEnvioList() {
        return envioList;
    }

    public void setEnvioList(List<Envio> envioList) {
        this.envioList = envioList;
    }

    @XmlTransient
    public List<DetalleEnvio> getDetalleEnvioList() {
        return detalleEnvioList;
    }

    public void setDetalleEnvioList(List<DetalleEnvio> detalleEnvioList) {
        this.detalleEnvioList = detalleEnvioList;
    }

    @XmlTransient
    public List<Pizza> getPizzaList() {
        return pizzaList;
    }

    public void setPizzaList(List<Pizza> pizzaList) {
        this.pizzaList = pizzaList;
    }

    @XmlTransient
    public List<Pedido> getPedidoList() {
        return pedidoList;
    }

    public void setPedidoList(List<Pedido> pedidoList) {
        this.pedidoList = pedidoList;
    }

    @XmlTransient
    public List<Persona> getPersonaList() {
        return personaList;
    }

    public void setPersonaList(List<Persona> personaList) {
        this.personaList = personaList;
    }

    @XmlTransient
    public List<Tipocomprobante> getTipocomprobanteList() {
        return tipocomprobanteList;
    }

    public void setTipocomprobanteList(List<Tipocomprobante> tipocomprobanteList) {
        this.tipocomprobanteList = tipocomprobanteList;
    }

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
