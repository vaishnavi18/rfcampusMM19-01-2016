package com.iitms.rfcampusdata.academic.feecollection.daoimpl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.feecollection.dao.FeesDemandCreationTransactionDao;
import com.iitms.rfcampusdata.academic.feecollection.dto.StudentDemandDTO;
import com.iitms.rfcampusdata.academic.feecollection.dto.StudentFeeDetailsDTO;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesDemandCreationTransactionEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.StandardFeeMasterEntity;

@Repository
public class FeesDemandCreationTransactionDaoImpl implements FeesDemandCreationTransactionDao {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public int createDemand(int receiptId, int degreeId, int branchId, int paymentTypeId, int semesterId, int demandFor,
        String enrollmentIds, int acadamicSessionId, List<StandardFeeMasterEntity> feeHeads) {
        Session session = this.sessionFactory.getCurrentSession();

        FeesDemandCreationTransactionEntity demandEntity;

        for (String enrollmentId : enrollmentIds.split(",")) {
            for (StandardFeeMasterEntity feeHeadEntity : feeHeads) {
                demandEntity =
                    new FeesDemandCreationTransactionEntity(enrollmentId, acadamicSessionId, degreeId, branchId,
                        semesterId, demandFor, paymentTypeId, feeHeadEntity.getFeeHeadId(), feeHeadEntity.getAmount());
                session.save(demandEntity);
            }
        }
        return 1;
    }

    @Override
    public void deleteDemand(int degreeId, int branchId, int paymentTypeId, int semesterId, String enrollmentIds) {
        Session session = sessionFactory.getCurrentSession();
        session
            .createQuery(
                "delete from FeesDemandCreationTransactionEntity d where d.studentEnrollmentNumber in (:enrollmentIds)"
                    + " and d.degreeId=:degreeId and d.branchId=:branchId"
                    + " and d.currentSemesterId=:currentSemesterId")
            .setParameterList("enrollmentIds", enrollmentIds.split(",")).setInteger("degreeId", degreeId)
            .setInteger("branchId", branchId).setInteger("currentSemesterId", semesterId).executeUpdate();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<StudentDemandDTO> getStudentDemand(String enrollment_id, int semesterId) {
        Session session = sessionFactory.getCurrentSession();
        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("feeheadId").as("feeheadId"));
        projectionList.add(Projections.property("feesFeeheadMaster.feeheadLongName").as("feeheadLongName"));
        projectionList.add(Projections.property("amount").as("amount"));
        List<StudentDemandDTO> demandList = session.createCriteria(FeesDemandCreationTransactionEntity.class, "demand")
            .createAlias("demand.feesFeeheadMaster", "feesFeeheadMaster").setProjection(projectionList)
            .add(Restrictions.eq("studentEnrollmentNumber", enrollment_id))
            .add(Restrictions.eq("demandCreatedSemesterId", semesterId))
            .setResultTransformer(new AliasToBeanResultTransformer(StudentDemandDTO.class)).list();
        return demandList;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<StudentDemandDTO> getStudentOutStandingBalance(String enrollment_id, int semesterId) {
        Session session = sessionFactory.getCurrentSession();
        SQLQuery query = session.createSQLQuery(
            "select dmt.feehead_id as feeheadId ,ffm.feehead_long_name as feeheadLongName,(sum(distinct dmt.amount)-coalesce(sum(dct.amount),0)) as amount"
                + " from transaction.fees_demandcreation_transaction dmt "
                + "inner join master.admission_student_admission_master sam on dmt.student_enrollment_number=sam.enrollment_number "
                + "left join transaction.fees_dcrmain_transaction dcmt on dcmt.student_serial_number=sam.id "
                + "left join transaction.fees_dcr_transaction dct on dct.dcrmain_id=dcmt.id and dmt.feehead_id=dct.feehead_id "
                + "inner join master.fees_feehead_master ffm on dmt.feehead_id=ffm.id "
                + "where sam.enrollment_number='" + enrollment_id + "' and dmt.demand_created_semester_id=" + semesterId
                + " group by sam.id,dmt.feehead_id,ffm.feehead_long_name,ffm.serial_number "
                + "order by ffm.serial_number")
            .addEntity(StudentDemandDTO.class);
        List<StudentDemandDTO> demandList = query.list();
        return demandList;
    }

    @Override
    public List<StudentFeeDetailsDTO> getStudentFeeDetails(String enrollment_id, int semesterId, int studentId) {
        Session session = sessionFactory.getCurrentSession();
        SQLQuery query = session
            .createSQLQuery(";with cte_demand as" + "("
                + " select sam.id,demand_created_semester_id,sum(amount) totalAppliedAmount "
                + "from transaction.fees_demandcreation_transaction dmt "
                + "inner join master.admission_student_admission_master sam on dmt.student_enrollment_number=sam.enrollment_number  "
                + " where student_enrollment_number='" + enrollment_id + "'"
                + " group by sam.id,demand_created_semester_id" + ")" + ",cte_dcr_tran as" + "("
                + " select student_serial_number,semester_id,"
                + "       sum(case when  receipt_number not like '%ADJ%' then total_paid_amount else 0 end)totalAmtPaid ,"
                + "       sum(case when  receipt_number like '%ADJ%' then total_paid_amount else 0 end)totadjustedamt ,"
                + "       sum(case when  receipt_number not like '%ADJ%' then excess_amount else 0 end)totalExcessAmt "
                + "from transaction.fees_dcrmain_transaction dcmt " + "where student_serial_number=" + studentId
                + "group by student_serial_number,semester_id" + ")"
                + " select dcr.semester_id as semesterId  ,dm.totalAppliedAmount , dcr.totalAmtPaid,"
                + "       (dm.totalAppliedAmount-dcr.totalAmtPaid)balanceamt,dcr.totalExcessAmt,dcr.totadjustedamt"
                + " from cte_demand dm "
                + "left join cte_dcr_tran dcr on dm.id=dcr.student_serial_number and dm.demand_created_semester_id=dcr.semester_id ;")
            .addEntity(StudentFeeDetailsDTO.class);
        List<StudentFeeDetailsDTO> demandList = query.list();
        return demandList;
    }
}
