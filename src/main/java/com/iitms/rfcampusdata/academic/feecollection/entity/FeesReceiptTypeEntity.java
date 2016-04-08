package com.iitms.rfcampusdata.academic.feecollection.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "master.fees_receipt_type_master")
public class FeesReceiptTypeEntity {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int Id;

    @Column(name = "receipt_code")
    private String receiptCode;

    @Column(name = "receipt_title")
    private String receiptTitle;

    @Column(name = "receipt_for")
    private String receiptFor;

    @Column(name = "account_number")
    private String accountNumber;

    @Column(name = "is_linked")
    private boolean isLinked;

    @Column(name = "cash_counter_number")
    private int cashCounterNumber;

    @Column(name = "bank_counter_number")
    private int bankCounterNumber;

    @Column(name = "adjust_counter_number")
    private int adjustCounterNumber;

    @Column(name = "prospectus_counter_number")
    private int prospectusCounterNumber;

    @Column(name = "register_counter_number")
    private int registerCounterNumber;

    @Column(name = "document_counter_number")
    private int documentCounterNumber;

    @Column(name = "bank_id")
    private int bankId;

    @Column(name = "bank_account_id")
    private int bankAccountId;

    @Column(name = "prospectus_fee")
    private float prospectusFee;

    @Column(name = " registration_fee")
    private float registrationFee;

    @Column(name = "college_code")
    private String collegeCode;

    @Column(name = "ipaddress")
    private String ipaddress;

    @Column(name = "macaddress")
    private String macaddress;

    @Column(name = "created_by")
    private int createdBy;

    @Column(name = "created_date")
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @Temporal(TemporalType.DATE)
    private Date createdDate;

    @Column(name = "modified_by")
    private int modifiedBy;

    @Column(name = "modified_date")
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @Temporal(TemporalType.DATE)
    private Date modifiedDate;

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        this.Id = id;
    }

    public String getReceiptCode() {
        return receiptCode;
    }

    public void setReceiptCode(String receiptCode) {
        this.receiptCode = receiptCode;
    }

    public String getReceiptTitle() {
        return receiptTitle;
    }

    public void setReceiptTitle(String receiptTitle) {
        this.receiptTitle = receiptTitle;
    }

    public String getReceiptFor() {
        return receiptFor;
    }

    public void setReceiptFor(String receitFor) {
        this.receiptFor = receitFor;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public int getCashCounterNumber() {
        return cashCounterNumber;
    }

    public void setCashCounterNumber(int cashCounterNumber) {
        this.cashCounterNumber = cashCounterNumber;
    }

    public int getBankCounterNumber() {
        return bankCounterNumber;
    }

    public void setBankCounterNumber(int bankCounterNumber) {
        this.bankCounterNumber = bankCounterNumber;
    }

    public int getAdjustCounterNumber() {
        return adjustCounterNumber;
    }

    public void setAdjustCounterNumber(int adjustCounterNumber) {
        this.adjustCounterNumber = adjustCounterNumber;
    }

    public int getProspectusCounterNumber() {
        return prospectusCounterNumber;
    }

    public void setProspectusCounterNumber(int prospectusCounterNumber) {
        this.prospectusCounterNumber = prospectusCounterNumber;
    }

    public int getRegisterCounterNumber() {
        return registerCounterNumber;
    }

    public void setRegisterCounterNumber(int registerCounterNumber) {
        this.registerCounterNumber = registerCounterNumber;
    }

    public int getDocumentCounterNumber() {
        return documentCounterNumber;
    }

    public void setDocumentCounterNumber(int documentCounterNumber) {
        this.documentCounterNumber = documentCounterNumber;
    }

    public int getBankId() {
        return bankId;
    }

    public void setBankId(int bankId) {
        this.bankId = bankId;
    }

    public int getBankAccountId() {
        return bankAccountId;
    }

    public void setBankAccountId(int bankAccountId) {
        this.bankAccountId = bankAccountId;
    }

    public float getProspectusFee() {
        return prospectusFee;
    }

    public void setProspectusFee(float prospectusFee) {
        this.prospectusFee = prospectusFee;
    }

    public float getRegistrationFee() {
        return registrationFee;
    }

    public void setRegistrationFee(float registrationFee) {
        this.registrationFee = registrationFee;
    }

    public String getCollegeCode() {
        return collegeCode;
    }

    public void setCollegeCode(String collegeCode) {
        this.collegeCode = collegeCode;
    }

    public String getIpaddress() {
        return ipaddress;
    }

    public void setIpaddress(String ipaddress) {
        this.ipaddress = ipaddress;
    }

    public String getMacaddress() {
        return macaddress;
    }

    public void setMacaddress(String macaddress) {
        this.macaddress = macaddress;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public int getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(int modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public Date getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    @Override
    public String toString() {
        return "FeesReceiptTypeEntity [isLinked=" + isLinked + "]";
    }

    public boolean isLinked() {
        return isLinked;
    }

    public void setLinked(boolean isLinked) {
        this.isLinked = isLinked;
    }

}
