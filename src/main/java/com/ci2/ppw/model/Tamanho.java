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
@Table(name = "tamanho")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tamanho.findAll", query = "SELECT t FROM Tamanho t"),
    @NamedQuery(name = "Tamanho.findByIdTamanho", query = "SELECT t FROM Tamanho t WHERE t.idTamanho = :idTamanho"),
    @NamedQuery(name = "Tamanho.findByNombre", query = "SELECT t FROM Tamanho t WHERE t.nombre = :nombre"),
    @NamedQuery(name = "Tamanho.findByCantidadPorciones", query = "SELECT t FROM Tamanho t WHERE t.cantidadPorciones = :cantidadPorciones")})
public class Tamanho implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdTamanho")
    private Integer idTamanho;
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @Column(name = "cantidadPorciones")
    private int cantidadPorciones;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tamanho")
    private List<Pizza> pizzaList;

    public Tamanho() {
    }

    public Tamanho(Integer idTamanho) {
        this.idTamanho = idTamanho;
    }

    public Tamanho(Integer idTamanho, String nombre, int cantidadPorciones) {
        this.idTamanho = idTamanho;
        this.nombre = nombre;
        this.cantidadPorciones = cantidadPorciones;
    }

    public Integer getIdTamanho() {
        return idTamanho;
    }

    public void setIdTamanho(Integer idTamanho) {
        this.idTamanho = idTamanho;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantidadPorciones() {
        return cantidadPorciones;
    }

    public void setCantidadPorciones(int cantidadPorciones) {
        this.cantidadPorciones = cantidadPorciones;
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
        hash += (idTamanho != null ? idTamanho.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tamanho)) {
            return false;
        }
        Tamanho other = (Tamanho) object;
        if ((this.idTamanho == null && other.idTamanho != null) || (this.idTamanho != null && !this.idTamanho.equals(other.idTamanho))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ci2.ppw.model.Tamanho[ idTamanho=" + idTamanho + " ]";
    }
    
}
