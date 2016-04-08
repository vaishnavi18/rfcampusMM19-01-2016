package com.iitms.rfcampusdata.academic.admission.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "master.reference_file")
public class ReferenceFileEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "create_registration_number_flag")
    private boolean createRegistrationNumber;

    @Column(name = "registration_number_format_id")
    private int registrationNumberFormatId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isCreateRegistrationNumber() {
        return createRegistrationNumber;
    }

    public void setCreateRegistrationNumber(boolean createRegistrationNumber) {
        this.createRegistrationNumber = createRegistrationNumber;
    }

    public int getRegistrationNumberFormatId() {
        return registrationNumberFormatId;
    }

    public void setRegistrationNumberFormatId(int registrationNumberFormatId) {
        this.registrationNumberFormatId = registrationNumberFormatId;
    }

}
