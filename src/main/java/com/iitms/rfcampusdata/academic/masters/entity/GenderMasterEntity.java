package com.iitms.rfcampusdata.academic.masters.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "master.gender_master")
public class GenderMasterEntity implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "gender_name")
    private String genderName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGenderName() {
        return genderName;
    }

    public void setGenderName(String genderName) {
        this.genderName = genderName;
    }

    public GenderMasterEntity() {
        super();

    }

    public GenderMasterEntity(Integer id, String genderName) {
        super();
        if (id != 0) {
            this.id = id;
        }
        this.genderName = genderName;
    }

    @Override
    public String toString() {
        return "GenderMasterEntity [genderName=" + genderName + "]";
    }

}
