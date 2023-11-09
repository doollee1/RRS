package bt.common.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.btframework.utils.ResponseStatus;
import bt.common.service.CommonService;
import bt.common.service.MailManagementService;

@Controller
public class MailManagementController {
	@Resource(name = "CommonService")
	private CommonService commonService;
	
	@Resource(name = "MailManagementService")
	private MailManagementService mailManagementService;
	
	/**
	 * open Mail Contents Management
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/ContentsManagement.do")
	public String ContentsManagement(ModelMap model) throws Exception {

		model.addAttribute("TITLE_TYPE", commonService.selectCommonCodeGrid("TITLE_TYPE"));
		model.addAttribute("RCPNT_TYPE", commonService.selectCommonCodeGrid("RCPNT_TYPE"));
		model.addAttribute("RECEIVER_TYPE", commonService.selectCommonCodeGrid("RECEIVER_TYPE"));
		
		return "/common/MailContentsManagement";
	}
	
	/**
	 * based mail title search
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/searchMailTitle.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData searchMailTitle(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", mailManagementService.searchMailTitle(param));
		
		return respData;
	}
	
	/**
	 * based mail recipient search
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/searchMailRecipient.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData searchMailRecipient(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", mailManagementService.searchMailRecipient(param));
		
		return respData;
	}

	/**
	 * save Mail Contents
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/saveMailContents.do")
	@ResponseBody
	public BRespData saveMailContents(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		
		BRespData respData = new BRespData();
		
		respData.put("MAIL_CD", mailManagementService.saveMailContents(param));
		
		return respData;
	}
	
	/**
	 * search Mail Contents
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/searchMailContents.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData searchMailContents(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", mailManagementService.searchMailContents(param));
		
		return respData;
	}
	
	@RequestMapping(value = "/common/selectMailContents.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectMailContents(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		System.err.println(param);
		
		BRespData respData = new BRespData();
		
		BMap result = mailManagementService.selectMailContents(param);
		
		if(null == result || result.isEmpty()){
			respData.put("resultLeadInfo", null);
		}else{
			respData.put("selectMailBody", result);
			respData.put("selectMailTitle", mailManagementService.selectMailTitle(param));
			respData.put("selectMailRecipient", mailManagementService.selectMailRecipient(param));
		}
		
		return respData;
	}
	
	@RequestMapping(value = "/popup/mailPreview.do")
	public ModelAndView opoenMailPreviewPopup() throws Exception {
		return new ModelAndView("/popup/MailPreviewPopup");
	}
	
	@RequestMapping(value = "/common/mailPreview.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData mailPreview(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("COMP_CD", LoginInfo.getCompCd());
		BRespData respData = new BRespData();
		
		System.err.println(param);
		
		respData.put("result", mailManagementService.mailPreview(param));
		
		return respData;
	}
	
	/**
	 * MailHistory Management
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/MailHistory.do")
	public String MailHistory(ModelMap model) throws Exception {
		return "/common/MailHistory";
	}
	
	@RequestMapping(value = "/common/selectMailHistory.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectMailHistory(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", mailManagementService.selectMailHistory(param));
				
		return respData;
	}
	@RequestMapping(value = "/popup/mailHis.do")
	public ModelAndView mailHisPopup() throws Exception {
		return new ModelAndView("/popup/MailHisPopup");
	}
	
	/**
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/sendEmailCust.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData sendEmailCust(HttpServletRequest request, @RequestBody Map<String, Object> req) throws Exception {
		mailManagementService.sendEmailCust(request, req);
		return new BRespData(ResponseStatus.OK);
	}
	
	/**
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/sendEmailEtc.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData sendEmailEtc(HttpServletRequest request, @RequestBody Map<String, Object> req) throws Exception {
		mailManagementService.sendEmailEtc(request, req);
		return new BRespData(ResponseStatus.OK);
	}
	
	/**
	 * PDF 다운로드
	 * @param req
	 * @param resp
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/downloadPdfAttach", method = {RequestMethod.GET, RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public void downloadPdfAttach(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		mailManagementService.downloadPdfAttach(req, resp);
	}

	/**
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/sendApprovEmail.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData sendApprovEmail(HttpServletRequest request, @RequestBody Map<String, Object> req) throws Exception {
		System.err.println(req);
		mailManagementService.sendRejectEmail(request, req);
		return new BRespData(ResponseStatus.OK);
	}
	
	/**
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/sendRejectEmail.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData sendRejectEmail(HttpServletRequest request, @RequestBody Map<String, Object> req) throws Exception {
		System.err.println(req);
		mailManagementService.sendRejectEmail(request, req);
		return new BRespData(ResponseStatus.OK);
	}
}
