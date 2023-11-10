package bt.common.service;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import bt.btframework.common.FileManager;
import bt.btframework.sap.JCOHandler;
import bt.btframework.sap.SAPConnectorManager;
import bt.btframework.sap.SAPDataProvider;
import bt.btframework.sap.SAPTable;
import bt.btframework.utils.BMap;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.btframework.utils.ResponseStatus;
import bt.common.dao.SapCrmIfRecvCustomerDao;
import bt.common.dao.SapCrmIfRecvLeadDao;
import bt.common.dao.SapCrmIfRecvQuotDao;
import bt.common.dao.SapIfRecvBomDao;
import bt.common.dao.SapIfRecvCreditBlockDao;
import bt.common.dao.SapIfRecvCustomerDao;
import bt.common.dao.SapIfRecvEmpDao;
import bt.common.dao.SapIfRecvMsPartnerDao;
import bt.common.dao.SapIfRecvProductDao;
import bt.common.dao.SapIfRecvSalesOrderDao;
import bt.customer.service.CustomerService;
import egovframework.com.utl.sim.service.EgovFileScrty;

@Service
public class SapIfService {
	private static final Logger logger = LoggerFactory.getLogger(SapIfService.class);
	
	private static final String DE_COMP_CD = "1000";
	private static final String FR_COMP_CD = "3500";
	private static final String DE_POLICY_NO = "369446";
	private static final String FR_POLICY_NO = "907912";
	
	private static final String svrNm = "IF";
	private static final String filePath = "D:\\log\\batchjob\\";
	
	@Resource
	private SapIfRecvProductDao sapIfRecvProductDao;
	
	@Resource
	private SapIfRecvBomDao sapIfRecvBomDao;
	
	@Resource
	private SapIfRecvMsPartnerDao sapIfRecvMsPartnerDao;
	
	@Resource
	private SapIfRecvEmpDao sapIfRecvEmpDao;

	@Resource
	private SapIfRecvCreditBlockDao sapIfRecvCreditBlockDao;

	@Resource
	private SapIfRecvCustomerDao sapIfRecvCustomerDao;

	@Resource
	private SapIfRecvSalesOrderDao sapIfRecvSalesOrderDao;

	@Resource
	private SapCrmIfRecvCustomerDao sapCrmIfRecvCustomerDao;

	@Resource
	private SapCrmIfRecvLeadDao sapCrmIfRecvLeadDao;

	@Resource
	private SapCrmIfRecvQuotDao sapCrmIfRecvQuotDao;
	
	@Resource
	private CustomerService customerService;
	
	public BRespData callErpProduct(Map<String, Object> req) throws Exception {
		//////////////////////////////////////////////////////////////
		//1. RFP 펑션에 파라메터값을 설정 (optional)
		//ZCDPOR 에 “X” 값세팅
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("IS_ZCDPOR", (String) req.get("ZCDPOR"));
		
		//2. 테이블값 설정
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		SAPTable table = new SAPTable("T_TVKO");
		table.put("VKORG", (String) req.get("P_VKORG"));
		tableList.add(table);

		table = new SAPTable("T_T001W");
		
		//table.put("WERKS", "1000");
		table.put("WERKS", (String) req.get("P_WERKS"));
		tableList.add(table);

		//3. 호출
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_SD_PRODUCT_MASTER", param, tableList);
		if (result != null) {
			//프로시저호출…
			// T_MARA, T_MAKT, T_MVKE, T_MARC, T_MBEW, T_MARM, T_T001, T_LONGTEXT
			for (int i = 0; i < result.size(); i++) {
				SAPTable tempMap = result.get(i);
				if ("T_LONGTEXT".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvProductDao.insertSapIfRecvTLongText(list.get(j));
					}
					list = null;
				} else if ("T_MAKT".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvProductDao.insertSapIfRecvTMakt(list.get(j));
					}
					list = null;
				} else if ("T_MARA".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvProductDao.insertSapIfRecvTMara(list.get(j));
					}
					list = null;
				} else if ("T_MARC".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvProductDao.insertSapIfRecvTMarc(list.get(j));
					}
					list = null;
				} else if ("T_MARM".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvProductDao.insertSapIfRecvTMarm(list.get(j));
					}
					list = null;
				} else if ("T_MBEW".equals(tempMap.getTableName()) ){
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvProductDao.insertSapIfRecvTMbew(list.get(j));
					}
					list = null;
				} else if ("T_MVKE".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvProductDao.insertSapIfRecvTMvke(list.get(j));
					}
					list = null;
				} else if ("T_T001".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvProductDao.insertSapIfRecvTT001(list.get(j));
					}
					list = null;
				} else if ("T_MCHA".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvProductDao.insertSapIfRecvTMcha(list.get(j));
					}
					list = null;
				} else if ("T_MCHB".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvProductDao.insertSapIfRecvTMchb(list.get(j));
					}
					list = null;
				}
			}
			result = null;
			// Stored PROCEDURE CALL SP_IF_ERP_RECV_PRODUCT
			param.put("COMP_CD", "1000");
			param.put("USER_ID", LoginInfo.getUserId());
			
			sapIfRecvProductDao.callSpSapIfRecvProduct(param);
			
			return new BRespData(ResponseStatus.OK);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
	public BRespData callErpBom(Map<String, Object> req) throws Exception {
		//////////////////////////////////////////////////////////////
		//1. RFP 펑션에 파라메터값을 설정 (optional)
		//ZCDPOR 에 “X” 값세팅
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("IS_STLAN", (String) req.get("STLAN"));
		param.put("IS_STLTY", (String) req.get("STLTY"));
		
		//2. 테이블값 설정
		List<SAPTable> tableList = new ArrayList<SAPTable>();		
		SAPTable table = new SAPTable("T_T001W");			//
		
		table.put("WERKS", (String) req.get("WERKS"));
		tableList.add(table);
		
		if ( (String) req.get("MATNR") != "" ) {
			table = new SAPTable("T_MARA");		
			table.put("MATNR", (String) req.get("MATNR"));	
			
			tableList.add(table);
		}

		//3. 호출
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_SD_BOM_MASTER", param, tableList);
		
		if (result != null) {
			// I/F Table에 Insert
			for(int i = 0; i < result.size(); i++) {
				SAPTable tempMap = result.get(i);
				if ("T_MAST".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvBomDao.insertSapIfRecvBomMast(list.get(j));
					}
					list = null;
				} else if("T_STKO".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvBomDao.insertSapIfRecvBomTStko(list.get(j));
					}
					list = null;
				} else if("T_STPO".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvBomDao.insertSapIfRecvBomTStpo(list.get(j));
					}
					list = null;
				}
			}
			result = null;
			// Bom Table에 Insert/Update
			// Stored PROCEDURE CALL SP_IF_ERP_RECV_BOM
			param.put("COMP_CD", "1000");
			param.put("USER_ID", LoginInfo.getUserId());
			sapIfRecvBomDao.callSpSapIfRecvBom(param);
			return new BRespData(ResponseStatus.OK);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
	public BRespData selectOpenArList(Map<String, Object> req) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("IS_KUNNR", req.get("CUST_CD")); 
		param.put("IS_BUKRS", req.get("COMP_CD"));
		param.put("IS_ALLGSTID", req.get("IS_ALLGSTID"));
		param.put("IS_BPETNBEL", "X");
		
		/*  Sapmpe Data
		 *  IS_KUNNR : 1705244
		 *  IS_BUKRS : 1000
		 *  IS_ALLGSTID : 21.03.2017
		 */
		
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_FI_OPENAR", param);
		if (result != null) {
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}

	public BRespData callErpMsPartner(Map<String, Object> req) throws Exception {
		//////////////////////////////////////////////////////////////
		//1. RFP 펑션에 파라메터값을 설정 (optional)
		Map<String, Object> param = new HashMap<String, Object>();
		//3. 호출
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_SD_FORWARDER", param);
		
		if (result != null) {
			// I/F Table에 Insert
			for(int i = 0; i < result.size(); i++) {
				SAPTable tempMap = result.get(i);
				if ("ET_LFA1".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvMsPartnerDao.insertSapIfRecvMsPartner(list.get(j));
					}
				}
			}
			param.put("COMP_CD", "1000");
			param.put("USER_ID", LoginInfo.getUserId());
			sapIfRecvMsPartnerDao.callSpSapIfRecvMsPartner(param);
			return new BRespData(ResponseStatus.OK);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
	public BRespData selectEmpList(Map<String, Object> req) throws Exception {
		//////////////////////////////////////////////////////////////
		//1. RFP 펑션에 파라메터값을 설정 (optional)
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("IS_BUKRS", "1000");		
		param.put("IS_CHECK", "");		

		//3. 호출
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_FI_HR", param);
		
		if (result != null) {
			// I/F Table에 Insert			
			for(int i = 0; i < result.size(); i++) {
				SAPTable tempMap = result.get(i);
				if ("T_PA0001".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						list.get(j).put("PWCUR",EgovFileScrty.encryptPassword("oms1234",String.valueOf(Integer.parseInt(list.get(j).get("PERNR").toString()))));
						sapIfRecvEmpDao.insertSapIfRecvEmpPA0001(list.get(j));
					}
				}else if("T_T501T".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvEmpDao.insertSapIfRecvEmpT501T(list.get(j));
					}
				}else if("T_HRORG".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvEmpDao.insertSapIfRecvEmpHRORG(list.get(j));
					}
				}else if("T_CSKS".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvEmpDao.insertSapIfRecvEmpCSKS(list.get(j));
					}
				}
			}
			param.put("COMP_CD", "1000");
			param.put("USER_ID", LoginInfo.getUserId());
			sapIfRecvEmpDao.callSpSapIfRecvEmp(param);
			return new BRespData(ResponseStatus.OK);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}

	public BRespData selectPhysicalSockList(BMap req) throws Exception {
		
		String lang = (String)req.get("LANG");
		
		if ( lang.equals("EN") ) {
			req.put("IS_SPRAS", "E" );
		}else if ( lang.equals("DE") ) {
			req.put("IS_SPRAS", "D" );
		}else if ( lang.equals("FR") ) {
			req.put("IS_SPRAS", "F" );
		}
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("IS_SPRAS", req.get("IS_SPRAS"));
		
		System.err.println(param.get("IS_SPRAS"));
		
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		SAPTable table = new SAPTable("T_MATNR");
		table.put("SIGN", "I");
		table.put("OPTION", "EQ");
		table.put("LOW", req.get("MATL_CD"));
		
		tableList.add(table);
		
		table = new SAPTable("T_WERKS");
		table.put("SIGN", "I");
		table.put("OPTION", "EQ");
		table.put("LOW", req.get("PLANT_CD"));
		tableList.add(table);
		
		if (req.get("STO_LOC") != null && req.get("STO_LOC") != "") {
			table = new SAPTable("T_LGORT");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("STO_LOC"));
			tableList.add(table);
		}
		
		/* FROM - TO가 모두 있는 경우*/
		if((req.get("CHARG_FR") != null && req.get("CHARG_FR") != "") && (req.get("CHARG_TO") != null && req.get("CHARG_TO") != "")){
			table = new SAPTable("T_CHARG");
			table.put("SIGN", "I");
			table.put("OPTION", "BT");
			table.put("LOW", req.get("CHARG_FR"));
			table.put("HIGH", req.get("CHARG_TO"));
			tableList.add(table);
		}
		/* FROM만 있는 경우*/
		if((req.get("CHARG_FR") != null && req.get("CHARG_FR") != "") && (req.get("CHARG_TO") == null || req.get("CHARG_TO") == "")){
			table = new SAPTable("T_CHARG");
			table.put("SIGN", "I");
			table.put("OPTION", "GE");
			table.put("LOW", req.get("CHARG_FR"));
			tableList.add(table);
		}
		/* TO만 있는 경우*/
		if((req.get("CHARG_FR") == null || req.get("CHARG_FR") == "") && (req.get("CHARG_TO") != null && req.get("CHARG_TO") != "")){
			table = new SAPTable("T_CHARG");
			table.put("SIGN", "I");
			table.put("OPTION", "LE");
			table.put("LOW", req.get("CHARG_TO"));
			tableList.add(table);
		}
		
		//List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_SD_STOCK_LIST", tableList);  
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_SD_AVSTOCK_LIST", param, tableList);
		if (result != null) {
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
	public BRespData callErpCreditBlock(Map<String, Object> req) throws Exception {
		//////////////////////////////////////////////////////////////
		//1. RFP 펑션에 파라메터값을 설정 (optional)
		//
		Map<String, Object> param = new HashMap<String, Object>();

		param.put("IS_CMGST", "B");			// IS_CMGST : 'B'
		param.put("IS_FRDATE", "01022018");		// IS_FRDATE : '01022018'
		param.put("IS_TODATE", "28022018");		// IS_TODATE : '28022018'
		
		//2. 테이블값 설정
		List<SAPTable> tableList = new ArrayList<SAPTable>();

		//T_VKORG 테이블 VKORG 필드에  값세팅
		SAPTable table = new SAPTable("T_VKORG");		
		table.put("VKORG", "1000");					// Sales Organization	1000
		tableList.add(table);

		//T_VBELN 테이블 VBELN 필드에  값세팅
		table = new SAPTable("T_VBELN");			// 
		table.put("VBELN", "612015187");			// Sales Document	612100010,	612015187
		tableList.add(table);

		//3. 호출
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_SD_SO_STATUS", param, tableList);
		
		if (result != null) {
			// I/F Table에 Insert
			for(int i = 0; i < result.size(); i++) {
				SAPTable tempMap = result.get(i);
				if ("T_DATA".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvCreditBlockDao.insertSapIfRecvCreditBlockTData(list.get(j));
					}
				}
			}
			// SD_CREDIT_BLOCK Table에 Insert/Update
			// Stored PROCEDURE CALL SP_IF_ERP_RECV_CREDIT_BLOCK
			param.put("COMP_CD", "1000");
			param.put("USER_ID", LoginInfo.getUserId());
			return new BRespData(ResponseStatus.OK);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}

	public BRespData connCRM(Map<String, Object> req) throws Exception {
		//////////////////////////////////////////////////////////////
		//1. RFP 펑션에 파라메터값을 설정 (optional)
		Map<String, Object> param = new HashMap<String, Object>();

		//3. 호출
		//List<SAPTable> result = SAPConnectorManager.executeCRM("ZZ_CRM_CONNECT", param);
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.CRM, "ZZ_CRM_CONNECT", param);
		
		if (result != null) {
			// I/F Table에 Insert

			for(int i = 0; i < result.size(); i++) {
				SAPTable tempMap = result.get(i);
				List<Map<String, Object>> list = tempMap.getRows();
				
				for (int j = 0; j < list.size(); j++) {
					sapIfRecvMsPartnerDao.insertSapIfRecvMsPartner(list.get(j));
				}
			}
			param.put("COMP_CD", "1000");
			param.put("USER_ID", LoginInfo.getUserId());
			sapIfRecvMsPartnerDao.callSpSapIfRecvMsPartner(param);
			return new BRespData(ResponseStatus.OK);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
	public BRespData selectCreditBlockList(BMap req) throws Exception {
		// set import parameter
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("IS_SPRAS", LoginInfo.getLang());
		
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		SAPTable table = new SAPTable("IT_RG_KKBER");
		table.put("SIGN", "I");
		table.put("OPTION", "EQ");
		table.put("LOW", LoginInfo.getCompCd());
		tableList.add(table);

		table = new SAPTable("IT_RG_CMGST");
		table.put("SIGN", "I");
		table.put("OPTION", "EQ");
		table.put("LOW", req.get("CREDIT_STS"));
		tableList.add(table);
		
		if(req.get("CUST_CD") != null && req.get("CUST_CD") != ""){
			table = new SAPTable("IT_RG_KNKLI");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("CUST_CD"));
			tableList.add(table);	
		}

		/* FROM - TO가 모두 있는 경우*/
		if((req.get("DOC_NO_FR") != null && req.get("DOC_NO_FR") != "") && (req.get("DOC_NO_TO") != null && req.get("DOC_NO_TO") != "")){
			table = new SAPTable("IT_RG_VBELN");
			table.put("SIGN", "I");
			table.put("OPTION", "BT");
			table.put("LOW", req.get("DOC_NO_FR"));
			table.put("HIGH", req.get("DOC_NO_TO"));
			tableList.add(table);
		}
		/* FROM만 있는 경우*/
		if((req.get("DOC_NO_FR") != null && req.get("DOC_NO_FR") != "") && (req.get("DOC_NO_TO") == null || req.get("DOC_NO_TO") == "")){
			table = new SAPTable("IT_RG_VBELN");
			table.put("SIGN", "I");
			table.put("OPTION", "GE");
			table.put("LOW", req.get("DOC_NO_FR"));
			tableList.add(table);
		}
		/* TO만 있는 경우*/
		if((req.get("DOC_NO_FR") == null || req.get("DOC_NO_FR") == "") && (req.get("DOC_NO_TO") != null && req.get("DOC_NO_TO") != "")){
			table = new SAPTable("IT_RG_VBELN");
			table.put("SIGN", "I");
			table.put("OPTION", "LE");
			table.put("LOW", req.get("DOC_NO_TO"));
			tableList.add(table);
		}
		
		if(req.get("SALES_ORG_CD") != null && req.get("SALES_ORG_CD") != ""){
			table = new SAPTable("IT_RG_VKORG");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("SALES_ORG_CD"));
			tableList.add(table);
		}

		if(req.get("DISTRB_CH") != null && req.get("DISTRB_CH") != ""){
			table = new SAPTable("IT_RG_VTWEG");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("DISTRB_CH"));
			tableList.add(table);
		}
		
		if(req.get("DIV_CD") != null && req.get("DIV_CD") != ""){
			table = new SAPTable("IT_RG_SPART");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("DIV_CD"));
			tableList.add(table);
		}
		
		if(req.get("SALES_OFFICE_CD") != null && req.get("SALES_OFFICE_CD") != ""){
			table = new SAPTable("IT_RG_VKBUR");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("SALES_OFFICE_CD"));
			tableList.add(table);
		}
		
		if(req.get("SALES_GR") != null && req.get("SALES_GR") != ""){
			table = new SAPTable("IT_RG_VKGRP");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("SALES_GR"));
			tableList.add(table);
		}
		
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_SD_SO_STATUS", param, tableList);
		if (result != null) {
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	public BRespData selectSalesOrder(BMap req) throws Exception {
		// set import parameter
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		
		/*Date on Which Record Was Created 필수값*/
		SAPTable table = new SAPTable("IT_ERDAT");
		table.put("SIGN", "I");
		table.put("OPTION", "BT");
		table.put("LOW", req.get("H_CREATE_ON_FR"));
		table.put("HIGH", req.get("H_CREATE_ON_TO"));
		tableList.add(table);
		
		/*Sales Organization*/
		table = new SAPTable("IT_VKORG");
		table.put("SIGN", "I");
		table.put("OPTION", "EQ");
		table.put("LOW", req.get("SALES_ORG_CD"));
		tableList.add(table);

		/*Distribution Channel*/
		if(req.get("DISTRB_CH") != null && req.get("DISTRB_CH") != ""){
			table = new SAPTable("IT_VTWEG");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("DISTRB_CH"));
			tableList.add(table);
		}
		
		/*Division*/
		if(req.get("DIV_CD") != null && req.get("DIV_CD") != ""){
			table = new SAPTable("IT_SPART");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("DIV_CD"));
			tableList.add(table);
		}
		
		/* Sales Document FROM - TO가 모두 있는 경우*/
		if((req.get("H_DOC_NO_FR") != null && req.get("H_DOC_NO_FR") != "") && (req.get("H_DOC_NO_TO") != null && req.get("H_DOC_NO_TO") != "")){
			table = new SAPTable("IT_VBELN");
			table.put("SIGN", "I");
			table.put("OPTION", "BT");
			table.put("LOW", req.get("H_DOC_NO_FR"));
			table.put("HIGH", req.get("H_DOC_NO_TO"));
			tableList.add(table);
		}
		/* Sales Document FROM만 있는 경우*/
		if((req.get("H_DOC_NO_FR") != null && req.get("H_DOC_NO_FR") != "") && (req.get("H_DOC_NO_TO") == null || req.get("H_DOC_NO_TO") == "")){
			table = new SAPTable("IT_VBELN");
			table.put("SIGN", "I");
			table.put("OPTION", "GE");
			table.put("LOW", req.get("H_DOC_NO_FR"));
			tableList.add(table);
		}
		/* Sales Document TO만 있는 경우*/
		if((req.get("H_DOC_NO_FR") == null || req.get("H_DOC_NO_FR") == "") && (req.get("H_DOC_NO_TO") != null && req.get("H_DOC_NO_TO") != "")){
			table = new SAPTable("IT_VBELN");
			table.put("SIGN", "I");
			table.put("OPTION", "LE");
			table.put("LOW", req.get("H_DOC_NO_TO"));
			tableList.add(table);
		}
		
		/*SD document category*/
		if(req.get("SD_DOC_CATE") != null && req.get("SD_DOC_CATE") != ""){
			table = new SAPTable("IT_VBTYP");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("SD_DOC_CATE"));
			tableList.add(table);
		}
		
		/*Sales Document Type*/
		if(req.get("DOC_TP") != null && req.get("DOC_TP") != ""){
			table = new SAPTable("IT_AUART");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("DOC_TP"));
			tableList.add(table);
		}
		
		/*Sold-to party*/
		if(req.get("SOLD_CUST_CD") != null && req.get("SOLD_CUST_CD") != ""){
			table = new SAPTable("IT_KUNNR");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("SOLD_CUST_CD"));
			tableList.add(table);
		}
		
		/*Sales Group*/
		if(req.get("SALES_GR") != null && req.get("SALES_GR") != ""){
			table = new SAPTable("IT_VKGRP");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("SALES_GR"));
			tableList.add(table);
		}
		
		/* Requested delivery date FROM - TO가 모두 있는 경우*/
		if((req.get("H_REQ_DELI_DT_FR") != null && req.get("H_REQ_DELI_DT_FR") != "") && (req.get("H_REQ_DELI_DT_TO") != null && req.get("H_REQ_DELI_DT_TO") != "")){
			table = new SAPTable("IT_VDATU");
			table.put("SIGN", "I");
			table.put("OPTION", "BT");
			table.put("LOW", req.get("H_REQ_DELI_DT_FR"));
			table.put("HIGH", req.get("H_REQ_DELI_DT_TO"));
			tableList.add(table);
		}
		/* Requested delivery date FROM만 있는 경우*/
		if((req.get("H_REQ_DELI_DT_FR") != null && req.get("H_REQ_DELI_DT_FR") != "") && (req.get("H_REQ_DELI_DT_TO") == null || req.get("H_REQ_DELI_DT_TO") == "")){
			table = new SAPTable("IT_VDATU");
			table.put("SIGN", "I");
			table.put("OPTION", "GE");
			table.put("LOW", req.get("H_REQ_DELI_DT_FR"));
			tableList.add(table);
		}
		/* Requested delivery date TO만 있는 경우*/
		if((req.get("H_REQ_DELI_DT_FR") == null || req.get("H_REQ_DELI_DT_FR") == "") && (req.get("H_REQ_DELI_DT_TO") != null && req.get("H_REQ_DELI_DT_TO") != "")){
			table = new SAPTable("IT_VDATU");
			table.put("SIGN", "I");
			table.put("OPTION", "LE");
			table.put("LOW", req.get("H_REQ_DELI_DT_TO"));
			tableList.add(table);
		}
		
		/* Actual Goods Movement Date FROM - TO가 모두 있는 경우*/
		if((req.get("H_MOVE_DT_FR") != null && req.get("H_MOVE_DT_FR") != "") && (req.get("H_MOVE_DT_TO") != null && req.get("H_MOVE_DT_TO") != "")){
			table = new SAPTable("IT_WADAT");
			table.put("SIGN", "I");
			table.put("OPTION", "BT");
			table.put("LOW", req.get("H_MOVE_DT_FR"));
			table.put("HIGH", req.get("H_MOVE_DT_TO"));
			tableList.add(table);
		}
		/*  Actual Goods Movement Date FROM만 있는 경우*/
		if((req.get("H_MOVE_DT_FR") != null && req.get("H_MOVE_DT_FR") != "") && (req.get("H_MOVE_DT_TO") == null || req.get("H_MOVE_DT_TO") == "")){
			table = new SAPTable("IT_WADAT");
			table.put("SIGN", "I");
			table.put("OPTION", "GE");
			table.put("LOW", req.get("H_MOVE_DT_FR"));
			tableList.add(table);
		}
		/*  Actual Goods Movement Date date TO만 있는 경우*/
		if((req.get("H_MOVE_DT_FR") == null || req.get("H_MOVE_DT_FR") == "") && (req.get("H_MOVE_DT_TO") != null && req.get("H_MOVE_DT_TO") != "")){
			table = new SAPTable("IT_WADAT");
			table.put("SIGN", "I");
			table.put("OPTION", "LE");
			table.put("LOW", req.get("H_MOVE_DT_TO"));
			tableList.add(table);
		}
		
		/*Material Group*/
		if(req.get("MATL_GR") != null && req.get("MATL_GR") != ""){
			table = new SAPTable("IT_MATKL");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("MATL_GR"));
			tableList.add(table);
		}
		
		/*Sales document item category*/
		if(req.get("ITEM_CTG_GR") != null && req.get("ITEM_CTG_GR") != ""){
			table = new SAPTable("IT_PSTYV");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("ITEM_CTG_GR"));
			tableList.add(table);
		}
		
		/*Plant (Own or External)*/
		if(req.get("PLANT_CD") != null && req.get("PLANT_CD") != ""){
			table = new SAPTable("IT_WERKS");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("PLANT_CD"));
			tableList.add(table);
		}
		
		/*Storage Location*/
		if(req.get("STO_LOC") != null && req.get("STO_LOC") != ""){
			table = new SAPTable("IT_LGORT");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("STO_LOC"));
			tableList.add(table);
		}
		
		/*Batch Number*/
		if(req.get("BATCH_NO") != null && req.get("BATCH_NO") != ""){
			table = new SAPTable("IT_CHARG");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("BATCH_NO"));
			tableList.add(table);
		}
		
		/*Usage Indicator*/
		if(req.get("USAGE_CD") != null && req.get("USAGE_CD") != ""){
			table = new SAPTable("IT_VKAUS");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("USAGE_CD"));
			tableList.add(table);
		}
		
		/*Billing Type*/
		if(req.get("BILLING_TYPE") != null && req.get("BILLING_TYPE") != ""){
			table = new SAPTable("IT_FKART");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("BILLING_TYPE"));
			tableList.add(table);
		}
		
		/*Billing category*/
		if(req.get("BILLING_CATE") != null && req.get("BILLING_CATE") != ""){
			table = new SAPTable("IT_FKTYP");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("BILLING_CATE"));
			tableList.add(table);
		}
		
		/*Customer Account Group*/
		if(req.get("ACCOUNT_GR") != null && req.get("ACCOUNT_GR") != ""){
			table = new SAPTable("IT_KTOKD");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("ACCOUNT_GR"));
			tableList.add(table);
		}
		
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_SD_OTC", tableList);
		if (result != null) {
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
	public BRespData selectCredit(Map<String, Object> req) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("IS_KKBER", req.get("COMP_CD"));
		param.put("IS_KUNNR", req.get("CUST_CD"));
		
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_FI_CREDIT_LIMIT", param);
		if (result != null) {
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
	@SuppressWarnings("unchecked")
	public BRespData selectCreditAll(Map<String, Object> req) throws Exception {
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		SAPTable table = new SAPTable("T_KNB1");
		
		List<String> companyList = (List<String>) req.get("companyList");
		List<String> custList = (List<String>) req.get("custList");
		
		if (companyList == null || companyList.size() == 0) {
			return new BRespData(ResponseStatus.Bad_Request); 
		}
		if (custList == null || custList.size() == 0) {
			return new BRespData(ResponseStatus.Bad_Request); 
		}
		
		for (int i = 0; i < custList.size(); i++) {
			Map<String, Object> row = new HashMap<String, Object>();
			row.put("KKBER", companyList.get(i));
			row.put("KUNNR", custList.get(i));
			table.addRow(row);
		}
		tableList.add(table);
		
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_FI_CREDIT_LIMIT_M", tableList);
		if (result != null) {
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
	public BRespData updateCredit(Map<String, Object> req) throws Exception {
		
		String compcd = (String)req.get("COMP_CD");
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("IS_KUNNR", req.get("CUST_CD"));
		param.put("IS_BUKRS", compcd);
		
		if (DE_COMP_CD.equals(compcd)) {			
			param.put("IS_VRSNR", DE_POLICY_NO);
		} else if (FR_COMP_CD.equals(compcd)) {
			param.put("IS_VRSNR", FR_POLICY_NO);
		} else {				
			throw new Exception("invalid company code.");
		}	
		
		param.put("IS_VLIBB", req.get("EV_RESULT"));
		param.put("IS_ZZINTLIM", req.get("REQ_CREDIT"));
		param.put("IS_ZZEASY", req.get("EASY_NO"));
		param.put("IS_ZZGBDAT", req.get("EV_ZZGBDAT"));
		param.put("IS_ZZBDATUM", req.get("EV_ZZBDATUM"));
		param.put("IS_ZZTEXT1", req.get("EV_DECS"));
		customerService.updateCustomerCredit(req);
		
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_FI_EXCREDIT", param);
		if (result != null) {
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
	@SuppressWarnings("unchecked")
	public BRespData updateCreditAll(Map<String, Object> req) throws Exception {
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		SAPTable table = new SAPTable("T_KNB1");
		List<Map<String, Object>> custList = (List<Map<String, Object>>) req.get("custList");
		if (custList == null || custList.size() == 0) {
			return new BRespData(ResponseStatus.Bad_Request); 
		}
		
		for (int i = 0; i < custList.size(); i++) {
			Map<String, Object> item = custList.get(i);
			Map<String, Object> row = new HashMap<String, Object>();
			
			String compcd = (String)item.get("COMP_CD");			
			row.put("KUNNR", item.get("CUST_CD"));
			row.put("BUKRS", compcd);
									
			if (DE_COMP_CD.equals(compcd)) {		
				row.put("VRSNR", DE_POLICY_NO);
			} else if (FR_COMP_CD.equals(compcd)) {
				row.put("VRSNR", FR_POLICY_NO);
			} else {				
				throw new Exception("invalid company code.");
			}
						
			row.put("VLIBB", item.get("EV_RESULT"));
			row.put("ZZINTLIM", item.get("REQ_CREDIT"));
			row.put("ZZEASY", item.get("OrgId"));
			row.put("ZZGBDAT", item.get("EV_ZZGBDAT"));
			row.put("ZZBDATUM", item.get("EV_ZZBDATUM"));
			row.put("ZZTEXT1", item.get("ReqDesc"));
			customerService.updateCustomerCredit(item);
			table.addRow(row);
		}
		tableList.add(table);
		
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_FI_EXCREDIT_M", tableList);
		if (result != null) {
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
	public BRespData selectAvailableStockList(BMap req) throws Exception {
		// set import parameter
		List<SAPTable> tableList = new ArrayList<SAPTable>();

		SAPTable table = new SAPTable("T_WERKS");
		table.put("SIGN", "I");
		table.put("OPTION", "EQ");
		table.put("LOW", req.get("PLANT_CD"));
		tableList.add(table);
		
		/* Material Code FROM - TO가 모두 있는 경우*/
		if((req.get("MATL_CD_FR") != null && req.get("MATL_CD_FR") != "") && (req.get("MATL_CD_TO") != null && req.get("MATL_CD_TO") != "")){
			table = new SAPTable("T_MATNR");
			table.put("SIGN", "I");
			table.put("OPTION", "BT");
			table.put("LOW", req.get("MATL_CD_FR"));
			table.put("HIGH", req.get("MATL_CD_TO"));
			tableList.add(table);
		}
		/* Material Code FROM만 있는 경우*/
		if((req.get("MATL_CD_FR") != null && req.get("MATL_CD_FR") != "") && (req.get("MATL_CD_TO") == null || req.get("MATL_CD_TO") == "")){
			table = new SAPTable("T_MATNR");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("MATL_CD_FR"));
			tableList.add(table);
		}
		/*  Material Code TO만 있는 경우*/
		if((req.get("MATL_CD_FR") == null || req.get("MATL_CD_FR") == "") && (req.get("MATL_CD_TO") != null && req.get("MATL_CD_TO") != "")){
			table = new SAPTable("T_MATNR");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("MATL_CD_TO"));
			tableList.add(table);
		}
		
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_SD_AVAILABLE_STOCK_LIST", tableList);
		if (result != null) {
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
	public BRespData selectAvailableStockList2(List<BMap> req) throws Exception {
		List<SAPTable> tableList = new ArrayList<SAPTable>();

		SAPTable table = new SAPTable("T_WERKS");
		for (int i = 0; i < req.size(); i++) {
			BMap matnrList = new BMap(req.get(i));
			Map<String, Object> row = new HashMap<String, Object>();
			row.put("SIGN", "I");
			row.put("OPTION", "EQ");
			row.put("LOW", matnrList.get("PLANT_CD"));
			table.addRow(row);
			tableList.add(table);
		}
		
		table = new SAPTable("T_MATNR");
		for (int i = 0; i < req.size(); i++) {
			BMap matnrList = new BMap(req.get(i));
			Map<String, Object> row = new HashMap<String, Object>();
			row.put("SIGN", "I");
			row.put("OPTION", "EQ");
			row.put("LOW", matnrList.get("MATL_CD"));
			table.addRow(row);
			tableList.add(table);
		}
		
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_SD_AVAILABLE_STOCK_LIST", tableList);
		if (result != null) {
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
		
	}
	public BRespData requireCreditBlock(BMap req) throws Exception {
		// set import parameter
		BMap param = new BMap();
		param.put("IS_ORDER", req.get("IS_ORDER"));
		
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_SD_SO_RELEASE", param);
		if (result != null) {
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}

	public BRespData callErpCustomer(Map<String, Object> req) throws Exception {
		//////////////////////////////////////////////////////////////
		//1. RFP 펑션에 파라메터값을 설정 (optional)
		//
		Map<String, Object> param = new HashMap<String, Object>();
		
		//2. 테이블값 설정
		//
		Map<String, Object> row = new HashMap<String, Object>();
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		
		SAPTable table = new SAPTable("IT_KTOKD");	//
		
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "Z001");
		row.put("HIGH", "");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "Z002");
		row.put("HIGH", "");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "Z003");
		row.put("HIGH", "");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "Z004");
		row.put("HIGH", "");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("HIGH", "");
		row.put("LOW", "Z006");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "CPD");
		row.put("HIGH", "");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "0170");
		row.put("HIGH", "");
		table.addRow(row);

		tableList.add(table);
		table = new SAPTable("IT_VKORG");	//

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "3500");
		row.put("HIGH", "");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "1000");
		row.put("HIGH", "");
		table.addRow(row);		
		
		tableList.add(table);
		
		Date date = new Date();
		logger.debug("parameter" + date);

		//3. 호출
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_RFC_SD_CUSTOMER_READ", tableList);
		date = new Date();
		logger.debug("result call" + date);		
		
		if (result != null) {
			for(int i = 0; i < result.size(); i++) {
//_____ ET_ZZADR12
//_____ ET_ZZADR2
//_____ ET_ZZADR3
//_____ ET_ZZADR6
//_____ ET_ZZADRC
//_____ ET_ZZKNA1
//_____ ET_ZZKNAS
//_____ ET_ZZKNB1
//_____ ET_ZZKNB5
//_____ ET_ZZKNVI
//_____ ET_ZZKNVK
//_____ ET_ZZKNVP
//_____ ET_ZZKNVV
								
				SAPTable tempMap = result.get(i);
				if ("ET_ZZKNA1".equals(tempMap.getTableName())) {
					
					List<Map<String, Object>> list = tempMap.getRows();
					
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvCustomerDao.insertSapIfRecvCustomerKNA1(list.get(j));
					}
					list = null;
				} else if("ET_ZZKNAS".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvCustomerDao.insertSapIfRecvCustomerKNAS(list.get(j));
					}
					list = null;
				} else if("ET_ZZADRC".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvCustomerDao.insertSapIfRecvCustomerARDC(list.get(j));
					}
					list = null;
				} else if("ET_ZZADR6".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvCustomerDao.insertSapIfRecvCustomerARD6(list.get(j));
					}
					list = null;
				} else if("ET_ZZADR12".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvCustomerDao.insertSapIfRecvCustomerADR12(list.get(j));
					}
					list = null;
				} else if("ET_ZZKNVK".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvCustomerDao.insertSapIfRecvCustomerKNVK(list.get(j));
					}
					list = null;
				} else if("ET_ZZADR2".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvCustomerDao.insertSapIfRecvCustomerADR2(list.get(j));
					}
					list = null;
				} else if("ET_ZZADR3".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvCustomerDao.insertSapIfRecvCustomerADR3(list.get(j));
					}
					list = null;
				} else if("ET_ZZKNB1".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvCustomerDao.insertSapIfRecvCustomerKNB1(list.get(j));
					}
					list = null;
				} else if("ET_ZZKNB5".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvCustomerDao.insertSapIfRecvCustomerKNB5(list.get(j));
					}
					list = null;
				} else if("ET_ZZKNVV".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvCustomerDao.insertSapIfRecvCustomerKNVV(list.get(j));
					}
					list = null;
				} else if("ET_ZZKNVP".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvCustomerDao.insertSapIfRecvCustomerKNVP(list.get(j));
					}
					list = null;
				} else if("ET_ZZKNVI".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvCustomerDao.insertSapIfRecvCustomerKNVI(list.get(j));
					}
					list = null;
				} else if("ET_TEXT".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvCustomerDao.insertSapIfRecvCustomerTEXT(list.get(j));
					}
					list = null;
				}
			}
			result = null;
			// Stored PROCEDURE CALL SP_IF_ERP_RECV_CUSTOMER
			param.put("COMP_CD", "1000");
			param.put("USER_ID", LoginInfo.getUserId());
			date = new Date();
			logger.debug("db insert" + date);		
			
			sapIfRecvCustomerDao.callSpSapIfRecvCustomer(param);
			date = new Date();
			logger.debug("sap if" + date);		
			return new BRespData(ResponseStatus.OK);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}

	public BRespData callErpSalesOrder(Map<String, Object> req) throws Exception {
		//////////////////////////////////////////////////////////////
		//1. RFP 펑션에 파라메터값을 설정 (optional)
		//
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("IV_OPENSO", "X");
		param.put("IV_NOCANC", "X");
		
		//2. 테이블값 설정
		//
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		
		Map<String, Object> row = new HashMap<String, Object>();

		SAPTable table = new SAPTable("IT_KTOKD");	//Customer Account Group Z001 , Z002 ,Z003 ,Z004 ,Z006 ,CPD ,0170

		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "Z001");
		row.put("HIGH", "");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "Z002");
		row.put("HIGH", "");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "Z003");
		row.put("HIGH", "");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "Z004");
		row.put("HIGH", "");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "Z006");
		row.put("HIGH", "");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "CPD");
		row.put("HIGH", "");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "0170");
		row.put("HIGH", "");
		table.addRow(row);
//		
//		tableList.add(table);
//		logger.debug("- IT_KTOKD table.getRows ==> " + table.getRows());

		table = new SAPTable("IT_VKORG");	//Sales Organization
		
		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "1000");
		row.put("HIGH", "");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "3500");
		row.put("HIGH", "");
		table.addRow(row);
		
		tableList.add(table);
		table = new SAPTable("IT_ERDAT");	//Date on Which Record Was Created

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "BT");
		row.put("LOW",  (String) req.get("ERDAT_ST"));
		row.put("HIGH", (String) req.get("ERDAT_ED"));
		table.addRow(row);
		
		tableList.add(table);
		//3. 호출
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_SD_SO_MULTI", param, tableList);
		
		
		if (result != null) {
			// I/F Table에 Insert
//_____ ET_ORDER_ADDRESS_OUT
//_____ ET_ORDER_BUSINESS_OUT
//_____ ET_ORDER_CONDITIONS_OUT
//_____ ET_ORDER_HEADERS_OUT
//_____ ET_ORDER_ITEMS_OUT
//_____ ET_ORDER_PARTNERS_OUT
//_____ ET_ORDER_SCHEDULES_OUT
//_____ ET_ORDER_STATUSHEADERS_OUT
//_____ ET_ORDER_TEXTHEADERS_OUT
//_____ ET_ORDER_TEXTLINES_OUT
//_____ ET_SALES_DOCUMENTS
			long d1 = System.currentTimeMillis();
			
			for(int i = 0; i < result.size(); i++) {
								
				SAPTable tempMap = result.get(i);
				
				if ("ET_ORDER_HEADERS_OUT".equals(tempMap.getTableName())) {					
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_HEADERS_OUT(list.get(j));
					}
					list = null;
				} else if("ET_ORDER_ITEMS_OUT".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_ITEMS_OUT(list.get(j));
					}
					list = null;
				} else if("ET_ORDER_SCHEDULES_OUT".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_SCHEDULES_OUT(list.get(j));
					}
					list = null;
				} else if("ET_ORDER_BUSINESS_OUT".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_BUSINESS_OUT(list.get(j));
					}
					list = null;
				} else if("ET_ORDER_CONDITIONS_OUT".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_CONDITIONS_OUT(list.get(j));
					}
					list = null;
				} else if("ET_ORDER_PARTNERS_OUT".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_PARTNERS_OUT(list.get(j));
					}
					list = null;
				} else if("ET_ORDER_ADDRESS_OUT".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_ADDRESS_OUT(list.get(j));
					}
					list = null;
				} else if("ET_ORDER_STATUSHEADERS_OUT".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_STATUSHEADERS_OUT(list.get(j));
					}
					list = null;
				} else if("ET_ORDER_TEXTHEADERS_OUT".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_TEXTHEADERS_OUT(list.get(j));
					}
					list = null;
				} else if("ET_ORDER_TEXTLINES_OUT".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_TEXTLINES_OUT(list.get(j));
					}
					list = null;
				}
			}
			result = null;
			// Stored PROCEDURE CALL SP_IF_ERP_RECV_CUSTOMER
			param.put("COMP_CD", "1000");
			param.put("USER_ID", "Batch_System");
			sapIfRecvSalesOrderDao.callSpSapIfRecvSalesOrder(param);
			
			return new BRespData(ResponseStatus.OK);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}

	public BRespData callCrmCustomer(Map<String, Object> req) throws Exception {
		//////////////////////////////////////////////////////////////
		//1. RFP 펑션에 파라메터값을 설정 (optional)
		//
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("IS_TYPE", "");
		param.put("IS_GROUP", "ZZ01");
		param.put("IS_XDELE", "");
		param.put("IS_CRDAT", (String)req.get("IS_CRDAT"));
		param.put("IS_CRDAT_TO", (String)req.get("IS_CRDAT_TO"));
		
		//2. 테이블값 설정
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		
		SAPTable table = new SAPTable("IS_PARTNER");
		Map<String, Object> row = new HashMap<String, Object>();
		
		row.put("IS_PARTNER", "0001755300");
		table.addRow(row);

		tableList.add(table);
		//3. 호출
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.CRM, "ZZ_IF_CRM_BP", param);
		if (result != null) {
			//프로시저호출…
			// ET_MAST, ET_BPREL
			for (int i = 0; i < result.size(); i++) {
				SAPTable tempMap = result.get(i);
				if ("ET_MAST".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapCrmIfRecvCustomerDao.insertSapCrmIfRecvBPMAST(list.get(j));
					}
				} else if ("ET_BPREL".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapCrmIfRecvCustomerDao.insertSapCrmIfRecvBPREL(list.get(j));
					}
				} else if ("ET_SALES1".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapCrmIfRecvCustomerDao.insertSapCrmIfRecvBP_SALES1(list.get(j));
					}
				} else if ("ET_SALES2".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapCrmIfRecvCustomerDao.insertSapCrmIfRecvBP_SALES2(list.get(j));
					}
				} else if ("ET_SALES3".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapCrmIfRecvCustomerDao.insertSapCrmIfRecvBP_SALES3(list.get(j));
					}
				} else if ("ET_SALES4".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapCrmIfRecvCustomerDao.insertSapCrmIfRecvBP_SALES4(list.get(j));
					}
				} else if ("ET_TAXES".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapCrmIfRecvCustomerDao.insertSapCrmIfRecvBP_TAXES(list.get(j));
					}
				}
			}
			// Stored PROCEDURE CALL SP_IF_ERP_RECV_Customer
			param.put("COMP_CD", "1000");
			param.put("USER_ID", LoginInfo.getUserId());
			return new BRespData(ResponseStatus.OK);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}


	public BRespData callCrmLead(Map<String, Object> req) throws Exception {
		//////////////////////////////////////////////////////////////
		//1. RFP 펑션에 파라메터값을 설정 (optional)
		//
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("IS_PROCESS_TYPE", "ZLD");
		param.put("IS_POSTING_DATE", (String)req.get("IS_POSTING_DATE"));
		param.put("IS_POSTING_DATE_TO", (String)req.get("IS_POSTING_DATE_TO"));
		param.put("IS_ARCHIVING_FLAG", "");
		
		//2. 테이블값 설정
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		//3. 호출
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.CRM, "ZZ_IF_CRM_LEAD", param);
		if (result != null) {
			//프로시저호출…
//_____ EV_MSGTYP
//_____ ET_HEAD
//_____ ET_ITEM
//_____ ET_PART
//_____ ET_PROD
//_____ ET_TEXT
//_____ IT_GUID
			// ET_HEAD, ET_PROD, ET_PART, ET_ITEM, ET_TEXT
			for (int i = 0; i < result.size(); i++) {
				SAPTable tempMap = result.get(i);
				if ("ET_HEAD".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapCrmIfRecvLeadDao.insertSapCrmIfRecvLeadHEAD(list.get(j));
					}
				} else if ("ET_PROD".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapCrmIfRecvLeadDao.insertSapCrmIfRecvLeadPROD(list.get(j));
					}
				} else if ("ET_PART".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapCrmIfRecvLeadDao.insertSapCrmIfRecvLeadPART(list.get(j));
					}
				} else if ("ET_ITEM".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapCrmIfRecvLeadDao.insertSapCrmIfRecvLeadITEM(list.get(j));
					}
				} else if ("ET_TEXT".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapCrmIfRecvLeadDao.insertSapCrmIfRecvLeadTEXT(list.get(j));
					}
				}
			}
			// Stored PROCEDURE CALL SP_IF_ERP_RECV_Customer
			param.put("COMP_CD", "1000");
			param.put("USER_ID", LoginInfo.getUserId());
			return new BRespData(ResponseStatus.OK);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
	public BRespData callCrmQuot(Map<String, Object> req) throws Exception {
		//////////////////////////////////////////////////////////////
		//1. RFP 펑션에 파라메터값을 설정 (optional)
		//
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("IS_PROCESS_TYPE", "ZAGM");
		param.put("IS_POSTING_DATE", (String)req.get("IS_POSTING_DATE"));
		param.put("IS_POSTING_DATE_TO", (String)req.get("IS_POSTING_DATE_TO"));
		param.put("IS_ARCHIVING_FLAG", "");
		
		//2. 테이블값 설정
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		//3. 호출
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.CRM, "ZZ_IF_CRM_QUA", param);
		if (result != null) {
			//프로시저호출…
//_____ EV_MSGTYP
//_____ ET_HEAD
//_____ ET_ITEM
//_____ ET_PART
//_____ ET_PROD
//_____ ET_TEXT
//_____ IT_GUID
			// ET_HEAD, ET_PROD, ET_PART, ET_ITEM, ET_TEXT
			for (int i = 0; i < result.size(); i++) {
				SAPTable tempMap = result.get(i);
				if ("ET_HEAD".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapCrmIfRecvQuotDao.insertSapCrmIfRecvQuotHEAD(list.get(j));
					}
				} else if ("ET_PROD".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapCrmIfRecvQuotDao.insertSapCrmIfRecvQuotPROD(list.get(j));
					}
				} else if ("ET_ITEM".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapCrmIfRecvQuotDao.insertSapCrmIfRecvQuotITEM(list.get(j));
					}
				} else if ("ET_COND".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapCrmIfRecvQuotDao.insertSapCrmIfRecvQuotCOND(list.get(j));
					}
				} else if ("ET_PART".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapCrmIfRecvQuotDao.insertSapCrmIfRecvQuotPART(list.get(j));
					}
				} else if ("ET_TEXT".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapCrmIfRecvQuotDao.insertSapCrmIfRecvQuotTEXT(list.get(j));
					}
				}
			}
			// Stored PROCEDURE CALL SP_IF_CRM_RECV_QUOT
			param.put("COMP_CD", "1000");
			param.put("USER_ID", LoginInfo.getUserId());
			return new BRespData(ResponseStatus.OK);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
	public BRespData selectIncommingPaymentList(BMap req) throws Exception {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("IS_BUKRS", LoginInfo.getCompCd());
		param.put("IS_INCOME","X" );
		
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		SAPTable table = new SAPTable("T_AZDAT");
		table.put("SIGN", "I");
		table.put("OPTION", "BT");
		table.put("LOW", req.get("H_FROM_DT"));
		table.put("HIGH", req.get("H_TO_DT"));
		tableList.add(table);
			
		if(req.get("CUST_CD") != null && req.get("CUST_CD") != ""){
			param.put("IS_KUNNR", req.get("CUST_CD"));
		}
		
		if(req.get("DOC_NO") != null && req.get("DOC_NO") != ""){
			param.put("IS_VBELN", req.get("DOC_NO"));
		}
		
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_FI_INCOMING", param, tableList);
		if (result != null) {
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
	public BRespData selectPriceList(BMap req) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("IV_KVEWE", "A");
		param.put("IV_KAPPL","V" );
		param.put("IV_LANGU",LoginInfo.getLang());
		
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		SAPTable table = new SAPTable("IT_KSCHL");
		table.put("KSCHL", req.get("COND_TP"));
		tableList.add(table);
		
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_RFC_SD_READ_PRICE", param, tableList);
		if (result != null) {
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
	public BRespData selectCustomer(Map<String, Object> req) throws Exception {
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		SAPTable table = new SAPTable("IT_KUNNR");
		table.put("SIGN", "I");
		table.put("OPTION", "EQ");
		table.put("LOW", req.get("CUST_CD"));
		tableList.add(table);
		
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_RFC_SD_CUSTOMER_READ", tableList);
		if (result != null) {
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
	public BRespData callMappingCustNo(Map<String, Object> req) throws Exception {
		try {
			sapCrmIfRecvCustomerDao.callMappingCustNo();
			return new BRespData(ResponseStatus.OK);
		} catch(Exception ex) {
			return new BRespData(ResponseStatus.Bad_Request);
		}		
	}
	
	public BRespData selectSapTestList(Map<String, Object> req) throws Exception{
		List<BMap> result = new ArrayList<BMap>();
		
		String functionName = "RFC_FUNCTION_NAME";
		
		try {
			// 1. JCO Handler 생성
            JCOHandler jcoHandler = new JCOHandler();
            
            // 2. JCO Connection
            jcoHandler.initFunction(functionName);
            
            // 3. Set Input Parameter
            //jcoHandler.setInputParam(param);
            
            // 4. RFC 함수 호출
            //LLog.debug.println( "4. RFC 함수 호출 : invokeFunction");
//            jcoHandler.invokeFunction(functionName);
//            
//            result = jcoHandler.getResultMultiData();
            
            return new BRespData(ResponseStatus.OK);
            
		}
		catch(Exception e) {
			System.err.println(e.getMessage());			
			return new BRespData(ResponseStatus.Bad_Request);
		}
		
	}
	
	public BRespData selectCrmTestList(Map<String, Object> req) throws Exception{
		List<BMap> result = new ArrayList<BMap>();
		
		String functionName = "RFC_FUNCTION_NAME";
		
		try {
			// 1. JCO Handler 생성
            JCOHandler jcoHandler = new JCOHandler();
            
            // 2. JCO Connection
            jcoHandler.initCRMFunction(functionName);
            
            // 3. Set Input Parameter
            //jcoHandler.setInputParam(param);
            
            // 4. RFC 함수 호출
            //LLog.debug.println( "4. RFC 함수 호출 : invokeFunction");
//            jcoHandler.invokeFunction(functionName);
//            
//            result = jcoHandler.getResultMultiData();
            
            return new BRespData(ResponseStatus.OK);
            
		}
		catch(Exception e) {
			System.err.println(e.getMessage());			
			return new BRespData(ResponseStatus.Bad_Request);
		}
		
	}
	
	public BRespData callERPSalesOrderChanged(Map<String, Object> req) throws Exception {
		SimpleDateFormat sdfBatch = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		
		Calendar calendarBatch = Calendar.getInstance();
		Date startDate = calendarBatch.getTime();
		
		StringBuffer sb = new StringBuffer();
		sb.append("Start Date - ");
		sb.append(startDate);
		sb.append(System.getProperty("line.separator"));
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("START_DATE", sdfBatch.format(startDate).substring(0, 8));
		
    	try {
    		List<SAPTable> tableList = new ArrayList<SAPTable>();
    		
    		Map<String, Object> row = new HashMap<String, Object>();

    		SAPTable table = new SAPTable("IT_VKORG");	//Sales Organization
    		
    		List<String> orgList = sapIfRecvSalesOrderDao.getSalesOrg(req);
    		
    		if(null != orgList && 0 < orgList.size()){
    			for(String tempVal : orgList){
            		row = new HashMap<String, Object>();
            		row.put("SIGN", "I");
            		row.put("OPTION", "EQ");
            		row.put("LOW", tempVal);
            		row.put("HIGH", "");
            		table.addRow(row);
    			}
    		}
    		tableList.add(table);
    		
			table = new SAPTable("IT_AUART");
			row = new HashMap<String, Object>();
    		row.put("SIGN", "I");
    		row.put("OPTION", "EQ");
    		row.put("LOW", "ZTA");
    		table.addRow(row);

			row = new HashMap<String, Object>();
    		row.put("SIGN", "I");
    		row.put("OPTION", "EQ");
    		row.put("LOW", "ZKL");
    		table.addRow(row);
			tableList.add(table);

    		table = new SAPTable("IT_AEDAT");	//Date on Which Record Was Modify

    		row = new HashMap<String, Object>();
    		row.put("SIGN", "I");
    		row.put("OPTION", "EQ");
    		
    		Calendar calendar = Calendar.getInstance();
    		Date toDay = calendar.getTime();
    		
    		//calendar.add(Calendar.DAY_OF_MONTH, -7);
    		calendar.add(Calendar.DAY_OF_MONTH, -1);
    		Date beforeDate = calendar.getTime();
    		
    		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
   		
    		row.put("LOW", sdf.format(beforeDate));
    		row.put("HIGH", sdf.format(toDay));
    		table.addRow(row);
    		
    		tableList.add(table);
    		
    		//3. 호출
    		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.BATCH, "ZZ_IF_SD_SO_GET_CHANGED", tableList);
    		
    		if (result != null) {
    			for(int i = 0; i < result.size(); i++) {
    				SAPTable tempMap = result.get(i);
    				
    				if ("ET_ORDER_HEADERS_OUT".equals(tempMap.getTableName())) {
    					List<Map<String, Object>> list = tempMap.getRows();
    					for (int j = 0; j < list.size(); j++) {
    						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_HEADERS_OUT(list.get(j));
    					}
    				} else if("ET_ORDER_ITEMS_OUT".equals(tempMap.getTableName())) {
    					List<Map<String, Object>> list = tempMap.getRows();
    					for (int j = 0; j < list.size(); j++) {
    						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_ITEMS_OUT(list.get(j));
    					}
    				} else if("ET_ORDER_SCHEDULES_OUT".equals(tempMap.getTableName())) {
    					List<Map<String, Object>> list = tempMap.getRows();
    					for (int j = 0; j < list.size(); j++) {
    						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_SCHEDULES_OUT(list.get(j));
    					}
    				} else if("ET_ORDER_CONDITIONS_OUT".equals(tempMap.getTableName())) {
    					List<Map<String, Object>> list = tempMap.getRows();
    					for (int j = 0; j < list.size(); j++) {
    						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_CONDITIONS_OUT(list.get(j));
    					}
    				} else if("ET_ORDER_PARTNERS_OUT".equals(tempMap.getTableName())) {
    					List<Map<String, Object>> list = tempMap.getRows();
    					for (int j = 0; j < list.size(); j++) {
    						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_PARTNERS_OUT(list.get(j));
    					}
    				} else if("ET_ORDER_ADDRESS_OUT".equals(tempMap.getTableName())) {
    					List<Map<String, Object>> list = tempMap.getRows();
    					for (int j = 0; j < list.size(); j++) {
    						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_ADDRESS_OUT(list.get(j));
    					}
    				} else if("ET_ORDER_STATUSHEADERS_OUT".equals(tempMap.getTableName())) {
    					List<Map<String, Object>> list = tempMap.getRows();
    					for (int j = 0; j < list.size(); j++) {
    						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_STATUSHEADERS_OUT(list.get(j));
    					}
    				} else if("ET_ORDER_TEXTHEADERS_OUT".equals(tempMap.getTableName())) {
    					List<Map<String, Object>> list = tempMap.getRows();
    					for (int j = 0; j < list.size(); j++) {
    						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_TEXTHEADERS_OUT(list.get(j));
    					}
    				} else if("ET_ORDER_TEXTLINES_OUT".equals(tempMap.getTableName())) {
    					List<Map<String, Object>> list = tempMap.getRows();
    					for (int j = 0; j < list.size(); j++) {
    						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_TEXTLINES_OUT(list.get(j));
    					}
    				} else if("ET_ORDER_BUSINESS_OUT".equals(tempMap.getTableName())) {
    					List<Map<String, Object>> list = tempMap.getRows();
    					for (int j = 0; j < list.size(); j++) {
    						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_BUSINESS_OUT(list.get(j));
    					}
    				}
    			}
    			param.put("COMP_CD", "1000");
    			param.put("USER_ID", "Batch_System_P");
    			param.put("DOC_NO", "");
    			sapIfRecvSalesOrderDao.callSpSapIfRecvSalesOrder(param);
    		}
    		
    		Calendar calendarEnd = Calendar.getInstance();
    		Date endDate = calendarEnd.getTime();
    		
    		param.put("END_DATE",  sdfBatch.format(endDate));
    		param.put("SVR_NAME", svrNm);    		

			sapIfRecvSalesOrderDao.insertBatchHistory(param);
			
			return new BRespData(ResponseStatus.OK);
    		
		} catch (Exception e) {
			e.printStackTrace();
			sb.append(" : Fail!");
			
			return new BRespData(ResponseStatus.Bad_Request);
		} finally {
			String fileName = svrNm + "_updateSalesOrder_" + sdfBatch.format(startDate).substring(0, 8);
			createLog(fileName, sb.toString());
		}
	
	}
	
	
	public BRespData callErpCustomerKLBABC(Map<String, Object> req) throws Exception {
		//////////////////////////////////////////////////////////////
		//1. RFP 펑션에 파라메터값을 설정 (optional)
		//
		Map<String, Object> param = new HashMap<String, Object>();
		
		//2. 테이블값 설정
		//
		Map<String, Object> row = new HashMap<String, Object>();
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		
		SAPTable table = new SAPTable("IT_KTOKD");	//
		
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "Z001");
		row.put("HIGH", "");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "Z002");
		row.put("HIGH", "");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "Z003");
		row.put("HIGH", "");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "Z004");
		row.put("HIGH", "");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("HIGH", "");
		row.put("LOW", "Z006");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "CPD");
		row.put("HIGH", "");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "0170");
		row.put("HIGH", "");
		table.addRow(row);

		tableList.add(table);		

		table = new SAPTable("IT_VKORG");	//

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "3500");
		row.put("HIGH", "");
		table.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "1000");
		row.put("HIGH", "");
		table.addRow(row);		
		table = new SAPTable("IT_KUNNR");	//

		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("HIGH", "");
		row.put("LOW", (String) req.get("CUST_CD"));
		table.addRow(row);
		
		tableList.add(table);

		
		//3. 호출
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_RFC_SD_CUSTOMER_READ", tableList);
		
		
		if (result != null) {
			// I/F Table에 Insert

			for(int i = 0; i < result.size(); i++) {
								
				SAPTable tempMap = result.get(i);
				if("ET_ZZKNB1".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvCustomerDao.insertSapIfRecvCustomerKNB1(list.get(j));
					}
				} else if("ET_ZZKNVV".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvCustomerDao.insertSapIfRecvCustomerKNVV(list.get(j));
					}
				} 
			}
			// Stored PROCEDURE CALL SP_IF_ERP_RECV_CUSTOMER
			param.put("COMP_CD", "1000");
			param.put("USER_ID", LoginInfo.getUserId());
			sapIfRecvCustomerDao.callSpSapIfRecvCustomerKLABC(param);
			return new BRespData(ResponseStatus.OK);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}

	public void createLog(String fileName, String context) {
		
		String file = filePath + fileName + ".log";
		
		try{
			FileManager.mkDir(filePath);
			
			BufferedWriter fw = new BufferedWriter(new FileWriter(file, true));
			
			fw.write(context);
			fw.flush();
			fw.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	

	public BRespData retrieveSalesReportList(Map<String, Object> req) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("IV_EUR", "X");
		param.put("IV_NOCANC","X" );
		
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		Map<String, Object> row = new HashMap<String, Object>();
		
		SAPTable table = new SAPTable("IT_ERDAT");
		table.put("SIGN", "I");
		table.put("OPTION", "BT");
		table.put("LOW", req.get("CREATE_ON_FR"));
		table.put("HIGH", req.get("CREATE_ON_TO"));
		tableList.add(table);
		
		/*Sales Organization*/
		table = new SAPTable("IT_VKORG");
		table.put("SIGN", "I");
		table.put("OPTION", "EQ");
		table.put("LOW", req.get("SALES_ORG_CD"));
		tableList.add(table);
		
		if(req.get("DOC_NO") != null && req.get("DOC_NO") != ""){
			table = new SAPTable("IT_VBELN");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("DOC_NO"));
			tableList.add(table);
		}
		
		if(req.get("SOLD_CUST_CD") != null && req.get("SOLD_CUST_CD") != ""){
			table = new SAPTable("IT_KUNNR");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("SOLD_CUST_CD"));
			tableList.add(table);
		}	

		
		if(req.get("PLANT_CD") != null && req.get("PLANT_CD") != ""){
			table = new SAPTable("IT_WERKS");
			table.put("SIGN", "I");
			table.put("OPTION", "EQ");
			table.put("LOW", req.get("PLANT_CD"));
			tableList.add(table);
		}
		

		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_SD_OTC_REPORT", param, tableList);
		if (result != null) {
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
}