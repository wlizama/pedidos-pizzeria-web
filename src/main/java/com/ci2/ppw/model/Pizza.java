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

/**
 *
 * @author wilderlizama
 */
@Entity
@Table(name = "pizza")
public class Pizza {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdPizza")
    private Integer idPizza;
    
    @JoinColumn(name = "IdEstado", referencedColumnName = "IdEstado")
    @ManyToOne(optional = false)
    private Estado estado;
    
    @JoinColumn(name = "idProducto", referencedColumnName = "idProducto")
    @ManyToOne(optional = false)
    private Producto producto;
    
    @JoinColumn(name = "IdTamanho", referencedColumnName = "IdTamanho")
    @ManyToOne(optional = false)
    private Tamanho tamanho;
    
    @JoinColumn(name = "IdTipoPizza", referencedColumnName = "IdTipoPizza")
    @ManyToOne(optional = false)
    private Tipopizza tipopizza;

    public Pizza() {
    }

    public Pizza(Integer idPizza) {
        this.idPizza = idPizza;
    }

    public Integer getIdPizza() {
        return idPizza;
    }

    public void setIdPizza(Integer idPizza) {
        this.idPizza = idPizza;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public Tamanho getTamanho() {
        return tamanho;
    }

    public void setTamanho(Tamanho tamanho) {
        this.tamanho = tamanho;
    }

    public Tipopizza getTipopizza() {
        return tipopizza;
    }

    public void setTipopizza(Tipopizza tipopizza) {
        this.tipopizza = tipopizza;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPizza != null ? idPizza.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pizza)) {
            return false;
        }
        Pizza other = (Pizza) object;
        if ((this.idPizza == null && other.idPizza != null) || (this.idPizza != null && !this.idPizza.equals(other.idPizza))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ci2.ppw.model.Pizza[ idPizza=" + idPizza + " ]";
    }
    
}
