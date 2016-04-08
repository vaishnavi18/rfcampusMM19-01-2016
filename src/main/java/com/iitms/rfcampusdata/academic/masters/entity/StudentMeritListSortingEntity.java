package com.iitms.rfcampusdata.academic.masters.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "master.student_registration_merit_list")
public class StudentMeritListSortingEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int meritSortingId;

    @Column(name = "column_name")
    private String columnName;

    @Column(name = "display_name")
    private String displayName;

    public int getMeritSortingId() {
        return meritSortingId;
    }

    public void setMeritSortingId(int meritSortingId) {
        this.meritSortingId = meritSortingId;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }
}
