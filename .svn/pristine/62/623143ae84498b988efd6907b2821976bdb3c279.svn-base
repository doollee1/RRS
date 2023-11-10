package bt.customer.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bt.btframework.sap.SAPConnectorManager;
import bt.btframework.sap.SAPDataProvider;
import bt.btframework.sap.SAPTable;
import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.common.dao.MailManagementDao;
import bt.customer.dao.CustomerDao;

@Service
public class CustomerService {
	@Resource
	private CustomerDao customerDao;
	
	@Resource
	private MailManagementDao mailManagementDao;
	
	public List<BMap> selectCustomerList(Map<String, Object> param) throws Exception {
		param.put("LANG", LoginInfo.getLang());
		return customerDao.selectCustomerList(param);
	}
	
	public List<BMap> insertCustomerInfo(Map<String, Object> param) throws Exception {
		param.put("LANG", LoginInfo.getLang());
		param.put("USER_ID", LoginInfo.getUserId());
		customerDao.insertCustomerInfo(param);
		
		String accountGr = (String) param.get("ACCOUNT_GR");
		if (!accountGr.equals("Z005")) {
			// insert data in InterfaceTable (for ERP)
			customerDao.callSpIfErpSendCustInsert(param);
			
			// call ERP
			callRfc(param);
			
			// update state for RFC
			param.put("IF_STS", "D");
			customerDao.callSpIfErpSendCustStsUpdate(param);
		}
		
		return customerDao.selectCustomerList(param);
	}
	
	public List<BMap> updateCustomerInfo(Map<String, Object> param) throws Exception {
		param.put("LANG", LoginInfo.getLang());
		param.put("USER_ID", LoginInfo.getUserId());
		customerDao.updateCustomerInfo(param);
		
		String accountGr = (String) param.get("ACCOUNT_GR");
		if (!accountGr.equals("Z005")) {
			// insert data in InterfaceTable (for ERP)
			customerDao.callSpIfErpSendCustInsert(param);
			
			// call ERP
			callRfc(param);
			
			// update state for RFC
			param.put("IF_STS", "D");
			customerDao.callSpIfErpSendCustStsUpdate(param);
		}
		
		return customerDao.selectCustomerList(param);
	}
	
	public List<BMap> selectEmployeeList(Map<String, Object> param) throws Exception {
		param.put("LANG", LoginInfo.getLang());
		return customerDao.selectEmployeeList(param);
	}
	
	public List<BMap> selectCustomerHeaderList(Map<String, Object> param) throws Exception {
		param.put("LANG", LoginInfo.getLang());
		return customerDao.selectCustomerHeaderList(param);
	}
	
	public List<BMap> selectCustomerByAttradiusIdList(Map<String, Object> param) throws Exception {
		return customerDao.selectCustomerByAttradiusIdList(param);
	}
	
	public void updateAtradiusId(Map<String, Object> param) throws Exception {
		param.put("USER_ID", LoginInfo.getUserId());
		customerDao.updateAtradiusId(param);
	}
	
	public void updateCustomerCredit(Map<String, Object> param) throws Exception {
		param.put("USER_ID", LoginInfo.getUserId());
		customerDao.updateCustomerCredit(param);
	}
	
	public void updateCustomerRemoteCredit(Map<String, Object> param) throws Exception {	
		customerDao.saveRequestCreditHistory(param);
	}
	
	private SAPTable makeSAPTable(String name, List<Map<String, Object>> list) {
		SAPTable table = new SAPTable(name);
		if (list != null && list.size() > 0) {
			for(int i = 0; i < list.size(); i++) {
				table.addRow(list.get(i));
			}
		}
		
		return table;
	}
	
	protected void callRfc(Map<String, Object> param) throws Exception {
		List<SAPTable> tables = new ArrayList<SAPTable>();
		List<Map<String, Object>> list = customerDao.selectIfCustKna1(param);
		SAPTable table = makeSAPTable("T_ZZKNA1", list);
		tables.add(table);

		list = customerDao.selectIfCustKnas(param);
		table = makeSAPTable("T_ZZKNAS", list);
		tables.add(table);

		list = customerDao.selectIfCustArdc(param);
		table = makeSAPTable("T_ZZADRC", list);
		tables.add(table);

//		list = customerDao.selectIfCustKnb1(param);
//		table = makeSAPTable("T_ZZKNB1", list);
//		tables.add(table);

//		list = customerDao.selectIfCustKnb5(param);
//		table = makeSAPTable("T_ZZKNB5", list);
//		tables.add(table);
		
		list = customerDao.selectIfCustKnvv(param);
		table = makeSAPTable("T_ZZKNVV", list);
		tables.add(table);
		
		list = customerDao.selectIfCustKnvk(param);
		table = makeSAPTable("T_ZZKNVK", list);
		tables.add(table);
		
		list = customerDao.selectIfCustAdr6(param);
		table = makeSAPTable("T_ZZADR6", list);
		tables.add(table);

		list = customerDao.selectIfCustAdr12(param);
		table = makeSAPTable("T_ZZADR12", list);
		tables.add(table);
		
		list = customerDao.selectIfCustAdr2(param);
		table = makeSAPTable("T_ZZADR2", list);
		tables.add(table);
		
		list = customerDao.selectIfCustAdr3(param);
		table = makeSAPTable("T_ZZADR3", list);
		tables.add(table);
		
		list = customerDao.selectIfCustKnvp(param);
		table = makeSAPTable("T_ZZKNVP", list);
		tables.add(table);
		
		list = customerDao.selectIfCustKnvi(param);
		table = makeSAPTable("T_ZZKNVI", list);
		tables.add(table);
		
		SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_SD_CUSTOMER_MASTER", null, tables);
	}
	
	public List<BMap> selectCreditRequestHistory(Map<String, Object> param) throws Exception {
		param.put("LANG", LoginInfo.getLang());
		return customerDao.selectCreditRequestHistory(param);
	}
	
	public List<BMap> getCustText(Map<String, Object> param) throws Exception {
		return customerDao.getCustText(param);
	}
	
	
	public BMap resultInteractionLog(BMap param) throws Exception{
		System.err.println("aaa");
		return customerDao.resultInteractionLog(param);
	}
	public List<BMap> resultContactReportGrid(BMap param) throws Exception{
		System.err.println("bbb");
		return customerDao.resultContactReportGrid(param);
	}
	
	public String saveContactReport(BMap param) throws Exception{

		Map<String, Object> contRpt = (Map<String, Object>) param.get("contRpt");
		Map<String, Object> contRptNote = (Map<String, Object>) param.get("contRptNote");

		String userId = LoginInfo.getUserId();
		String docNo = "";
		
		System.err.println(param);
		
		String custCd = (String)param.get("CUST_CD");

		// Interaction Log
		if(null != contRpt){
			String gbn = (String)param.get("GBN");
			
			contRpt.put("CUST_CD", custCd);
			contRpt.put("USERID", userId);
			
			System.err.println("param >> " + contRpt);
			System.err.println("gbn" + gbn);
			
			if ( "S".equals(gbn) ) {

				contRpt.put("REPORT_NOTE", contRptNote.get("REPORT_NOTE"));
				
				// SD_LEAD_INTACT 입력
				customerDao.insertLeadIntact(contRpt);

			} else if ( "E".equals(gbn) ) {
				contRpt.put("REPORT_NOTE", contRptNote.get("REPORT_NOTE"));
				
				// SD_LEAD_INTACT 입력
				customerDao.updateLeadIntact(contRpt);
				

			}

		}
			

		
		return docNo;
	}
}