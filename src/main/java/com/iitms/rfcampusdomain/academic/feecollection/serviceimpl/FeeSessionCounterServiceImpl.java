package com.iitms.rfcampusdomain.academic.feecollection.serviceimpl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampuscommon.feescollection.CounterReceiptNumbersDTO;
import com.iitms.rfcampusdata.academic.feecollection.dao.FeeSessionCounterDao;
import com.iitms.rfcampusdata.academic.feecollection.dao.FeesCounterCreationDao;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesPaymentModeEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesReceiptTypeEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesSessionCounterReferenceTransactionEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesUserCounterMasterEntity;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeeSessionCounterService;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesPaymentModeService;
@Service
@Transactional
public class FeeSessionCounterServiceImpl implements FeeSessionCounterService {
    
    private static final Logger LOG = LoggerFactory.getLogger(FeeSessionCounterServiceImpl.class);
    @Autowired
    private FeeSessionCounterDao feeSessionCounterDAO;
    
    @Autowired
    private FeesCounterCreationDao feesCounterCreationDao;
    
    
    @Autowired 
    private FeesPaymentModeService feesPaymentModeService; 
 
    @Override
    public List<CounterReceiptNumbersDTO> getCounterSeqNo(int userId, int sessionId) {
        return feeSessionCounterDAO.getCounterSeqNo(userId, sessionId);        
    }

    @Override
    public boolean updateCounterSeqNo(HttpServletRequest request,String[][] receiptsMatrix, List<FeesPaymentModeEntity> paymentModes, List<FeesUserCounterMasterEntity> reciptList)
    {
        String paramName="rcpt";
        int count=0;
        int rowCount=-1;
        
        int paymentModesCount=paymentModes.size();
        String oldValue= new String();
        while( request.getParameter(paramName+count)!=null){
            String strValue= (String)request.getParameter(paramName+count);
            if ("".equals(strValue)){
                strValue="0";
            }
            int intValue = Integer.parseInt(strValue);
            int idx = count%paymentModesCount;
            if (idx==0){
                rowCount++;
            }
            
            oldValue =(String)receiptsMatrix[rowCount][idx*2];
            
            if ((oldValue !=null && !oldValue.equals(strValue)) ){
                    int receiptRecordId=Integer.parseInt(receiptsMatrix[rowCount][(idx*2)+1]);
                    System.err.println("Record Id: "+ receiptRecordId +"   old value: "+ oldValue + "new value: "+ intValue);
                    feeSessionCounterDAO.updateCounterSeqNo(receiptRecordId, intValue);          
            }
            count++;
        } 
        return true;
    }
    
    @Override
    public String[][] showRecords(int acadamicSessionId,int userId, List<FeesPaymentModeEntity> paymentModes, List<FeesReceiptTypeEntity> reciptList)
    {       
        LOG.info("reciptList:"+reciptList);
        List<CounterReceiptNumbersDTO> counterReceipts=feeSessionCounterDAO.getCounterSeqNo(userId, acadamicSessionId);
        HashMap<Integer, Integer> paymentModesMap = new HashMap<Integer,Integer>();
        HashMap<Integer, Integer> receiptTypeMap = new HashMap<Integer,Integer>();      
        //creating hashmap to store the index no of the payment modes.
        int itr=0;
        for(FeesPaymentModeEntity paymentMode: paymentModes){
            paymentModesMap.put(paymentMode.getId(),itr);
            itr++;
        }    
        itr=0;
        for(FeesReceiptTypeEntity receiptType: reciptList){
            receiptTypeMap.put(receiptType.getId(),itr);
            itr++;
        }
        String[][] receiptsNos= new String[reciptList.size()][paymentModes.size()*2];
        for(CounterReceiptNumbersDTO counterReceipt: counterReceipts){
            int tmpRecpTypeId=counterReceipt.getReceiptTypeId();
                int paymentModeId =counterReceipt.getPaymentModeId();
                int rowidx = receiptTypeMap.get(tmpRecpTypeId);
                if (paymentModesMap.get(paymentModeId)!=null){
                    int colidx = paymentModesMap.get(paymentModeId);    
                    receiptsNos[rowidx][(colidx*2)]=counterReceipt.getReceiptNumber()+"";
                    receiptsNos[rowidx][(colidx*2)+1]=counterReceipt.getReceiptNumberId()+"";    
                }; 
        }     
        for(int rowidx=0;rowidx<reciptList.size();rowidx++){
            for(int colidx=1;colidx<paymentModes.size()*2;colidx=colidx+2){
                System.out.println(receiptsNos[rowidx][colidx]);
                if (receiptsNos[rowidx][colidx]==null){
                    FeesUserCounterMasterEntity counterMaster = feesCounterCreationDao.getUserCounter(userId, reciptList.get(rowidx).getId(), paymentModes.get(colidx/2).getId());
                    receiptsNos[rowidx][colidx]=counterMaster.getId()+"";
                    receiptsNos[rowidx][colidx-1]="0";
                    //assumptions
                    //1. only one counter is created for one user
                    //2. getUserCounter will result one record only, and record will be there
                    //3. in case a new payment mode is added in future this code will required minor changes.
                    //4. from this logic refund record will not be created, and 
                    // it is assumed that refund receipt record will be created at the time receipt type assigned to user.
                    feeSessionCounterDAO.addCounterSeqNo(counterMaster.getId(), acadamicSessionId, 0,counterMaster.isActive());
               
                }
            }
        }
        return receiptsNos;
    }

    @Override
    public FeesSessionCounterReferenceTransactionEntity getReceiptNo(int counterId, int paymentModeId, int receiptId) {
        return feeSessionCounterDAO.getReceiptNo(counterId, paymentModeId, receiptId);
    }
}
