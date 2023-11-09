package bt.customer.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;

@Repository
public class CustomerDao extends DBAbstractMapper {
	private static final Logger logger = LoggerFactory.getLogger(DBAbstractMapper.class);
	
	@SuppressWarnings("unchecked")
	public List<BMap> selectCustomerList(Map<String, Object> param) throws Exception {
		String langCd = LoginInfo.getLang();
		int count = (int) selectByPk("CustomerMapper.selectCustomerCount", param);
		if (count == 0) {
			return new ArrayList<BMap>();
		} else if (count == 1) {
			List<BMap> result = list("CustomerMapper.selectCustomerList", param);
			for (int i = 0; i < result.size(); i++) {
				BMap customer = result.get(i);
				customer.put("LANG", langCd);
				customer.put("custPersonList", list("CustomerMapper.selectCustomerPersonList", customer));
				customer.put("custTaxList", list("CustomerMapper.selectCustomerTaxList", customer));
				customer.put("custVatList", list("CustomerMapper.selectCustomerVatList", customer));
				
				List<BMap> salesList = list("CustomerMapper.selectCustomerSalesList", customer);
				customer.put("custSalesList", salesList);
				
				for (int j = 0; j < salesList.size(); j++) {
					BMap sale = salesList.get(j);
					sale.put("LANG", langCd);
					sale.put("custPartList", list("CustomerMapper.selectCustomerPartList", sale));
				}
				
				customer.put("contactReportList", list("CustomerMapper.resultContactReportGrid", customer));
			}
			
			return result;
		} else {
			List<BMap> result = list("CustomerMapper.selectPopupCustomerList", param);
			return result;
		}
	}
	
	@SuppressWarnings("unchecked")
	public void insertCustomerInfo(Map<String, Object> param) throws Exception {
		String userId = LoginInfo.getUserId();
		String langCd = LoginInfo.getLang();
		
		insert("CustomerMapper.insertCustomerInfo", param);
		Object custCd = param.get("CUST_CD");
		Object custNm = param.get("CUST_NM");
		Object compCd = param.get("COMP_CD");
		
		List<Map<String, Object>> list = (List<Map<String, Object>>) param.get("custPersonList");
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> item = list.get(i);
				item.put("COMP_CD", compCd);
				item.put("CUST_CD", custCd);
				item.put("USER_ID", userId);
				item.put("LANG", langCd);
				insert("CustomerMapper.insertCustomerPerson", item);
			}
		}
		
		list = (List<Map<String, Object>>) param.get("custTaxList");
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> item = list.get(i);
				item.put("COMP_CD", compCd);
				item.put("CUST_CD", custCd);
				item.put("USER_ID", userId);
				item.put("LANG", langCd);
				insert("CustomerMapper.insertCustomerTax", item);
			}
		}
		
		list = (List<Map<String, Object>>) param.get("custVatList");
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> item = list.get(i);
				item.put("COMP_CD", compCd);
				item.put("CUST_CD", custCd);
				item.put("USER_ID", userId);
				item.put("LANG", langCd);
				insert("CustomerMapper.insertCustomerVat", item);
			}
		}
		
		// default partner function
		list = (List<Map<String, Object>>) param.get("custSalesList");
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> item = list.get(i);
				item.put("COMP_CD", compCd);
				item.put("CUST_CD", custCd);
				item.put("USER_ID", userId);
				item.put("LANG", langCd);
				insert("CustomerMapper.insertCustomerSales", item);
				
				Object salesOrgCd = item.get("SALES_ORG_CD");
				Object distrbCh = item.get("DISTRB_CH");
				Object divCd = item.get("DIV_CD");
				List<Map<String, Object>> partlist = (List<Map<String, Object>>) item.get("custPartList");
				if (partlist != null && partlist.size() > 0) {
					// insert for input
					for (int j = 0; j < partlist.size(); j++) {
						Map<String, Object> part = partlist.get(j);
						part.put("COMP_CD", compCd);
						part.put("CUST_CD", custCd);
						part.put("SALES_ORG_CD", salesOrgCd);
						part.put("DISTRB_CH", distrbCh);
						part.put("DIV_CD", divCd);
						part.put("USER_ID", userId);
						part.put("LANG", langCd);
						if (j < 4) {
							part.put("PF_PS_NO", custCd);
							part.put("PF_PS_NM", custNm);
						}
						insert("CustomerMapper.insertCustomerPart", part);
					}
				}
			}
		}
		

		Map<String, Object> contRpt = (Map<String, Object>) param.get("contRpt");
		Map<String, Object> contRptNote = (Map<String, Object>) param.get("contRptNote");
		
		System.err.println("param contRpt >> " + contRpt);
		System.err.println("param contRptNote >> " + contRptNote);
		System.err.println("gbn >> " + (String)param.get("GBN"));		
		
		if(null != contRpt){
			String gbn = (String)param.get("GBN");
			
			contRpt.put("CUST_CD", custCd);
			contRpt.put("USERID", userId);
			
			System.err.println("param >> " + contRpt);
			System.err.println("gbn" + gbn);
			
			if ( "S".equals(gbn) ) {

				contRpt.put("REPORT_NOTE", contRptNote.get("REPORT_NOTE"));
				
				// SD_LEAD_INTACT 입력
				insert("CustomerMapper.insertLeadIntact", contRpt);
			} else if ( "E".equals(gbn) ) {
				contRpt.put("REPORT_NOTE", contRptNote.get("REPORT_NOTE"));
				
				// SD_LEAD_INTACT 입력
				insert("CustomerMapper.updateLeadIntact", contRpt);
			}

		}
	}
	
	private void deleteArray(List<Map<String, Object>> list, String k, Object v) {
		if (list == null || list.size() == 0) {
			return;
		}
		
		Integer value = (Integer) v;
		for (int i = 0; i < list.size(); i++) {
			BigDecimal obj = (BigDecimal) list.get(i).get(k);
			if (value.intValue() == obj.intValue()) {
				list.remove(i);
			}
		}
	}
	
	private void deleteArray2(List<Map<String, Object>> list, String k, Object v) {
		if (list == null || list.size() == 0) {
			return;
		}
		
		for (int i = 0; i < list.size(); i++) {
			if (v.equals(list.get(i).get(k))) {
				list.remove(i);
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	public void updateCustomerInfo(Map<String, Object> param) throws Exception {
		String userId = LoginInfo.getUserId();
		String langCd = LoginInfo.getLang();
		
		update("CustomerMapper.updateCustomerInfo", param);
		Object compCd = param.get("COMP_CD");
		Object custCd = param.get("CUST_CD");
		
		List<Map<String, Object>> origin = list("CustomerMapper.selectCustomerPersonList", param);
		List<Map<String, Object>> list = (List<Map<String, Object>>) param.get("custPersonList");
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> item = list.get(i);
				item.put("COMP_CD", compCd);
				item.put("CUST_CD", custCd);
				item.put("USER_ID", userId);
				item.put("LANG", langCd);
				Object seq = item.get("CODE");
				
				if (seq == null) {
					insert("CustomerMapper.insertCustomerPerson", item);
				} else {
					update("CustomerMapper.updateCustomerPerson", item);
					deleteArray2(origin, "CODE", seq);
				}
			}
		}
		if (origin != null) {
			for (int i = 0; i < origin.size(); i++) {
				Map<String, Object> item = origin.get(i);
				item.put("CUST_CD", custCd);
				delete("CustomerMapper.deleteCustomerPerson", item);
			}
		}
		
		origin = list("CustomerMapper.selectCustomerTaxList", param);
		list = (List<Map<String, Object>>) param.get("custTaxList");
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> item = list.get(i);
				item.put("COMP_CD", compCd);
				item.put("CUST_CD", custCd);
				item.put("USER_ID", userId);
				item.put("LANG", langCd);
				Object seq = item.get("SEQ");
				
				if (seq == null) {
					insert("CustomerMapper.insertCustomerTax", item);
				} else {
					update("CustomerMapper.updateCustomerTax", item);
//					deleteArray(origin, "SEQ", seq);
				}
			}
		}
//		if (origin != null) {
//			for (int i = 0; i < origin.size(); i++) {
//				Map<String, Object> item = origin.get(i);
//				item.put("CUST_CD", custCd);
//				delete("CustomerMapper.deleteCustomerTax", item);
//			}
//		}
		
		origin = list("CustomerMapper.selectCustomerVatList", param);
		list = (List<Map<String, Object>>) param.get("custVatList");
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> item = list.get(i);
				item.put("COMP_CD", compCd);
				item.put("CUST_CD", custCd);
				item.put("USER_ID", userId);
				item.put("LANG", langCd);
				Object seq = item.get("SEQ");
				
				if (seq == null) {
					insert("CustomerMapper.insertCustomerVat", item);
				} else {
					update("CustomerMapper.updateCustomerVat", item);
					deleteArray(origin, "SEQ", seq);
				}
			}
		}
		if (origin != null) {
			for (int i = 0; i < origin.size(); i++) {
				Map<String, Object> item = origin.get(i);
				item.put("CUST_CD", custCd);
				delete("CustomerMapper.deleteCustomerVat", item);
			}
		}
		
		origin = list("CustomerMapper.selectCustomerSalesList", param);
		list = (List<Map<String, Object>>) param.get("custSalesList");
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> item = list.get(i);
				item.put("COMP_CD", compCd);
				item.put("CUST_CD", custCd);
				item.put("USER_ID", userId);
				item.put("LANG", langCd);
				Object seq = item.get("SEQ");
				if (seq == null) {
					insert("CustomerMapper.insertCustomerSales", item);
				} else {
					update("CustomerMapper.updateCustomerSales", item);
					deleteArray(origin, "SEQ", seq);
				}
				
				Object salesOrgCd = item.get("SALES_ORG_CD");
				Object distrbCh = item.get("DISTRB_CH");
				Object divCd = item.get("DIV_CD");
				List<Map<String, Object>> origin1 = list("CustomerMapper.selectCustomerPartList", item);
				List<Map<String, Object>> partList = (List<Map<String, Object>>) item.get("custPartList");
				if (partList != null && partList.size() > 0) {
					for (int j = 0; j < partList.size(); j++) {
						Map<String, Object> part = partList.get(j);
						Object partSeq = part.get("SEQ");
						part.put("COMP_CD", compCd);
						part.put("CUST_CD", custCd);
						part.put("SALES_ORG_CD", salesOrgCd);
						part.put("DISTRB_CH", distrbCh);
						part.put("DIV_CD", divCd);
						part.put("USER_ID", userId);
						part.put("LANG", langCd);
						if (partSeq == null) {
							insert("CustomerMapper.insertCustomerPart", part);
						} else {
							update("CustomerMapper.updateCustomerPart", part);
							deleteArray(origin1, "SEQ", partSeq);
						}
					}
				}
				if (origin1 != null) {
					for (int j = 0; j < origin1.size(); j++) {
						Map<String, Object> orgitem = origin1.get(j);
						orgitem.put("CUST_CD", custCd);
						orgitem.put("USER_ID", userId);
						delete("CustomerMapper.deleteCustomerPart", orgitem);
					}
				}
			}
		}
		if (origin != null) {
			for (int i = 0; i < origin.size(); i++) {
				Map<String, Object> item = origin.get(i);
				item.put("CUST_CD", custCd);
				delete("CustomerMapper.deleteCustomerSales", item);
			}
		}
		

		Map<String, Object> contRpt = (Map<String, Object>) param.get("contRpt");
		Map<String, Object> contRptNote = (Map<String, Object>) param.get("contRptNote");
		
		System.err.println("param contRpt >> " + contRpt);
		System.err.println("param contRptNote >> " + contRptNote);
		System.err.println("gbn >> " + (String)param.get("GBN"));	
		
		if(null != contRpt){
			String gbn = (String)param.get("GBN");
			
			contRpt.put("CUST_CD", custCd);
			contRpt.put("USERID", userId);
			
			System.err.println("param >> " + contRpt);
			System.err.println("gbn" + gbn);
			
			if ( "S".equals(gbn) ) {

				contRpt.put("REPORT_NOTE", contRptNote.get("REPORT_NOTE"));
				
				// SD_LEAD_INTACT 입력
				insert("CustomerMapper.insertLeadIntact", contRpt);
			} else if ( "E".equals(gbn) ) {
				contRpt.put("REPORT_NOTE", contRptNote.get("REPORT_NOTE"));
				
				// SD_LEAD_INTACT 입력
				insert("CustomerMapper.updateLeadIntact", contRpt);
			}

		}
	}
	
	@SuppressWarnings("unchecked")
	public List<BMap> selectEmployeeList(Map<String, Object> param) throws Exception {
		return list("CustomerMapper.selectCustomerPersonList", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<BMap> selectCustomerHeaderList(Map<String, Object> param) throws Exception {
		return list("CustomerMapper.selectCustomerHeaderList", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<BMap> selectCustomerByAttradiusIdList(Map<String, Object> param) throws Exception {
		return list("CustomerMapper.selectCustomerByAttradiusIdList", param);
	}
	
	public void updateAtradiusId(Map<String, Object> param) throws Exception {
		update("CustomerMapper.updateAtradiusId", param);
	}
	
	public void updateCustomerCredit(Map<String, Object> param) throws Exception {
		update("CustomerMapper.updateCustomerCredit", param);
	}
	
	public void saveRequestCreditHistory(Map<String, Object> param) throws Exception {
		update("CustomerMapper.saveRequestCreditHistory", param);
	}
	
	public Object callSpIfErpSendCustInsert(Map<String, Object> param) throws Exception {
		return selectByPk("CustomerMapper.callSpIfErpSendCustInsert", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIfCustKna1(Map<String, Object> param) throws Exception {
		return list("CustomerMapper.selectIfCustKna1", param);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIfCustKnas(Map<String, Object> param) throws Exception {
		return list("CustomerMapper.selectIfCustKnas", param);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIfCustArdc(Map<String, Object> param) throws Exception {
		return list("CustomerMapper.selectIfCustArdc", param);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIfCustKnb1(Map<String, Object> param) throws Exception {
		return list("CustomerMapper.selectIfCustKnb1", param);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIfCustKnb5(Map<String, Object> param) throws Exception {
		return list("CustomerMapper.selectIfCustKnb5", param);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIfCustKnvv(Map<String, Object> param) throws Exception {
		return list("CustomerMapper.selectIfCustKnvv", param);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIfCustKnvk(Map<String, Object> param) throws Exception {
		return list("CustomerMapper.selectIfCustKnvk", param);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIfCustAdr6(Map<String, Object> param) throws Exception {
		return list("CustomerMapper.selectIfCustAdr6", param);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIfCustAdr12(Map<String, Object> param) throws Exception {
		return list("CustomerMapper.selectIfCustAdr12", param);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIfCustAdr2(Map<String, Object> param) throws Exception {
		return list("CustomerMapper.selectIfCustAdr2", param);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIfCustAdr3(Map<String, Object> param) throws Exception {
		return list("CustomerMapper.selectIfCustAdr3", param);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIfCustKnvp(Map<String, Object> param) throws Exception {
		return list("CustomerMapper.selectIfCustKnvp", param);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIfCustKnvi(Map<String, Object> param) throws Exception {
		return list("CustomerMapper.selectIfCustKnvi", param);
	}
	
	public Object callSpIfErpSendCustStsUpdate(Map<String, Object> param) throws Exception {
		return selectByPk("CustomerMapper.callSpIfErpSendCustStsUpdate", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<BMap> selectCreditRequestHistory(Map<String, Object> param) throws Exception {
		return list("CustomerMapper.selectCreditRequestHistory", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<BMap> getCustText(Map<String, Object> param) throws Exception {
		return list("CustomerMapper.getCustText", param);
	}
	
	@SuppressWarnings("unchecked")
	public BMap resultInteractionLog(BMap param)throws Exception{
		return (BMap) selectByPk("CustomerMapper.resultInteractionLog", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<BMap> resultContactReportGrid(BMap param) throws Exception{
		return list("CustomerMapper.resultContactReportGrid", param);
	}
	
	@SuppressWarnings("unchecked")
	public void insertLeadIntact(Map<String, Object> param)throws Exception{
		insert("CustomerMapper.insertLeadIntact", param);		
	}
	@SuppressWarnings("unchecked")
	public void updateLeadIntact(Map<String, Object> param)throws Exception{
		insert("CustomerMapper.updateLeadIntact", param);		
	}
	
	@SuppressWarnings("unchecked")
	public BMap isQPartner(BMap param)throws Exception{
		return (BMap) selectByPk("CustomerMapper.isQPartner", param);
	}
}