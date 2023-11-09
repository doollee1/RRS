package bt.lead.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bt.btframework.common.vo.CodeVO;
import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.lead.dao.LeadDao;

@Service("LeadService")
public class LeadService {
	@Resource(name = "LeadDao")
	private LeadDao leadDao;

	/**
	 * search Lead List
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> searchLeadList(BMap param) throws Exception {
		return leadDao.searchLeadList(param);
	}

	/**
	 * Save Lead
	 * @param master
	 * @param detail
	 * @throws Exception
	 */
	public String SaveLead(BMap param) throws Exception{
		
		Map<String, Object> leadData = (Map<String, Object>) param.get("leadData");
		Map<String, Object> noteData = (Map<String, Object>) param.get("noteData");
		List<Map<String, Object>> noteGrid = (List<Map<String, Object>>) param.get("noteGrid");
		List<Map<String, Object>> productsGrid = (List<Map<String, Object>>) param.get("productsGrid");
		List<Map<String, Object>> partInvGrid = (List<Map<String, Object>>) param.get("partInvGrid");
		Map<String, Object> contRpt = (Map<String, Object>) param.get("contRpt");
		Map<String, Object> contRptNote = (Map<String, Object>) param.get("contRptNote");

		String userId = LoginInfo.getUserId();
		String docNo = "";
		
		System.err.println(param);
		
		String tempLeadNo = (String)leadData.get("TEMP_LEAD_NO");
		System.err.println("tempLeadNo>"+tempLeadNo);
		if(null != tempLeadNo && !"".equals(tempLeadNo)){
			leadData.put("LEAD_NO", tempLeadNo);		
			
			leadDao.deleteLeadInfo(leadData);
			leadDao.deleteLeadNotes(leadData);
			leadDao.deleteLeadProducts(leadData);
			leadDao.deleteLeadPartInv(leadData);
		}
		
		if(null != leadData) {
			
			leadData.put("USERID", userId);
			leadData.put("DOC_GR", "LD");
			
			//New Or Copy
			if(null != leadData.get("isStatus") && (!"M".equals(leadData.get("isStatus")))){
				
				// LEAD_NO 채번 : BC_NUMBER
				docNo = leadDao.getLeadSeq(leadData);
				leadData.put("LEAD_NO", docNo);
				leadData.put("CUST_NOTE", noteData.get("CUST_NOTE"));
				
				// 입력
				leadDao.insertLeadInfo(leadData);				
				
			}else{
				System.err.println("leasd data >"+leadData);
				docNo = (String) leadData.get("LEAD_NO");
				leadData.put("CUST_NOTE", noteData.get("CUST_NOTE"));
//				leadData.put("LEAD_NO", docNo);
				
				// 수정
				leadDao.updateLeadInfo(leadData);
			}
			
			// Note Grid
			if(null != noteGrid){
				leadDao.deleteLeadNotes(leadData);
				for(Map<String, Object> tempMap : noteGrid){
					
//					tempMap.put("LEAD_NO", docNo);
					tempMap.put("USERID", userId);
					tempMap.put("COMP_CD", leadData.get("G_COMP_CD"));
					tempMap.put("LEAD_NO", leadData.get("LEAD_NO"));
					tempMap.put("DOC_STATUS", leadData.get("DOC_STATUS"));
					
//					if("I".equals(tempMap.get("ROW_STATUS"))){
						leadDao.insertLeadNotes(tempMap);
//					}else if("U".equals(tempMap.get("ROW_STATUS"))){
//						System.err.println("note tempMap >> " + tempMap);
//						leadDao.updateLeadNotes(tempMap);
//					}else if("D".equals(tempMap.get("ROW_STATUS"))){
//						tempMap.put("STATUS", "D");
//						leadDao.updateLeadNotes(tempMap);
//					}
					
				}
			}
			
			// Products Grid
			if(null != productsGrid){
				leadDao.deleteLeadProducts(leadData);
				for(Map<String, Object> tempMap : productsGrid){
					
					
					tempMap.put("DOC_NO", docNo);
					tempMap.put("USERID", userId);
					tempMap.put("COMP_CD", leadData.get("G_COMP_CD"));
					tempMap.put("LEAD_NO", leadData.get("LEAD_NO"));
					tempMap.put("DOC_STATUS", leadData.get("DOC_STATUS"));					

					System.err.println("Products >> " + tempMap);
					
//					if("I".equals(tempMap.get("ROW_STATUS"))){
						leadDao.insertLeadProducts(tempMap);
//					}else if("U".equals(tempMap.get("ROW_STATUS"))){
//						leadDao.updateLeadProducts(tempMap);
//					}else if("D".equals(tempMap.get("ROW_STATUS"))){
//						tempMap.put("STATUS", "D");
//						leadDao.updateLeadProducts(tempMap);
//					}
				}
			}
			
			// PartInv Grid
			if(null != partInvGrid){

				leadDao.deleteLeadPartInv(leadData);
				
				for(Map<String, Object> tempMap : partInvGrid){
					
					tempMap.put("DOC_NO", docNo);
					tempMap.put("USERID", userId);
					tempMap.put("COMP_CD", leadData.get("G_COMP_CD"));
					tempMap.put("LEAD_NO", leadData.get("LEAD_NO"));	
					tempMap.put("DOC_STATUS", leadData.get("DOC_STATUS"));				

					System.err.println("PartInv>> " + tempMap);
					
//					if("I".equals(tempMap.get("ROW_STATUS"))){
						leadDao.insertLeadPartInv(tempMap);
//					}else if("U".equals(tempMap.get("ROW_STATUS"))){
//						leadDao.updateLeadPartInv(tempMap);
//					}else if("D".equals(tempMap.get("ROW_STATUS"))){
//						tempMap.put("STATUS", "D");
//						leadDao.updateLeadPartInv(tempMap);
//					}
				}
			}
			
			// Interaction Log
			if(null != contRpt){
				String gbn = (String)param.get("GBN");
				
				contRpt.put("LEAD_NO", leadData.get("LEAD_NO"));
				contRpt.put("USERID", userId);
				
				System.err.println("param >> " + contRpt);
				System.err.println("gbn" + gbn);
				
				if ( "S".equals(gbn) ) {

					contRpt.put("REPORT_NOTE", contRptNote.get("REPORT_NOTE"));
					
					// SD_LEAD_INTACT 입력
					leadDao.insertLeadIntact(contRpt);
					
//					leadData.put("REPORT_NOTE", contRptNote.get("REPORT_NOTE"));
//						
//					// 입력
//					leadDao.updateLeadInfo(leadData);
				} else if ( "E".equals(gbn) ) {
					contRpt.put("REPORT_NOTE", contRptNote.get("REPORT_NOTE"));
					
					// SD_LEAD_INTACT 입력
					leadDao.updateLeadIntact(contRpt);
					
//					leadData.put("CUST_NOTE", contRptNote.get("CUST_NOTE"));
//						
//					// 입력
//					leadDao.updateLeadInfo(leadData);
				}

			}
			
		}
		
		return docNo;
	}
	
	/**
	 * Lead Info 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap selectLeadInfo(BMap param) throws Exception{
		return leadDao.selectLeadInfo(param);
	}

	/**
	 * Lead Note 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap selectCustomNote(BMap param) throws Exception{
		return leadDao.selectCustomNote(param);
	}
	
	/**
	 * Lead Note  Grid  
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectNoteGrid(BMap param) throws Exception{
		return leadDao.selectNoteGrid(param);
	}
	
	/**
	 * Lead Products Grid  
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> resultProductsGrid(BMap param) throws Exception{
		return leadDao.resultProductsGrid(param);
	}

	/**
	 * Lead PartInv Grid  
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> resultPartInvGrid(BMap param) throws Exception{
		return leadDao.resultPartInvGrid(param);
	}
	
	/**
	 * Lead Transaction 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap resultInteractionLog(BMap param) throws Exception{
		return leadDao.resultInteractionLog(param);
	}
	
	/**
	 * Lead Transaction List 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> resultContactReportGrid(BMap param) throws Exception{
		return leadDao.resultContactReportGrid(param);
	}
	
	/**
	 * Lead ChangeHistory List 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> resultChangeHistoryGrid(BMap param) throws Exception{
		return leadDao.resultChangeHistoryGrid(param);
	}
	
	/*
	 * Partner Search Popup
	 */
	public List<BMap> partnerSearchList(Map<String, Object> param) throws Exception {
		return leadDao.partnerSearchList(param);
	}

	public String getLeadStatusReasonCode(BMap refMap) throws Exception{
		
		List<CodeVO> codeList = leadDao.getLeadStatusReasonCode(refMap);
		
		String resultValue = "";
		for (int i=0; i<codeList.size(); i++) {
			if (i == 0) {
				resultValue += codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
			} else {
				resultValue += ";" + codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
			}
		}
		
		return resultValue;
	}
	
	/**
	 * Save Lead
	 * @param master
	 * @param detail
	 * @throws Exception
	 */
	public String saveTempLead(BMap param) throws Exception{
		
		Map<String, Object> leadData = (Map<String, Object>) param.get("leadData");
		Map<String, Object> noteData = (Map<String, Object>) param.get("noteData");
		List<Map<String, Object>> noteGrid = (List<Map<String, Object>>) param.get("noteGrid");
		List<Map<String, Object>> productsGrid = (List<Map<String, Object>>) param.get("productsGrid");
		List<Map<String, Object>> partInvGrid = (List<Map<String, Object>>) param.get("partInvGrid");
		Map<String, Object> contRpt = (Map<String, Object>) param.get("contRpt");
		Map<String, Object> contRptNote = (Map<String, Object>) param.get("contRptNote");
		String tabNm = (String) param.get("TAB");
		String bTabNm = (String) param.get("BTAB");
		
		String userId = LoginInfo.getUserId();
		String leadNo = (String) leadData.get("LEAD_NO");
		String tempLeadNo = "";
		
		System.err.println("temp save::"+ param);
		
		if(null == leadNo || "".equals(leadNo)){
			if(null == leadData.get("TEMP_LEAD_NO") || "".equals(leadData.get("TEMP_LEAD_NO"))){
				tempLeadNo = leadDao.getLeadTempSeq(leadData);
			}else{
				tempLeadNo = (String) leadData.get("TEMP_LEAD_NO");
			}
			
			leadData.put("LEAD_NO", tempLeadNo);
			leadData.put("USERID", userId);
			leadData.put("DOC_GR", "LD");
			
			if ( bTabNm.equals("GENERAL") ) {
//				if ( tabNm.equals("GENERAL") || bTabNm.equals("GENERAL") ) {				
				
				leadDao.deleteLeadInfo(leadData);
				
				leadData.put("LEAD_NO", tempLeadNo);
				leadData.put("CUST_NOTE", noteData.get("CUST_NOTE"));
				
				// 입력
				leadDao.insertLeadInfo(leadData);
			} else if ( bTabNm.equals("NOTE") ) {
//			} else if ( tabNm.equals("NOTE") || bTabNm.equals("NOTE") ) {				
				leadDao.deleteLeadInfo(leadData);
				
				leadData.put("LEAD_NO", tempLeadNo);
				leadData.put("CUST_NOTE", noteData.get("CUST_NOTE"));
				
				// 입력
				leadDao.insertLeadInfo(leadData);
				
				leadDao.deleteLeadNotes(leadData);
				
				for(Map<String, Object> tempMap : noteGrid){
					
					tempMap.put("LEAD_NO", tempLeadNo);
					tempMap.put("USERID", userId);
					tempMap.put("COMP_CD", leadData.get("G_COMP_CD"));
					tempMap.put("LEAD_NO", leadData.get("LEAD_NO"));
					tempMap.put("DOC_STATUS", leadData.get("DOC_STATUS"));
					
					leadDao.insertLeadNotes(tempMap);
				}
			} else if ( bTabNm.equals("PART") ) {
//			} else if ( tabNm.equals("PART") || bTabNm.equals("PART") ) {				
				leadDao.deleteLeadProducts(leadData);
				
				for(Map<String, Object> tempMap : productsGrid){

					tempMap.put("DOC_NO", tempLeadNo);
					tempMap.put("USERID", userId);
					tempMap.put("COMP_CD", leadData.get("G_COMP_CD"));
					tempMap.put("LEAD_NO", leadData.get("LEAD_NO"));
					tempMap.put("DOC_STATUS", leadData.get("DOC_STATUS"));
					
					leadDao.insertLeadProducts(tempMap);
				}
							
				
				leadDao.deleteLeadPartInv(leadData);
				
				for(Map<String, Object> tempMap : partInvGrid){

					tempMap.put("DOC_NO", tempLeadNo);
					tempMap.put("USERID", userId);
					tempMap.put("COMP_CD", leadData.get("G_COMP_CD"));
					tempMap.put("LEAD_NO", leadData.get("LEAD_NO"));
					tempMap.put("DOC_STATUS", leadData.get("DOC_STATUS"));
					
					leadDao.insertLeadPartInv(tempMap);
				}
			} 
		} else {
			if(null != leadData) {
				
				leadData.put("USERID", userId);
				leadData.put("DOC_GR", "LD");

				leadData.put("CUST_NOTE", noteData.get("CUST_NOTE"));
				// 수정
				leadDao.updateLeadInfo(leadData);
				
				
				// Note Grid
				if(null != noteGrid){
					for(Map<String, Object> tempMap : noteGrid){
						
						tempMap.put("LEAD_NO", leadNo);
						tempMap.put("USERID", userId);
						tempMap.put("COMP_CD", leadData.get("G_COMP_CD"));
						tempMap.put("DOC_STATUS", leadData.get("DOC_STATUS"));
						
						if("I".equals(tempMap.get("ROW_STATUS"))){
							leadDao.insertLeadNotes(tempMap);
						}else if("U".equals(tempMap.get("ROW_STATUS"))){
							System.err.println("note tempMap >> " + tempMap);
							leadDao.updateLeadNotes(tempMap);
						}else if("D".equals(tempMap.get("ROW_STATUS"))){
							tempMap.put("STATUS", "D");
							leadDao.updateLeadNotes(tempMap);
						}
						
					}
				}
				
				// Products Grid
				if(null != productsGrid){
					for(Map<String, Object> tempMap : productsGrid){
						
						tempMap.put("USERID", userId);
						tempMap.put("COMP_CD", leadData.get("G_COMP_CD"));
						tempMap.put("LEAD_NO", leadNo);					
						tempMap.put("DOC_STATUS", leadData.get("DOC_STATUS"));

						System.err.println("Products tempMap >> " + tempMap);
						
						if("I".equals(tempMap.get("ROW_STATUS"))){
							leadDao.insertLeadProducts(tempMap);
						}else if("U".equals(tempMap.get("ROW_STATUS"))){
							leadDao.updateLeadProducts(tempMap);
						}else if("D".equals(tempMap.get("ROW_STATUS"))){
							tempMap.put("STATUS", "D");
							leadDao.updateLeadProducts(tempMap);
						}
					}
				}
				
				// PartInv Grid
				if(null != partInvGrid){
					for(Map<String, Object> tempMap : partInvGrid){
						
						tempMap.put("USERID", userId);
						tempMap.put("COMP_CD", leadData.get("G_COMP_CD"));
						tempMap.put("LEAD_NO", leadNo);					
						tempMap.put("DOC_STATUS", leadData.get("DOC_STATUS"));
						
						System.err.println("PartInv tempMap >> " + tempMap);
						
						if("I".equals(tempMap.get("ROW_STATUS"))){
							leadDao.insertLeadPartInv(tempMap);
						}else if("U".equals(tempMap.get("ROW_STATUS"))){
							leadDao.updateLeadPartInv(tempMap);
						}else if("D".equals(tempMap.get("ROW_STATUS"))){
							tempMap.put("STATUS", "D");
							leadDao.updateLeadPartInv(tempMap);
						}
					}
				}
				
				// Interaction Log
				if(null != contRpt){
					String gbn = (String)param.get("GBN");
					
					contRpt.put("LEAD_NO", leadData.get("LEAD_NO"));
					contRpt.put("DOC_STATUS", leadData.get("DOC_STATUS"));
					
					System.err.println("param >> " + contRpt);
					System.err.println("gbn" + gbn);
					
					if ( "S".equals(gbn) ) {

						// SD_LEAD_INTACT 입력
						leadDao.insertLeadIntact(contRpt);
						
						leadData.put("CUST_NOTE", contRptNote.get("CUST_NOTE"));
							
						// 입력
						leadDao.updateLeadInfo(leadData);
					} else if ( "E".equals(gbn) ) {
						// SD_LEAD_INTACT 입력
						leadDao.updateLeadIntact(contRpt);
						
						leadData.put("CUST_NOTE", contRptNote.get("CUST_NOTE"));
							
						// 입력
						leadDao.updateLeadInfo(leadData);
					}

				}
				
			}
		}
		
		
		
		
		return tempLeadNo;
	}

	public BMap getLeadInfo(BMap param) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object getLeadItem(BMap param) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object getLeadPF(BMap param) {
		// TODO Auto-generated method stub
		return null;
	}


	public BMap resultCustSalesData(BMap param) throws Exception{
		return leadDao.resultCustSalesData(param);
	}
	
	/**
	 * search sales grp
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public String selectSalesOffice(BMap param) throws Exception{
		
		List<CodeVO> codeList = leadDao.selectSalesOffice(param);
		
		String resultValue = "";
		for (int i=0; i<codeList.size(); i++) {
			if (i == 0) {
				resultValue += codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
			} else {
				resultValue += ";" + codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
			}
		}
		
		return resultValue;
	}
	
	public BMap setCustSalesData(BMap param) throws Exception{
		return leadDao.setCustSalesData(param);
	}
	
	public String getModiTms(BMap param) throws Exception{
		return leadDao.getModiTms(param);
	}
}
