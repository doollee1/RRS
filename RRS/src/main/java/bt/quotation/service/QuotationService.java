package bt.quotation.service;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.DataSource;
import javax.annotation.Resource;
import javax.mail.util.ByteArrayDataSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.context.MessageSource;
import org.springframework.core.env.Environment;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import bt.btframework.common.vo.CodeVO;
import bt.btframework.mail.MailSenderManager;
import bt.btframework.utils.BMap;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.HtmlToPdf;
import bt.btframework.utils.LoginInfo;
import bt.common.dao.MailManagementDao;
import bt.customer.dao.ContactPersonDao;
import bt.quotation.dao.QuotationDao;
import bt.salesOrder.dao.SalesOrderDao;

@Service("QuotationService")
public class QuotationService {
	private static final Logger logger = LoggerFactory.getLogger(QuotationService.class);
	
	@Resource(name = "SalesOrderDao")
	private SalesOrderDao salesOrderDao;

	@Resource(name = "QuotationDao")
	private QuotationDao quotationDao;
	
	@Resource(name = "ContactPersonDao")
	private ContactPersonDao contactPersonDao;
	
	@Resource
	private MailManagementDao mailManagementDao;
	
	@Autowired
	SessionLocaleResolver localeResolver;
	
	@Autowired
	MessageSource messageSource;
	
    @Autowired
    private Environment env;
	/**
	 * search Quotation List
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> searchQuotationList(BMap param) throws Exception {
		return salesOrderDao.searchSalesOrderList(param);
	}

	/**
	 * search Approval List
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> searchApprovalList(BMap param) throws Exception {
		return quotationDao.searchApprovalList(param);
	}
	
	/**
	 * Quotation 저장
	 * @param master
	 * @param detail
	 * @throws Exception
	 */
	public String SaveQuotation(BMap param) throws Exception{
		
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
		
		if(null != headData){
			
			headData.put("USERID", userId);
			headData.put("DOC_GR", "QT");
			
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
						scMap.put("G_COMP_CD", headData.get("G_COMP_CD"));
						scMap.put("DOC_GR", headData.get("DOC_GR"));
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
						tempMap.put("DOC_GR", "QT");
						
						if("U".equals(tempMap.get("ROW_STATUS"))){
							salesOrderDao.updateSalesScdl(tempMap);
						}
					}
				}
			}
			
			param.put("DOC_NO", docNo);
			param.put("COMP_CD", headData.get("G_COMP_CD"));
			
//			if(null != headData.get("APPROVAL_STS") && "N".equals(headData.get("APPROVAL_STS"))){
//				salesOrderDao.deleteAppr(headData);
//				for(int i = 1; i <= apprLv; i++){
//					headData.put("APPR_ID", apprData.get("REF_CHR" + String.valueOf(i)));
//					headData.put("PRIORITY", i);
//					salesOrderDao.insertAppr(headData);
//				}
//			}
		}
		
		return docNo;
	}
	
	/**
	 * Quotation Info 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap selectQuotationInfo(BMap param) throws Exception{
		return salesOrderDao.selectSalesOrderInfo(param);
	}
	
	/**
	 * Approval Info 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap selectApprovalInfo(BMap param) throws Exception{
		return salesOrderDao.selectApprovalInfo(param);
	}
	
	/**
	 * Approval Item Tab 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectApprovalItem(BMap param) throws Exception{
		return salesOrderDao.selectApprovalItem(param);
	}
	
	
	/**
	 * Quotation Partner Tab 조회.
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
	 * Quotation Item Tab 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectItemTab(BMap param) throws Exception{
		return salesOrderDao.selectItemTab(param);
	}
	
	/**
	 * Approval List 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectApprovalList(BMap param) throws Exception{
		return salesOrderDao.selectApprovalList(param);
	}
	
	/**
	 * Quotation Scdl Tab 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectScdlTab(BMap param) throws Exception{
		return salesOrderDao.selectScdlTab(param);
	}
	
	/**
	 * Quotation Approval Status
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Boolean updateApproval(BMap param) throws Exception{
		Boolean isValid = true;
		int cnt = salesOrderDao.selectApprovalCnt(param); //현 ID가 등록된 ID인지 카운트 
		if(cnt != 0){
			salesOrderDao.updateApproval(param);
		}else{
			isValid = false;
		}
		return isValid;
	}
	
	/**
	 * Sales Order 승인 업데이트 (1차 승인)
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Boolean updateApproval_pre(BMap param) throws Exception{
		Boolean isValid = true;
		salesOrderDao.updateApproval_pre(param);
		
		return isValid;
	}
	
	
	/**
	 * Sales Order 승인 업데이트 (1차 승인)
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Boolean updateApprovalAll_pre(BMap param) throws Exception{
		Boolean isValid = true;
		
		List<Map<String, Object>> gridData = (List<Map<String, Object>>) param.get("gridData");
		
		if(null != gridData){
			for(Map<String, Object> tempMap : gridData){

				System.err.println(tempMap);
				tempMap.put("USER_ID", param.get("USER_ID"));
				//tempMap.put("APPR_ID", param.get("APPR_ID"));
				tempMap.put("G_COMP_CD", param.get("G_COMP_CD"));
				tempMap.put("APPROVAL_STS", "Y");
								
				salesOrderDao.updateApprovalAll_pre(tempMap);
			}
		}		
		
		return isValid;
	}
	
	/**
	 * Quotation Approval Status
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Boolean updateApprovalAll(BMap param) throws Exception{
		Boolean isValid = true;
		
		List<Map<String, Object>> gridData = (List<Map<String, Object>>) param.get("gridData");
		
		if(null != gridData){
			for(Map<String, Object> tempMap : gridData){

				tempMap.put("USER_ID", param.get("USER_ID"));
				//tempMap.put("APPR_ID", param.get("APPR_ID"));
				tempMap.put("G_COMP_CD", param.get("G_COMP_CD"));
				tempMap.put("APPROVAL_STS", "Y");
								
				int cnt = salesOrderDao.selectApprovalCntAll(tempMap); //현 ID가 등록된 ID인지 카운트 
//				System.err.println("cnt::"+cnt);
				if(cnt != 0){
					salesOrderDao.updateApprovalAll(tempMap);
				}else{
					isValid = false;
				}
			}
		}		
		
		return isValid;
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
	 * Quotation Item Partner Grid 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectItemPfGrid(BMap param) throws Exception{
		return salesOrderDao.selectPartnerFnc(param);
	}
	
	/**
	 * Quotation Temp 저장
	 * @param master
	 * @param detail
	 * @throws Exception
	 */
	public String SaveTempQuotation(BMap param) throws Exception{
		
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
		headData.put("DOC_GR", "QT");
		
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
	 * Confirm Quotation
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void confirmQuotation(BMap param) throws Exception{
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
		
		if(null != headData){
			
			headData.put("USERID", userId);
			headData.put("DOC_GR", "QT");
			
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

				//System.err.println("headData :::" +headData);
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

//				System.err.println("getApprData(param) :::" +param);
				
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
				
				for(Map<String, Object> tempMap : itemGrdApr){
					String itemWP = salesOrderDao.selectItemWP(tempMap);
					
					if ( itemWP == null ) itemWP = "1";
					
					if ( itemWP != null ) {

						double erpPrice = Double.parseDouble(changeNormForm(String.valueOf(tempMap.get("ERP_PRICE"))));
						double reqPrice = Double.parseDouble(changeNormForm(String.valueOf(tempMap.get("REQUESTED_PRICE"))));
						
						if ( (erpPrice - reqPrice) > 1 ) {
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
				
//				System.err.println("apprData :::" +apprData);
			
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
////						System.err.println("per::" + per);
////						System.err.println("netPrice::" + netPrice);
////						System.err.println("zpnnPrice::" + zpnnPrice);
////						System.err.println("erpPrice::" + erpPrice);
//						
////						if((erpPrice - netPrice) < apprData.getDouble("REF_NUM1")){
//						if((erpPrice - zpnnPrice) < apprData.getDouble("REF_NUM1")){
//							if(apprLv < 2){
//								apprLv = 1;
//							}
////						}else if(apprData.getDouble("REF_NUM1") < (erpPrice - netPrice)){
//						}else if(apprData.getDouble("REF_NUM1") < (erpPrice - zpnnPrice)){
//							apprLv = 2;
//							//totWp += per * Double.parseDouble((String)tempMap.get("ORD_QTY"));
//							
//						//	totWp += Double.parseDouble(itemWP) * Double.parseDouble((String)tempMap.get("ORD_QTY"));
////							System.err.println("item Wp::" + totWp);
//						}
//						
//						totWp = totWp + Double.parseDouble(itemWP) * Double.parseDouble((String)tempMap.get("ORD_QTY"));
//						
//					}
//				}

//				System.err.println("totWp::" + totWp);
				
//				if(apprLv == 2 && apprData.getDouble("REF_NUM2") < totWp){
//					apprLv = 3;
//				}
			}
		}
		
		//기존 데이터 이관
		salesOrderDao.moveAppr(headData);
		
		salesOrderDao.deleteAppr(headData);
		
		int addPriority = 0;
		
		//country head
		addPriority++;
		
		String countryHead = salesOrderDao.getCounrtyHead(headData);

//		System.err.println("countryHead::" + countryHead);
		
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
//			System.err.println("salesPlanning::" + salesPlanning);
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
	}
	
	/**
	 * Delete Quotation
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void deleteQuotation(BMap param) throws Exception{
		salesOrderDao.deleteSalesOrder(param);
	}
	
	/**
	 * Quotation Condition Tab 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectConditionTab(BMap param) throws Exception{
		return salesOrderDao.selectConditionTab(param);
	}
	
	/**
	 * Quotation Condition Dtl Tab 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectConditionDtlTab(BMap param) throws Exception{
		return salesOrderDao.selectConditionDtlTab(param);
	}
	
	/**
	 * Quotation Condition Tab 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public String copyQuotation(Map<String, Object> param) throws Exception{
		
		String tempDocNo = salesOrderDao.getSalesTempSeq(param);
		param.put("TEMP_DOC_NO", tempDocNo);
		
		salesOrderDao.copySalesHeader(param);
		salesOrderDao.copySalesPf(param);
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
		param.put("DOC_GR", "QT");
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
	 * @param param
	 * @throws Exception
	 */
	public BMap createPdf(HttpServletRequest request, Map<String, Object> param) throws Exception{
		String fileTitle = "";
		Document doc;

		// get data from rdb
		BMap bmap = new BMap();
		bmap.put("DOC_NO", param.get("DOC_NO"));
		bmap.put("CUST_CD", param.get("CUST_CD"));
		bmap.put("G_COMP_CD", LoginInfo.getCompCd());
		bmap.put("DOC_GR", "QT");
		bmap.put("LANG", LoginInfo.getLang());
		bmap.put("QT_YN", "Y");

		BMap list_addr = salesOrderDao.selectCustAddr(bmap);

		// get html from template
		if(list_addr.get("SALES_ORG_CD").toString().equals("3500")) {
			if(list_addr.get("LANG_CD").toString().equals("DE")){
				doc = MailSenderManager.getTemplateDocument(MailSenderManager.TEMPLATE_DOCUMENT_QUOTATION_DE_3500);
			}else if(list_addr.get("LANG_CD").toString().equals("FR")){
				doc = MailSenderManager.getTemplateDocument(MailSenderManager.TEMPLATE_DOCUMENT_QUOTATION_FR_3500);
			}else{
				doc = MailSenderManager.getTemplateDocument(MailSenderManager.TEMPLATE_DOCUMENT_QUOTATION_EN_3500);
			}	
			
		} else {
			if(list_addr.get("LANG_CD").toString().equals("DE")){
				doc = MailSenderManager.getTemplateDocument(MailSenderManager.TEMPLATE_DOCUMENT_QUOTATION_DE);
			}else if(list_addr.get("LANG_CD").toString().equals("FR")){
				doc = MailSenderManager.getTemplateDocument(MailSenderManager.TEMPLATE_DOCUMENT_QUOTATION_FR);
			}else{
				doc = MailSenderManager.getTemplateDocument(MailSenderManager.TEMPLATE_DOCUMENT_QUOTATION_EN);
			}			
		}
		
		bmap.put("LANG", list_addr.get("LANG_CD").toString());
		
		Element elm = doc.getElementById("sold_street");
		elm.text(list_addr.get("SOLD_STREET").toString());
		
		elm = doc.getElementById("sold_post");
		elm.text(list_addr.get("SOLD_POST").toString());
		
		elm = doc.getElementById("sold_cust_nm");
		elm.text(list_addr.get("SOLD_CUST_NM").toString());
		
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
		
		BMap createForlist = salesOrderDao.selectCreateFor(bmap);

		if(null != createForlist){
			elm = doc.getElementById("orderof");
			elm.text(createForlist.get("FULL_NM").toString());			
		}
		
		elm = doc.getElementById("pricevalid");
		elm.text(list.get("PRICE_DT").toString());
		
		BMap contactlist = salesOrderDao.selectContactPersonReport(bmap);
		
		if(null != contactlist){
			elm = doc.getElementById("contact");
			elm.text(contactlist.get("FULL_NM").toString());
			
			elm = doc.getElementById("tel");
			elm.text(contactlist.get("TEL_NO1").toString());
			
			elm = doc.getElementById("email");
			elm.text(contactlist.get("E_MAIL").toString());
		}
		
		BMap byOrderOf = salesOrderDao.selectByOrderOf(bmap);
		
		if(null != byOrderOf){
			elm = doc.getElementById("qckam");
			elm.text(byOrderOf.get("FULL_NM").toString());
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

				sb.append("<td width=\"7%\" height=\"40\" align=\"right\">");
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
					sb.append(netval);
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
		
		fileTitle = "Quotation_" +  param.get("DOC_NO").toString() + "_" + sdf_Pdf.format(new Date(curr)) + ".pdf";
		
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
	public void sendEmailQt(Map<String, Object> param) throws Exception{
		// System.err.println(param);
		BMap bmap = new BMap();
		bmap.put("COMP_CD", LoginInfo.getCompCd());
		bmap.put("MAIL_CD", param.get("MAIL_CD"));
		bmap.put("MAIL_LANG", LoginInfo.getLang());
			
		MultiPartEmail email = MailSenderManager.getInstance();
		String mail_from = "";
		String mail_to = "";
		String mail_cc = "";

		mail_from = param.get("SENDER_T").toString();		
		if ("".equals(mail_from)) {
			mail_from = LoginInfo.getEmail();
		}
		
		email.setFrom(mail_from);
		email.addTo(mail_from);
		if (null != param.get("RECEIVER_T").toString() && "" != param.get("RECEIVER_T").toString()) {
			String recever[] = param.get("RECEIVER_T").toString().split(";");
			for (int i = 0; i < recever.length; i++) {
				email.addTo(recever[i]);
				if (mail_to == "") {
					mail_to = recever[i];
				} else {
					mail_to = mail_to + "; " + recever[i];
				}
			}
		}
		if (null != param.get("CARBON_COPY_T").toString() && "" != param.get("CARBON_COPY_T").toString()) {
			String carbon[] = param.get("CARBON_COPY_T").toString().split(";");
			for (int i = 0; i < carbon.length; i++) {
				email.addCc(carbon[i]);
				if (mail_cc == "") {
					mail_cc = carbon[i];
				} else {
					mail_cc = mail_cc + "; " + carbon[i];
				}
			}
		}
		String title = (String) param.get("MAIL_TITLE_T");
		bmap.put("MAIL_TITLE", title);
		email.setSubject(title);
		String body = (String) param.get("BODY_CONTENTS_T");
		email.setMsg(body);
		bmap.put("MAIL_CONTENTS", body);
		
		////////File to Bytes
		String filename = param.get("FILE_NAME").toString();        
        //String filename = new String(fname.getBytes("iso-8859-1"),"UTF-8");
        String of = param.get("ATTACH_FILE_NAME").toString(); //인코딩 서버 기본값 ("iso-8859-1")
        File downloadFile = new File(env.getProperty("PDF_ATTACHFILEPATH") + filename);
        byte[] bytesArray = Files.readAllBytes(downloadFile.toPath());
		InputStream is = new ByteArrayInputStream(bytesArray);
		DataSource ds = new ByteArrayDataSource(is, "application/pdf");

		email.attach(ds, of, of);
//		email.send();
		
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
	}

	/**
	 * Quotation Order Modi Tms조회.
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public String getModiTms(BMap param) throws Exception{
		return salesOrderDao.getModiTms(param);
	}
	
	/**
	 * Quotation Order Modi Tms조회.
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectApprovalId() throws Exception{
		return salesOrderDao.selectApprovalId();
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
	
	/**
	 * Sales Order Close.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void quotationClosed(BMap param) throws Exception{
		salesOrderDao.salesOrderClosedByHeader(param);
		salesOrderDao.salesOrderClosedByItem(param);
	}
	
	/**
	 * get Partner Customer
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap getPartnerData(BMap param) throws Exception{
		return salesOrderDao.getPartnerData(param);
	}
	
	/**
	 * get Contact Person
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap getContactPersonData(BMap param) throws Exception{
		return salesOrderDao.getContactPersonData(param);
	}
	
	/**
	 * Quotation History 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectHisTab(BMap param) throws Exception{
		return salesOrderDao.selectHisTab(param);
	}
}