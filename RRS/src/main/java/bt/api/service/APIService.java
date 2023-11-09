package bt.api.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import bt.api.dao.APIDao;
import bt.btframework.sap.SAPConnectorManager;
import bt.btframework.sap.SAPDataProvider;
import bt.btframework.sap.SAPTable;
import bt.btframework.utils.BMap;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.ResponseStatus;
import bt.external.dao.ExternalDao;
import bt.external.service.ExternalService;
import bt.quotation.service.QuotationService;

@Service
public class APIService {
	private static final Logger logger = LoggerFactory.getLogger(APIService.class);
	
	// (OK)
	private static final String[] EXTERNAL_COMMOM_CODES = { "TERM_PAY_CD", "COUNTRY_CD", "KIND_CD" };
	
	@Resource
	private APIDao apiDao;
	
	@Resource
	private QuotationService quotationService;
	
	@Resource
	private ExternalService externalService;
	
	@Resource
	private ExternalDao externalDao;
	
	public void insertLead(Map<String, Object> param) throws Exception {
		apiDao.insertLead(param);
		
		try {
			apiDao.callSpIfMellowRecvLead();
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
		}
	}
		
	private Map<String, Object> getInvoceList(Map<String, Object> param) throws Exception {
		
		// System.out.println(">>>>>>>>" + param);		
		Map<String, Object> invoiceMap = new HashMap<String, Object>();
		
		//List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_FI_EXTOMS", param);
		List<SAPTable> result = null;
		if (result != null) {
			/*for (int i = 0; i < result.size(); i++) {
				List<Map<String, Object>> list = result.get(i).getRows();
				logger.debug(result.get(i).getTableName());
				for (int j = 0; j < list.size(); j++) {
					logger.debug(list.get(j).toString());
				}
			}		*/	
			// I/F Table에 Insert
				
			for(int i = 0; i < result.size(); i++) {
				SAPTable tempMap = result.get(i);
				String tblName = tempMap.getTableName();
				List<Map<String, Object>> list = tempMap.getRows();
				
				if (tblName.equals("T_VBRP")) {// table 추출
					invoiceMap.put("invoicelist", list);					
				} else {
					invoiceMap.put(tblName, list.get(0).get(tblName) );
				} 
			}
		}		
		return invoiceMap;
	}
	
	private String getCustLangCD (String lang) {		
		switch (lang) {
		case "DE":
			lang = "DE";
			break;
		case "EN":
			lang = "EN";
			break;	
		default:
			lang = "EN";
			break;
		}
		return lang;
	}
	
	public Map<String, Object> selectExternalInfo(Map<String, Object> req) throws Exception {
		
		// 현재 날짜 - invoice는 당해연도 데이터만 가지고 옮
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy", Locale.GERMAN );		
		String cyear = mSimpleDateFormat.format(new Date ());
		// cyear = "2017";
		String fromdt = cyear + "0101";
		String todt = cyear + "1231";		
				
		BMap param = new BMap();
		param.put("COMP_CD", req.get("COMP_CD"));
		param.put("CUST_CD", req.get("CUST_CD"));
		param.put("IS_FKDAT", fromdt);
		param.put("IS_FKDAT1", todt);
		
		BMap customerInfo = externalDao.selectCustomerLang(param);
		String lang = this.getCustLangCD((String)customerInfo.get("LANG_CD"));
		param.put("LANG", lang);
				
		BMap orderProcess = externalDao.selectOrderProcess(param);
		BMap invoceAddr = externalDao.selectInvoiceAddr(param);
		List<BMap> selectContactPerson = externalDao.selectContactPerson(param);
					
		Map<String, Object> codeParam = new HashMap<String, Object>();
		// TODO
		codeParam.put("LANG", lang);
		codeParam.put("codeList", EXTERNAL_COMMOM_CODES);
		List<BMap> codeList = externalDao.selectCommonCodeList(codeParam);
		
		// Module List (OK)
		List<BMap> moduleList = externalDao.selectModuleList(param);
		List<BMap> bomList = externalDao.selectBomList(param);
		List<BMap> shiptoList = externalDao.selectShiptoList(param);
		
		// Quotation List
		param.put("DOC_GR", "QT");
		List<BMap> qutationMster = externalDao.selectSalesMster(param);
		List<BMap> qutationDetail = externalDao.selectSalesDetail(param);
		
		// Sales Order List
		param.put("DOC_GR", "SO");
		List<BMap> salesOrderMaster = externalDao.selectSalesMster(param);
		List<BMap> salesOrderDetail = externalDao.selectSalesDetail(param);
		
		// invoice list
		Map<String, Object> paramInvoce = new HashMap<String, Object>();
		paramInvoce.put("IS_KUNNR", param.get("CUST_CD"));	
		paramInvoce.put("IS_BUKRS", param.get("COMP_CD"));		
		paramInvoce.put("IS_FKDAT", fromdt);
		paramInvoce.put("IS_FKDAT1", todt);
		logger.debug(">>>>" + paramInvoce);
		Map<String, Object> invoiceMap = this.getInvoceList(paramInvoce);
		// Map<String, Object> invoiceMap = null;
				
		Map<String, Object> externalMap = new HashMap<String, Object>();
		externalMap.put("codeList", codeList);
		externalMap.put("shiptoList", shiptoList);
		externalMap.put("orderProcess", orderProcess);
		externalMap.put("invoceAddr", invoceAddr);
		externalMap.put("contactPerson", selectContactPerson);
		externalMap.put("qutationMster", qutationMster);
		externalMap.put("qutationDetail", qutationDetail);
		externalMap.put("salesOrderMaster", salesOrderMaster);
		externalMap.put("salesOrderDetail", salesOrderDetail);
		externalMap.put("moduleList", moduleList);
		externalMap.put("bomList", bomList);
		externalMap.put("invoiceInfo", invoiceMap);	
		externalMap.put("custinfo", customerInfo);	
				
		return externalMap;
	}
	
	public void insertSalesOrder(Map<String, Object> param) throws Exception {
		externalDao.insertSalesOrder(param);
	}
	
	 
	/*******************************************************************************************
	 * confirm SO HEAD
	 * 
	 * 1.    RFC ; ZZ_RFC_SD_SO_CHANGE
	 * 2.    헤더승인 CASE
	 * 
	 * IV_SALESDOCUMENT = SO 번호
	 * IS_SALES_HEADER_IN-DLV_BLOCK = Z1 또는 Z2 (SO 의 P.TERM +0(2) 가 CA 이면 Z2 아니면 Z1)
	 * IS_SALES_HEADER_INX-UPDATEFLAG = U
	 * IV_EXTERNAL_OMS = X
	 * 
	 ********************************************************************************************/
	public BRespData confirmSalesHead(Map<String, Object> req) throws Exception {		
		
		Map<String, Object> param = new HashMap<String, Object>();		
		param.put("IV_SALESDOCUMENT", "0" + req.get("DOC_NO"));
		// param.put("IV_SALESDOCUMENT", "0612100290");
						
		Map<String, Object> salesHeaderIn = new HashMap<String, Object>();
		salesHeaderIn.put("DLV_BLOCK", req.get("DLV_BLOCK"));
		// salesHeaderIn.put("DLV_BLOCK", "Z1");
		param.put("IS_SALES_HEADER_IN", salesHeaderIn);		
		
		Map<String, Object> salesHeaderInx = new HashMap<String, Object>();
		salesHeaderInx.put("UPDATEFLAG", "U");
		param.put("IS_SALES_HEADER_INX", salesHeaderInx);	
		param.put("IV_EXTERNAL_OMS", "X");
		
		// System.out.println(">>>>>>>>" + param);
		
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_RFC_SD_SO_CHANGE", param);
		if (result != null) {			
			// oms update
			Map<String, Object> soParam = new HashMap<String, Object>();	
			soParam.put("COMP_CD", req.get("COMP_CD"));
			soParam.put("DOC_NO", req.get("DOC_NO"));
			soParam.put("DELI_BLOCK_CD", req.get("DLV_BLOCK"));		
			soParam.put("REASON_REJECT", req.get("REASON_REJECT"));	
			externalDao.confirmSalesOrderHead(soParam);
			
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}	
	}
	
	
	/*******************************************************************************************
	 * confirm SO HEAD
	 * 
	 * 1.    RFC ; ZZ_RFC_SD_SO_CHANGE
	 * 2.    헤더승인 CASE
	 * 
	 * IV_SALESDOCUMENT = SO 번호
	 * IS_SALES_HEADER_INX-UPDATEFLAG = U
	 * IV_EXTERNAL_OMS = X
	 * 
	 * IT_SALES_SCHEDULES_IN-ITM_NUMBER = SO ITEM 항목번호
	 * IT_SALES_SCHEDULES_IN-SCHED_LINE = 0001
	 * IT_SALES_SCHEDULES_IN-REQ_DLV_BL = Z1 또는 Z2 (SO 의 P.TERM +0(2) 가 CA 이면 Z2 아니면 Z1)
	 * 
	 * IT_SALES_SCHEDULES_INX-ITM_NUMBER = SO ITEM 항목번호
	 * IT_SALES_SCHEDULES_INX-SCHED_LINE = 0001
	 * IT_SALES_SCHEDULES_INX-UPDATEFLAG = U
	 * 
	 ********************************************************************************************/
	private BRespData confirmSalesItem(Map<String, Object> req) throws Exception {

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("IV_SALESDOCUMENT", "0" + req.get("DOC_NO"));
		// param.put("IV_SALESDOCUMENT", "0612100283");
		
		Map<String, Object> salesHeaderInx = new HashMap<String, Object>();
		salesHeaderInx.put("UPDATEFLAG", "U");
		param.put("IS_SALES_HEADER_INX", salesHeaderInx);
		param.put("IV_EXTERNAL_OMS", "X");		
		
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		HashMap<String, Object> row = new HashMap<String, Object>();
		
		SAPTable table = new SAPTable("IT_SALES_SCHEDULES_IN");			
		row = new HashMap<String, Object>();
		row.put("ITM_NUMBER", req.get("ITM_NUMBER"));
		row.put("SCHED_LINE", "000" + req.get("SCHED_LINE"));	
		row.put("REQ_DLV_BL", req.get("REQ_DLV_BL"));
		// row.put("ITM_NUMBER", "100");
		// row.put("SCHED_LINE", "0001");	
		// row.put("REQ_DLV_BL", "Z2");
		
		
		table.addRow(row);	
		tableList.add(table);
						
		table = new SAPTable("IT_SALES_SCHEDULES_INX");		
		row = new HashMap<String, Object>();
		row.put("ITM_NUMBER", req.get("ITM_NUMBER"));
		row.put("SCHED_LINE", "000" + req.get("SCHED_LINE"));
		// row.put("ITM_NUMBER", "100");
		// row.put("SCHED_LINE", "0001");		
		
		row.put("UPDATEFLAG", "U");
		table.addRow(row);		
		tableList.add(table);
				 		
		// System.out.println(">>>>>>>>" + tableList);
		// System.out.println(">>>>>>>>" + param);
				
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_RFC_SD_SO_CHANGE", param, tableList);
		
		if (result != null) {
				   
			Map<String, Object> soParam = new HashMap<String, Object>();	
			soParam.put("COMP_CD", req.get("COMP_CD"));
			soParam.put("DOC_NO", req.get("DOC_NO"));
			soParam.put("ITEM_SEQ", req.get("ITM_NUMBER"));
			soParam.put("DELI_BLOCK_CD", req.get("REQ_DLV_BL"));
			soParam.put("REASON_REJECT", req.get("REASON_REJECT"));
			
			externalDao.confirmSalesOrderItem(soParam);			
			
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}	
	}	
	
	
	public BRespData confirmSales(Map<String, Object> req) throws Exception {
		
		// return this.confirmSalesItem(req);
				
		final String _DIV_HEAD_ = "HEAD";		
		String div = (String)req.get("DIV");	
		
		// 이력 남기기
		// IF_QC_EXT_ORDER_CONFIRM_HISTORY
		externalDao.insertConfirmHis(req);
		
		if (_DIV_HEAD_.equals(div)) {
			return this.confirmSalesHead(req);
		} else {
			return this.confirmSalesItem(req);
		}		
	}
}