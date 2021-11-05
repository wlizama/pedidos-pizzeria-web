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
@Table(name = "tipopizza")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tipopizza.findAll", query = "SELECT t FROM Tipopizza t"),
    @NamedQuery(name = "Tipopizza.findByIdTipoPizza", query = "SELECT t FROM Tipopizza t WHERE t.idTipoPizza = :idTipoPizza"),
    @NamedQuery(name = "Tipopizza.findByNombre", query = "SELECT t FROM Tipopizza t WHERE t.nombre = :nombre"),
    @NamedQuery(name = "Tipopizza.findByDescripcion", query = "SELECT t FROM Tipopizza t WHERE t.descripcion = :descripcion")})
public class Tipopizza implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdTipoPizza")
    private Integer idTipoPizza;
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    @Column(name = "descripcion")
    private String descripcion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipopizza")
    private List<Pizza> pizzaList;

    public Tipopizza() {
    }

    public Tipopizza(Integer idTipoPizza) {
        this.idTipoPizza = idTipoPizza;
    }

    public Tipopizza(Integer idTipoPizza, String nombre) {
        this.idTipoPizza = idTipoPizza;
        this.nombre = nombre;
    }

    public Integer getIdTipoPizza() {
        return idTipoPizza;
    }

    public void setIdTipoPizza(Integer idTipoPizza) {
        this.idTipoPizza = idTipoPizza;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @XmlTransient
    public List<Pizza> getPizzaList() {
        return pizzaList;
    }

    public void setPizzaList(List<Pizza> pizzaList) {
        this.pizzaList = pizzaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipoPizza != null ? idTipoPizza.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tipopizza)) {
            return false;
        }
        Tipopizza other = (Tipopizza) object;
        if ((this.idTipoPizza == null && other.idTipoPizza != null) || (this.idTipoPizza != null && !this.idTipoPizza.equals(other.idTipoPizza))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ci2.ppw.model.Tipopizza[ idTipoPizza=" + idTipoPizza + " ]";
    }
    
}
