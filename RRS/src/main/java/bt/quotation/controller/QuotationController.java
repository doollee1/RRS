package bt.quotation.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.btframework.utils.ResponseStatus;
import bt.common.service.CommonService;
import bt.common.service.MailManagementService;
import bt.common.service.UserService;
import bt.quotation.service.QuotationService;
import bt.salesOrder.service.SalesOrderService;

@Controller
public class QuotationController {
	@Resource(name = "QuotationService")
	private QuotationService quotationService;

	@Resource(name = "CommonService")
	private CommonService commonService;
	
	@Resource(name = "SalesOrderService")
	private SalesOrderService salesOrderService;
	
	@Resource(name = "UserService")
	private UserService userService;
	

	@Resource(name = "MailManagementService")
	private MailManagementService mailManagementService;
	
	
	/**
	 * Move Quotation List Page
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/QuotationList.do")
	public String QuotationList(ModelMap model) throws Exception{
		return "/quotation/QuotationList";
	}
	
	/**
	 * search Quotation List
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/searchQuotationList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData searchQuotationList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("DOC_GR", "QT");
		
		BRespData respData = new BRespData();
		
		respData.put("result", quotationService.searchQuotationList(param));
		
		return respData;
	}

	/**
	 * search Approval List
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/searchApprovalList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData searchApprovalList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("DOC_GR", (String) reqData.get("DOC_GR"));
		param.put("COMP_CD", LoginInfo.getCompCd());
		param.put("USER_ID", LoginInfo.getUserId());
		
		BRespData respData = new BRespData();
		
		respData.put("result", quotationService.searchApprovalList(param));
		
		return respData;
	}
	
	/**
	 * Move Quotation List Page
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/QuotationEntry.do")
	public String QuotationEntry(ModelMap model) throws Exception{
		model.addAttribute("pf_tp", "ERR:;" + commonService.selectCommonCodeGrid("PF_TP"));
		model.addAttribute("text_tp", "ERR:;" + commonService.selectCommonCodeGrid("SO_TEXT_TP").toUpperCase());
		model.addAttribute("text_lang", commonService.selectCommonCodeGrid("LANGUAGE").toUpperCase());
		model.addAttribute("dt_tp", commonService.selectCommonCodeGrid("DT_TP"));
		model.addAttribute("item_cat", "ERR:;" + quotationService.selectItemCatCode("ITEM_CTG_GR").toUpperCase());
		model.addAttribute("unit_cd", commonService.selectCommonCodeGrid("BASIC_UNIT"));
		model.addAttribute("curr_cd", commonService.selectCommonCodeGrid("CURR_CD"));
		model.addAttribute("dvl_blc_cd", commonService.selectCommonCodeGrid("DELI_BLOCK_CD"));
		
		model.addAttribute("uom_tp", ":;ST:PCS;WP:WP");
		model.addAttribute("per_tp", ":;1:1;10:10;100:100;1000:1.000");
		return "/quotation/QuotationEntry";
	}
	
	/**
	 * Save Quotation
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/SaveQuotation.do")
	@ResponseBody
	public BRespData SaveQuotation(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		
		BRespData respData = new BRespData();
		
		respData.put("docNo", quotationService.SaveQuotation(param));
		
		return respData;
	}
	
	/**
	 * Quotation 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/selectQuotationInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectQuotationInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "QT");
		
		BRespData respData = new BRespData();
		
		BMap resultQuotationInfo = quotationService.selectQuotationInfo(param);
		
		if(null == resultQuotationInfo || resultQuotationInfo.isEmpty()){
			respData.put("resultQuotationInfo", null);
		}else{
			respData.put("resultQuotationInfo", resultQuotationInfo);
		}
		
		return respData;
	}
	
	/**
	 * Quotation 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/selectApprovalInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectApprovalInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		
		BRespData respData = new BRespData();
		
		BMap resultApprovalInfo = quotationService.selectApprovalInfo(param);
		
		if(null == resultApprovalInfo || resultApprovalInfo.isEmpty()){
			respData.put("resultApprovalInfo", null);
		}else{
			respData.put("resultApprovalInfo", resultApprovalInfo);
		}
		
		return respData;
	}
	
	/**
	 * Approval Item Tab 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/selectApprovalItem.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectApprovalItem(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());

		BRespData respData = new BRespData();
		
		respData.put("result", quotationService.selectApprovalItem(param));
		
		return respData;
	}
	
	/**
	 * Quotation Partner Tab 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/selectPartnerTab.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectPartnerTab(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "QT");
		param.put("ITEM_SEQ", "000000");
		
		BRespData respData = new BRespData();
		
		HashMap<String, Object> resultPartnerTab = quotationService.selectPartnerTab(param);
		
		respData.put("resultTextsGrid", resultPartnerTab.get("text"));
		respData.put("resultPartnerFncGrid", resultPartnerTab.get("partner"));
		
		return respData;
	}
	
	/**
	 * Quotation Item Tab 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/selectItemTab.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectItemTab(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "QT");
		
		BRespData respData = new BRespData();
		
		respData.put("result", quotationService.selectItemTab(param));
		
		return respData;
	}
	
	/**
	 * Approval List 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/selectApprovalList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectApprovalList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("COMP_CD", LoginInfo.getCompCd());
		
		BRespData respData = new BRespData();
		
		respData.put("result", quotationService.selectApprovalList(param));
		respData.put("userid",LoginInfo.getUserId());
		return respData;
	}
	
	/**
	 * Quotation Scdl Tab 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/selectScdlTab.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectScdlTab(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "QT");
		
		BRespData respData = new BRespData();
		
		respData.put("result", quotationService.selectScdlTab(param));
		
		return respData;
	}
	
	/**
	 * Move Quotation List Page
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/QuotationApproval.do")
	public String QuotationApproval(ModelMap model) throws Exception{
		model.addAttribute("pf_tp", commonService.selectCommonCodeGrid("DT_TP"));
		model.addAttribute("pf_ps_no", commonService.selectCommonCodeGrid("DT_TP"));
		model.addAttribute("text_tp", commonService.selectCommonCodeGrid("TEXT_TP"));
		model.addAttribute("text_lang", commonService.selectCommonCodeGrid("LANGUAGE"));
		return "/quotation/QuotationApproval";
	}
	
	/**
	 * Move Quotation Popup Page
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/QuotationPopup.do")
	public String QuotationPopup(ModelMap model) throws Exception{
		return "/popup/QuotationPopup";
	}
	
	/**
	 * 
	 * @param docNo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/QuotationEmailPopup.do", params = {"docNo"})
	public ModelAndView QuotationEmailPopup(@RequestParam(value = "docNo") String docNo) throws Exception{
		ModelAndView modelView = new ModelAndView("/popup/QuotationEmailPopup");
		modelView.addObject("docNo", docNo);
		return modelView;
	}
	
	/**
	 * Move Approval Popup Page
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/ApprovalPopup.do")
	public String ApprovalPopup(ModelMap model) throws Exception{
		return "/popup/ApprovalPopup";
	}
	
	/**
	 * Quotation Approval update
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/updateApproval.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData updateApproval(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");	
		@SuppressWarnings("unchecked")
		
		BRespData respData = new BRespData();
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("USER_ID", LoginInfo.getUserId());
		
		if(!quotationService.updateApproval(param)){
			respData.put("ALEADY", "Y");
		}else{
			Map<String, Object> doc_no = new HashMap<String, Object>();
			doc_no.put("COMP_CD", LoginInfo.getCompCd());
			doc_no.put("DOC_GR", param.get("DOC_GR"));
			doc_no.put("DOC_NO", param.get("DOC_NO"));
			doc_no.put("USER_ID", param.get("USER_ID"));
			if(null!=param.get("DOC_GR") && param.get("DOC_GR").equals("SO")){
				if(salesOrderService.getIfyn(param) == 0){
					if(null != param.get("APPROVAL_STS") && !param.get("APPROVAL_STS").equals("R")){
						salesOrderService.callRfcForInsert(doc_no);
					}
				}else{
					/*reject인 경우에 sap로 어떻게 업데이트를 해야하는지?  삭제 플래그를 던져야하는지?*/
					if(null != param.get("APPROVAL_STS") && !param.get("APPROVAL_STS").equals("R")){
						salesOrderService.callRfcForUpdate(doc_no);
					}
				}
			}
			if(null != param.get("APPROVAL_STS") && !param.get("APPROVAL_STS").equals("R")){
				salesOrderService.updateNetPrice(doc_no);
			} else {
				salesOrderService.updateNetPriceNull(doc_no);
			}
		}
		return respData;
	}
	
	/**
	 * Quotation Approval update (1차 승인)
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/updateApproval_pre.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData updateApproval_pre(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");	
		@SuppressWarnings("unchecked")
		
		BRespData respData = new BRespData();
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("USER_ID", LoginInfo.getUserId());
		
		if(quotationService.updateApproval_pre(param) && (param.get("MAX_PRIORITY").equals(param.get("PRIORITY")) || param.get("APPROVAL_STS").equals("R"))){
			
			if(!quotationService.updateApproval(param)){
				respData.put("ALEADY", "Y");
			}else{
				Map<String, Object> doc_no = new HashMap<String, Object>();
				doc_no.put("COMP_CD", LoginInfo.getCompCd());
				doc_no.put("DOC_GR", param.get("DOC_GR"));
				doc_no.put("DOC_NO", param.get("DOC_NO"));
				doc_no.put("USER_ID", param.get("USER_ID"));
				if(null!=param.get("DOC_GR") && param.get("DOC_GR").equals("SO")){
					if(salesOrderService.getIfyn(param) == 0){
						if(null != param.get("APPROVAL_STS") && !param.get("APPROVAL_STS").equals("R")){
							salesOrderService.callRfcForInsert(doc_no);
						}
					}else{
						/*reject인 경우에 sap로 어떻게 업데이트를 해야하는지?  삭제 플래그를 던져야하는지?*/
						if(null != param.get("APPROVAL_STS") && !param.get("APPROVAL_STS").equals("R")){
							salesOrderService.callRfcForUpdate(doc_no);
						}
					}
				}

				if(null != param.get("APPROVAL_STS") && !param.get("APPROVAL_STS").equals("R")){
					salesOrderService.updateNetPrice(doc_no);
				} else {
					salesOrderService.updateNetPriceNull(doc_no);
				}
			}
		};
		return respData;
	}
	/**
	 * Quotation Item Matl > Bom 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/selectBomList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectBomList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		
		BRespData respData = new BRespData();
		
		respData.put("result", quotationService.selectBomList(param));
		
		return respData;
	}
	
	/**
	 * Quotation Item Partner Grid 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/selectItemPfGrid.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectItemPfGrid(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "QT");
		
		BRespData respData = new BRespData();
		
		respData.put("result", quotationService.selectItemPfGrid(param));
		
		return respData;
	}
	
	/**
	 * Save Temp Quotation
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/SaveTempQuotation.do")
	@ResponseBody
	public BRespData SaveTempQuotation(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		
		BRespData respData = new BRespData();
		
		respData.put("tempDocNo", quotationService.SaveTempQuotation(param));
		
		return respData;
	}
	
	/**
	 * Confirm Quotation
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/confirmQuotation.do")
	@ResponseBody
	public BRespData confirmQuotation(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("USERID", LoginInfo.getUserId());
		param.put("DOC_GR", "QT");
		
		BRespData respData = new BRespData();
		
		quotationService.confirmQuotation(param);
		
		respData.put("MESSAGE", "OK");
		
		return respData;
	}
	
	/**
	 * Delete Quotation
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/deleteQuotation.do")
	@ResponseBody
	public BRespData deleteQuotation(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("USERID", LoginInfo.getUserId());
		param.put("DOC_GR", "QT");
		
		BRespData respData = new BRespData();
		
		quotationService.deleteQuotation(param);
		
		respData.put("MESSAGE", "OK");
		
		return respData;
	}
	
	/**
	 * Quotation Condition Tab 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/selectConditionTab.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectConditionTab(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "QT");
		
		BRespData respData = new BRespData();
		
		respData.put("result", quotationService.selectConditionTab(param));
		
		return respData;
	}
	
	/**
	 * Quotation Condition Dtl Tab 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/selectConditionDtlTab.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectConditionDtlTab(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "QT");
		
		BRespData respData = new BRespData();
		
		respData.put("result", quotationService.selectConditionDtlTab(param));
		
		return respData;
	}
	
	/**
	 * Quotation Copy.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/copyQuotation.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData copyQuotation(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		Map<String, Object> param = (Map<String, Object>) reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("I_DOC_GR", "QT");
		param.put("S_DOC_GR", "QT");
		param.put("USER_ID", LoginInfo.getUserId());
		
		BRespData respData = new BRespData();
		
		respData.put("tempDocNo", quotationService.copyQuotation(param));
		
		return respData;
	}
	
	/**
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/sendEmailQt.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData sendEmailQt(@RequestBody Map<String, Object> req) throws Exception {
		 quotationService.sendEmailQt(req);
		return new BRespData(ResponseStatus.OK);
	}
	
	/**
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/createPdf.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData createPdf(HttpServletRequest request, @RequestBody Map<String, Object> req) throws Exception {
		
		BRespData respData = new BRespData();
		
		respData.put("fileInfo", quotationService.createPdf(request, req));
		
		return respData;
	}

	/**
	 * Sales Order Modi Tms조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/getModiTms.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getModiTms(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "QT");
		
		BRespData respData = new BRespData();
		
		respData.put("result", quotationService.getModiTms(param));
		
		return respData;
	}
	
	/**
	 * Sales Order Modi Tms조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/selectApprovalId.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectApprovalId(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{

		BRespData respData = new BRespData();
		respData.put("result", quotationService.selectApprovalId());
		
		return respData;
	}
	
	/**
	 * Quotation Order Closed 처리
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/quotationClosed.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData quotationClosed(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "QT");
		
		BRespData respData = new BRespData();
		
		quotationService.quotationClosed(param);
		
		return respData;
	}
	
	/**
	 * Quotation partner 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/getPFData.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getPFData(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "QT");
		
		BRespData respData = new BRespData();
		
		if("PR".equals(param.get("PF_TP"))){
			respData.put("result", quotationService.getContactPersonData(param));
		}else{
			respData.put("result", userService.selectUserInfo(param));
		}
		
		return respData;
	}
	
	/**
	 * Quotation History 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/selectHisTab.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectHisTab(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "QT");

		BRespData respData = new BRespData();
		
		respData.put("result", quotationService.selectHisTab(param));
		
		return respData;
	}
	
	/**
	 * Quotation Approval update
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/quotation/updateApprovalAll.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData updateApprovalAll(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");	
		@SuppressWarnings("unchecked")
		
		BRespData respData = new BRespData();
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("USER_ID", LoginInfo.getUserId());
		
		List<Map<String, Object>> gridData = (List<Map<String, Object>>) param.get("gridData");
		
		if(null != gridData){
			for(Map<String, Object> tempMap : gridData){
				System.err.println(tempMap);
				tempMap.put("USER_ID", param.get("USER_ID"));
				//tempMap.put("APPR_ID", param.get("APPR_ID"));
				tempMap.put("G_COMP_CD", param.get("G_COMP_CD"));
				tempMap.put("APPROVAL_STS", "Y");
				
				
				if(quotationService.updateApprovalAll_pre(param) && (tempMap.get("MAX_PRIORITY").equals(tempMap.get("PRIORITY")))){
					
					if(!quotationService.updateApprovalAll(param)){
						respData.put("ALEADY", "Y");
					}else{
						
						Map<String, Object> doc_no = new HashMap<String, Object>();
						doc_no.put("COMP_CD", LoginInfo.getCompCd());
						doc_no.put("DOC_GR", tempMap.get("DOC_GR"));
						doc_no.put("DOC_NO", tempMap.get("DOC_NO"));
						doc_no.put("USER_ID", tempMap.get("USER_ID"));
						if(null!=tempMap.get("DOC_GR") && tempMap.get("DOC_GR").equals("SO")){
							param.put("DOC_NO", tempMap.get("DOC_NO"));
							param.put("DOC_GR", tempMap.get("DOC_GR"));
							if(salesOrderService.getIfyn(param) == 0){
								if(null != tempMap.get("APPROVAL_STS") && !tempMap.get("APPROVAL_STS").equals("R")){
									salesOrderService.callRfcForInsert(doc_no);
								}
							}else{
								/*reject인 경우에 sap로 어떻게 업데이트를 해야하는지?  삭제 플래그를 던져야하는지?*/
								if(null != tempMap.get("APPROVAL_STS") && !tempMap.get("APPROVAL_STS").equals("R")){
									salesOrderService.callRfcForUpdate(doc_no);
								}
							}
						}

						if(null != param.get("APPROVAL_STS") && !param.get("APPROVAL_STS").equals("R")){
							salesOrderService.updateNetPrice(doc_no);
						} else {
							salesOrderService.updateNetPriceNull(doc_no);
						}
						
						
						//Map<String, Object> doc_no = new HashMap<String, Object>();
						
//						List<Map<String, Object>> gridData = (List<Map<String, Object>>) param.get("gridData");
//						
//						if(null != gridData){
//							for(Map<String, Object> doc_no : gridData){
//								doc_no.put("COMP_CD", LoginInfo.getCompCd());
////								doc_no.put("DOC_GR", param.get("DOC_GR"));
////								doc_no.put("DOC_NO", param.get("DOC_NO"));
//								doc_no.put("USER_ID", param.get("USER_ID"));
//
//								doc_no.put("G_COMP_CD", param.get("G_COMP_CD"));
//								
//								System.err.println(doc_no);
//								
//								if(null!=param.get("DOC_GR") && param.get("DOC_GR").equals("SO")){
//									if(salesOrderService.getIfyn(param) == 0){
//										if(null != param.get("APPROVAL_STS") && !param.get("APPROVAL_STS").equals("R")){
//											salesOrderService.callRfcForInsert(doc_no);
//										}
//									}else{
//										/*reject인 경우에 sap로 어떻게 업데이트를 해야하는지?  삭제 플래그를 던져야하는지?*/
//										if(null != param.get("APPROVAL_STS") && !param.get("APPROVAL_STS").equals("R")){
//											salesOrderService.callRfcForUpdate(doc_no);
//										}
//									}
//								}
//								salesOrderService.updateNetPrice(doc_no);
//							}
//						}	
					}
				}
								
				
			}
		}	
		
		
		
		

		System.err.println("respData   :: " + respData);
		
		return respData;
	}
}