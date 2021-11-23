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
import javax.validation.constraints.Size;

/**
 *
 * @author wilderlizama
 */
@Entity
@Table(name = "direccionCliente")
public class DireccionCliente {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "iddireccionCliente")
    private Integer iddireccionCliente;

    @Size(max = 250)
    @Column(name = "direccion")
    private String direccion;

    @Size(max = 250)
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
    private Cliente cliente;

    @JoinColumn(name = "idDistrito", referencedColumnName = "IdDistrito")
    @ManyToOne(optional = false)
    private Distrito distrito;

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

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Distrito getDistrito() {
        return distrito;
    }

    public void setDistrito(Distrito distrito) {
        this.distrito = distrito;
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
