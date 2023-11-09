package bt.salesOrder.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import bt.btframework.utils.StringUtils;
import bt.common.service.CommonService;
import bt.salesOrder.service.SalesOrderService;

@Controller
public class SalesOrderController {
	@Resource(name = "SalesOrderService")
	private SalesOrderService salesOrderService;

	@Resource(name = "CommonService")
	private CommonService commonService;
	
	private static final Logger logger = LoggerFactory.getLogger(SalesOrderService.class);
	
	/**
	 * Move SalesOrder List Page
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/S_Test.do")
	public String SalesOrderTest(ModelMap model) throws Exception{
		return "/salesOrder/S_Test";
	}
	
	
	/**
	 * search SalesOrder List
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/searchS_Test.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData searchS_Test(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("DOC_GR", "SO");
		
		BRespData respData = new BRespData();
		
		respData.put("result", salesOrderService.searchSalesS_Test(param));
		
		return respData;
	}
	
	
	
	/**
	 * Move SalesOrder List Page
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/SalesOrderList.do")
	public String SalesOrderList(ModelMap model) throws Exception{
		return "/salesOrder/SalesOrderList";
	}
	
	/**
	 * search SalesOrder List
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/searchSalesOrderList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData searchSalesOrderList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("DOC_GR", "SO");
		
		BRespData respData = new BRespData();
		
		respData.put("result", salesOrderService.searchSalesOrderList(param));
		
		return respData;
	}
	
	
	/**
	 * Move SalesOrder Entry Page
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/SalesOrderEntry.do")
	public String SalesOrderEntry(ModelMap model) throws Exception{
		model.addAttribute("pf_tp", "ERR:;" + commonService.selectCommonCodeGrid("PF_TP"));
		model.addAttribute("text_tp", "ERR:;" + commonService.selectCommonCodeGrid("SO_TEXT_TP").toUpperCase());
		model.addAttribute("text_lang", commonService.selectCommonCodeGrid("LANGUAGE").toUpperCase());
		model.addAttribute("dt_tp", commonService.selectCommonCodeGrid("DT_TP"));
		model.addAttribute("item_cat", "ERR:;" + salesOrderService.selectItemCatCode("ITEM_CTG_GR").toUpperCase());
		model.addAttribute("unit_cd", commonService.selectCommonCodeGrid("BASIC_UNIT"));
		model.addAttribute("curr_cd", commonService.selectCommonCodeGrid("CURR_CD"));
		model.addAttribute("dvl_blc_cd", commonService.selectCommonCodeGrid("DELI_BLOCK_CD"));
		
		model.addAttribute("seg_value", salesOrderService.selectSegement("SEG_VAL"));
		model.addAttribute("uom_tp", ":;ST:PCS;WP:WP");
		model.addAttribute("per_tp", ":;1:1;10:10;100:100;1000:1.000");
		
		model.addAttribute("q_bonus_yn", commonService.selectCommonCodeGrid("PRICE_GR"));
		
		model.addAttribute("SALES_OFFICE_CD", commonService.selectCommonCode("SALES_OFFICE_CD"));
		model.addAttribute("ORD_RESN_CD", commonService.selectCommonCode("ORD_RESN_CD"));
		model.addAttribute("DELI_PLANT_CD", commonService.selectCommonCode("DELI_PLANT_CD"));
		model.addAttribute("ATTR_ORD", commonService.selectCommonCode("ATTR_ORD"));
		model.addAttribute("INCOTERMS_CD", commonService.selectCommonCode("INCOTERMS_CD"));
		model.addAttribute("DELI_BLOCK_CD", commonService.selectCommonCode("DELI_BLOCK_CD"));
		model.addAttribute("OVL_STS", commonService.selectCommonCode("OVL_STS"));
		model.addAttribute("DELI_STS", commonService.selectCommonCode("DELI_STS"));
		model.addAttribute("SHP_CON_CD", commonService.selectCommonCode("SHP_CON_CD"));
		model.addAttribute("CREDIT_STS", commonService.selectCommonCode("CREDIT_STS"));
		model.addAttribute("SEG_CD", commonService.selectCommonCode("SEG_CD"));
		model.addAttribute("Q_BONUS_YN", commonService.selectCommonCode("Q_BONUS_YN"));
		model.addAttribute("OVL_DVL_STS", commonService.selectCommonCode("OVL_DVL_STS"));
		
		return "/salesOrder/SalesOrderEntry";
	}
	
	/**
	 * Sales Order 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/selectSalesOrderInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectSalesOrderInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		
		if(null != param.get("SOC") && "Y".equals(param.get("SOC"))){
			param.put("DOC_GR", "QT");
		}else{
			param.put("DOC_GR", "SO");
		}
		
		BRespData respData = new BRespData();
		
		BMap resultSalesOrderInfo = salesOrderService.selectSalesOrderInfo(param);
		
		if(null == resultSalesOrderInfo || resultSalesOrderInfo.isEmpty()){
			respData.put("resultSalesOrderInfo", null);
		}else{
			respData.put("resultSalesOrderInfo", resultSalesOrderInfo);
		}
		
		return respData;
	}
	
	/**
	 * Sales Order Partner Tab 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/selectPartnerTab.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectPartnerTab(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "SO");
		param.put("ITEM_SEQ", "000000");
		
		BRespData respData = new BRespData();
		
		HashMap<String, Object> resultPartnerTab = salesOrderService.selectPartnerTab(param);
		
		respData.put("resultTextsGrid", resultPartnerTab.get("text"));
		respData.put("resultPartnerFncGrid", resultPartnerTab.get("partner"));
		
		return respData;
	}
	
	/**
	 * Sales Order Item Tab 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/selectItemTab.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectItemTab(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "SO");
		
		BRespData respData = new BRespData();
		
		respData.put("result", salesOrderService.selectItemTab(param));
		
		return respData;
	}
	
	/**
	 * Sales Order
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/SaveSalesOrder.do")
	@ResponseBody
	public BRespData SaveSalesOrder(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		
		BRespData respData = new BRespData();
		
		respData.put("docNo", salesOrderService.SaveSalesOrder(param));
		
		return respData;
	}
	
	/**
	 * Sales Order Scdl Tab 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/selectScdlTab.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectScdlTab(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "SO");
		
		BRespData respData = new BRespData();
		
		respData.put("result", salesOrderService.selectScdlTab(param));
		
		return respData;
	}
	
	/**
	 * Sales Order Item Matl > Bom 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/selectBomList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectBomList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		
		BRespData respData = new BRespData();
		
		respData.put("result", salesOrderService.selectBomList(param));
		
		return respData;
	}
	
	/**
	 * 
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/selectItemPriceList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectItemPriceList(@RequestBody Map<String, Object> req) throws Exception {
		req.put("G_COMP_CD", LoginInfo.getCompCd());
		req.put("USERID", LoginInfo.getUserId());

		return salesOrderService.selectItemPriceList(req);
	}
	
	/**
	 * Sales Order Partner Function Popup Page
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/PartnerFunctionPopup.do")
	public String QuotationPopup(ModelMap model) throws Exception{
		return "/popup/PartnerFunctionPopup";
	}
	
	/**
	 * Sales Order Partner Function List 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/product/selectPfPopList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectPfPopList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		
		BRespData respData = new BRespData();
		
		respData.put("result", salesOrderService.selectPfPopList(param));
		
		return respData;
	}
	
	
	/**
	 * Move SalesOrder Approval Page
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/SalesOrderApproval.do")
	public String SalesOrderApproval(ModelMap model) throws Exception{
		return "/salesOrder/SalesOrderApproval";
	}
	
	/**
	 * Move Quotation Popup Page
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/SalesOrderPopup.do")
	public String SalesOrderPopup(ModelMap model) throws Exception{
		return "/popup/SalesOrderPopup";
	}
	
	/**
	 * 
	 * @param docNo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/SalesOrderEmailPopup.do", params = {"docNo"})
	public ModelAndView SalesOrderEmailPopup(@RequestParam(value = "docNo") String docNo) throws Exception{
		ModelAndView modelView = new ModelAndView("/popup/SalesOrderEmailPopup");
		modelView.addObject("docNo", docNo);
		return modelView;
	}
	/**
	 * One Time Customer Popup Page
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/OneTimeCustomerPopup.do")
	public String OneTimeCustomerPopup(ModelMap model) throws Exception{
		return "/popup/OneTimeCustomerPopup";
	}
	
	/**
	 * Sales Order Partner Grid 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/selectItemPfGrid.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectItemPfGrid(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "SO");
		
		BRespData respData = new BRespData();
		
		respData.put("result", salesOrderService.selectItemPfGrid(param));
		
		return respData;
	}
	
	/**
	 * Save Temp Quotation
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/SaveTempSalesOrder.do")
	@ResponseBody
	public BRespData SaveTempQuotation(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		
		BRespData respData = new BRespData();
		
		respData.put("tempDocNo", salesOrderService.SaveTempSalseOrder(param));
		
		return respData;
	}
	
	/**
	 * Confirm Sales Order
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/confirmSalesOrder.do")
	@ResponseBody
	public BRespData confirmSalesOrder(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("USERID", LoginInfo.getUserId());
		param.put("DOC_GR", "SO");
		
		BRespData respData = new BRespData();
		
		salesOrderService.confirmSalesOrder(param);
		
		respData.put("MESSAGE", "OK");
		
		return respData;
	}
	
	/**
	 * Delete Sales Order
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/deleteSalesOrder.do")
	@ResponseBody
	public BRespData deleteSalesOrder(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("USERID", LoginInfo.getUserId());
		param.put("DOC_GR", "SO");
		
		BRespData respData = new BRespData();
		
		salesOrderService.deleteSalesOrder(param);
		
		respData.put("MESSAGE", "OK");
		
		return respData;
	}
	
	/**
	 * Sales Order Partner Function List 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/checkItemCatGrpCodeGrid.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectItemCatGrpCodeGrid(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		
		BRespData respData = new BRespData();
		
		respData.put("itemCatGrp", salesOrderService.checkItemCatGrpCodeGrid(param));
		
		return respData;
	}
	
	/**
	 * Sales Order Partner Function List 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/getItemCatGrpCodeGrid.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getItemCatGrpCodeGrid(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		
		BRespData respData = new BRespData();
		
		respData.put("itemCatGrp", salesOrderService.getItemCatGrpCodeGrid(param));
		
		return respData;
	}
	
	@RequestMapping(value = "/salesOrder/selectSalesGrp.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectSalesGrp(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", salesOrderService.selectSalesGrp(param));
		
		return respData;
	}
	
	/**
	 * Sales Order Condition Tab 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/selectConditionTab.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectConditionTab(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "SO");
		
		BRespData respData = new BRespData();
		
		respData.put("result", salesOrderService.selectConditionTab(param));
		
		return respData;
	}
	
	/**
	 * Sales Order Condition Dtl Tab 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/selectConditionDtlTab.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectConditionDtlTab(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "SO");
		
		BRespData respData = new BRespData();
		
		respData.put("result", salesOrderService.selectConditionDtlTab(param));
		
		return respData;
	}
	
	/**
	 * Sales Order Copy.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/copySalesOrder.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData copySalesOrder(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		Map<String, Object> param = (Map<String, Object>) reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		
		if(null != param.get("SOC") && "Y".equals(param.get("SOC"))){
			param.put("I_DOC_GR", "SO");
			param.put("S_DOC_GR", "QT");
		}else{
			param.put("I_DOC_GR", "SO");
			param.put("S_DOC_GR", "SO");
		}
		param.put("USER_ID", LoginInfo.getUserId());
		
		BRespData respData = new BRespData();
		
		respData.put("tempDocNo", salesOrderService.copySalesOrder(param));
		
		return respData;
	}
	
	/**
	 * Sales Order Customer 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/selectCustomerInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectCustomerInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		
		BRespData respData = new BRespData();
		
		respData.put("result", salesOrderService.selectCustomerInfo(param));
		
		return respData;
	}
	
	/**
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/sendEmail.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData sendEmail(@RequestBody Map<String, Object> req) throws Exception {
		salesOrderService.sendEmail(req);
		return new BRespData(ResponseStatus.OK);
	}

	/**
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/sendEmail_Invoice.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData sendEmail_Invoice(@RequestBody Map<String, Object> req) throws Exception {
		salesOrderService.sendEmail_Invoice(req);
		return new BRespData(ResponseStatus.OK);
	}
	
	/**
	 * Sales Order Partner Function List 의 Ship조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/getShipToBySold.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getShipToBySold(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		
		BRespData respData = new BRespData();
		
		respData.put("result", salesOrderService.getShipToBySold(param));
		
		return respData;
	}

	/**
	 * Sales Order Modi Tms조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/getModiTms.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getModiTms(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
//		param.put("DOC_GR", "SO");
		
		BRespData respData = new BRespData();
		
		respData.put("result", salesOrderService.getModiTms(param));
		
		return respData;
	}
	
	/**
	 * 
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/checkSoStatus.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData checkSoStatus(@RequestBody Map<String, Object> req) throws Exception {
		req.put("G_COMP_CD", LoginInfo.getCompCd());
		req.put("USERID", LoginInfo.getUserId());
		req.put("DOC_GR", "SO");

		return salesOrderService.checkSoStatus(req);
	}
	
	/**
	 * Sales Order Batch Pop Up.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/batchPopUp.do")
	public String productPopUp() throws Exception {
		return "/popup/batchPopUp";
	}
	
	@RequestMapping(value = "/popup/plantPopUp.do")
	public String plantPopUp() throws Exception {
		return "/popup/plantPopUp";
	}

	@RequestMapping(value = "/popup/storeLocPopUp.do")
	public String storeLocPopUp() throws Exception {
		return "/popup/storeLocPopUp";
	}
	
	/**
	 * Sales Order Batch No List 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/selectBatchPopList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectBatchPopList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		
		BRespData respData = new BRespData();
		
		respData.put("batchNo", salesOrderService.selectBatchPopList(param));
		
		return respData;
	}
	
	/**
	 * Get Sold To credit Amount.
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/getSoldCreditAmt.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getSoldCreditAmt(@RequestBody Map<String, Object> req) throws Exception {
		req.put("G_COMP_CD", LoginInfo.getCompCd());

		return salesOrderService.getSoldCreditAmt(req);
	}
	
	/**
	 * Sales Order Close Pop Up.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/closePopUp.do")
	public String closePopUp() throws Exception {
		return "/popup/closePopUp";
	}
	
	/**
	 * Sales Order Closed 처리
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/salesOrderClosed.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData salesOrderClosed(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "SO");
		
		BRespData respData = new BRespData();
		
		salesOrderService.salesOrderClosed(param);
		
		return respData;
	}
	
	/**
	 * Sales Order Partner Function Popup Page
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/StockPopup.do")
	public String StockPopup(ModelMap model) throws Exception{
		return "/popup/StockPopup";
	}
	
	/**
	 * Sales Order History 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/selectHisTab.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectHisTab(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "SO");

		BRespData respData = new BRespData();
		
		respData.put("result", salesOrderService.selectHisTab(param));
		
		return respData;
	}
	
	@RequestMapping(value = "/salesOrder/setDeliPlantCombo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData setDeliPlantCombo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", salesOrderService.setDeliPlantCombo(param));
		
		return respData;
	}
	
	/**
	 * 
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/getAtpQty.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getAtpQty(@RequestBody Map<String, Object> req) throws Exception {
		req.put("G_COMP_CD", LoginInfo.getCompCd());
		req.put("USERID", LoginInfo.getUserId());

		return salesOrderService.getAtpQty(req);
	}
	
	/**
	 * Get Sold To credit Amount.
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/getItemCondition.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getItemCondition(@RequestBody Map<String, Object> req) throws Exception {
		BRespData respData = new BRespData();
		req.put("G_COMP_CD", LoginInfo.getCompCd());

		respData.put("COND_SUM", salesOrderService.getItemCondition(req));
		
		return respData;
	}
	
	/**
	 * Move External List Page
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/ExternalList.do")
	public String ExternalList(ModelMap model) throws Exception{
		return "/salesOrder/ExternalList";
	}
	
	/**
	 * search External List
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/searchExternalList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData searchExternalList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		
		BMap param = reqData.getParamDataMap("param");
		String onlyMyReport = (String)param.getString("chkOnlyMyReport");
		if ("Y".equals(onlyMyReport)) {
			param.put("OM_NO", LoginInfo.getUserId());
		}
		
		BRespData respData = new BRespData();
		
		respData.put("result", salesOrderService.searchExternalList(param));
		
		return respData;
	}
	
	/**
	 * search External Item List
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/searchExternalItemList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData searchExternalItemList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		
		BRespData respData = new BRespData();
		
		respData.put("result", salesOrderService.searchExternalItemList(param));
		
		return respData;
	}
	
	/**
	 * Item Plant Cd조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/getPlantCD.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getPlantCD(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
//		param.put("DOC_GR", "SO");
		
		BRespData respData = new BRespData();
		
		respData.put("result", salesOrderService.getPlantCD(param));
		
		return respData;
	}
	
	/**
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/createPdf.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData createPdf(HttpServletRequest request, @RequestBody Map<String, Object> req) throws Exception {
		
		BRespData respData = new BRespData();
		
		respData.put("fileInfo", salesOrderService.createProformaInvoicePdf(request, req));
		respData.put("fileInfo2", salesOrderService.createOrderConfirmationPdf(request, req));
		
		return respData;
	}
	

	@RequestMapping(value = "/salesOrder/selectItemPlant.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectItemPlant(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		
		BRespData respData = new BRespData();
		
		respData.put("plantCd", salesOrderService.selectItemPlant(param));
		
		return respData;
	}
	

	@RequestMapping(value = "/salesOrder/selectStoreLocPopList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectStoreLocPopList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		
		BRespData respData = new BRespData();
		
		System.err.println(salesOrderService.selectStoreLocPopList(param));
		
		respData.put("storeLoc", salesOrderService.selectStoreLocPopList(param));
		
		return respData;
	}	
	
	/**
	 * 엑셀 업로드 팝업 호출
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/UploadPopup.do")
	public String UploadPopup(ModelMap model) throws Exception{
		return "/popup/UploadPopup";
	}
	
	@RequestMapping(value = "/salesOrder/selectFileAttach.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectFileAttach(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		
		String docno = (String) reqData.get("VBELN"); 
		docno = StringUtils.LPadding(docno, '0', 10);		
				
		BRespData respData = new BRespData();
		try {
			respData.put("result", salesOrderService.selectFileAttach(docno));
		} catch (Exception e) {
			respData.put("result", null);
		}
		return respData;
	}
	
	
	/**
	 * 엑셀 업로드 
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/getSAPATTACH.do", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public void getSAPATTACH(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		salesOrderService.getSAPATTACH(req, resp);
	}
	
	/**
	 * 엑셀 업로드 
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/uploadSAPATTACH.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData uploadSAPATTACH(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		return salesOrderService.uploadSAPATTACH(req);
	}
	
	/**
	 * 엑셀 업로드 
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/salesOrder/removeSAPATTACH.do")
	@ResponseBody
	public BRespData removeSAPATTACH(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String docno = req.getParameter("docno");
		String objno = req.getParameter("objno");
		
		docno = StringUtils.LPadding(docno, '0', 10);
		objno = StringUtils.LPadding(objno, '0', 12);	
		
		logger.debug("removeSAPATTACH >> " + docno + "/" + objno);
		
		Map<String, Object> param = new HashMap<String, Object>();	
		param.put("IV_VBELN", docno);
		param.put("IV_DOCNO", objno);
		
		return salesOrderService.removeSAPATTACH(param);
	}
	
}