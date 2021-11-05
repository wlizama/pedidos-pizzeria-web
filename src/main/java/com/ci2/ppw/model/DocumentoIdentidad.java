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
@Table(name = "documentoIdentidad")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DocumentoIdentidad.findAll", query = "SELECT d FROM DocumentoIdentidad d"),
    @NamedQuery(name = "DocumentoIdentidad.findByIdDocumentoIdentidad", query = "SELECT d FROM DocumentoIdentidad d WHERE d.idDocumentoIdentidad = :idDocumentoIdentidad"),
    @NamedQuery(name = "DocumentoIdentidad.findByNumero", query = "SELECT d FROM DocumentoIdentidad d WHERE d.numero = :numero")})
public class DocumentoIdentidad implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdDocumentoIdentidad")
    private Integer idDocumentoIdentidad;
    @Basic(optional = false)
    @Column(name = "numero")
    private String numero;
    @JoinColumns({
        @JoinColumn(name = "IdTipoDocIdentidad", referencedColumnName = "IdTipoDocIdentidad"),
        @JoinColumn(name = "IdTipoDocIdentidad", referencedColumnName = "IdTipoDocIdentidad")})
    @ManyToOne(optional = false)
    private TipoDocumentoIdentidad tipoDocumentoIdentidad;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "documentoIdentidad")
    private List<Persona> personaList;

    public DocumentoIdentidad() {
    }

    public DocumentoIdentidad(Integer idDocumentoIdentidad) {
        this.idDocumentoIdentidad = idDocumentoIdentidad;
    }

    public DocumentoIdentidad(Integer idDocumentoIdentidad, String numero) {
        this.idDocumentoIdentidad = idDocumentoIdentidad;
        this.numero = numero;
    }

    public Integer getIdDocumentoIdentidad() {
        return idDocumentoIdentidad;
    }

    public void setIdDocumentoIdentidad(Integer idDocumentoIdentidad) {
        this.idDocumentoIdentidad = idDocumentoIdentidad;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public TipoDocumentoIdentidad getTipoDocumentoIdentidad() {
        return tipoDocumentoIdentidad;
    }

    public void setTipoDocumentoIdentidad(TipoDocumentoIdentidad tipoDocumentoIdentidad) {
        this.tipoDocumentoIdentidad = tipoDocumentoIdentidad;
    }

    @XmlTransient
    public List<Persona> getPersonaList() {
        return personaList;
    }

    public void setPersonaList(List<Persona> personaList) {
        this.personaList = personaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDocumentoIdentidad != null ? idDocumentoIdentidad.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DocumentoIdentidad)) {
            return false;
        }
        DocumentoIdentidad other = (DocumentoIdentidad) object;
        if ((this.idDocumentoIdentidad == null && other.idDocumentoIdentidad != null) || (this.idDocumentoIdentidad != null && !this.idDocumentoIdentidad.equals(other.idDocumentoIdentidad))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ci2.ppw.model.DocumentoIdentidad[ idDocumentoIdentidad=" + idDocumentoIdentidad + " ]";
    }
    
}
