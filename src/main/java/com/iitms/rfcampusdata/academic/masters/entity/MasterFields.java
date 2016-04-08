package com.iitms.rfcampusdata.academic.masters.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "master.generic_master")
public class MasterFields {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Transient
    private int recordId;

    @Column(name = "master_type")
    private String masterType;

    @Column(name = "page_name")
    private String pageName;

    @Column(name = "entity_name")
    private String entityName;

    @Column(name = "property_name")
    private String propertyName;

    @Column(name = "lable1")
    private String lable1;

    @Column(name = "field1_name")
    private String field1Name;

    @Column(name = "field1_is_number")
    private boolean field1IsNumber;

    @Column(name = "lable2")
    private String lable2;

    @Column(name = "field2_name")
    private String field2Name;

    @Column(name = "field2_is_number")
    private boolean field2IsNumber;

    @Column(name = "lable3")
    private String lable3;

    @Column(name = "field3_name")
    private String field3Name;

    @Column(name = "field3_is_number")
    private boolean field3IsNumber;

    @Column(name = "table_caption")
    private String tableCaption;

    @Column(name = "column1_caption")
    private String column1Caption;

    @Column(name = "column2_caption")
    private String column2Caption;

    @Column(name = "column3_caption")
    private String column3Caption;

    @Column(name = "column4_caption")
    private String column4Caption;

    public String getPageName() {
        return pageName;
    }

    public void setPageName(String pageName) {
        this.pageName = pageName;
    }

    public String getLable1() {
        return lable1;
    }

    public void setLable1(String lable1) {
        this.lable1 = lable1;
    }

    public String getField1Name() {
        return field1Name;
    }

    public void setField1Name(String field1Name) {
        this.field1Name = field1Name;
    }

    public String getTableCaption() {
        return tableCaption;
    }

    public void setTableCaption(String tableCaption) {
        this.tableCaption = tableCaption;
    }

    public String getColumn1Caption() {
        return column1Caption;
    }

    public void setColumn1Caption(String column1Caption) {
        this.column1Caption = column1Caption;
    }

    public String getColumn2Caption() {
        return column2Caption;
    }

    public void setColumn2Caption(String column2Caption) {
        this.column2Caption = column2Caption;
    }

    public String getColumn3Caption() {
        return column3Caption;
    }

    public void setColumn3Caption(String column3Caption) {
        this.column3Caption = column3Caption;
    }

    public String getEntityName() {
        return entityName;
    }

    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public String getMasterType() {
        return masterType;
    }

    public void setMasterType(String masterType) {
        this.masterType = masterType;
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    public Serializable getEntity() {

        Serializable model = null;

        try {
            Class masterClass = Class.forName(this.entityName);

            if (this.field3Name != null) {
                model = (Serializable) masterClass.getConstructor(String.class, String.class, String.class)
                    .newInstance(this.field1Name, this.field2Name, this.field3Name);
            } else if (this.field2Name != null) {
                model = (Serializable) masterClass.getConstructor(Integer.class, String.class, String.class)
                    .newInstance(this.recordId, this.field1Name, this.field2Name);
            } else {
                model = (Serializable) masterClass.getConstructor(Integer.class, String.class)
                    .newInstance(this.recordId, this.field1Name);
            }

        } catch (Exception e) {

        }

        /*
         * switch (masterType) { case ConstantUtil.MASTER_MOTHERTONGUE: { model = new
         * MothertongueMasterEntity(this.field1Name); break; } case ConstantUtil.MASTER_DOCUMENT_LIST: { model = new
         * DocumentListMasterEntity(this.field1Name); break; } }
         */

        return model;
    }

    @SuppressWarnings("rawtypes")
    public Class getRuntimeClass() {
        Class masterClass = null;
        try {
            masterClass = Class.forName(this.entityName);
        } catch (Exception e) {

        }
        return masterClass;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "MasterFields [id=" + id + ", masterType=" + masterType + ", pageName=" + pageName + ", entityName="
            + entityName + ", propertyName=" + propertyName + ", lable1=" + lable1 + ", field1Name=" + field1Name
            + ", lable2=" + lable2 + ", field2Name=" + field2Name + ", lable3=" + lable3 + ", field3Name=" + field3Name
            + ", tableCaption=" + tableCaption + ", column1Caption=" + column1Caption + ", column2Caption="
            + column2Caption + ", column3Caption=" + column3Caption + ", column4Caption=" + column4Caption + "]";
    }

    public String getLable2() {
        return lable2;
    }

    public void setLable2(String lable2) {
        this.lable2 = lable2;
    }

    public String getField2Name() {
        return field2Name;
    }

    public void setField2Name(String field2Name) {
        this.field2Name = field2Name;
    }

    public String getLable3() {
        return lable3;
    }

    public void setLable3(String lable3) {
        this.lable3 = lable3;
    }

    public String getField3Name() {
        return field3Name;
    }

    public void setField3Name(String field3Name) {
        this.field3Name = field3Name;
    }

    public String getColumn4Caption() {
        return column4Caption;
    }

    public void setColumn4Caption(String column4Caption) {
        this.column4Caption = column4Caption;
    }

    public boolean isField1IsNumber() {
        return field1IsNumber;
    }

    public void setField1IsNumber(boolean field1IsNumber) {
        this.field1IsNumber = field1IsNumber;
    }

    public boolean isField2IsNumber() {
        return field2IsNumber;
    }

    public void setField2IsNumber(boolean field2IsNumber) {
        this.field2IsNumber = field2IsNumber;
    }

    public boolean isField3IsNumber() {
        return field3IsNumber;
    }

    public void setField3IsNumber(boolean field3IsNumber) {
        this.field3IsNumber = field3IsNumber;
    }

    public int getRecordId() {
        return recordId;
    }

    public void setRecordId(int recordId) {
        this.recordId = recordId;
    }

}
