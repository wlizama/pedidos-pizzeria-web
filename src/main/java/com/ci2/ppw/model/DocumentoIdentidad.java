/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.model;

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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author wilderlizama
 */
@Entity
@Table(name = "documentoIdentidad")
public class DocumentoIdentidad {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdDocumentoIdentidad")
    private Integer idDocumentoIdentidad;

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "numero")
    private String numero;

    @JoinColumn(name = "IdTipoDocIdentidad", referencedColumnName = "IdTipoDocIdentidad")
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
