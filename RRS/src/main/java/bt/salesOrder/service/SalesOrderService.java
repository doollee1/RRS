package bt.salesOrder.service;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.DataSource;
import javax.annotation.Resource;
import javax.mail.util.ByteArrayDataSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.mail.MultiPartEmail;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
//import org.jsoup.nodes.Document;
//import org.jsoup.nodes.Element;
//import org.jsoup.nodes.Document;
//import org.jsoup.nodes.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import bt.btframework.common.FileManager;
import bt.btframework.common.fileupload.FileExtFilter;
import bt.btframework.common.fileupload.FileMaxUploadFilter;
import bt.btframework.common.fileupload.FileTransferManager;
import bt.btframework.common.vo.CodeVO;
import bt.btframework.mail.MailSenderManager;
import bt.btframework.sap.SAPConnectorManager;
import bt.btframework.sap.SAPDataProvider;
import bt.btframework.sap.SAPTable;
import bt.btframework.utils.BMap;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.DateValidator;
import bt.btframework.utils.HtmlToPdf;
import bt.btframework.utils.LoginInfo;
import bt.btframework.utils.ResponseStatus;
import bt.btframework.utils.StringUtils;
import bt.common.dao.MailManagementDao;
import bt.common.dao.SapIfRecvSalesOrderDao;
import bt.salesOrder.dao.SalesOrderDao;

@Service("SalesOrderService")
public class SalesOrderService {
	private static final Logger logger = LoggerFactory.getLogger(SalesOrderService.class);
	
	@Resource(name = "SalesOrderDao")
	private SalesOrderDao salesOrderDao;
	
	@Resource
	private SapIfRecvSalesOrderDao sapIfRecvSalesOrderDao;

	@Resource
	private MailManagementDao mailManagementDao;
	
    @Autowired
    private Environment env;
    
	/**
	 * search SalesOrder List
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> searchSalesOrderList(BMap param) throws Exception {
		return salesOrderDao.searchSalesOrderList(param);
	}
	
	
	/**
	 * search searchSalesS_Test
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> searchSalesS_Test(BMap param) throws Exception {
		return salesOrderDao.searchSalesS_Test(param);
	}
	
	
	/**
	 * Sales Order Info 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BMap selectSalesOrderInfo(BMap param) throws Exception{

		//System.err.println("tt"+param);
		String docgroup  = (String)param.getString("DOC_GR");
		if ("SO".equals(docgroup)) {
			
			param.put("DOC_NO", (String)param.get("DOC_NO"));
			String tempdocno = (String)param.get("DOC_NO");
			tempdocno = tempdocno.substring(0, 3);
			if (! "999".equals(tempdocno) && !"CP".equals(param.get("SOC")) && !"Y".equals(param.get("SOC"))) {
				callErpSalesOrder(param);
			}
	/*		
			// delivery block sync
			Map<String, Object> somap = this.syncDeliveryBlock(param, "HEADERS");			
			List<Map<String, Object>> headlist = (List<Map<String, Object>>)somap.get("headlist");

			if ( headlist.size() > 0) {
				Map<String, Object> m = headlist.get(0);
				
				String cmpdeliyn = (String)m.get("COMPL_DLV");			
				cmpdeliyn = ("X".equals(cmpdeliyn))? "Y": "N";			
				String reqpericd = (String)m.get("DATE_TYPE");
				String ordresncd = (String)m.get("ORD_REASON");
				String shipconcd = (String)m.get("SHIP_COND");
				String salesofficecd = (String)m.get("SALES_OFF");
				String netamt = (String)m.get("NET_VAL_HD");
				String attrord = (String)m.get("CUST_GRP1");			
				String pono = (String)m.get("PURCH_NO");			
				String distrbch = (String)m.get("DISTR_CHAN");			
				String reqdelidt = (String)m.get("REQ_DATE_H");
				String salesgr = (String)m.get("SALES_GRP");
				String salesorgcd = (String)m.get("SALES_ORG");			
				String divcd = (String)m.get("DIVISION");			
				String currcd = (String)m.get("CURRENCY");
				String dblock = (String)m.get("DLV_BLOCK");
				String podt = (String)m.get("PURCH_DATE");
				
				
				param.put("CMP_DELI_YN", cmpdeliyn);
				param.put("REQ_PERI_CD", reqpericd);
				param.put("ORD_RESN_CD", ordresncd);
				param.put("SHP_CON_CD", shipconcd);
				param.put("SALES_OFFICE_CD", salesofficecd);
				param.put("NET_AMT", netamt);
				param.put("ATTR_ORD", attrord);
				param.put("PO_NO", pono);			
				param.put("DISTRB_CH", distrbch);
				param.put("REQ_DELI_DT", reqdelidt);			
				param.put("SALES_GR", salesgr);
				param.put("SALES_ORG_CD", salesorgcd);
				param.put("DIV_CD", divcd);
				param.put("CURR_CD", currcd);
				param.put("DELI_BLOCK_CD", dblock);			
				param.put("PO_DT", podt);
				param.put("USERID", LoginInfo.getUserId());
				
				salesOrderDao.syncSalesOrder(param);
			}
			*/
		}		
		return salesOrderDao.selectSalesOrderInfo(param);
	}
	
	
	private String getDeliDT1st(List<Map<String, Object>> scheduleslist, Map<String, Object> item) {
		
		String ITM_NUMBER = (String)item.get("ITM_NUMBER");
		
		String MaxReqDT = "";
		int iMaxReqDT = 0;
		for (Map<String, Object> map : scheduleslist) {		
			
			String itemno = (String)map.get("ITM_NUMBER");			
			String reqdt = ((String)map.get("REQ_DATE")).replaceAll("[-,/]", "");	
			int ireqdt = Integer.parseInt(reqdt);
			
			if (itemno.equals(ITM_NUMBER)) {			
				if (ireqdt > iMaxReqDT) {
					iMaxReqDT = ireqdt; 
					MaxReqDT = (String)map.get("REQ_DATE");
				}
			}			
		} 
		
		return MaxReqDT;
	}
	
	
	private String getPriceDate(List<Map<String, Object>> businesslist) {	
		String pricedt = "";
		for (Map<String, Object> map : businesslist) {		
			String itemno = (String)map.get("ITM_NUMBER");
			if ("000000".equals(itemno)) {// only head 
				pricedt = (String)map.get("PRICE_DATE");
				break;
			}			
		} 
		
		return pricedt;
	}
	
	
	private Map<String, Object> getCondPrice(List<Map<String, Object>> conditionlist, Map<String, Object> item) {	

		String ITM_NUMBER = (String)item.get("ITM_NUMBER");
		
		boolean bZPNM = false;
		boolean bZPL0 = false;
		String zpmpNetValue = "", zpmpNetPrice = "";
		String zpl0NetValue = "", zpl0NetPrice = "";
		
		Map<String, Object> rtnmap = new HashMap<String, Object>();		
		for (Map<String, Object> map : conditionlist) {		
			
			String ctype = (String)map.get("COND_TYPE");
			String itemno = (String)map.get("ITM_NUMBER");
			if (itemno.equals(ITM_NUMBER)) {
				// Net price
				if ("ZPNM".equals(ctype)) {
					zpmpNetPrice = (String)map.get("CONDVALUE");
					zpmpNetValue = (String)map.get("COND_VALUE");
					bZPNM = true;
				}
				// gross price
				if ("ZPL0".equals(ctype)) {
					zpl0NetPrice = (String)map.get("CONDVALUE");
					zpl0NetValue = (String)map.get("COND_VALUE");
					bZPL0 = true;
				}
			}			
		} 
		
		if (bZPNM) {		
			rtnmap.put("NET_PRICE", zpmpNetValue);
			rtnmap.put("NET_VALUE", zpmpNetPrice);
		} else {
			if (bZPL0) {
				rtnmap.put("NET_PRICE", zpl0NetValue);
				rtnmap.put("NET_VALUE", zpl0NetPrice);
			} else {
				rtnmap.put("NET_PRICE", "0");
				rtnmap.put("NET_VALUE", "0");	
			}
		}
		
		return rtnmap;
	}
	
	
	@SuppressWarnings("unchecked")
	private void syncCondition(Map<String, Object> somap, BMap param) throws Exception {

		String G_COMP_CD = (String)param.get("G_COMP_CD");
		String DOC_GR = (String)param.get("DOC_GR");
		String DOC_NO = (String)param.get("DOC_NO");
		
		Map<String, Object> m  = new HashMap<String, Object>();
		m.put("G_COMP_CD", G_COMP_CD);
		m.put("DOC_GR", DOC_GR);
		m.put("DOC_NO", DOC_NO);
		
		salesOrderDao.deletePriceCondition(m);
	
		List<Map<String, Object>> conditionlist = (List<Map<String, Object>>)somap.get("conditionlist");		
		for (Map<String, Object> map : conditionlist) {
			
			String ctype = (String)map.get("COND_TYPE");
			
			map.put("G_COMP_CD", G_COMP_CD);
			map.put("DOC_GR", DOC_GR);
			map.put("DOC_NO", DOC_NO);
			map.put("USERID", LoginInfo.getUserId());
			
			if (   "ZPL1".equals(ctype) 
				|| "ZPB1".equals(ctype) 
				|| "ZSR6".equals(ctype) 
				|| "ZPR0".equals(ctype) 
				|| "ZDC1".equals(ctype) 
				|| "ZDC2".equals(ctype) 
				|| "ZSR3".equals(ctype) 
				|| "ZSR4".equals(ctype)
				|| "ZSR5".equals(ctype)
				|| "ZSR7".equals(ctype)
				|| "ZFK0".equals(ctype)
				|| "ZPNM".equals(ctype)
				|| "ZVKD".equals(ctype)
				|| "ZVKS".equals(ctype)
				|| "MWST".equals(ctype)
				|| "ZDC3".equals(ctype)
				|| "ZDC4".equals(ctype)
				|| "ZPNN".equals(ctype)
				|| "ZPL0".equals(ctype))
			{
				/*			 	
				 	'ZPL1' or 'ZPB1' or 'ZSR6' or 'ZPR0' or 'ZDC1' or
					'ZDC2' or 'ZSR3' or 'ZSR4' or 'ZSR5' or 'ZSR7' or
					'ZFK0' or 'ZPNM' or 'ZVKD' or 'ZVKS' or 'MWST' or
					'ZDC3' or 'ZDC4' or 'ZPNN' or 'ZPL0'
				*/
				salesOrderDao.syncCondition(map);
			}
		}
	}
	
	
	@SuppressWarnings("unchecked")
	private void syncItem(Map<String, Object> somap, BMap param) throws Exception {
		
		String G_COMP_CD = (String)param.get("G_COMP_CD");
		String DOC_GR = (String)param.get("DOC_GR");
		String DOC_NO = (String)param.get("DOC_NO");
		
		List<Map<String, Object>> oitemlist = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> itemlist = (List<Map<String, Object>>)somap.get("itemlist");		
		List<Map<String, Object>> scheduleslist = (List<Map<String, Object>>)somap.get("scheduleslist");
		List<Map<String, Object>> businesslist = (List<Map<String, Object>>)somap.get("businesslist");		
		List<Map<String, Object>> conditionlist = (List<Map<String, Object>>)somap.get("conditionlist");
		
		for (Map<String, Object> map : itemlist) {
			
			Map<String, Object> cnmap = this.getCondPrice(conditionlist, map);
			
			map.put("COMP_CD", G_COMP_CD);
			map.put("DOC_GR", DOC_GR);
			map.put("DOC_NO", DOC_NO);			
			map.put("USERID", LoginInfo.getUserId());
			map.put("REQ_DATE", this.getDeliDT1st(scheduleslist, map));
			map.put("PRICE_DATE", this.getPriceDate(businesslist));
			map.put("NET_PRICE", cnmap.get("NET_PRICE"));
			map.put("NET_VALUE", cnmap.get("NET_VALUE"));
							
			Map<String, Object> oitemmap = salesOrderDao.selectExistsItem(map);			
			if (oitemmap != null && oitemmap.size() > 0) {		
				salesOrderDao.syncItemUpdate(map);
				oitemlist.add(oitemmap);
			} else {				
				salesOrderDao.syncItemInsert(map);				
				map.put("ITEM_SEQ", map.get("ITM_NUMBER"));
				oitemlist.add(map);
			}	
		}
		
		Map<String, Object> delitem = new HashMap<String, Object>();
		delitem.put("DOC_GR", DOC_GR);
		delitem.put("DOC_NO", DOC_NO);
		delitem.put("ITEMS", oitemlist);		
		salesOrderDao.syncItemDelete(delitem);
		
	}
	
	
	/**
	 * Sales Order Item Tab 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectItemTab(BMap param) throws Exception{
				
		String tempdocno = (String)param.get("DOC_NO");
//		tempdocno = tempdocno.substring(0, 3);
//		if (! "999".equals(tempdocno)) {
//					// delivery block sync
//			Map<String, Object> somap = this.syncDeliveryBlock(param, "ITEMS");
//			
//			this.syncItem(somap, param);
//			this.syncCondition(somap, param);
//			this.syncScdl(somap, param);
//		}
		
		return salesOrderDao.selectItemTab(param);
	}
	
	/**
	 * Sales Order Partner Tab 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> selectPartnerTab(BMap param) throws Exception{
		HashMap<String, Object> tempMap = new HashMap<String, Object>();
		
		List<BMap> partnerList = salesOrderDao.selectPartnerFnc(param);
		
		if(partnerList.size() < 1){
			tempMap.put("partner", salesOrderDao.selectPfList(param));
		}else{
			tempMap.put("partner", partnerList);
		}
		
		tempMap.put("text", salesOrderDao.selectText(param));
		return tempMap;
	}
	
	/**
	 * Sales Order  저장
	 * @param master
	 * @param detail
	 * @throws Exception
	 */
	@Transactional
	public String SaveSalesOrder (BMap param) throws Exception{
		
		Map<String, Object> headData = (Map<String, Object>) param.get("headData");
		List<Map<String, Object>> partnerGrid = (List<Map<String, Object>>) param.get("partnerGrid");
		List<Map<String, Object>> textGrid = (List<Map<String, Object>>) param.get("textGrid");
		List<Map<String, Object>> itemGrid = (List<Map<String, Object>>) param.get("itemGrid");
		Map<String, Object> itemDtl = (Map<String, Object>) param.get("itemDtl");
		List<Map<String, Object>> scGrid = (List<Map<String, Object>>) param.get("scGrid");
		List<Map<String, Object>> itemPfGrid = (List<Map<String, Object>>) param.get("itemPfGrid");
		BMap apprData = new BMap();
		
		String userId = LoginInfo.getUserId();
		String docNo = "";
		int apprLv = 1;	//1 - 헤드, 2 - 부장, 3 - 상무
		double totWp = 0;
		boolean inserted = false;
		
		param.put("COMP_CD", headData.get("G_COMP_CD"));
		
		//System.err.println(partnerGrid);
		
		try{
			
		if(null != headData){
			
			headData.put("USERID", userId);
			headData.put("DOC_GR", "SO");
			
//			if(null != headData.get("APPROVAL_STS") && "N".equals(headData.get("APPROVAL_STS"))){
//				apprData = salesOrderDao.getApprData();
//			}
			
			//New Or Copy
			if(null == headData.get("DOC_NO") || "".equals(headData.get("DOC_NO"))){
				
				//DOC_NO 채번
				docNo = salesOrderDao.getSalesSeq(headData);
				headData.put("DOC_NO", docNo);
				
				//헤더정보 입력
//				salesOrderDao.insertSalesHeader(headData);
				salesOrderDao.createSalesHeader(headData);
				salesOrderDao.createSalesPf(headData);
				salesOrderDao.createSalesText(headData);
				salesOrderDao.createSalesItem(headData);
				salesOrderDao.createSalesScdl(headData);
				salesOrderDao.createSalesCondition(headData);
				
				if(null != headData.get("QT_NO") && !"".equals(headData.get("QT_NO"))){
					salesOrderDao.updateQuotToSales(headData);
					
					param.put("DOC_NO", headData.get("QT_NO"));
					callRfcForInsert(param);
				}
				
				//Item Grid 입력
//				if(null != itemGrid){
//					for(Map<String, Object> tempMap : itemGrid){
//						
//						tempMap.put("DOC_NO", docNo);
//						tempMap.put("USERID", userId);
//						tempMap.put("SALES_ORG_CD", headData.get("SALES_ORG_CD"));
//						tempMap.put("DISTRB_CH", headData.get("DISTRB_CH"));
//						tempMap.put("DIV_CD", headData.get("DIV_CD"));
//						tempMap.put("G_COMP_CD", headData.get("G_COMP_CD"));
//						tempMap.put("DOC_GR", headData.get("DOC_GR"));
//						tempMap.put("DOC_STATUS", headData.get("DOC_STATUS"));
						
//						if(null != headData.get("APPROVAL_STS") && "N".equals(headData.get("APPROVAL_STS"))){
//							if(null != tempMap.get("PER") && !"".equals(tempMap.get("PER")) && !"0".equals(tempMap.get("PER"))){
//								double per = Double.parseDouble(changeNormForm((String)tempMap.get("PER")));
//								double netPrice = (Double.parseDouble((String)tempMap.get("NET_PRICE")) / per) * 10;
//								double erpPrice = (Double.parseDouble(changeNormForm((String)tempMap.get("ERP_NET_PRICE"))) / per) * 10;
//								
//								if((erpPrice - netPrice) < apprData.getDouble("REF_NUM1")){
//									apprLv = 1;
//								}else if(apprData.getDouble("REF_NUM1") < (erpPrice - netPrice)){
//									apprLv = 2;
//									totWp = per * Double.parseDouble((String)tempMap.get("ORD_QTY"));
//								}
//							}
//						}
//					}
					
//					if(apprLv == 2 && apprData.getDouble("REF_NUM2") < totWp){
//						apprLv = 3;
//					}
//				}
				inserted = true;
			}else{
				docNo = (String) headData.get("DOC_NO");
				
				//헤더정보 수정
				salesOrderDao.updateSalesHeader(headData);
				
				//Partner Function 입력
				if(null != partnerGrid){
					for(Map<String, Object> tempMap : partnerGrid){
						
						tempMap.put("DOC_NO", docNo);
						tempMap.put("USERID", userId);
						tempMap.put("SALES_ORG_CD", headData.get("SALES_ORG_CD"));
						tempMap.put("DISTRB_CH", headData.get("DISTRB_CH"));
						tempMap.put("DIV_CD", headData.get("DIV_CD"));
						tempMap.put("G_COMP_CD", headData.get("G_COMP_CD"));
						tempMap.put("DOC_GR", headData.get("DOC_GR"));
						tempMap.put("DOC_STATUS", headData.get("DOC_STATUS"));
						tempMap.put("ITEM_SEQ", "000000");
						
						if("I".equals(tempMap.get("ROW_STATUS"))){
							if(Integer.parseInt(salesOrderDao.checkDupPf(tempMap)) == 0){
								salesOrderDao.insertSalesPf(tempMap);
							}else{
								salesOrderDao.updateSalesPf(tempMap);
							}
						}else if("U".equals(tempMap.get("ROW_STATUS"))){
							salesOrderDao.updateSalesPf(tempMap);
						}else if("D".equals(tempMap.get("ROW_STATUS"))){
							tempMap.put("DOC_STATUS", "D");
							salesOrderDao.updateSalesPf(tempMap);
						}
					}
				}
				
				//Text Grid 입력
				if(null != textGrid){
					for(Map<String, Object> tempMap : textGrid){
						
						tempMap.put("DOC_NO", docNo);
						tempMap.put("USERID", userId);
						tempMap.put("SALES_ORG_CD", headData.get("SALES_ORG_CD"));
						tempMap.put("DISTRB_CH", headData.get("DISTRB_CH"));
						tempMap.put("DIV_CD", headData.get("DIV_CD"));
						tempMap.put("G_COMP_CD", headData.get("G_COMP_CD"));
						tempMap.put("DOC_GR", headData.get("DOC_GR"));
						tempMap.put("DOC_STATUS", headData.get("DOC_STATUS"));
						
						if(null != tempMap.get("TEXT_TP") && !"".equals(tempMap.get("TEXT_TP")) && !"ERR".equals(tempMap.get("TEXT_TP"))){
							if("I".equals(tempMap.get("ROW_STATUS"))){
								salesOrderDao.insertSalesText(tempMap);
							}else if("U".equals(tempMap.get("ROW_STATUS"))){
								salesOrderDao.updateSalesText(tempMap);
							}else if("D".equals(tempMap.get("ROW_STATUS"))){
								tempMap.put("DOC_STATUS", "D");
								salesOrderDao.updateSalesText(tempMap);
							}
						}
					}
				}
				
				//Item Grid 입력
				if(null != itemGrid){
					for(Map<String, Object> tempMap : itemGrid){
						
						//System.err.println(tempMap);
						
						tempMap.put("DOC_NO", docNo);
						tempMap.put("USERID", userId);
						tempMap.put("SALES_ORG_CD", headData.get("SALES_ORG_CD"));
						tempMap.put("DISTRB_CH", headData.get("DISTRB_CH"));
						tempMap.put("DIV_CD", headData.get("DIV_CD"));
						tempMap.put("G_COMP_CD", headData.get("G_COMP_CD"));
						tempMap.put("DOC_GR", headData.get("DOC_GR"));
						tempMap.put("DOC_STATUS", headData.get("DOC_STATUS"));
						
						Map<String, Object> scMap = new HashMap<String, Object>();
						scMap.put("DOC_NO", docNo);
						scMap.put("USERID", userId);
						scMap.put("SALES_ORG_CD", headData.get("SALES_ORG_CD"));
						scMap.put("DISTRB_CH", headData.get("DISTRB_CH"));
						scMap.put("DIV_CD", headData.get("DIV_CD"));
						scMap.put("G_COMP_CD", "1000");
						scMap.put("DOC_GR", "SO");
						scMap.put("DOC_STATUS", headData.get("DOC_STATUS"));
						scMap.put("SEQ", 1);
						scMap.put("PERI_CD", tempMap.get("DELI_DT_1ST_TP"));
						scMap.put("DELI_DT", tempMap.get("DELI_DT_1ST"));
						scMap.put("ORD_QTY", tempMap.get("ORD_QTY"));
						scMap.put("SALES_UNIT_CD", tempMap.get("ORD_UNIT_CD"));
						scMap.put("ITEM_SEQ", tempMap.get("ITEM_SEQ"));
						scMap.put("MATL_CD", tempMap.get("MATL_CD"));
						scMap.put("BATCH_NO", tempMap.get("BATCH_NO"));
						
						if("I".equals(tempMap.get("ROW_STATUS"))){
							salesOrderDao.insertSalesItem(tempMap);
							
							scMap.put("CFM_QTY", "0");
							scMap.put("ATP_QTY", "0");
							scMap.put("DELI_BLOCK_CD", "G4");
							salesOrderDao.insertSalesScdl(scMap);
						}else if("U".equals(tempMap.get("ROW_STATUS"))){
							salesOrderDao.updateSalesItem(tempMap);
							
							salesOrderDao.updateSalesScdlItem(scMap);
						}else if("D".equals(tempMap.get("ROW_STATUS"))){
							tempMap.put("DOC_STATUS", "D");
							scMap.put("DOC_STATUS", "D");
							salesOrderDao.updateSalesItem(tempMap);
							
							salesOrderDao.updateSalesScdlItem(scMap);
						}
						
//						if(null != headData.get("APPROVAL_STS") && "N".equals(headData.get("APPROVAL_STS"))){
//							if(null != tempMap.get("PER") && !"".equals(tempMap.get("PER")) && !"0".equals(tempMap.get("PER"))){
//								double per = Double.parseDouble(changeNormForm((String)tempMap.get("PER")));
//								double netPrice = (Double.parseDouble((String)tempMap.get("NET_PRICE")) / per) * 10;
//								double erpPrice = (Double.parseDouble(changeNormForm((String)tempMap.get("ERP_NET_PRICE"))) / per) * 10;
//								
//								if((erpPrice - netPrice) < apprData.getDouble("REF_NUM1")){
//									apprLv = 1;
//								}else if(apprData.getDouble("REF_NUM1") < (erpPrice - netPrice)){
//									apprLv = 2;
//									totWp = per * Double.parseDouble((String)tempMap.get("ORD_QTY"));
//								}
//							}
//						}
					}
					
//					if(null != headData.get("APPROVAL_STS") && "N".equals(headData.get("APPROVAL_STS"))){
//						if(apprLv == 2 && apprData.getDouble("REF_NUM2") < totWp){
//							apprLv = 3;
//						}
//					}
				}
				
				//Item Partner Function 입력
				if(null != itemPfGrid){
					for(Map<String, Object> tempMap : itemPfGrid){
						
						
						tempMap.put("DOC_NO", docNo);
						tempMap.put("USERID", userId);
						tempMap.put("SALES_ORG_CD", headData.get("SALES_ORG_CD"));
						tempMap.put("DISTRB_CH", headData.get("DISTRB_CH"));
						tempMap.put("DIV_CD", headData.get("DIV_CD"));
						tempMap.put("G_COMP_CD", headData.get("G_COMP_CD"));
						tempMap.put("DOC_GR", headData.get("DOC_GR"));
						tempMap.put("DOC_STATUS", headData.get("DOC_STATUS"));

						//System.err.println(tempMap);
						
						if("I".equals(tempMap.get("ROW_STATUS"))){
							if(Integer.parseInt(salesOrderDao.checkDupPf(tempMap)) == 0){
								salesOrderDao.insertSalesPf(tempMap);
							}else{
								salesOrderDao.updateSalesPf(tempMap);
							}
						}else if("U".equals(tempMap.get("ROW_STATUS"))){
							salesOrderDao.updateSalesPf(tempMap);
						}else if("D".equals(tempMap.get("ROW_STATUS"))){
							tempMap.put("DOC_STATUS", "D");
							salesOrderDao.updateSalesPf(tempMap);
						}
					}
				}
				
				//Scdl Grid 입력
				if(null != scGrid){
					for(Map<String, Object> tempMap : scGrid){
//						
//						tempMap.put("DOC_NO", docNo);
//						tempMap.put("USERID", userId);
//						tempMap.put("SALES_ORG_CD", headData.get("SALES_ORG_CD"));
//						tempMap.put("DISTRB_CH", headData.get("DISTRB_CH"));
//						tempMap.put("DIV_CD", headData.get("DIV_CD"));
//						tempMap.put("G_COMP_CD", headData.get("G_COMP_CD"));
//						tempMap.put("DOC_GR", headData.get("DOC_GR"));
//						tempMap.put("DOC_STATUS", headData.get("DOC_STATUS"));
//						
//						if("I".equals(tempMap.get("ROW_STATUS"))){
//							salesOrderDao.insertSalesScdl(tempMap);
//						}else if("U".equals(tempMap.get("ROW_STATUS"))){
//							salesOrderDao.updateSalesScdl(tempMap);
//						}else if("D".equals(tempMap.get("ROW_STATUS"))){
//							tempMap.put("DOC_STATUS", "D");
//							salesOrderDao.updateSalesScdl(tempMap);
//						}
						tempMap.put("G_COMP_CD", "1000");
						tempMap.put("DOC_GR", "SO");
						
						if("U".equals(tempMap.get("ROW_STATUS"))){
							salesOrderDao.updateSalesScdl(tempMap);
						}
						
					}
				}
			}
			
			param.put("DOC_NO", docNo);
			param.put("SALES_ORG_CD", headData.get("SALES_ORG_CD"));
//			param.put("COMP_CD", headData.get("G_COMP_CD"));
			
//			if(null != headData.get("APPROVAL_STS") && "N".equals(headData.get("APPROVAL_STS"))){
//				salesOrderDao.deleteAppr(headData);
//				for(int i = 1; i <= apprLv; i++){
//					headData.put("APPR_ID", apprData.get("REF_CHR" + String.valueOf(i)));
//					headData.put("PRIORITY", i);
//					salesOrderDao.insertAppr(headData);
//				}
//			}else{
//			if(null == headData.get("APPROVAL_STS") || "".equals(headData.get("APPROVAL_STS"))){
			
			
			// 저장 후 결재 재지정 (결재중일 경우에는 save가 안되므로 해당 로직은 타지 않음.)
			salesOrderDao.moveAppr(headData);
			
			salesOrderDao.deleteAppr(headData);
			
			
				if (inserted) {
					callRfcForInsert(param);
				}else{
					callRfcForUpdate(param);
				}
//			}
//			}
		}
		}catch(Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			//System.err.println(e.getMessage());
			docNo = "Fail" + "^ERP Validation Message : \n" + e.getMessage();
		}
		return docNo;
	}
	
	
	private Map<String, Object> getItemInfo(List<Map<String, Object>> itemlist, Map<String, Object> schMap) {
		
		String DOC_NUMBER = (String)schMap.get("DOC_NUMBER");
		String ITM_NUMBER = (String)schMap.get("ITM_NUMBER");	
		
		String matcd = "", batchno = "";
		for (Map<String, Object> map : itemlist) {
			String _DOC_NUMBER = (String)map.get("DOC_NUMBER");
			String _ITM_NUMBER = (String)map.get("ITM_NUMBER");		
			
			if ( _DOC_NUMBER.equals(DOC_NUMBER) &&
				 _ITM_NUMBER.equals(ITM_NUMBER)) {
				
				matcd = (String)map.get("MATERIAL");
				batchno = (String)map.get("BATCH");
				break;
			}
		}
		
		Map<String, Object> rtnmap = new HashMap<String, Object>();
		rtnmap.put("MATL_CD", matcd);
		rtnmap.put("BATCH_NO", batchno);
		
		return rtnmap;
	}
	
	
	@SuppressWarnings("unchecked")
	private void syncScdl(Map<String, Object> somap, BMap param) throws Exception {
		
		String G_COMP_CD = (String)param.get("G_COMP_CD");
		String DOC_GR = (String)param.get("DOC_GR");
		String DOC_NO = (String)param.get("DOC_NO");
		String USERID = LoginInfo.getUserId();
		
		// schedule line remove all
		Map<String, Object> m  = new HashMap<String, Object>();
		m.put("G_COMP_CD", G_COMP_CD);
		m.put("DOC_GR", DOC_GR);
		m.put("DOC_NO", DOC_NO);
		salesOrderDao.deleteSalesScdl(m);
						
		List<Map<String, Object>> sclinelist = (List<Map<String, Object>>)somap.get("scheduleslist");
		List<Map<String, Object>> itemlist = (List<Map<String, Object>>)somap.get("itemlist");	
		for (Map<String, Object> map : sclinelist) {
						
			String DELI_DT = (String)map.get("DELI_DT");
			if (!new DateValidator().isThisDateValid(DELI_DT, "dd-MM-yyyy")) {
				DELI_DT = null;
			}			
			String TP_DT = (String)map.get("TP_DT");
			if (!new DateValidator().isThisDateValid(TP_DT, "dd-MM-yyyy")) {
				TP_DT = null;
			}		
			
			Map<String, Object> itemmap = this.getItemInfo(itemlist, map);
			map.put("DELI_DT", DELI_DT);
			map.put("TP_DT", TP_DT);
			map.put("COMP_CD", G_COMP_CD);
			map.put("DOC_GR", DOC_GR);
			map.put("DOC_NO", DOC_NO);
			map.put("USERID", USERID);			
			map.put("MATL_CD", itemmap.get("MATL_CD"));
			map.put("BATCH_NO", itemmap.get("BATCH_NO"));
		
			salesOrderDao.syncScheduline(map);
		}		
	}
	
	/**
	 * Sales Order Item Tab 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectScdlTab(BMap param) throws Exception {		
		// delivery block sync
		// Map<String, Object> somap = this.syncDeliveryBlock(param, "SCHEDULES");
		// this.syncScdl(somap, param);		
		
		return salesOrderDao.selectScdlTab(param);
	}
	
	
	/**
	 * Quotation Item Matl > Bom 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectBomList(BMap param) throws Exception{
		return salesOrderDao.selectBomList(param);
	}
	
	/**
	 * Sales Order Partner Function List 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectPfPopList(BMap param) throws Exception{
		return salesOrderDao.selectPfPopList(param);
	}
	
	/**
	 * 
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BRespData selectItemPriceList(Map<String, Object> req) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("IV_TESTRUN", "X");

		// set import param for IS_SALES_HEADER_IN
		Map<String, Object> salesHeaderIn = new HashMap<String, Object>();
		salesHeaderIn.put("DOC_TYPE", req.get("DOC_TP"));
		salesHeaderIn.put("SALES_ORG", req.get("SALES_ORG_CD"));
		salesHeaderIn.put("DISTR_CHAN", req.get("DISTRB_CH"));
		salesHeaderIn.put("DIVISION", req.get("DIV_CD"));
		salesHeaderIn.put("SALES_GRP", req.get("SALES_GR"));
		salesHeaderIn.put("SALES_OFF", req.get("SALES_OFFICE_CD"));
		salesHeaderIn.put("REQ_DATE_H", req.get("REQ_DELI_DT"));
		salesHeaderIn.put("DATE_TYPE", req.get("PO_DT_TP"));
		salesHeaderIn.put("PURCH_DATE", req.get("PO_DT"));
		salesHeaderIn.put("INCOTERMS1", req.get("INCOTERMS_CD"));
		salesHeaderIn.put("INCOTERMS2", req.get("INCOTERMS_NM"));
		salesHeaderIn.put("PMNTTRMS", req.get("TERM_PAY_CD"));
		salesHeaderIn.put("PRICE_DATE", req.get("PRICE_DT"));
		salesHeaderIn.put("CUST_GRP1", req.get("ATTR_ORD"));
		salesHeaderIn.put("PURCH_NO_C", req.get("PO_NO"));
		salesHeaderIn.put("DOC_DATE", req.get("IF_DT"));
		salesHeaderIn.put("SHIP_COND", req.get("SHIP_CONDI_CD"));
		salesHeaderIn.put("CURRENCY", req.get("CURR_CD"));
		salesHeaderIn.put("ORD_REASON", req.get("ORD_REASON"));
		salesHeaderIn.put("EXCHG_RATE", req.get("EXCHG_RATE"));
		param.put("IS_SALES_HEADER_IN", salesHeaderIn);
//		logger.debug("rass IS_SALES_HEADER_IN : " + salesHeaderIn.toString());
		
		String acctGrp = (String) req.get("ACCT_GRP");
		
		// set table info
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		SAPTable table = null;
		List<Map<String, Object>> list = (List<Map<String, Object>>) req.get("itemGrid");
		if (list != null) {
			table = new SAPTable("IT_SALES_ITEMS_IN");
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> row = new HashMap<String, Object>();
				if("".equals(list.get(i).get("PITEMSEQ"))){
					row.put("ITM_NUMBER", list.get(i).get("ITEM_SEQ"));
					row.put("MATERIAL", list.get(i).get("MATL_CD"));
					row.put("PLANT", list.get(i).get("PLANT_CD"));
					row.put("STORE_LOC", list.get(i).get("STORE_LOC"));
					row.put("TARGET_QTY", list.get(i).get("ORD_QTY"));
					row.put("ITEM_CATEG", list.get(i).get("ITEM_CTG_GR"));
					row.put("SALES_UNIT", list.get(i).get("ORD_UNIT_CD"));
					row.put("REF_DOC", list.get(i).get("REF_DOC"));
					row.put("REF_DOC_IT", list.get(i).get("REF_DOC_IT"));
					table.addRow(row);
//					logger.debug("rass itemGrid count: " + i + "  " + row.toString());
				}
			}
			tableList.add(table);
		}
		
		list = (List<Map<String, Object>>) req.get("scGrid");
		if (list != null) { 
			table = new SAPTable("IT_SALES_SCHEDULES_IN");
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> row = new HashMap<String, Object>();
				if(Integer.parseInt((String) list.get(i).get("ITEM_SEQ")) % 100 == 0){
					row.put("ITM_NUMBER", list.get(i).get("ITEM_SEQ"));
					row.put("REQ_QTY", list.get(i).get("ORD_QTY"));
					table.addRow(row);
//					logger.debug("rass scGrid count: " + i + "  " + row.toString());
				}
			}
			tableList.add(table);
		}
		
		list = (List<Map<String, Object>>) req.get("partnerGrid");
		if (list != null) {
			table = new SAPTable("IT_SALES_PARTNERS");
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> row = new HashMap<String, Object>();
				row.put("ITM_NUMBER", list.get(i).get("ITEM_SEQ"));
				row.put("PARTN_ROLE", list.get(i).get("PF_TP"));
				
				if("ZAGM".equals(req.get("DOC_TP"))){
					if("CPD".equals(acctGrp) || "CPDA".equals(acctGrp) || "Z007".equals(acctGrp) || "Z001".equals(acctGrp)){
						row.put("PARTN_NUMB", list.get(i).get("PF_PS_NO"));
					}else{
						if("ZI".equals(list.get(i).get("PF_TP")) || "ZK".equals(list.get(i).get("PF_TP"))){
							row.put("PARTN_NUMB", list.get(i).get("PF_PS_NO"));
						}else{
							row.put("PARTN_NUMB", "1100001");
						}
					}
				}else{
					row.put("PARTN_NUMB", list.get(i).get("PF_PS_NO"));
				}
				table.addRow(row);
//				logger.debug("rass partnerGrid count: " + i + "  " + row.toString());
			}
			tableList.add(table);
		}
		
		
		
		list = (List<Map<String, Object>>) req.get("itemGrid");
		table = new SAPTable("IT_SALES_CONDITIONS_IN");
		
		if(!"ZKL".equals(req.get("DOC_TP"))){
			if(null != req.get("SUR_CHARGE") && !"".equals(req.get("SUR_CHARGE"))){
				
				Double tempVal = Double.parseDouble((String) req.get("SUR_CHARGE"));
				
				if(0 < tempVal){
					Map<String, Object> row = new HashMap<String, Object>();
					row.put("ITM_NUMBER", "000000");
					row.put("COND_TYPE", "ZSR4");
					row.put("COND_VALUE", req.get("SUR_CHARGE"));
					row.put("CURRENCY", req.get("CURR_CD"));
					table.addRow(row);
					
//					logger.debug("rass IT_SALES_CONDITIONS_IN : " + row.toString());
				}
			}
			
			if(null != req.get("DC_VAL") && !"".equals(req.get("DC_VAL"))){
				
				Double tempVal = Double.parseDouble((String) req.get("DC_VAL"));
				
				if(0 < tempVal){

					Map<String, Object> row = new HashMap<String, Object>();
					row.put("ITM_NUMBER", "000000");
					if("R".equals(req.get("DC_TP"))){
						row.put("COND_TYPE", "ZDC4");
					}else{
						row.put("COND_TYPE", "ZDC3");
					}
					row.put("COND_VALUE", req.get("DC_VAL"));
					row.put("CURRENCY", req.get("CURR_CD"));
					table.addRow(row);
					
//					logger.debug("rass IT_SALES_CONDITIONS_IN : " + row.toString());
					}
			}
		}
		
		if(null != req.get("DLV_AMT") && !"".equals(req.get("DLV_AMT"))){
			
			Double tempVal = Double.parseDouble((String) req.get("DLV_AMT"));
			if(0 < tempVal){
				Map<String, Object> row = new HashMap<String, Object>();
				row.put("ITM_NUMBER", "000000");
				row.put("COND_TYPE", "ZFK0");
				row.put("COND_VALUE", req.get("DLV_AMT"));
				row.put("CURRENCY", req.get("CURR_CD"));
				table.addRow(row);
				
//				logger.debug("rass IT_SALES_CONDITIONS_IN : " + row.toString());
			}
		}
		
		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> row = new HashMap<String, Object>();
				
				//System.err.println(list);
				
				if(null != list.get(i).get("ERP_STATUS")
					&& (
							!list.get(i).get("NET_PRICE").equals(changeNormForm(list.get(i).get("ERP_NET_PRICE").toString()))
							|| (null != list.get(i).get("ZPNN_UOM") && !"".equals(list.get(i).get("ZPNN_UOM")) && !list.get(i).get("ZPNN_UOM").equals(list.get(i).get("UOM")))
							|| (null != list.get(i).get("ZPNN_PER") && !"".equals(list.get(i).get("ZPNN_PER")) && !list.get(i).get("ZPNN_PER").equals(list.get(i).get("PER")))
						)
					){
					
					if(Integer.parseInt((String) list.get(i).get("ITEM_SEQ")) % 100 == 0 ){
						if (!"TANN".equals(list.get(i).get("ITEM_CTG_GR"))) {
							row.put("ITM_NUMBER", list.get(i).get("ITEM_SEQ"));
							row.put("COND_TYPE", "ZPNM");
		//					row.put("COND_VALUE", changeNormForm((String) list.get(i).get("NET_PRICE")));
							row.put("COND_VALUE", (String) list.get(i).get("NET_PRICE"));
							row.put("COND_UNIT", list.get(i).get("ZPNN_UOM"));
							row.put("COND_P_UNT", (String) list.get(i).get("ZPNN_PER"));
							row.put("CURRENCY", list.get(i).get("CURR"));
							table.addRow(row);
						}
						
//						logger.debug("rass +_______________+ : " + row.toString());
					}
				}
			}
		}
		
		tableList.add(table);
		
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_RFC_SD_SO_CREATE", param, tableList);
		if (result != null) {
			int delCounter = 0;
			for(SAPTable tempT : result){
				for(Map<String, Object> tempM : tempT.getRows()){
					
					tempM.put("G_COMP_CD", req.get("G_COMP_CD"));
					tempM.put("DOC_GR", req.get("DOC_GR"));
					tempM.put("DOC_NO", req.get("DOC_NO"));
					tempM.put("USERID", req.get("USERID"));
					
					if(delCounter == 0){
						salesOrderDao.deletePriceCondition(tempM);
						delCounter++;
					}
					
					if(tempM.containsKey("COND_TYPE")){
						if(!"ZPNN".equals(tempM.get("COND_TYPE"))){
							salesOrderDao.insertPriceCondition(tempM);
						}
					}
				}
			}
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
	public BRespData callRfcForInsert(Map<String, Object> req) throws Exception {
		req.put("USER_ID", LoginInfo.getUserId());
		req.put("SAVE_TYPE", "I");
		salesOrderDao.callSpIfErpSendOrderInsert(req);
				
		// make param for RFC
		Map<String, Object> param = new HashMap<String, Object>();
		Map<String, Object> header = salesOrderDao.selectIfSalesHeader(req);
		param.put("IS_SALES_HEADER_IN", header);
		//if ( !"3500".equals(req.get("SALES_ORG_CD")) ) {
			param.put("IV_SALESDOCUMENT", req.get("DOC_NO")); 
		//}
		
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		List<Map<String, Object>> list = salesOrderDao.selectIfSalesItems(req);
		SAPTable table = makeSAPTable("IT_SALES_ITEMS_IN", list);
		tableList.add(table);
		
		list = salesOrderDao.selectIfSalesSchedules(req);
		table = makeSAPTable("IT_SALES_SCHEDULES_IN", list);
		tableList.add(table);
		
		list = salesOrderDao.selectIfSalesPartners(req);
		table = makeSAPTable("IT_SALES_PARTNERS", list);
		tableList.add(table);
		
		list = salesOrderDao.selectIfSalesConditions(req);
		table = makeSAPTable("IT_SALES_CONDITIONS_IN", list);
		tableList.add(table);
		
		list = salesOrderDao.selectIfSalesText(req);
		table = makeSAPTable("IT_SALES_TEXT", list);
		tableList.add(table);
		
		param.put("IF_STS", "D");
		param.put("DOC_NO", req.get("DOC_NO"));
		param.put("USER_ID", LoginInfo.getUserId());
		param.put("COMP_CD", req.get("COMP_CD"));
		
		salesOrderDao.callSpIfErpSendOrderStsUpdate(param);
		
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_RFC_SD_SO_CREATE", param, tableList);
		if (result != null) {
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
	public BRespData callRfcForUpdate(Map<String, Object> req) throws Exception {
		req.put("USER_ID", LoginInfo.getUserId());
		req.put("SAVE_TYPE", "U");
		
		salesOrderDao.callSpIfErpSendOrderInsert(req);
		
		// make param for RFC
		Map<String, Object> param = new HashMap<String, Object>();
		Map<String, Object> header = salesOrderDao.selectIfSalesHeader(req);
		param.put("IS_SALES_HEADER_IN", header);
		
		if("D".equals(req.get("DOC_STATUS"))){
			header.put("UPDATEFLAG", "D");
		}else{
			header.put("UPDATEFLAG", "U");
		}
		
		param.put("IS_SALES_HEADER_INX", header);
		param.put("IV_SALESDOCUMENT", req.get("DOC_NO")); 
		
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		
		List<Map<String, Object>> list = salesOrderDao.selectIfSalesItems(req);
		SAPTable table = makeSAPTable("IT_SALES_ITEMS_INX", list);
		tableList.add(table);
		table = makeSAPTable("IT_SALES_ITEMS_IN", list);
		tableList.add(table);
		
		list = salesOrderDao.selectIfSalesSchedules(req);
		table = makeSAPTable("IT_SALES_SCHEDULES_INX", list);
		tableList.add(table);
		
		table = makeSAPTable("IT_SALES_SCHEDULES_IN", list);
		tableList.add(table);
		
		list = salesOrderDao.selectIfSalesPartners(req);
		table = makeSAPTable("IT_SALES_PARTNERS", list);
		tableList.add(table);
		
		list = salesOrderDao.selectIfSalesPartnerchanges(req);
		table = makeSAPTable("IT_PARTNERCHANGES", list);
		tableList.add(table);
		
		list = salesOrderDao.selectIfSalesConditions(req);
		table = makeSAPTable("IT_SALES_CONDITIONS_IN", list);
		tableList.add(table);
		
		list = salesOrderDao.selectIfSalesText(req);
		table = makeSAPTable("IT_SALES_TEXT", list);
		tableList.add(table);
		
		param.put("DOC_NO", req.get("DOC_NO"));
		param.put("IF_STS", "D");
		param.put("USER_ID", LoginInfo.getUserId());
		param.put("COMP_CD", req.get("COMP_CD"));

		salesOrderDao.callSpIfErpSendOrderStsUpdate(param);
		
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_RFC_SD_SO_CHANGE", param, tableList);
		if (result != null) {
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
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
	
	/**
	 * Quotation Item Partner Grid 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectItemPfGrid(BMap param) throws Exception{
		return salesOrderDao.selectPartnerFnc(param);
	}
	
	/**
	 * Sales Order Temp 저장
	 * @param master
	 * @param detail
	 * @throws Exception
	 */
	public String SaveTempSalseOrder(BMap param) throws Exception{
		
		Map<String, Object> headData = (Map<String, Object>) param.get("headData");
		List<Map<String, Object>> partnerGrid = (List<Map<String, Object>>) param.get("partnerGrid");
		List<Map<String, Object>> textGrid = (List<Map<String, Object>>) param.get("textGrid");
		List<Map<String, Object>> itemGrid = (List<Map<String, Object>>) param.get("itemGrid");
		Map<String, Object> itemDtl = (Map<String, Object>) param.get("itemDtl");
		List<Map<String, Object>> scGrid = (List<Map<String, Object>>) param.get("scGrid");
		List<Map<String, Object>> itemPfGrid = (List<Map<String, Object>>) param.get("itemPfGrid");
		String beforeTab = (String) param.get("beforeTab");
		String preNextBtn = (String) param.get("preNextBtn");
		String erpInfoFlag = (String) param.get("erpInfoFlag");
		
		String userId = LoginInfo.getUserId();
		String tempDocNo = "";
		
		headData.put("USERID", userId);
		headData.put("DOC_GR", "SO");
		
		if(null == headData.get("TEMP_DOC_NO") || "".equals(headData.get("TEMP_DOC_NO"))){
			tempDocNo = salesOrderDao.getSalesTempSeq(headData);
		}else{
			tempDocNo = (String) headData.get("TEMP_DOC_NO");
		}
		
		headData.put("DOC_NO", tempDocNo);
		
		if("".equals(preNextBtn)){
			if("MAIN".equals(beforeTab)){
				salesOrderDao.deleteSalesHeader(headData);
				salesOrderDao.insertSalesHeader(headData);
			}else if("PARTNER".equals(beforeTab)){
				headData.put("ITEM_SEQ", "000000");
				
				//Partner Function 입력
				if(null != partnerGrid){
					for(Map<String, Object> tempMap : partnerGrid){
						
						tempMap.put("DOC_NO", tempDocNo);
						tempMap.put("USERID", userId);
						tempMap.put("SALES_ORG_CD", headData.get("SALES_ORG_CD"));
						tempMap.put("DISTRB_CH", headData.get("DISTRB_CH"));
						tempMap.put("DIV_CD", headData.get("DIV_CD"));
						tempMap.put("G_COMP_CD", headData.get("G_COMP_CD"));
						tempMap.put("DOC_GR", headData.get("DOC_GR"));
						tempMap.put("DOC_STATUS", headData.get("DOC_STATUS"));
						tempMap.put("ITEM_SEQ", "000000");
						
						salesOrderDao.deleteSalesPf(tempMap);
						if(!"D".equals(tempMap.get("ROW_STATUS"))){
							if(null != tempMap.get("PF_TP") && !"".equals(tempMap.get("PF_TP")) && !"ERR".equals(tempMap.get("PF_TP"))){
								salesOrderDao.insertSalesPf(tempMap);
							}
						}
					}
				}
				
				//Text Grid 입력
				if(null != textGrid){
					for(Map<String, Object> tempMap : textGrid){
						
						tempMap.put("DOC_NO", tempDocNo);
						tempMap.put("USERID", userId);
						tempMap.put("SALES_ORG_CD", headData.get("SALES_ORG_CD"));
						tempMap.put("DISTRB_CH", headData.get("DISTRB_CH"));
						tempMap.put("DIV_CD", headData.get("DIV_CD"));
						tempMap.put("G_COMP_CD", headData.get("G_COMP_CD"));
						tempMap.put("DOC_GR", headData.get("DOC_GR"));
						tempMap.put("DOC_STATUS", headData.get("DOC_STATUS"));
						
						if(!"D".equals(tempMap.get("ROW_STATUS"))){
							salesOrderDao.deleteSalesText(tempMap);
							if(null != tempMap.get("TEXT_TP") && !"".equals(tempMap.get("TEXT_TP")) && !"ERR".equals(tempMap.get("TEXT_TP"))){
								salesOrderDao.insertSalesText(tempMap);
							}
						}
					}
				}
			}else if("ITEM".equals(beforeTab) || "ITEM_DTL".equals(beforeTab)){
				
				salesOrderDao.deleteSalesItem(headData);
				salesOrderDao.deleteSalesScdl(headData);
				
				//Item Grid 입력
				if(null != itemGrid){
					for(Map<String, Object> tempMap : itemGrid){
						
						tempMap.put("DOC_NO", tempDocNo);
						tempMap.put("USERID", userId);
						tempMap.put("SALES_ORG_CD", headData.get("SALES_ORG_CD"));
						tempMap.put("DISTRB_CH", headData.get("DISTRB_CH"));
						tempMap.put("DIV_CD", headData.get("DIV_CD"));
						tempMap.put("G_COMP_CD", headData.get("G_COMP_CD"));
						tempMap.put("DOC_GR", headData.get("DOC_GR"));
						tempMap.put("DOC_STATUS", headData.get("DOC_STATUS"));
						
//						salesOrderDao.deleteSalesItem(tempMap);
						if(!"D".equals(tempMap.get("ROW_STATUS"))){
							salesOrderDao.deleteSalesItem(tempMap);
							salesOrderDao.insertSalesItem(tempMap);
							
//							if(!"Y".equals(erpInfoFlag)){
								tempMap.put("SEQ", 1);
								tempMap.put("PERI_CD", tempMap.get("DELI_DT_1ST_TP"));
								tempMap.put("DELI_DT", tempMap.get("DELI_DT_1ST"));
								tempMap.put("ORD_QTY", tempMap.get("ORD_QTY"));
								tempMap.put("CFM_QTY", "0");
								tempMap.put("SALES_UNIT_CD", tempMap.get("ORD_UNIT_CD"));
								tempMap.put("ATP_QTY", "0");
								tempMap.put("DELI_BLOCK_CD", "G4");
							
								//Scdl 생성
								salesOrderDao.deleteSalesScdl(tempMap);
								salesOrderDao.insertSalesScdl(tempMap);
//							}
						}
					}
				}
				if("ITEM_DTL".equals(beforeTab)){
					//Item Partner Function 입력
					if(null != itemPfGrid){
						for(Map<String, Object> tempMap : itemPfGrid){
							tempMap.put("DOC_NO", tempDocNo);
							tempMap.put("USERID", userId);
							tempMap.put("SALES_ORG_CD", headData.get("SALES_ORG_CD"));
							tempMap.put("DISTRB_CH", headData.get("DISTRB_CH"));
							tempMap.put("DIV_CD", headData.get("DIV_CD"));
							tempMap.put("G_COMP_CD", headData.get("G_COMP_CD"));
							tempMap.put("DOC_GR", headData.get("DOC_GR"));
							tempMap.put("DOC_STATUS", headData.get("DOC_STATUS"));
							
							salesOrderDao.deleteSalesPf(tempMap);
							if(!"D".equals(tempMap.get("ROW_STATUS"))){
								if(null != tempMap.get("PF_TP") && !"".equals(tempMap.get("PF_TP")) && !"ERR".equals(tempMap.get("PF_TP"))){
									salesOrderDao.insertSalesPf(tempMap);
								}
							}
						}
					}
				}
			}else if("SCHE".equals(beforeTab)){
				
				//Scdl Grid 입력
//				if(null != scGrid){
//					for(Map<String, Object> tempMap : scGrid){
//						tempMap.put("DOC_NO", tempDocNo);
//						tempMap.put("USERID", userId);
//						tempMap.put("SALES_ORG_CD", headData.get("SALES_ORG_CD"));
//						tempMap.put("DISTRB_CH", headData.get("DISTRB_CH"));
//						tempMap.put("DIV_CD", headData.get("DIV_CD"));
//						tempMap.put("G_COMP_CD", headData.get("G_COMP_CD"));
//						tempMap.put("DOC_GR", headData.get("DOC_GR"));
//						tempMap.put("DOC_STATUS", headData.get("DOC_STATUS"));
//						
//						salesOrderDao.deleteSalesScdl(tempMap);
//						if(!"D".equals(tempMap.get("ROW_STATUS"))){
//							salesOrderDao.insertSalesScdl(tempMap);
//						}
//					}
//				}
			}
		}
		if("ITEM_PF".equals(preNextBtn)){
			//Item Partner Function 입력
			if(null != itemPfGrid){
				for(Map<String, Object> tempMap : itemPfGrid){
					tempMap.put("DOC_NO", tempDocNo);
					tempMap.put("USERID", userId);
					tempMap.put("SALES_ORG_CD", headData.get("SALES_ORG_CD"));
					tempMap.put("DISTRB_CH", headData.get("DISTRB_CH"));
					tempMap.put("DIV_CD", headData.get("DIV_CD"));
					tempMap.put("G_COMP_CD", headData.get("G_COMP_CD"));
					tempMap.put("DOC_GR", headData.get("DOC_GR"));
					tempMap.put("DOC_STATUS", headData.get("DOC_STATUS"));
					
					salesOrderDao.deleteSalesPf(tempMap);
					if(!"D".equals(tempMap.get("ROW_STATUS"))){
						salesOrderDao.insertSalesPf(tempMap);
					}
				}
			}
		}else if("SCDL".equals(preNextBtn)){
			//Scdl Grid 입력
//			if(null != scGrid){
//				for(Map<String, Object> tempMap : scGrid){
//					tempMap.put("DOC_NO", tempDocNo);
//					tempMap.put("USERID", userId);
//					tempMap.put("SALES_ORG_CD", headData.get("SALES_ORG_CD"));
//					tempMap.put("DISTRB_CH", headData.get("DISTRB_CH"));
//					tempMap.put("DIV_CD", headData.get("DIV_CD"));
//					tempMap.put("G_COMP_CD", headData.get("G_COMP_CD"));
//					tempMap.put("DOC_GR", headData.get("DOC_GR"));
//					tempMap.put("DOC_STATUS", headData.get("DOC_STATUS"));
//					
//					salesOrderDao.deleteSalesScdl(tempMap);
//					if(!"D".equals(tempMap.get("ROW_STATUS"))){
//						salesOrderDao.insertSalesScdl(tempMap);
//					}
//				}
//			}
		}
		return tempDocNo;
	}

	/**
	 * Confirm Sales Order
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void confirmSalesOrder(BMap param) throws Exception{
		Map<String, Object> headData = (Map<String, Object>) param.get("headData");
		List<Map<String, Object>> itemGrid = (List<Map<String, Object>>) param.get("itemGrid");
		BMap apprData = new BMap();
		
		String userId = LoginInfo.getUserId();
		int apprLv = 1;	//1 - 헤드, 2 - 부장, 3 - 상무
		boolean moduleFlag = false;
		boolean bosFlag = false;
		boolean multiFlag = false;
		double totWp = 0;
		
		boolean head = true;
		
		if(null != headData) {
			
			headData.put("USERID", userId);
			headData.put("DOC_GR", "SO");
			
			if(null != itemGrid){
//				for(Map<String, Object> tempMap : itemGrid){
//					if(null != tempMap.get("DIV_CD") && "20".equals(tempMap.get("DIV_CD"))){
//						moduleFlag = true;
//					}else if(null != tempMap.get("DIV_CD") && "40".equals(tempMap.get("DIV_CD"))){
//						bosFlag = true;
//					}
//					
//					if(null != tempMap.get("PITEMSEQ") && !"".equals(tempMap.get("PITEMSEQ"))){
//						moduleFlag = false;
//						bosFlag = false;
//						multiFlag = true;
//						break;
//					}
//				}
				
				String headDiv = (String) headData.get("DIV_CD");
				
				if ( headDiv.equals("20") ) {			// module
					moduleFlag = true;
					param.put("CODE", "01");
				} else if ( headDiv.equals("90") ) {	// bos
					bosFlag = true;
					param.put("CODE", "02");
				} else if ( headDiv.equals("40") ) {	// module+bos
					multiFlag = true;
					param.put("CODE", "03");
				}
			
//				if(moduleFlag){
//					param.put("CODE", "01");
//				}else if(!moduleFlag && bosFlag){
//					param.put("CODE", "02");
//				}
//				
//				if(multiFlag || (moduleFlag && bosFlag)){
//					param.put("CODE", "03");
//				}
				
				apprData = salesOrderDao.getApprData(param);
			
				headData.put("ALLOW_STS", "Q");
				headData.put("APPROVAL_STS", "Q");
				headData.put("DOC_STATUS", "A");
				
				//헤더정보 수정
				salesOrderDao.updateSalesHeader(headData);
				
				
				
				// 수정-->
				param.put("DOC_NO", headData.get("DOC_NO"));
				List<BMap> itemGrdApr = salesOrderDao.selectItemAppr(param);
				
//				System.err.println(itemGrdApr);

				/*
				 * {SALES_ORG_CD=1000, COMP_CD=1000, ERP_PRICE=35,00, ZPNN_UOM=WP, DOC_NO=612100472, MW=0,11, DISTRB_CH=10, DOC_GR=SO, REQUESTED_PRICE=31,50, DIV_CD=20, ZPNN_PER=100, ITEM_SEQ=100, MATL_CD=10019290, ORD_QTY=384.000}, 
				 * {SALES_ORG_CD=1000, COMP_CD=1000, ERP_PRICE=40,50, ZPNN_UOM=WP, DOC_NO=612100472, MW=0,05, DISTRB_CH=10, DOC_GR=SO, REQUESTED_PRICE=35,00, DIV_CD=20, ZPNN_PER=100, ITEM_SEQ=200, MATL_CD=10019255, ORD_QTY=160.000}, 
				 * {SALES_ORG_CD=1000, COMP_CD=1000, ERP_PRICE=0,00, ZPNN_UOM=WP, DOC_NO=612100472, MW=0,03, DISTRB_CH=10, DOC_GR=SO, REQUESTED_PRICE=35,50, DIV_CD=20, ZPNN_PER=100, ITEM_SEQ=300, MATL_CD=10019256, ORD_QTY=96.000}, 
				 * {SALES_ORG_CD=1000, COMP_CD=1000, ERP_PRICE=39,50, ZPNN_UOM=WP, DOC_NO=612100472, MW=0,10, DISTRB_CH=10, DOC_GR=SO, REQUESTED_PRICE=34,00, DIV_CD=20, ZPNN_PER=100, ITEM_SEQ=400, MATL_CD=10019157, ORD_QTY=320.000}
				 */

				for(Map<String, Object> tempMap : itemGrdApr){
					String itemWP = salesOrderDao.selectItemWP(tempMap);
					
					if ( itemWP == null ) itemWP = "1";
					
					if ( itemWP != null ) {
						double erpPrice = Double.parseDouble(changeNormForm(String.valueOf(tempMap.get("ERP_PRICE"))));
						double reqPrice = Double.parseDouble(changeNormForm(String.valueOf(tempMap.get("REQUESTED_PRICE"))));
						
						if ( (erpPrice - reqPrice) > 1 ) {
							logger.debug("erpPrice : " + erpPrice + "/reqPrice : "+ reqPrice);
							head = false;
						} 
						
						totWp = totWp + Double.parseDouble(String.valueOf(itemWP)) * Double.parseDouble(String.valueOf(tempMap.get("ORD_QTY")));
					}
				}
				
				if( apprData.getDouble("REF_NUM2") <= totWp) {
					if ( headDiv.equals("40") ) {
						apprLv = 3;
					} else {
						apprLv = 2;
					}
				} else {
					if ( headDiv.equals("40") ) {
						apprLv = 2;
					} else {
						apprLv = 1;
					}
				}
				// <<<- 수정
			
//				for(Map<String, Object> tempMap : itemGrid){
//					
//					String itemWP = salesOrderDao.selectItemWP(tempMap);
//					
//					if(null != tempMap.get("PER") && !"".equals(tempMap.get("PER")) && !"0".equals(tempMap.get("PER"))){
//						double per = Double.parseDouble(changeNormForm((String)tempMap.get("PER")));
//						double netPrice = (Double.parseDouble((String)tempMap.get("NET_PRICE")) / per) * 10;
//						double zpnnPrice = (Double.parseDouble(changeNormForm((String)tempMap.get("ZPNN_PRICE"))) / per) * 10;
//						double erpPrice = (Double.parseDouble(changeNormForm((String)tempMap.get("ERP_NET_PRICE"))) / per) * 10;
//						
////						if((erpPrice - netPrice) < apprData.getDouble("REF_NUM1")){
//						if((erpPrice - zpnnPrice) < apprData.getDouble("REF_NUM1")){
//							if(apprLv < 2){
//								apprLv = 1;
//							}
////						}else if(apprData.getDouble("REF_NUM1") < (erpPrice - netPrice)){
//						}else if(apprData.getDouble("REF_NUM1") < (erpPrice - zpnnPrice)){
//							apprLv = 2;
////							totWp = per * Double.parseDouble((String)tempMap.get("ORD_QTY"));
//							
//							//totWp += Double.parseDouble(itemWP) * Double.parseDouble((String)tempMap.get("ORD_QTY"));
//						}
//					}
//					
//					totWp = totWp + Double.parseDouble(itemWP) * Double.parseDouble((String)tempMap.get("ORD_QTY"));
//				}
//				
//				System.err.println("totWp ::" + new Double(totWp).toString());
//				
//				if(apprLv == 2 && apprData.getDouble("REF_NUM2") < totWp){
//					apprLv = 3;
//				}
			}
		}
		
		if("ZKL".equals(headData.get("DOC_TP"))){
			apprLv = 3;
		}
		
		//기존 데이터 이관
		salesOrderDao.moveAppr(headData);
		
		salesOrderDao.deleteAppr(headData);
		
		int addPriority = 0;
		
		//country head
		addPriority++;
		
		String countryHead = salesOrderDao.getCounrtyHead(headData);
		
		if(null != countryHead && !"".equals(countryHead)){
			headData.put("APPR_ID", countryHead);
			headData.put("PRIORITY", addPriority);
			salesOrderDao.insertAppr(headData);
		}
		
		if ( !head ) {
			//sales planning
			if(moduleFlag || multiFlag){
				addPriority++;
				
				String salesPlanning = salesOrderDao.getSalesPlanning(headData);
				
				if(null != salesPlanning && !"".equals(salesPlanning)){
					headData.put("APPR_ID", salesPlanning);
					headData.put("PRIORITY", addPriority);
					salesOrderDao.insertAppr(headData);
				}
			}
			
			for(int i = 1; i <= apprLv; i++){
				headData.put("APPR_ID", apprData.get("REF_CHR" + String.valueOf(i)));
				headData.put("PRIORITY", i + addPriority);
				salesOrderDao.insertAppr(headData);
			}
		}
		
//		//sales planning
//		if(moduleFlag || multiFlag){
//			addPriority++;
//			
//			String salesPlanning = salesOrderDao.getSalesPlanning(headData);
//			
//			if(null != salesPlanning && !"".equals(salesPlanning)){
//				headData.put("APPR_ID", salesPlanning);
//				headData.put("PRIORITY", addPriority);
//				salesOrderDao.insertAppr(headData);
//			}
//		}
//		
//		for(int i = 1; i <= apprLv; i++){
//			headData.put("APPR_ID", apprData.get("REF_CHR" + String.valueOf(i)));
//			headData.put("PRIORITY", i + addPriority);
//			salesOrderDao.insertAppr(headData);
//		}
		
		callRfcForUpdate(headData);
		
	}
	
	/**
	 * Delete Sales Order
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void deleteSalesOrder(BMap param) throws Exception{
		
//		System.err.println(param);
		
		callRfcForUpdate(param);
		
		salesOrderDao.deleteSalesOrder(param);
	}
	
	/**
	 * 그리드용 Item Cat Grp 값 조회
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public String checkItemCatGrpCodeGrid(BMap param) throws Exception{
		return salesOrderDao.checkItemCatGrpCodeGrid(param);
	}
	
	/**
	 * search sales grp
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public String selectSalesGrp(BMap param) throws Exception{
		
		List<CodeVO> codeList = salesOrderDao.selectSalesGrp(param);
		
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
	 * Sales Order Condition Tab 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectConditionTab(BMap param) throws Exception{
		return salesOrderDao.selectConditionTab(param);
	}
	
	
	
	/**
	 * Sales Order Condition Dtl Tab 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectConditionDtlTab(BMap param) throws Exception{
		return salesOrderDao.selectConditionDtlTab(param);
	}
	
	/**
	 * Sales Order Copy.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public String copySalesOrder(Map<String, Object> param) throws Exception{
		
		String tempDocNo = salesOrderDao.getSalesTempSeq(param);
		param.put("TEMP_DOC_NO", tempDocNo);
		
		salesOrderDao.copySalesHeader(param);
//		if(null != param.get("SOC") && "Y".equals(param.get("SOC"))){
			salesOrderDao.copySalesPf(param);
//		}
		salesOrderDao.copySalesText(param);
		salesOrderDao.copySalesItem(param);

		return tempDocNo;
	}
	
	/**
	 * Item Cat Group 조회
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public String selectItemCatCode(String code) throws Exception{
		BMap param = new BMap();
		param.put("HEAD_CD", code);
		param.put("LANG", LoginInfo.getLang());
		param.put("DOC_GR", "SO");
		List<CodeVO> codeList = salesOrderDao.selectItemCatCode(param);
		
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
	 * Sales Order Customer 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectCustomerInfo(BMap param) throws Exception{
		return salesOrderDao.selectCustomerInfo(param);
	}
	
	public String changeNormForm(String num) throws Exception{
		String rtnNm = "";
		
		if(null != num && !"".equals(num)){
			if(-1 != num.indexOf(",")){
				String[] tempVal = num.split(",");
				rtnNm = tempVal[0].replaceAll("\\.", "") + "." + tempVal[1];
			}else{
				rtnNm = num.replaceAll("\\.", "");
			}
		}
		
		return rtnNm;
	}
	public void sendEmail(Map<String, Object> param) throws Exception {
		// get html from template
		Document doc = MailSenderManager.getTemplateDocument(MailSenderManager.TEMPLATE_DOCUMENT_ORDER);
		
		// get data from rdb
		BMap bmap = new BMap();
		bmap.put("DOC_NO", param.get("DOC_NO"));
		bmap.put("G_COMP_CD", LoginInfo.getCompCd());
		bmap.put("DOC_GR", "SO");
		
		BMap list_addr = salesOrderDao.selectCustAddr(bmap);
		Element elm = doc.getElementById("sold_street");
		elm.text(list_addr.get("SOLD_STREET").toString());
		
		elm = doc.getElementById("sold_post");
		elm.text(list_addr.get("SOLD_POST").toString());
		
		elm = doc.getElementById("sold_cust_nm");
		elm.text(list_addr.get("SOLD_CUST_NM").toString());

		elm = doc.getElementById("ship_street");
		elm.text(list_addr.get("SHIP_STREET").toString());
		
		elm = doc.getElementById("ship_post");
		elm.text(list_addr.get("SHIP_POST").toString());
		
		elm = doc.getElementById("ship_cust_nm");
		elm.text(list_addr.get("SHIP_CUST_NM").toString());
		
		BMap list = salesOrderDao.selectQuotationReport(bmap);
		
		elm = doc.getElementById("docno");
		elm.text(list.get("DOC_NO").toString());
		
		elm = doc.getElementById("cust");
		elm.text(list.get("SOLD_CUST_CD").toString());
		
		elm = doc.getElementById("shipment");
		elm.text(list.get("SHIP_CUST_CD").toString());

		elm = doc.getElementById("ref");
		elm.text(list.get("REF_DOC_H_STS_NM").toString());
		
		elm = doc.getElementById("incoterms");
		elm.text(list.get("INCOTERMS_NM").toString());
		
		elm = doc.getElementById("payterm");
		elm.text(list.get("PAY_TERM_NM").toString());
		
		elm = doc.getElementById("tel");
		elm.text(list.get("TEL_NO").toString());
		
		elm = doc.getElementById("fax");
		elm.text(list.get("FAX_NO").toString());
				
		List<BMap> itemList = salesOrderDao.selectItemTab(bmap);
		if (itemList != null && itemList.size() > 0) {
			for (int i = 0; i < itemList.size(); i++) {
				BMap map = itemList.get(i);
				
				String pos = map.getString("ITEM_SEQ");
				String matlcd = map.getString("MATL_CD");
				String matlnm = map.getString("MATL_DESC");
				String delidt = map.getString("DELI_DT_1ST");
				String qty = map.getString("ORD_QTY");
				String unit = map.getString("ORD_UNIT_CD");
				String uprice = map.getString("NET_PRICE");
				String per = map.getString("PER");
				String tprice = map.getString("NET_VALUE");

				Element table = doc.getElementById("report_table");
				StringBuilder sb = new StringBuilder();
				sb.append("<tr>");
				sb.append("<td width=\"10%\" height=\"15\">");
				sb.append(pos);
				sb.append("</td>");
				
				sb.append("<td width=\"10%\" height=\"15\">");
				sb.append(matlcd);
				sb.append("</td>");
				
				sb.append("<td width=\"30%\" height=\"15\">");
				sb.append(matlnm);
				sb.append("</td>");
				
				sb.append("<td width=\"10%\" height=\"15\">");
				sb.append(delidt);
				sb.append("</td>");

				sb.append("<td width=\"5%\" height=\"15\">");
				sb.append(qty);
				sb.append("</td>");
				
				sb.append("<td width=\"5%\" height=\"15\">");
				sb.append(unit);
				sb.append("</td>");
				
				sb.append("<td width=\"10%\" height=\"15\">");
				sb.append(uprice);
				sb.append("</td>"); 

				sb.append("<td width=\"5%\" height=\"15\">");
				sb.append(per);
				sb.append("</td>");
				
				sb.append("<td width=\"10%\" height=\"15\">");
				sb.append(tprice);
				sb.append("</td>");
				sb.append("</tr>");
				
				table.append(sb.toString());
			}
			elm = doc.getElementById("tprice");
			elm.text(list.get("T_AMT").toString());
		}
		
		// get email sender
		MultiPartEmail email = MailSenderManager.getInstance();
		
		// get email info
		bmap.put("MAIL_CD", "SO");
		bmap.put("MAIL_LANG", LoginInfo.getLang());
		itemList = mailManagementDao.selectMailPreview(bmap);

		String mail_from = "";
		String mail_to = "";
		String mail_cc = "";
		
		if (itemList != null && itemList.size() > 0) {
			for (int i = 0; i < itemList.size(); i++) {
				BMap item = itemList.get(i);
				String mail = item.getString("E_MAIL");
				bmap.put("MAIL_NM","");
				bmap.put("MAIL_TITLE","");
				bmap.put("MAIL_CONTENTS","");
				bmap.put("ATTACH_FILE_YN","");
				bmap.put("SEND_DATE","");
				bmap.put("SEND_STATUS","");
				bmap.put("STATUS","");
				if ("001".equals(item.get("TYPE"))) {
					email.setFrom(mail);
					if(mail_from == ""){
						mail_from = mail;
					}else{
						mail_from = mail_from + "; " + mail;
					}
				} else if ("002".equals(item.get("TYPE"))) {
					email.addTo(mail);
					if(mail_to == ""){
						mail_to = mail;
					}else{
						mail_to = mail_to + "; " + mail;
					}
				} else if ("003".equals(item.get("TYPE"))) {
					email.addCc(mail);
					if(mail_cc == ""){
						mail_cc = mail;
					}else{
						mail_cc = mail_cc + "; " + mail;
					}
				}
			}
			
			// TODO
			email.addTo("H.Cho@q-cells.com");
			email.addTo("M.Ahn@q-cells.com");
			email.addTo("jeongmin.lee@q-cells.com");
			
			String title = itemList.get(0).getString("TITLE_TEXT");
			title = title.replace("{DOC_NO}", list.getString("DOC_NO"));
			title = title.replace("{Customer Name}", list.get("SOLD_CUST_CD").toString());
			email.setSubject(title);
			bmap.put("MAIL_TITLE", title);
			
			String bodyTitle = itemList.get(0).getString("BODY_TITLE_TXT") + " " + itemList.get(0).getString("BODY_TITLE_TYPE") + "\n";
			String body = bodyTitle + itemList.get(0).getString("BODY_CONTENTS");
			email.setMsg(body);
			bmap.put("MAIL_CONTENTS", body);
			
			InputStream is = new ByteArrayInputStream(doc.toString().getBytes(StandardCharsets.UTF_8));
			DataSource ds = new ByteArrayDataSource(is, "application/pdf");
			email.attach(ds, MailSenderManager.TEMPLATE_DOCUMENT_ORDER, MailSenderManager.TEMPLATE_DOCUMENT_ORDER);
//			email.send();
			
			bmap.put("MAIL_FROM",mail_from);
			bmap.put("MAIL_TO",mail_to);
			bmap.put("MAIL_CC",mail_cc);
			long curr = System.currentTimeMillis();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String datetime = sdf.format(new Date(curr));
			bmap.put("SEND_DATE", datetime);
			bmap.put("USERID", LoginInfo.getUserId());
			bmap.put("ATTACH_FILE_YN", "Y");
			
			// TODO*
			try {
				mailManagementDao.insertEmailHistory(bmap);
			} catch (Exception e) {
				// TODO..
			}
			
		} else {
			logger.error("Not found email information");
		}
	}
	
	public void sendEmail_Invoice(Map<String, Object> param) throws Exception {
		// get html from template
		Document doc = MailSenderManager.getTemplateDocument(MailSenderManager.TEMPLATE_DOCUMENT_INVOICE);
		
		// get data from rdb
		BMap bmap = new BMap();
		/*bmap.put("DOC_NO", param.get("DOC_NO"));*/
		bmap.put("DOC_NO","612100053");
		bmap.put("G_COMP_CD", LoginInfo.getCompCd());
		bmap.put("DOC_GR", "SO");
		
		BMap list_addr = salesOrderDao.selectCustAddr(bmap);
		Element elm = doc.getElementById("sold_street");
		elm.text(list_addr.get("SOLD_STREET").toString());
		
		elm = doc.getElementById("sold_post");
		elm.text(list_addr.get("SOLD_POST").toString());
		
		elm = doc.getElementById("sold_cust_nm");
		elm.text(list_addr.get("SOLD_CUST_NM").toString());

		elm = doc.getElementById("ship_street");
		elm.text(list_addr.get("SHIP_STREET").toString());
		
		elm = doc.getElementById("ship_post");
		elm.text(list_addr.get("SHIP_POST").toString());
		
		elm = doc.getElementById("ship_cust_nm");
		elm.text(list_addr.get("SHIP_CUST_NM").toString());
		
		BMap list = salesOrderDao.selectQuotationReport(bmap);
		
		elm = doc.getElementById("docno");
		elm.text(list.get("DOC_NO_DATE").toString());

		elm = doc.getElementById("deli");
		elm.text(list.get("REQ_DELI_DT").toString());
		
		elm = doc.getElementById("cust");
		elm.text(list.get("SOLD_CUST_CD").toString());
		
		elm = doc.getElementById("shipment");
		elm.text(list.get("SHIP_CUST_CD").toString());

		elm = doc.getElementById("ref");
		elm.text(list.get("REF_DOC_H_STS_NM").toString());
		
		elm = doc.getElementById("incoterms");
		elm.text(list.get("INCOTERMS_NM").toString());
		
		elm = doc.getElementById("payterm");
		elm.text(list.get("PAY_TERM_NM").toString());
		
		elm = doc.getElementById("tel");
		elm.text(list.get("TEL_NO").toString());

		elm = doc.getElementById("regno");
		elm.text(list.get("VAT_REG_NO").toString());		
		
		List<BMap> itemList = salesOrderDao.selectItemTab(bmap);
		if (itemList != null && itemList.size() > 0) {
			for (int i = 0; i < itemList.size(); i++) {
				BMap map = itemList.get(i);
				
				String pos = map.getString("ITEM_SEQ");
				String matlcd = map.getString("MATL_CD");
				String matlnm = map.getString("MATL_DESC");
				String delidt = map.getString("DELI_DT_1ST");
				String qty = map.getString("ORD_QTY");
				String unit = map.getString("ORD_UNIT_CD");
				String uprice = map.getString("NET_PRICE");
				String per = map.getString("PER");
				String tprice = map.getString("NET_VALUE");

				Element table = doc.getElementById("report_table");
				StringBuilder sb = new StringBuilder();
				sb.append("<tr>");
				sb.append("<td width=\"10%\" height=\"15\">");
				sb.append(pos);
				sb.append("</td>");
				
				sb.append("<td width=\"10%\" height=\"15\">");
				sb.append(matlcd);
				sb.append("</td>");
				
				sb.append("<td width=\"30%\" height=\"15\">");
				sb.append(matlnm);
				sb.append("</td>");
				
				sb.append("<td width=\"10%\" height=\"15\">");
				sb.append(delidt);
				sb.append("</td>");

				sb.append("<td width=\"5%\" height=\"15\">");
				sb.append(qty);
				sb.append("</td>");
				
				sb.append("<td width=\"5%\" height=\"15\">");
				sb.append(unit);
				sb.append("</td>");
				
				sb.append("<td width=\"10%\" height=\"15\">");
				sb.append(uprice);
				sb.append("</td>"); 

				sb.append("<td width=\"5%\" height=\"15\">");
				sb.append(per);
				sb.append("</td>");
				
				sb.append("<td width=\"10%\" height=\"15\">");
				sb.append(tprice);
				sb.append("</td>");
				sb.append("</tr>");
				
				table.append(sb.toString());
			}
			elm = doc.getElementById("tqty");
			elm.text(list.get("VOL_QTY").toString());
			
			elm = doc.getElementById("subtotal");
			elm.text(list.get("T_AMT").toString());
			
			elm = doc.getElementById("tprice");
			elm.text(list.get("T_AMT").toString());
		}
		
		// get email sender
		MultiPartEmail email = MailSenderManager.getInstance();
		
		// get email info
		bmap.put("MAIL_CD", "SO");
		bmap.put("MAIL_LANG", LoginInfo.getLang());
		itemList = mailManagementDao.selectMailPreview(bmap);
		
		String mail_from = "";
		String mail_to = "";
		String mail_cc = "";
		
		if (itemList != null && itemList.size() > 0) {
			for (int i = 0; i < itemList.size(); i++) {
				BMap item = itemList.get(i);
				String mail = item.getString("E_MAIL");
				if ("001".equals(item.get("TYPE"))) {
					email.setFrom(mail);
					if(mail_from == ""){
						mail_from = mail;
					}else{
						mail_from = mail_from + "; " + mail;
					}
				} else if ("002".equals(item.get("TYPE"))) {
					//email.addTo(mail);
					if(mail_to == ""){
						mail_to = mail;
					}else{
						mail_to = mail_to + "; " + mail;
					}
				} else if ("003".equals(item.get("TYPE"))) {
					email.addCc(mail);
					if(mail_cc == ""){
						mail_cc = mail;
					}else{
						mail_cc = mail_cc + "; " + mail;
					}
				}
			}
			
			// TODO
			email.addTo("H.Cho@q-cells.com");
			email.addTo("M.Ahn@q-cells.com");
			email.addTo("jeongmin.lee@q-cells.com");
			
			String title = itemList.get(0).getString("TITLE_TEXT");
			title = title.replace("{DOC_NO}", list.getString("DOC_NO"));
			title = title.replace("{Customer Name}", list.get("SOLD_CUST_CD").toString());
			email.setSubject(title);
			bmap.put("MAIL_TITLE", title);
			
			String bodyTitle = itemList.get(0).getString("BODY_TITLE_TXT") + " " + itemList.get(0).getString("BODY_TITLE_TYPE") + "\n";
			String body = bodyTitle + itemList.get(0).getString("BODY_CONTENTS");
			email.setMsg(body);
			bmap.put("MAIL_CONTENTS", body);
			
			InputStream is = new ByteArrayInputStream(doc.toString().getBytes(StandardCharsets.UTF_8));
			DataSource ds = new ByteArrayDataSource(is, MediaType.TEXT_HTML_VALUE);
			email.attach(ds, MailSenderManager.TEMPLATE_DOCUMENT_INVOICE, MailSenderManager.TEMPLATE_DOCUMENT_INVOICE);
//			email.send();
			
			bmap.put("MAIL_FROM",mail_from);
			bmap.put("MAIL_TO",mail_to);
			bmap.put("MAIL_CC",mail_cc);
			long curr = System.currentTimeMillis();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String datetime = sdf.format(new Date(curr));
			bmap.put("SEND_DATE", datetime);
			bmap.put("USERID", LoginInfo.getUserId());
			bmap.put("ATTACH_FILE_YN", "Y");
			
			// TODO
			try {
				mailManagementDao.insertEmailHistory(bmap);
			} catch (Exception e) {
				// TODO..
			}
		} else {
			logger.error("Not found email information");
		}
	}
	
	/**
	 * 그리드용 Item Cat Grp 값 조회
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public String getItemCatGrpCodeGrid(BMap param) throws Exception{
		return salesOrderDao.getItemCatGrpCodeGrid(param);
	}
	
	/**
	 * Sales Order Partner Function List 의 Ship조회.
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public List<BMap> getShipToBySold(BMap param) throws Exception{
		return salesOrderDao.getShipToBySold(param);
	}

	/**
	 * Sales Order Modi Tms조회.
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public String getModiTms(BMap param) throws Exception{
		return salesOrderDao.getModiTms(param);
	}
	
	/**
	 * 
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BRespData checkSoStatus(Map<String, Object> req) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		
		String ifSts = salesOrderDao.getIfSts(req);
		List<SAPTable> result = new ArrayList<SAPTable>();
		
		if(null != ifSts && "S".equals(ifSts)){
			// set table info
			List<SAPTable> tableList = new ArrayList<SAPTable>();
			HashMap<String, Object> row = new HashMap<String, Object>();
			
			String docNo =String.valueOf(req.get("DOC_NO"));
			if ( docNo.length() < 10 ) {
				int serial = Integer.parseInt(String.valueOf(req.get("DOC_NO"))); 
				docNo = String.format("%010d", serial); 
			}
			
			SAPTable table = new SAPTable("IT_VBELN");
			row = new HashMap<String, Object>();
			row.put("SIGN", "I");
			row.put("OPTION", "EQ");
			row.put("LOW", docNo);
			table.addRow(row);
			tableList.add(table);
			
			table = new SAPTable("IT_VKORG");
			row = new HashMap<String, Object>();
			row.put("SIGN", "I");
			row.put("OPTION", "EQ");
			row.put("LOW", req.get("SALES_ORG_CD"));
			table.addRow(row);
			tableList.add(table);
			
			table = new SAPTable("IT_AUART");
			row = new HashMap<String, Object>();
    		row.put("SIGN", "I");
    		row.put("OPTION", "EQ");
    		row.put("LOW", req.get("DOC_TP"));
    		table.addRow(row);
			
//    		row.put("SIGN", "I");
//    		row.put("OPTION", "EQ");
//    		row.put("LOW", "ZKL");
    		table.addRow(row);
			tableList.add(table);
			
			table = new SAPTable("IT_AEDAT");
			row = new HashMap<String, Object>();
			row.put("SIGN", "I");
			row.put("OPTION", "GE");
			row.put("LOW", req.get("REG_DT"));
			table.addRow(row);
			tableList.add(table);
			
			result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_SD_SO_GET_CHANGED", param, tableList);
			
			String dlvBlock = (String) req.get("DLV_BLOCK");
			boolean upDataFlag = false;
			
			if (result != null) {
				
				for(SAPTable tempMap : result){
					if ("ET_ORDER_HEADERS_OUT".equals(tempMap.getTableName())) {
						List<Map<String, Object>> list = tempMap.getRows();
						for (int j = 0; j < list.size(); j++) {
							Map<String, Object> headMap = list.get(j);
							if(!dlvBlock.equals(headMap.get("DLV_BLOCK"))){
								upDataFlag = true;
								break;
							}
						}
					}else if("ET_ORDER_SCHEDULES_OUT".equals(tempMap.getTableName())) {
						List<Map<String, Object>> list = tempMap.getRows();
						
						BMap scdlParam = new BMap();
						scdlParam.put("DOC_NO", req.get("DOC_NO"));
						scdlParam.put("G_COMP_CD", req.get("G_COMP_CD"));
						scdlParam.put("DOC_GR", req.get("DOC_GR"));
						List<BMap> scdlList = salesOrderDao.selectScdlTab(scdlParam);
						
						for (int j = 0; j < list.size(); j++) {
							Map<String, Object> outScdlMap = list.get(j);
							int isNewCnt = 0;
							
							for(BMap scdlMap : scdlList){
								
								if(Integer.parseInt((String) outScdlMap.get("ITM_NUMBER")) == Integer.parseInt((String) scdlMap.get("ITEM_SEQ"))){
									isNewCnt++;
								}
								
								if( (outScdlMap.get("ITM_NUMBER").equals(scdlMap.get("ITEM_SEQ"))
									&& outScdlMap.get("SCHED_LINE").equals(scdlMap.get("SEQ")))
									&& !outScdlMap.get("REQ_DLV_BL").equals(scdlMap.get("DELI_BLOCK_CD"))
									){
									upDataFlag = true;
									break;
								}
							}
							
							if(isNewCnt < 1){
								upDataFlag = true;
								break;
							}
						}
					}
				}
				
				if(upDataFlag){
					
					for(SAPTable tempMap : result){
								
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
						}
					}
					
					table = new SAPTable("UPDATE");
					row = new HashMap<String, Object>();
					row.put("upDataFlag", "U");
					table.addRow(row);
					result.add(table);
					
					param.put("COMP_CD", "1000");
					param.put("USER_ID", LoginInfo.getUserId());
					param.put("DOC_NO", req.get("DOC_NO"));
					sapIfRecvSalesOrderDao.callSpSapIfRecvSalesOrder(param);
				}else{
					table = new SAPTable("UPDATE");
					row = new HashMap<String, Object>();
					row.put("upDataFlag", "N");
					table.addRow(row);
					result.add(table);
				}
			}
		}
		return new BRespData(ResponseStatus.OK, result);
//		} else {
//			return new BRespData(ResponseStatus.Bad_Request);
//		}
	}
	
	/**
	 * Sales Order 전송 여부 조회.
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public int getIfyn(BMap param) throws Exception{
		return salesOrderDao.getIfyn(param);
	}
	
	/**
	 * Batch No 조회
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public String selectBatchPopList(BMap param) throws Exception{
		List<BMap> batchList = salesOrderDao.selectBatchPopList(param);
		
		String resultValue = "";
		for (int i = 0; i < batchList.size(); i++) {
			resultValue += ";" + batchList.get(i).getString("BATCH_NO")+ ":" + batchList.get(i).getString("BATCH_NO");
		}
		
		return resultValue;
	}
	
	/**
	 * Update App Price
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public void updateNetPrice(Map<String, Object> doc_no) throws Exception{
		salesOrderDao.updateNetPrice(doc_no);
	}
	
	public void updateNetPriceNull(Map<String, Object> doc_no) throws Exception{
		salesOrderDao.updateNetPriceNull(doc_no);
	}
	
	/**
	 * 
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BRespData getSoldCreditAmt(Map<String, Object> req) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("IS_KKBER", req.get("G_COMP_CD"));
		param.put("IS_KUNNR", req.get("SOLD_CUST_CD"));
		
		List<SAPTable> result = new ArrayList<SAPTable>();
		//result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_FI_CREDIT_LIMIT", param);
		
		return new BRespData(ResponseStatus.OK, result);
	}
	
	/**
	 * Sales Order Close.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void salesOrderClosed(BMap param) throws Exception{
		salesOrderDao.salesOrderClosedByHeader(param);
		salesOrderDao.salesOrderClosedByItem(param);
		
		Map<String, Object> rfcParam = new HashMap<String, Object>();
		rfcParam.put("COMP_CD", param.get("G_COMP_CD"));
		rfcParam.put("DOC_NO", param.get("DOC_NO"));
		
		callRfcForUpdate(rfcParam);
	}
	
	/**
	 * Release Credit Block
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void releaseCreditBlock(BMap param) throws Exception{
		salesOrderDao.releaseCreditBlock(param);
	}
	
	/**
	 * Sales Order History 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectHisTab(BMap param) throws Exception{
		return salesOrderDao.selectHisTab(param);
	}
	
	/**
	 * search deli plant
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public String setDeliPlantCombo(BMap param) throws Exception{
		
		List<CodeVO> codeList = salesOrderDao.setDeliPlantCombo(param);
		
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
	 * 
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BRespData getAtpQty(Map<String, Object> req) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		
		// set table info
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		SAPTable table = null;
		table = new SAPTable("T_MATNR");
		
		Map<String, Object> row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", req.get("MATL_CD"));
		row.put("HIGH", "");
		table.addRow(row);
		tableList.add(table);
		
		table = new SAPTable("T_WERKS");
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", req.get("PLANT_CD"));
		row.put("HIGH", "");
		table.addRow(row);
		tableList.add(table);
		
		//3. 호출
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.BATCH, "ZZ_IF_SD_AVAILABLE_STOCK_LIST", tableList);
		
		if (result != null) {
			return new BRespData(ResponseStatus.OK, result);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
	/**
	 * seg val 값 조회
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public String selectSegement(String code) throws Exception{
		BMap param = new BMap();
		param.put("HEAD_CD", code);
		param.put("LANG", LoginInfo.getLang());
		
		return salesOrderDao.selectSegement(param);
	}
	
	/**
	 * Sales Order cond sum조회.
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public String getItemCondition(Map<String, Object> param) throws Exception{
		return salesOrderDao.getItemCondition(param);
	}
	
	/**
	 * search External List
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> searchExternalList(BMap param) throws Exception {
		return salesOrderDao.searchExternalList(param);
	}
	
	/**
	 *  search External Item List
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> searchExternalItemList(BMap param) throws Exception {
		return salesOrderDao.searchExternalItemList(param);
	}
	
	/**
	 * Item Plant Cd조회.
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public String getPlantCD(BMap param) throws Exception{
		return salesOrderDao.getPlantCD(param);
	}
	
	
	private Map<String, Object> syncDeliveryBlock(BMap reqParam, String div) throws Exception {

		Map<String, Object> param = new HashMap<String, Object>();

		Map<String, Object> bapiview = new HashMap<String, Object>();
		bapiview.put("HEADER", "X");
		bapiview.put("ITEM", "X");
		bapiview.put("SDSCHEDULE", "X");	
		bapiview.put("SDCOND", "X");
		bapiview.put("BUSINESS", "X");	
		
		param.put("I_BAPI_VIEW", bapiview);		
		param.put("I_MEMORY_READ", "");	
		param.put("I_WITH_HEADER_CONDITIONS", "X");
			
		//2. 테이블값 설정
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		SAPTable table = new SAPTable("SALES_DOCUMENTS");
				
		String docno = (String)reqParam.get("DOC_NO");		
		table.put("VBELN", bt.btframework.utils.StringUtils.LPadding(docno, '0', 10)); 
		tableList.add(table);		
		
		// System.out.println(">>>>>>>>" + param);
		Map<String, Object> somap = new HashMap<String, Object>();		
		List<SAPTable> result = SAPConnectorManager.executeBAPI(SAPDataProvider.ERP, "BAPISDORDER_GETDETAILEDLIST", param, tableList);
		if (result != null) {
			// I/F Table에 Insert
			for(int i = 0; i < result.size(); i++) {
				SAPTable tempMap = result.get(i);
				String tblName = tempMap.getTableName();
				
//				System.err.println(tblName);
				
				if ("HEADERS".equals(div)) {
					if (tblName.equals("ORDER_HEADERS_OUT")) {// table 추출
						List<Map<String, Object>> soheadlist = tempMap.getRows();
						somap.put("headlist", soheadlist);					
					} 
				}
				if ("ITEMS".equals(div) || "SCHEDULES".equals(div)) {
					if (tblName.equals("ORDER_SCHEDULES_OUT")) {// table 추출
						List<Map<String, Object>> soscheduleslist = tempMap.getRows();
						// System.out.println(">>> " + soscheduleslist.get(0));
						somap.put("scheduleslist", soscheduleslist);					
					} 		
				}
				if ("ITEMS".equals(div)) {
			 		if (tblName.equals("ORDER_ITEMS_OUT")) {// table 추출
						List<Map<String, Object>> soitemlist = tempMap.getRows();
						// System.out.println(">>> " + soitemlist.get(0));
						somap.put("itemlist", soitemlist);					
					} 

				}
				if ("ITEMS".equals(div) || "BUSINESS".equals(div)) {			 		
			 		if (tblName.equals("ORDER_BUSINESS_OUT")) {// table 추출
						List<Map<String, Object>> sobusinesslist = tempMap.getRows();
						// System.out.println(">>> " + soitemlist.get(0));
						somap.put("businesslist", sobusinesslist);					
					} 
				}
				if ("ITEMS".equals(div) || "CONDITIONS".equals(div)) {
			 		if (tblName.equals("ORDER_CONDITIONS_OUT")) {// table 추출
						List<Map<String, Object>> soconditionlist = tempMap.getRows();
						// System.out.println(">>> " + soconditionlist.get(0));
						somap.put("conditionlist", soconditionlist);
					} 				
				}
			}
		}		
		return somap;
	}
	
	
	
	public BRespData callErpSalesOrder(Map<String, Object> req) throws Exception {

//		System.err.println(req);
		
		req.put("USER_ID", LoginInfo.getUserId());
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("IV_OPENSO", "X");
		param.put("IV_NOCANC", "X");
		//2. 테이블값 설정
		//
		List<SAPTable> tableList = new ArrayList<SAPTable>();
		
		Map<String, Object> row = new HashMap<String, Object>();

		SAPTable table = new SAPTable("IT_VKORG");
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
		
		table = new SAPTable("IT_KTOKD");	//Customer Account Group Z001 , Z002 ,Z003 ,Z004 ,Z006 ,CPD ,0170

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

//		table = new SAPTable("IT_AEDAT");
//		row = new HashMap<String, Object>();
//		row.put("SIGN", "I");
//		row.put("OPTION", "GE");
//		row.put("LOW", req.get("REG_DT"));
//		table.addRow(row);
//		tableList.add(table);
		
		table = new SAPTable("IT_ERDAT");	//Date on Which Record Was Created

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "BT");
		
		Calendar calendar = Calendar.getInstance();
		Date toDay = calendar.getTime();
		
		//calendar.add(Calendar.DAY_OF_MONTH, -7);
		calendar.add(Calendar.DAY_OF_MONTH, -1);
		Date beforeDate = calendar.getTime();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
//		row.put("LOW", sdf.format(beforeDate));
//		row.put("HIGH", sdf.format(toDay));
		
		row.put("LOW", sdf.format(beforeDate));
		row.put("HIGH", sdf.format(toDay));
		
		table.addRow(row);
		
		tableList.add(table);

		String docNo =String.valueOf(req.get("DOC_NO"));
		if ( docNo.length() < 10 ) {
			int serial = Integer.parseInt(String.valueOf(req.get("DOC_NO"))); 
			docNo = String.format("%010d", serial); 
		}

		table = new SAPTable("IT_VBELN");	//Sales Document

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", docNo);
		row.put("HIGH", "");
		table.addRow(row);	
		
		tableList.add(table);

		//3. 호출
		//List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_SD_SO_GET_CHANGED", tableList);
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_SD_SO_MULTI", param, tableList);
		
		int cnt1 = 0;
		
		if (result != null) {			
			for(int i = 0; i < result.size(); i++) {
								
				SAPTable tempMap = result.get(i);
				
				if ("ET_ORDER_HEADERS_OUT".equals(tempMap.getTableName())) {					
					List<Map<String, Object>> list = tempMap.getRows();

					if ( list.size() == 0 ) {
						cnt1 = 1;
						break;
					}
					
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
			
			if ( cnt1 == 1 ) {
				System.err.println("break");
				
				callErpSalesOrder2(req);

			}
			result = null;
			param.put("COMP_CD", "1000");
			param.put("DOC_NO", req.get("DOC_NO"));			
			param.put("USER_ID", LoginInfo.getUserId());
			sapIfRecvSalesOrderDao.callSpSapIfRecvSyncSalesOrder(param);
			return new BRespData(ResponseStatus.OK);
		} else {
			return new BRespData(ResponseStatus.Bad_Request);
		}
	}
	
	public BRespData callErpSalesOrder2(Map<String, Object> req) throws Exception {
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		List<SAPTable> tableList2 = new ArrayList<SAPTable>();
		
		Map<String, Object> row = new HashMap<String, Object>();
		
		SAPTable table2 = new SAPTable("IT_VKORG");	//Sales Organization
		
		List<String> orgList = sapIfRecvSalesOrderDao.getSalesOrg(req);
		
		if(null != orgList && 0 < orgList.size()){
			for(String tempVal : orgList){
        		row = new HashMap<String, Object>();
        		row.put("SIGN", "I");
        		row.put("OPTION", "EQ");
        		row.put("LOW", tempVal);
        		row.put("HIGH", "");
        		table2.addRow(row);
			}
		}
		tableList2.add(table2);
		
		table2 = new SAPTable("IT_AUART");
		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "ZTA");
		table2.addRow(row);

		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", "ZKL");
		table2.addRow(row);
		tableList2.add(table2);
		
		table2 = new SAPTable("IT_AEDAT");
		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "GE");
		row.put("LOW", req.get("REG_DT"));
		table2.addRow(row);
		tableList2.add(table2);
		
		table2 = new SAPTable("IT_VBELN");	//Sales Document

		String docNo =String.valueOf(req.get("DOC_NO"));
		if ( docNo.length() < 10 ) {
			int serial = Integer.parseInt(String.valueOf(req.get("DOC_NO"))); 
			docNo = String.format("%010d", serial); 
		}
		
		row = new HashMap<String, Object>();
		row.put("SIGN", "I");
		row.put("OPTION", "EQ");
		row.put("LOW", docNo);
		row.put("HIGH", "");
		table2.addRow(row);	
		
		tableList2.add(table2);
		
		List<SAPTable> bResult = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZZ_IF_SD_SO_GET_CHANGED", tableList2);
		if (bResult != null) {

			for(int i = 0; i < bResult.size(); i++) {
				
				SAPTable tempMap = bResult.get(i);
				
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
				} else if("ET_ORDER_BUSINESS_OUT".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					for (int j = 0; j < list.size(); j++) {
						sapIfRecvSalesOrderDao.insertSapIfRecvORDER_BUSINESS_OUT(list.get(j));
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
				}
			}
		}
		return null;	
	}
	
	/**
	 * @param param
	 * @throws Exception
	 */
	public BMap createProformaInvoicePdf(HttpServletRequest request, Map<String, Object> param) throws Exception{
		String fileTitle = "";
		Document doc;

System.err.println(param);
		// get data from rdb
		BMap bmap = new BMap();
		bmap.put("DOC_NO", param.get("DOC_NO"));
		bmap.put("CUST_CD", param.get("CUST_CD"));
		bmap.put("G_COMP_CD", LoginInfo.getCompCd());
		bmap.put("DOC_GR", "SO");
		bmap.put("LANG", LoginInfo.getLang());
		bmap.put("QT_YN", "Y");

		BMap list_addr = salesOrderDao.selectCustAddr(bmap);
		// get html from template
		if(list_addr.get("SALES_ORG_CD").toString().equals("3500")) {
			if(list_addr.get("LANG_CD").toString().equals("DE")){
				doc = MailSenderManager.getTemplateDocument(MailSenderManager.TEMPLATE_DOCUMENT_PROFORMA_INVOICE_DE_3500);
			}else if(list_addr.get("LANG_CD").toString().equals("FR")){
				doc = MailSenderManager.getTemplateDocument(MailSenderManager.TEMPLATE_DOCUMENT_PROFORMA_INVOICE_FR_3500);
			}else{
				doc = MailSenderManager.getTemplateDocument(MailSenderManager.TEMPLATE_DOCUMENT_PROFORMA_INVOICE_EN_3500);
			}	
			
		} else {
			if(list_addr.get("LANG_CD").toString().equals("DE")){
				doc = MailSenderManager.getTemplateDocument(MailSenderManager.TEMPLATE_DOCUMENT_PROFORMA_INVOICE_DE);
			}else if(list_addr.get("LANG_CD").toString().equals("FR")){
				doc = MailSenderManager.getTemplateDocument(MailSenderManager.TEMPLATE_DOCUMENT_PROFORMA_INVOICE_FR);
			}else{
				doc = MailSenderManager.getTemplateDocument(MailSenderManager.TEMPLATE_DOCUMENT_PROFORMA_INVOICE_EN);
			}			
		}
		
		bmap.put("LANG", list_addr.get("LANG_CD").toString());
		
		Element elm = doc.getElementById("bill_street");
		elm.text(list_addr.get("BILL_STREET").toString());
		
		elm = doc.getElementById("bill_post");
		elm.text(list_addr.get("BILL_POST").toString());
		
		elm = doc.getElementById("bill_cust_nm");
		elm.text(list_addr.get("BILL_CUST_NM").toString());

		elm = doc.getElementById("ship_street");
		elm.text(list_addr.get("SHIP_STREET").toString());
		
		elm = doc.getElementById("ship_post");
		elm.text(list_addr.get("SHIP_POST").toString());
		
		elm = doc.getElementById("ship_cust_nm");
		elm.text(list_addr.get("SHIP_CUST_NM").toString());
		
		BMap list = salesOrderDao.selectQuotationReport(bmap);
		
		elm = doc.getElementById("docno_h");
		elm.text(list.get("DOC_NO").toString());
		
		elm = doc.getElementById("docno");
		elm.text(list.get("DOC_NO_DATE").toString());
		
		elm = doc.getElementById("cust");
		elm.text(list.get("SOLD_CUST_CD").toString());
		
		elm = doc.getElementById("shipment");
		elm.text(list.get("SHP_CON_CD").toString());
				
		elm = doc.getElementById("udoc");
		elm.text(list.get("PO_NO").toString());
		
		elm = doc.getElementById("incoterms");
		elm.text(list.get("INCOTERMS_NM").toString());
		
		elm = doc.getElementById("payterm");
		elm.text(list.get("PAY_TERM_NM").toString());
		
		//BMap createForlist = salesOrderDao.selectCreateFor(bmap);

		//if(null != createForlist){
//			elm = doc.getElementById("orderof");
//			elm.text(createForlist.get("FULL_NM").toString());			
		//}
		
//		elm = doc.getElementById("pricevalid");
//		elm.text(list.get("PRICE_DT").toString());
		
		BMap contactlist = salesOrderDao.selectContactPersonReport(bmap);
		
		if(null != contactlist){
			elm = doc.getElementById("contact");
			elm.text(contactlist.get("FULL_NM").toString());
			
			elm = doc.getElementById("tel");
			elm.text(contactlist.get("TEL_NO1").toString());
			
			elm = doc.getElementById("fax");
			elm.text(contactlist.get("FAX_NO").toString());
			
//			elm = doc.getElementById("email");
//			elm.text(contactlist.get("E_MAIL").toString());
		}
		
		BMap byOrderOf = salesOrderDao.selectByOrderOf(bmap);
		
		if(null != byOrderOf){
//			elm = doc.getElementById("qckam");
//			elm.text(byOrderOf.get("FULL_NM").toString());
		}		
		
		BMap salesText = salesOrderDao.getPDFHeaderData(bmap);
		
		if(null != salesText){
			elm = doc.getElementById("head_text");
			elm.text(salesText.get("MATL_TEXT").toString());
		}		
		
		List<BMap> itemList = salesOrderDao.selectItemTab(bmap);
		int rowCounter = 0;
		int realRowCounter = 0;
		int pageCounter = 1;
		int textLength = 20;
		int firstRow = 15;
		int perRow = 25;
		
		StringBuilder sb = new StringBuilder();
		
		double tempNetVal = 0.00;
		if (itemList != null && itemList.size() > 0) {
			for (int i = 0; i < itemList.size(); i++) {
				
				rowCounter++;
				realRowCounter++;
				
				int lastRow = itemList.size() - ((pageCounter * perRow) + firstRow);
				
				BMap map = itemList.get(i);
				
				String pos = map.getString("ITEM_SEQ");
				String matlcd = map.getString("MATL_CD");
				String matlnm = map.getString("MATL_DESC");
				String delidt = map.getString("DELI_DT_1ST");
				String qty = map.getString("ORD_QTY");
				String unit = map.getString("ORD_UNIT_CD");
				String uprice = map.getString("NET_PRICE");
				//String per = map.getString("PER");
				String per = map.getString("ZPNN_PER");
				String tprice = list.get("T_AMT").toString();
				String curr = map.getString("CURR");
				String uom = map.getString("ZPNN_UOM");
				String netval = map.getString("NET_VAL");
				String itemNetVal = map.getString("ITEM_SUM");
				String itemSum = map.getString("PRINT_ITEM_SUM");
				
				if(list_addr.get("LANG_CD").toString().equals("DE")){
					if ( uom.equals("PCS")) {
						uom = "ST";
					}
					
					if( unit.equals("PCS") ) {
						unit = "ST";
					}
				}
				
				
				Element headerTable = doc.getElementById("header_table");
				Element detailTable = doc.getElementById("detail_table");
				
				if(rowCounter == 1){
					sb.setLength(0);
					sb.append("<table width=\"100%\" class=\"report_table_line\" style=\"font-family:Arial;\">");
				}
				
				if(1 < pageCounter && rowCounter == 1){
					detailTable.append("<br>" + headerTable.html());
				}
				sb.append("<tr>");
				sb.append("<td width=\"5%\" height=\"40\">");
				sb.append(pos);
				sb.append("</td>");
				
				sb.append("<td width=\"10%\" height=\"40\">");
				sb.append(matlcd);
				sb.append("</td>");
				
				sb.append("<td width=\"20%\" height=\"40\"  align=\"left\">");
				sb.append(matlnm);
				sb.append("</td>");
				
				sb.append("<td width=\"10%\" height=\"40\" align=\"left\">");
				sb.append(delidt);
				sb.append("</td>");

				sb.append("<td width=\"9%\" height=\"40\" align=\"right\">");
				sb.append(qty);
				sb.append("</td>");
				
				sb.append("<td width=\"10%\" height=\"40\" align=\"center\" style=\"padding-left:20px\">");
				sb.append(unit);
				sb.append("</td>");
				
				sb.append("<td width=\"14%\" height=\"40\" align=\"right\">");
				sb.append(uprice + ' ' + curr);
				sb.append("</td>"); 

				sb.append("<td width=\"9%\" height=\"40\" align=\"right\">");
				sb.append(per + uom);
				sb.append("</td>");
				
				sb.append("<td width=\"15%\" height=\"40\" align=\"right\">");
//				if(itemList.size() > 0){
//					BMap tempMap = new BMap();
//					tempMap.put("netVal", netval);
					sb.append(itemNetVal);
//				}
				sb.append("</td>");
				sb.append("</tr>");
				
				bmap.put("ITEM_SEQ", pos);
				
				List<BMap> conditionList = salesOrderDao.selectPDFConditionTab(bmap);
				
				if (conditionList != null && conditionList.size() > 0) {
					for (int j = 0; j < conditionList.size(); j++) {
						BMap condMap = conditionList.get(j);
						
						String condNum = condMap.getString("ROWNUM");
						String condDesc = condMap.getString("COND_DESC");
						String condPrice = condMap.getString("PRICE");
						String condcurr = condMap.getString("COND_CURR_CD");
						String unitPrice = condMap.getString("COND_VAL");
						
						if ( condNum.equals("9999999") ) {
							sb.append("<tr style=\"font-size: 14px; \">");
							sb.append("&nbsp;");
							sb.append("</td>");
//							
//							sb.append("<td width=\"10%\" height=\"25\">");
//							sb.append("&nbsp;");
//							sb.append("</td>");
//							
//							sb.append("<td width=\"20%\" height=\"25\"  align=\"left\">");
//							sb.append("&nbsp;");
//							sb.append("</td>");
							
							sb.append("<td width=\"35%\" height=\"25\" align=\"right\" style=\"font-size: 14px;\" colspan=\"3\">");
							sb.append("<strong>" + condDesc + "</strong>");
							sb.append("</td>");

//							sb.append("<td width=\"9%\" height=\"25\" align=\"right\"  >");
//							sb.append("&nbsp;");
//							sb.append("</td>");
//							
//							sb.append("<td width=\"10%\" height=\"25\" align=\"center\" style=\"padding-left:20px\">");
//							sb.append("&nbsp;");
//							sb.append("</td>");
							
							sb.append("<td width=\"40%\" height=\"25\" align=\"right\" style=\"font-size: 14px;\" colspan=\"4\">");
							sb.append(unitPrice);
							sb.append("</td>"); 

//							sb.append("<td width=\"9%\" height=\"25\" align=\"right\">");
//							sb.append("&nbsp;");
//							sb.append("</td>");
							
							sb.append("<td width=\"25%\" height=\"25\" align=\"right\" style=\"padding-right: 4%; font-size: 14px;\" colspan=\"2\">");
							sb.append(condPrice);
							
							sb.append("</td>");
							sb.append("</tr>");
						} else {
							
							sb.append("<tr>");
							sb.append("&nbsp;");
							sb.append("</td>");
//							
//							sb.append("<td width=\"10%\" height=\"25\">");
//							sb.append("&nbsp;");
//							sb.append("</td>");
//							
//							sb.append("<td width=\"20%\" height=\"25\"  align=\"left\">");
//							sb.append("&nbsp;");
//							sb.append("</td>");
							
							sb.append("<td width=\"35%\" height=\"25\" align=\"right\" style=\"font-size: 14px;\" colspan=\"3\">");
							sb.append(condDesc);
							sb.append("</td>");

//							sb.append("<td width=\"9%\" height=\"25\" align=\"right\"  >");
//							sb.append("&nbsp;");
//							sb.append("</td>");
//							
//							sb.append("<td width=\"10%\" height=\"25\" align=\"center\" style=\"padding-left:20px\">");
//							sb.append("&nbsp;");
//							sb.append("</td>");
							
							sb.append("<td width=\"40%\" height=\"25\" align=\"right\" style=\"font-size: 14px;\" colspan=\"4\">");
							sb.append("&nbsp;");
							sb.append("</td>"); 

//							sb.append("<td width=\"9%\" height=\"25\" align=\"right\">");
//							sb.append("&nbsp;");
//							sb.append("</td>");
							
							sb.append("<td width=\"25%\" height=\"25\" align=\"right\" style=\"padding-right: 4%; font-size: 14px;\" colspan=\"2\">");
							sb.append(condPrice);
							
							sb.append("</td>");
							sb.append("</tr>");		
							
						}
						
						
					}					
				}
				
				
				
				if(null != itemSum && !"".equals(itemSum)){
					tempNetVal = tempNetVal + Math.round(Double.parseDouble(itemSum) * 100d) / 100d;
				}
				if(i < firstRow && (rowCounter + 1 == firstRow || rowCounter == firstRow)){
					for(int j = 0; j < 3; j++){
						sb.append("<tr>");
						sb.append("<td>&nbsp;");
						sb.append("</td>");
						sb.append("</tr>");
					}
					sb.append("</table>");
					detailTable.append(sb.toString());
					rowCounter = 0;
					realRowCounter = 0;
					pageCounter++;
				}else{
					if(rowCounter + 1 == perRow || rowCounter == perRow){
						for(int j = 0; j < 1; j++){
							sb.append("<tr>");
							sb.append("<td>&nbsp;");
							sb.append("</td>");
							sb.append("</tr>");
						}
						sb.append("</table>");
						detailTable.append(sb.toString());
						rowCounter = 0;
						realRowCounter = 0;
						pageCounter++;
					}
					
					if( (lastRow < perRow) && i + 1 == itemList.size()){
						sb.append("</table>");
						detailTable.append(sb.toString());
					}
				}
			}
			elm = doc.getElementById("t_wp");
			elm.text(list.get("T_WP").toString());
			
			elm = doc.getElementById("t_qty");
			elm.text(list.get("VOL_QTY").toString());
			
			elm = doc.getElementById("tprice_eur1");
			
			BMap tempMap = new BMap();
			tempMap.put("netVal", tempNetVal);
			elm.text(salesOrderDao.setGridForm(tempMap));

			elm = doc.getElementById("disPercent");
			elm.text(list.get("DC_VAL").toString());
			
			elm = doc.getElementById("disPercentAmt");
			elm.text(list.get("DC_VAL_P").toString());
			
			elm = doc.getElementById("disAbs");
			elm.text(list.get("DC_VAL_A").toString());
			
			elm = doc.getElementById("freight");
			elm.text(list.get("DVL_AMT").toString());
			
			elm = doc.getElementById("tprice_discount");
			elm.text(list.get("NET_AMT").toString());
			
			elm = doc.getElementById("vat");
			elm.text(list.get("VAT").toString());	
			
			elm = doc.getElementById("vat_amt");
			elm.text(list.get("VAT_AMT").toString());	
			
			elm = doc.getElementById("tprice_eur2");
			elm.text(list.get("T_AMT").toString());	

		}
		logger.error(doc.toString());
		
		bmap.put("MAIL_CD", "QT");
		bmap.put("MAIL_LANG", LoginInfo.getLang());
		bmap.put("COMP_CD", LoginInfo.getCompCd());
		
		long curr = System.currentTimeMillis();
		
		Date date = new Date();
		SimpleDateFormat sdf_Pdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		fileTitle = "ProformaInvoice_" +  param.get("DOC_NO").toString() + "_" + sdf_Pdf.format(new Date(curr)) + ".pdf";
		
		String document = doc.toString();
		document = document.replaceAll("&lt;", "<");
		document = document.replaceAll("&gt;", ">");
		
		HtmlToPdf htmlToPdf = new HtmlToPdf();
		htmlToPdf.createHtmlToPdf(document, fileTitle, list_addr.get("LANG_CD").toString(),list_addr.get("SALES_ORG_CD").toString());
		
		BMap result= new BMap();
		result.put("fileTitle", fileTitle);
		result.put("fileDoc", document);
		
		return result;
	}
	
	/**
	 * @param param
	 * @throws Exception
	 */
	public BMap createOrderConfirmationPdf(HttpServletRequest request, Map<String, Object> param) throws Exception{
		String fileTitle = "";
		Document doc;

System.err.println(param);
		// get data from rdb
		BMap bmap = new BMap();
		bmap.put("DOC_NO", param.get("DOC_NO"));
		bmap.put("CUST_CD", param.get("CUST_CD"));
		bmap.put("G_COMP_CD", LoginInfo.getCompCd());
		bmap.put("DOC_GR", "SO");
		bmap.put("LANG", LoginInfo.getLang());
		bmap.put("QT_YN", "Y");

		BMap list_addr = salesOrderDao.selectCustAddr(bmap);
		// get html from template
		if(list_addr.get("SALES_ORG_CD").toString().equals("3500")) {
			if(list_addr.get("LANG_CD").toString().equals("DE")){
				doc = MailSenderManager.getTemplateDocument(MailSenderManager.TEMPLATE_DOCUMENT_ORDER_CONFIRMATION_DE_3500);
			}else if(list_addr.get("LANG_CD").toString().equals("FR")){
				doc = MailSenderManager.getTemplateDocument(MailSenderManager.TEMPLATE_DOCUMENT_ORDER_CONFIRMATION_FR_3500);
			}else{
				doc = MailSenderManager.getTemplateDocument(MailSenderManager.TEMPLATE_DOCUMENT_ORDER_CONFIRMATION_EN_3500);
			}	
			
		} else {
			if(list_addr.get("LANG_CD").toString().equals("DE")){
				doc = MailSenderManager.getTemplateDocument(MailSenderManager.TEMPLATE_DOCUMENT_ORDER_CONFIRMATION_DE);
			}else if(list_addr.get("LANG_CD").toString().equals("FR")){
				doc = MailSenderManager.getTemplateDocument(MailSenderManager.TEMPLATE_DOCUMENT_ORDER_CONFIRMATION_FR);
			}else{
				doc = MailSenderManager.getTemplateDocument(MailSenderManager.TEMPLATE_DOCUMENT_ORDER_CONFIRMATION_EN);
			}			
		}		

		
		bmap.put("LANG", list_addr.get("LANG_CD").toString());
		
		Element elm = doc.getElementById("sold_street");
		elm.text(list_addr.get("SOLD_STREET").toString());
		
		elm = doc.getElementById("sold_post");
		elm.text(list_addr.get("SOLD_POST").toString());
		
		elm = doc.getElementById("sold_cust_nm");
		elm.text(list_addr.get("SOLD_CUST_NM").toString());

		elm = doc.getElementById("ship_street");
		elm.text(list_addr.get("SHIP_STREET").toString());
		
		elm = doc.getElementById("ship_post");
		elm.text(list_addr.get("SHIP_POST").toString());
		
		elm = doc.getElementById("ship_cust_nm");
		elm.text(list_addr.get("SHIP_CUST_NM").toString());
		
		BMap list = salesOrderDao.selectQuotationReport(bmap);
		
		elm = doc.getElementById("docno_h");
		elm.text(list.get("DOC_NO").toString());
		
		elm = doc.getElementById("docno");
		elm.text(list.get("DOC_NO_DATE").toString());
		
		elm = doc.getElementById("cust");
		elm.text(list.get("SOLD_CUST_CD").toString());
		
		elm = doc.getElementById("shipment");
		elm.text(list.get("SHP_CON_CD").toString());
				
		elm = doc.getElementById("udoc");
		elm.text(list.get("PO_NO").toString());
		
		elm = doc.getElementById("incoterms");
		elm.text(list.get("INCOTERMS_NM").toString());
		
		elm = doc.getElementById("payterm");
		elm.text(list.get("PAY_TERM_NM").toString());
		
		//BMap createForlist = salesOrderDao.selectCreateFor(bmap);

		//if(null != createForlist){
//			elm = doc.getElementById("orderof");
//			elm.text(createForlist.get("FULL_NM").toString());			
		//}
		
//		elm = doc.getElementById("pricevalid");
//		elm.text(list.get("PRICE_DT").toString());
		
		BMap contactlist = salesOrderDao.selectContactPersonReport(bmap);
		
		if(null != contactlist){
			elm = doc.getElementById("contact");
			elm.text(contactlist.get("FULL_NM").toString());
			
			elm = doc.getElementById("tel");
			elm.text(contactlist.get("TEL_NO1").toString());
			
			elm = doc.getElementById("fax");
			elm.text(contactlist.get("FAX_NO").toString());
			
//			elm = doc.getElementById("email");
//			elm.text(contactlist.get("E_MAIL").toString());
		}
		
		BMap byOrderOf = salesOrderDao.selectByOrderOf(bmap);
		
		if(null != byOrderOf){
//			elm = doc.getElementById("qckam");
//			elm.text(byOrderOf.get("FULL_NM").toString());
		}		
		
		BMap salesText = salesOrderDao.getPDFHeaderData(bmap);
		
		if(null != salesText){
			elm = doc.getElementById("head_text");
			elm.text(salesText.get("MATL_TEXT").toString());
		}	
		
		List<BMap> itemList = salesOrderDao.selectItemTab(bmap);
		int rowCounter = 0;
		int realRowCounter = 0;
		int pageCounter = 1;
		int textLength = 20;
		int firstRow = 15;
		int perRow = 25;
		
		StringBuilder sb = new StringBuilder();
		
		double tempNetVal = 0.00;
		if (itemList != null && itemList.size() > 0) {
			for (int i = 0; i < itemList.size(); i++) {
				
				rowCounter++;
				realRowCounter++;
				
				int lastRow = itemList.size() - ((pageCounter * perRow) + firstRow);
				
				BMap map = itemList.get(i);
				
				String pos = map.getString("ITEM_SEQ");
				String matlcd = map.getString("MATL_CD");
				String matlnm = map.getString("MATL_DESC");
				String delidt = map.getString("DELI_DT_1ST");
				String qty = map.getString("ORD_QTY");
				String unit = map.getString("ORD_UNIT_CD");
				String uprice = map.getString("NET_PRICE");
				//String per = map.getString("PER");
				String tprice = list.get("T_AMT").toString();
				String curr = map.getString("CURR");
				String per = map.getString("ZPNN_PER");
				String uom = map.getString("ZPNN_UOM");
				String netval = map.getString("NET_VAL");
				String itemSum = map.getString("PRINT_ITEM_SUM");
				String itemNetVal = map.getString("ITEM_SUM");
				
				if(list_addr.get("LANG_CD").toString().equals("DE")){
					if ( uom.equals("PCS")) {
						uom = "ST";
					}
					
					if( unit.equals("PCS") ) {
						unit = "ST";
					}
				}
				
				
				Element headerTable = doc.getElementById("header_table");
				Element detailTable = doc.getElementById("detail_table");
				
				if(rowCounter == 1){
					sb.setLength(0);
					sb.append("<table width=\"100%\" class=\"report_table_line\" style=\"font-family:Arial;\">");
				}
				
				if(1 < pageCounter && rowCounter == 1){
					detailTable.append("<br>" + headerTable.html());
				}
				sb.append("<tr>");
				sb.append("<td width=\"5%\" height=\"40\">");
				sb.append(pos);
				sb.append("</td>");
				
				sb.append("<td width=\"10%\" height=\"40\">");
				sb.append(matlcd);
				sb.append("</td>");
				
				sb.append("<td width=\"20%\" height=\"40\"  align=\"left\">");
				sb.append(matlnm);
				sb.append("</td>");
				
				sb.append("<td width=\"10%\" height=\"40\" align=\"left\">");
				sb.append(delidt);
				sb.append("</td>");

				sb.append("<td width=\"9%\" height=\"40\" align=\"right\">");
				sb.append(qty);
				sb.append("</td>");
				
				sb.append("<td width=\"10%\" height=\"40\" align=\"center\" style=\"padding-left:20px\">");
				sb.append(unit);
				sb.append("</td>");
				
				sb.append("<td width=\"14%\" height=\"40\" align=\"right\">");
				sb.append(uprice + ' ' + curr);
				sb.append("</td>"); 

				sb.append("<td width=\"9%\" height=\"40\" align=\"right\">");
				sb.append(per + uom);
				sb.append("</td>");
				
				sb.append("<td width=\"15%\" height=\"40\" align=\"right\">");
//				if(itemList.size() > 0){
//					BMap tempMap = new BMap();
//					tempMap.put("netVal", netval);
					sb.append(itemNetVal);
//				}
				sb.append("</td>");
				sb.append("</tr>");
				
				bmap.put("ITEM_SEQ", pos);
				
				List<BMap> conditionList = salesOrderDao.selectPDFConditionTab(bmap);
				
				if (conditionList != null && conditionList.size() > 0) {
					for (int j = 0; j < conditionList.size(); j++) {
						BMap condMap = conditionList.get(j);
						
						String condNum = condMap.getString("ROWNUM");
						String condDesc = condMap.getString("COND_DESC");
						String condPrice = condMap.getString("PRICE");
						String condcurr = condMap.getString("COND_CURR_CD");
						String unitPrice = condMap.getString("COND_VAL");
						
						if ( condNum.equals("9999999") ) {
							sb.append("<tr style=\"font-size: 14px; \">");
							sb.append("&nbsp;");
							sb.append("</td>");
//							
//							sb.append("<td width=\"10%\" height=\"25\">");
//							sb.append("&nbsp;");
//							sb.append("</td>");
//							
//							sb.append("<td width=\"20%\" height=\"25\"  align=\"left\">");
//							sb.append("&nbsp;");
//							sb.append("</td>");
							
							sb.append("<td width=\"35%\" height=\"25\" align=\"right\" style=\"font-size: 14px;\" colspan=\"3\">");
							sb.append("<strong>" + condDesc + "</strong>");
							sb.append("</td>");

//							sb.append("<td width=\"9%\" height=\"25\" align=\"right\"  >");
//							sb.append("&nbsp;");
//							sb.append("</td>");
//							
//							sb.append("<td width=\"10%\" height=\"25\" align=\"center\" style=\"padding-left:20px\">");
//							sb.append("&nbsp;");
//							sb.append("</td>");
							
							sb.append("<td width=\"40%\" height=\"25\" align=\"right\" style=\"font-size: 14px;\" colspan=\"4\">");
							sb.append(unitPrice);
							sb.append("</td>"); 

//							sb.append("<td width=\"9%\" height=\"25\" align=\"right\">");
//							sb.append("&nbsp;");
//							sb.append("</td>");
							
							sb.append("<td width=\"25%\" height=\"25\" align=\"right\" style=\"padding-right: 4%; font-size: 14px;\" colspan=\"2\">");
							sb.append(condPrice);
							
							sb.append("</td>");
							sb.append("</tr>");
						} else {
							
							sb.append("<tr>");
							sb.append("&nbsp;");
							sb.append("</td>");
//							
//							sb.append("<td width=\"10%\" height=\"25\">");
//							sb.append("&nbsp;");
//							sb.append("</td>");
//							
//							sb.append("<td width=\"20%\" height=\"25\"  align=\"left\">");
//							sb.append("&nbsp;");
//							sb.append("</td>");
							
							sb.append("<td width=\"35%\" height=\"25\" align=\"right\" style=\"font-size: 14px;\" colspan=\"3\">");
							sb.append(condDesc);
							sb.append("</td>");

//							sb.append("<td width=\"9%\" height=\"25\" align=\"right\"  >");
//							sb.append("&nbsp;");
//							sb.append("</td>");
//							
//							sb.append("<td width=\"10%\" height=\"25\" align=\"center\" style=\"padding-left:20px\">");
//							sb.append("&nbsp;");
//							sb.append("</td>");
							
							sb.append("<td width=\"40%\" height=\"25\" align=\"right\" style=\"font-size: 14px;\" colspan=\"4\">");
							sb.append("&nbsp;");
							sb.append("</td>"); 

//							sb.append("<td width=\"9%\" height=\"25\" align=\"right\">");
//							sb.append("&nbsp;");
//							sb.append("</td>");
							
							sb.append("<td width=\"25%\" height=\"25\" align=\"right\" style=\"padding-right: 4%; font-size: 14px;\" colspan=\"2\">");
							sb.append(condPrice);
							
							sb.append("</td>");
							sb.append("</tr>");		
							
						}
						
						
					}					
				}
				
				
				
				if(null != itemSum && !"".equals(itemSum)){
					tempNetVal = tempNetVal + Math.round(Double.parseDouble(itemSum) * 100d) / 100d;
				}
				if(i < firstRow && (rowCounter + 1 == firstRow || rowCounter == firstRow)){
					for(int j = 0; j < 3; j++){
						sb.append("<tr>");
						sb.append("<td>&nbsp;");
						sb.append("</td>");
						sb.append("</tr>");
					}
					sb.append("</table>");
					detailTable.append(sb.toString());
					rowCounter = 0;
					realRowCounter = 0;
					pageCounter++;
				}else{
					if(rowCounter + 1 == perRow || rowCounter == perRow){
						for(int j = 0; j < 1; j++){
							sb.append("<tr>");
							sb.append("<td>&nbsp;");
							sb.append("</td>");
							sb.append("</tr>");
						}
						sb.append("</table>");
						detailTable.append(sb.toString());
						rowCounter = 0;
						realRowCounter = 0;
						pageCounter++;
					}
					
					if( (lastRow < perRow) && i + 1 == itemList.size()){
						sb.append("</table>");
						detailTable.append(sb.toString());
					}
				}
			}
			elm = doc.getElementById("t_wp");
			elm.text(list.get("T_WP").toString());
			
			elm = doc.getElementById("t_qty");
			elm.text(list.get("VOL_QTY").toString());
			
			elm = doc.getElementById("tprice_eur1");
			
			BMap tempMap = new BMap();
			tempMap.put("netVal", tempNetVal);
			elm.text(salesOrderDao.setGridForm(tempMap));

			elm = doc.getElementById("disPercent");
			elm.text(list.get("DC_VAL").toString());
			
			elm = doc.getElementById("disPercentAmt");
			elm.text(list.get("DC_VAL_P").toString());
			
			elm = doc.getElementById("disAbs");
			elm.text(list.get("DC_VAL_A").toString());
			
			elm = doc.getElementById("freight");
			elm.text(list.get("DVL_AMT").toString());
			
			elm = doc.getElementById("tprice_discount");
			elm.text(list.get("NET_AMT").toString());
			
			elm = doc.getElementById("vat");
			elm.text(list.get("VAT").toString());	
			
			elm = doc.getElementById("vat_amt");
			elm.text(list.get("VAT_AMT").toString());	
			
			elm = doc.getElementById("tprice_eur2");
			elm.text(list.get("T_AMT").toString());	

		}
		logger.error(doc.toString());
		
		bmap.put("MAIL_CD", "QT");
		bmap.put("MAIL_LANG", LoginInfo.getLang());
		bmap.put("COMP_CD", LoginInfo.getCompCd());
		
		long curr = System.currentTimeMillis();
		
		Date date = new Date();
		SimpleDateFormat sdf_Pdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		fileTitle = "OrderConfirmation_" +  param.get("DOC_NO").toString() + "_" + sdf_Pdf.format(new Date(curr)) + ".pdf";
		
		String document = doc.toString();
		document = document.replaceAll("&lt;", "<");
		document = document.replaceAll("&gt;", ">");
		
		HtmlToPdf htmlToPdf = new HtmlToPdf();
		htmlToPdf.createHtmlToPdf(document, fileTitle, list_addr.get("LANG_CD").toString(),list_addr.get("SALES_ORG_CD").toString());
		
		BMap result= new BMap();
		result.put("fileTitle", fileTitle);
		result.put("fileDoc", document);
		
		return result;
	}
	
	
	public String selectItemPlant(BMap param) throws Exception{
		
		List<BMap> plantList = salesOrderDao.selectItemPlant(param);
		
		String resultValue = "";
		for (int i = 0; i < plantList.size(); i++) {
			resultValue += ";" + plantList.get(i).getString("PLANT_CD")+ ":" + plantList.get(i).getString("PLANT_NM");
		}

		return resultValue;
	}
	

	public String selectStoreLocPopList(BMap param) throws Exception{
		
		List<BMap> sotreLocList = salesOrderDao.selectStoreLocPopList(param);
		
		String resultValue = "";
		for (int i = 0; i < sotreLocList.size(); i++) {
			resultValue += ";" + sotreLocList.get(i).getString("STORE_LOC")+ ":" + sotreLocList.get(i).getString("STORE_LOC_NM");
		}

		return resultValue;
	}
	
	/**
	 * 
	 * @param req
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectFileAttach(String docno) throws Exception {

		Map<String, Object> param = new HashMap<String, Object>();	
		param.put("IV_VBELN", docno);
		
		Map<String, Object> somap = new HashMap<String, Object>();
		List<SAPTable> result = SAPConnectorManager.execute(SAPDataProvider.ERP, "ZGOS_GET_FILE_LIST", param);		
		if (result != null) {		
			/*
			for (int i = 0; i < result.size(); i++) {
				List<Map<String, Object>> list = result.get(i).getRows();				
				logger.debug("_____1 "+ result.get(i).getTableName());
				for (int j = 0; j < list.size(); j++) {
					logger.debug("_____2 "+ list.get(j).toString());
				}
			}
			*/		

			for(int i = 0; i < result.size(); i++) {
				SAPTable tempMap = result.get(i);		
				// logger.debug("_____3 "+ tempMap.getTableName());
				if ("T_ATTACHMENTS".equals(tempMap.getTableName())) {
					List<Map<String, Object>> list = tempMap.getRows();
					
					// logger.debug("_____4 "+ list);
					somap.put("filelist", list);	
				}			
			}
		}
		
		return somap;
	} 
	
	/**
	 * 엑셀을 업로드하여 읽어와 list화 시켜 리턴
	 * @param req
	 * @return
	 * @throws Exception
	 */
	public void getSAPATTACH(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String docno = req.getParameter("docno");
		String objno = req.getParameter("objno");
		
		docno = StringUtils.LPadding(docno, '0', 10);
		objno = StringUtils.LPadding(objno, '0', 12);
		
		// 000000000106
		logger.debug("getSAPATTACH >> " + docno + " / " + objno);
		
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("IV_VBELN", docno);
		param.put("IV_DOCNO", objno);
		
		List<SAPTable> result = SAPConnectorManager.executeBinary(SAPDataProvider.ERP, "ZGOS_GET_FILE_XSTRING", param);
		
		if (result != null) {
			
			String filename = "";
			byte[] data = null;
			for(SAPTable tempT : result) {				
				if ("ExportParameter".equals(tempT.getTableName())) {
					// logger.debug("0" + tempT.getTableName());
					Map<String, Object> tempM = tempT.getRow();
					
					filename = (String) tempM.get("O_FILE_NAME");
					// logger.debug("1" + tempM.get("O_FILE_NAME"));
					// logger.debug("2" + tempM.get("O_MIMETYPE"));
					data = (byte[]) tempM.get("O_CONTENT_HEX");
					// logger.debug("3" + data + " / " + data.length);		
				}
			}
			
	        String userAgent 	= req.getHeader("User-Agent");
			if(userAgent.indexOf("MSIE") > -1){
				filename = URLEncoder.encode(filename, "utf-8");
			}else if (userAgent.indexOf("Trident") > -1) { //MS IE 11
				filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "\\ ");
		    }else{
		    	filename = new String(filename.getBytes("utf-8"), "iso-8859-1");
			}
			
			// logger.debug("4");
			
	        //웹브라우저가 파일을 다운로드 받로록 하려면 다음과 같이 컨테츠타입지정
	        resp.setContentType("application/octet-stream");
	        //response.setContentType("application/download; charset=utf-8");         
	        resp.setContentLength(data.length);//콘텐트 크기 지정
	        //Content-Disposition헤더를 이용해서 전송되는 파일의 이름을 명시
	        resp.setHeader("Content-Disposition", "attachment; filename=\""+ filename +"\"");
	        //전송되는 데이터의 인코딩이 바이너리 타입이라는것을 명시
	        resp.setHeader("Content-Transfer-Encoding","binary");
	        resp.setHeader("Pragma",  "no-cache;");
	        resp.setHeader("Expires", "-1;");
	        
	        // logger.debug("5");	        
	        OutputStream out = resp.getOutputStream();  
	        try {             
	        	out.write(data);
	        } catch(FileNotFoundException e){
	        	// logger.debug("6" + e.getMessage());
	        	out.close();
	        } catch(Exception e) {    
	        	// logger.debug("6" + e.getMessage());
	        	out.close();          
	        }
	         
	        out.flush();
	        out.close(); 
		}
	}
	
	
	/**
	 * 엑셀을 업로드하여 읽어와 list화 시켜 리턴
	 * @param req
	 * @return
	 * @throws Exception
	 */
	public BRespData uploadSAPATTACH(HttpServletRequest req) throws Exception{
		
		String docno = req.getParameter("DOC_NO");
		docno = StringUtils.LPadding(docno, '0', 10);		
		
		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest) req;
		
		List<MultipartFile> files =  mpRequest.getFiles("fileupload[]");
		
		for (MultipartFile file : files) {
			CommonsMultipartFile cmf = (CommonsMultipartFile) file;	
			
			String filename = cmf.getOriginalFilename();   	
	    	String nFileName = StringUtils.getUUID() + "." + FileManager.getExtension(filename);
	    				
	    	// 임시로 파일 저장
	    	FileManager.mkDir(env.getProperty("TEMPPATH"));	    	
	    	File temfile = new File(env.getProperty("TEMPPATH") + nFileName);
	        FileOutputStream fos = new FileOutputStream(temfile);
	    	Streams.copy(cmf.getInputStream(), fos, true);
	    	req.getInputStream().close();
	    	fos.close();
					
			// 파일 업로더 처리
	    	FileManager.mkDir(env.getProperty("NOTICE_IMAGEPATH"));	    
	    	FileTransferManager transferManager = new FileTransferManager(env.getProperty("NOTICE_IMAGEPATH"));    	
	    	
	    	transferManager.addFilter( new FileExtFilter(env.getProperty("EXTENDWHITELIST"), filename) ); // 확장자 필터링	    	
	    	transferManager.addFilter( new FileMaxUploadFilter(Integer.parseInt(env.getProperty("MAXFILESIZE")), temfile.length()) ); // 업로더 최대 용량 필터링
	    	
	    	transferManager.upload(nFileName, temfile);	    	
	    	
	    	File f = new File(env.getProperty("NOTICE_IMAGEPATH") + nFileName);
	    	byte[] data = Files.readAllBytes(f.toPath());
	    	
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("IV_VBELN", docno);
			param.put("IV_NAME", filename);
			// param.put("IV_CONTENT", "");
			param.put("IV_CONTENT_HEX", data);

			logger.debug("data >> " + param);
			logger.debug("data length >> " + data.length);
						
			SAPConnectorManager.executeBinary(SAPDataProvider.ERP, "ZGOS_ATTACH_FILE_XSTRING", param);
	    	
		}
		
		return new BRespData(ResponseStatus.OK);
	}	
	
	
	/**
	 * 엑셀을 업로드하여 읽어와 list화 시켜 리턴
	 * @param req
	 * @return
	 * @throws Exception
	 */
	public BRespData removeSAPATTACH(Map<String, Object> param) throws Exception {		
		
		SAPConnectorManager.execute(SAPDataProvider.ERP, "ZGOS_DELETE_FILE", param);
		
		return new BRespData(ResponseStatus.OK);
	}	
	
}