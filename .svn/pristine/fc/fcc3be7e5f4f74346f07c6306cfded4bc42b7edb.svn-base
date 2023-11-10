package bt.lead.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.common.service.CommonService;
import bt.lead.service.LeadService;

@Controller
public class LeadController {
	@Resource(name = "LeadService")
	private LeadService leadService;

	@Resource(name = "CommonService")
	private CommonService commonService;

	/**
	 * Move Lead List Page
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/lead/LeadList.do")
	public String LeadList(ModelMap model) throws Exception{
		return "/lead/LeadList";
	}
	
	/**
	 * search Lead List
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/lead/searchLeadList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData searchLeadList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", leadService.searchLeadList(param));
		
		return respData;
	}
	
	
	/**
	 * Move Lead Entry Page
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/lead/LeadEntry.do")
	public String LeadEntry(ModelMap model) throws Exception{
		
		model.addAttribute("LANG_CD", commonService.selectCommonCodeGrid("LANG_CD"));
		model.addAttribute("PF_TP", commonService.selectCommonCodeGrid("PF_TP"));
		model.addAttribute("LEAD_PF_TP", commonService.selectCommonCodeGrid("LEAD_PF_TP"));
		return "/lead/LeadEntry";
	}	
	
	/**
	 * Save Lead
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/lead/saveLead.do")
	@ResponseBody
	public BRespData SaveLead(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		
		BRespData respData = new BRespData();
		
		respData.put("docNo", leadService.SaveLead(param));
		
		return respData;
	}
	
	/**
	 * Lead 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/lead/selectLeadInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectLeadInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "LD");
		
		BRespData respData = new BRespData();
		
		BMap resultLeadInfo = leadService.selectLeadInfo(param);

		
		if(null == resultLeadInfo || resultLeadInfo.isEmpty()){
			respData.put("resultLeadInfo", null);
		}else{
			respData.put("resultLeadInfo", resultLeadInfo);
		}
		
		return respData;
	}
	
	/**
	 * Lead Notes Tab 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/lead/selectNoteTab.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectNoteTab(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "LD");
		
		BRespData respData = new BRespData();
		
		BMap resultCustomNote = leadService.selectCustomNote(param);
		
		respData.put("resultCustomNote", resultCustomNote);
		respData.put("resultNoteGrid", leadService.selectNoteGrid(param));
		
		return respData;
	}
	
	/**
	 * Lead MatnPartInv Tab 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/lead/selectMatnPartInvTab.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectMatnPartInvTab(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "LD");
		param.put("USERID", LoginInfo.getUserId());
		
		BRespData respData = new BRespData();
				
		respData.put("resultProductsGrid", leadService.resultProductsGrid(param));
		respData.put("resultPartInvGrid", leadService.resultPartInvGrid(param));
		
		return respData;
	}
	
	/**
	 * Lead MatnPartInv Tab 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/lead/selectContactReportTab.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectContactReportTab(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "LD");
		
		BRespData respData = new BRespData();
		
		BMap resultInteractionLog = leadService.resultInteractionLog(param);
		
		respData.put("resultInteractionLog", resultInteractionLog);
		respData.put("resultContactReportGrid", leadService.resultContactReportGrid(param));
		
		return respData;
	}
	
	/**
	 * Lead ChangeHistory Tab 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/lead/selectChangeHistoryTab.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectChangeHistoryTab(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "LD");
		
		BRespData respData = new BRespData();
		
		respData.put("resultChangeHistoryGrid", leadService.resultChangeHistoryGrid(param));
		
		return respData;
	}
	
	/**
	 * Move Partner Search Popup
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/partnerSearchPopup.do")
	public String partnerSearchPopup(ModelMap model) throws Exception {
		System.err.println("ddd");
		return "/popup/PartnerSearchPopUp";
	}
	
	/**
	 * Search Partner Search Popup
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/partnerSearchList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData partnerSearchList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {		
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", leadService.partnerSearchList(param));
		
		return respData;		
	}
	
	@RequestMapping(value = "/lead/getLeadStatusReasonCode.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getLeadStatusReasonCode(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BRespData respData = new BRespData();
		
		String[] tempVal = reqData.getParamDataVal("param").split(";");
		
		BMap param = new BMap();
		param.put("HEAD_CD", tempVal[0]);
		param.put("REF_CHR1", tempVal[1]);
		param.put("LANG", LoginInfo.getLang());
		
		respData.put("result", leadService.getLeadStatusReasonCode(param));
		return respData;
	}
	
	/**
	 * Save Temp
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/lead/saveTempLead.do")
	@ResponseBody
	public BRespData saveTempLead(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		
		BRespData respData = new BRespData();
		
		respData.put("tempLeadNo", leadService.saveTempLead(param));
		
		return respData;
	}
	
	@RequestMapping(value = "/lead/QuotationEntry.do")
	public String QuotationEntry(ModelMap model) throws Exception{
		model.addAttribute("pf_tp", "ERR:;" + commonService.selectCommonCodeGrid("PF_TP"));
		model.addAttribute("text_tp", "ERR:;" + commonService.selectCommonCodeGrid("SO_TEXT_TP").toUpperCase());
		model.addAttribute("text_lang", commonService.selectCommonCodeGrid("LANGUAGE").toUpperCase());
		model.addAttribute("dt_tp", commonService.selectCommonCodeGrid("DT_TP"));
		model.addAttribute("unit_cd", commonService.selectCommonCodeGrid("BASIC_UNIT"));
		model.addAttribute("curr_cd", commonService.selectCommonCodeGrid("CURR_CD"));
		
		
		return "/quotation/QuotationEntry";
	}
	
	
	@RequestMapping(value = "/lead/checkCustSalesData.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData checkCustSalesData(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		
		BRespData respData = new BRespData();
		
		BMap resultLeadInfo = leadService.resultCustSalesData(param);

		respData.put("result", resultLeadInfo);
		
		return respData;
	}
	
	@RequestMapping(value = "/lead/selectSalesOffice.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectSalesOffice(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", leadService.selectSalesOffice(param));
		
		return respData;
	}
	
	@RequestMapping(value = "/lead/setCustSalesData.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData setCustSalesData(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		BMap result  = leadService.setCustSalesData(param);

		System.err.println(result);
		
		respData.put("setSalesData", result);
			
		
		return respData;
	}
	
	@RequestMapping(value = "/lead/getModiTms.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getModiTms(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		
		BRespData respData = new BRespData();
		
		respData.put("result", leadService.getModiTms(param));
		
		return respData;
	}
	
}
