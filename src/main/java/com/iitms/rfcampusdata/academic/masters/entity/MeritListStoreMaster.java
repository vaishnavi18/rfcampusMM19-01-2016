package com.iitms.rfcampusdata.academic.masters.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.iitms.rfcampusdata.authentication.entity.UserMasterEntity;

@Entity
@Table(name = "master.merit_list_store_master")
public class MeritListStoreMaster {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "list_number", columnDefinition = "serial")
    private int listNumber;

    @Column(name = "list_name")
    private String listName;

    @Column(name = "created_by")
    private int createdBy;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "created_by", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private UserMasterEntity userMasterEntity;

    @Column(name = "preparation_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    private Date preparationDate;

    public int getListNumber() {
        return listNumber;
    }

    public void setListNumber(int listNumber) {
        this.listNumber = listNumber;
    }

    public String getListName() {
        return listName;
    }

    public void setListName(String listName) {
        this.listName = listName;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public Date getPreparationDate() {
        return preparationDate;
    }

    public void setPreparationDate(Date preparationDate) {
        this.preparationDate = preparationDate; //
    }

    public UserMasterEntity getUserMasterEntity() {
        return userMasterEntity;
    }

    public void setUserMasterEntity(UserMasterEntity userMasterEntity) {
        this.userMasterEntity = userMasterEntity;
    }

}
