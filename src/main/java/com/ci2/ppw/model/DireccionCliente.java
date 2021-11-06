/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.model;

import java.io.Serializable;
import java.math.BigDecimal;
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
@Table(name = "direccionCliente")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DireccionCliente.findAll", query = "SELECT d FROM DireccionCliente d"),
    @NamedQuery(name = "DireccionCliente.findByIddireccionCliente", query = "SELECT d FROM DireccionCliente d WHERE d.iddireccionCliente = :iddireccionCliente"),
    @NamedQuery(name = "DireccionCliente.findByDireccion", query = "SELECT d FROM DireccionCliente d WHERE d.direccion = :direccion"),
    @NamedQuery(name = "DireccionCliente.findByReferencia", query = "SELECT d FROM DireccionCliente d WHERE d.referencia = :referencia"),
    @NamedQuery(name = "DireccionCliente.findByLatitud", query = "SELECT d FROM DireccionCliente d WHERE d.latitud = :latitud"),
    @NamedQuery(name = "DireccionCliente.findByLongitud", query = "SELECT d FROM DireccionCliente d WHERE d.longitud = :longitud"),
    @NamedQuery(name = "DireccionCliente.findByPrincipal", query = "SELECT d FROM DireccionCliente d WHERE d.principal = :principal")})
public class DireccionCliente implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "iddireccionCliente")
    private Integer iddireccionCliente;
    @Column(name = "direccion")
    private String direccion;
    @Column(name = "referencia")
    private String referencia;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "latitud")
    private BigDecimal latitud;
    @Column(name = "longitud")
    private BigDecimal longitud;
    @Column(name = "principal")
    private Short principal;
    @JoinColumn(name = "idCliente", referencedColumnName = "IdCliente")
    @ManyToOne(optional = false)
    private Cliente idCliente;
    @JoinColumn(name = "idDistrito", referencedColumnName = "IdDistrito")
    @ManyToOne(optional = false)
    private Distrito idDistrito;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idDireccionEnvio")
    private List<Pedido> pedidoList;

    public DireccionCliente() {
    }

    public DireccionCliente(Integer iddireccionCliente) {
        this.iddireccionCliente = iddireccionCliente;
    }

    public Integer getIddireccionCliente() {
        return iddireccionCliente;
    }

    public void setIddireccionCliente(Integer iddireccionCliente) {
        this.iddireccionCliente = iddireccionCliente;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    public BigDecimal getLatitud() {
        return latitud;
    }

    public void setLatitud(BigDecimal latitud) {
        this.latitud = latitud;
    }

    public BigDecimal getLongitud() {
        return longitud;
    }

    public void setLongitud(BigDecimal longitud) {
        this.longitud = longitud;
    }

    public Short getPrincipal() {
        return principal;
    }

    public void setPrincipal(Short principal) {
        this.principal = principal;
    }

    public Cliente getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Cliente idCliente) {
        this.idCliente = idCliente;
    }

    public Distrito getIdDistrito() {
        return idDistrito;
    }

    public void setIdDistrito(Distrito idDistrito) {
        this.idDistrito = idDistrito;
    }

    @XmlTransient
    public List<Pedido> getPedidoList() {
        return pedidoList;
    }

    public void setPedidoList(List<Pedido> pedidoList) {
        this.pedidoList = pedidoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iddireccionCliente != null ? iddireccionCliente.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DireccionCliente)) {
            return false;
        }
        DireccionCliente other = (DireccionCliente) object;
        if ((this.iddireccionCliente == null && other.iddireccionCliente != null) || (this.iddireccionCliente != null && !this.iddireccionCliente.equals(other.iddireccionCliente))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ci2.ppw.model.DireccionCliente[ iddireccionCliente=" + iddireccionCliente + " ]";
    }
    
}
