package com.iitms.rfcampusdata.academic.masters.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "master.admission_degree_type_master")
public class DegreeTypeEntity implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "degree_type")
    private String degreeType;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDegreeType() {
        return degreeType;
    }

    public void setDegreeType(String degreeType) {
        this.degreeType = degreeType;
    }

    public DegreeTypeEntity() {
        super();
    }

    public DegreeTypeEntity(Integer id, String degreeType) {
        super();
        if (id != 0) {
            this.id = id;
        }
        this.degreeType = degreeType;
    }

    @Override
    public String toString() {
        return "DegreeTypeEntity [degreeType=" + degreeType + "]";
    }

}
