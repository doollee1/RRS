package bt.external.controller;

import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import bt.Bom.service.BOMService;
import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.btframework.utils.ResponseStatus;
import bt.common.service.CommonService;
import bt.external.service.ExternalModuleService;
import bt.lead.service.LeadService;

@RestController
@RequestMapping("/external/module")
public class ExternalModuleController {
	
	@Resource(name = "ExternalModuleService")
	private ExternalModuleService externalModuleService;

	@Autowired MessageSource messageSource;
	
	/**
	 * BOM 조회 페이지 호출
	 */
	@RequestMapping(value = "/ModuleSearch.do")
	public ModelAndView showModuleListForm(ModelMap model) throws Exception {
		DateFormat df = new SimpleDateFormat("ddmmyyyy");
		String today = df.format(new Date());
		
		ModelAndView mv = new ModelAndView("/external/ModuleSearch");
		mv.addObject("today", today);
		
		return mv;
	}
	
	/**
	 * 	Module 정보 조회
	 */
	@RequestMapping(value = "/selectModuleList.do", method = RequestMethod.POST)	
	public BRespData selectModuleList(@RequestBody Map<String, Object> req, HttpServletRequest request) throws Exception{

		BRespData respData = new BRespData();
		respData.put("result", externalModuleService.selectModuleList(req));
		
		return respData;
	}
	
	/**
	 * 	Module 정보 조회
	 */
	@RequestMapping(value = "/selectBOSList.do", method = RequestMethod.POST)	
	public BRespData selectBOSList(@RequestBody Map<String, Object> req, HttpServletRequest request) throws Exception{

		BRespData respData = new BRespData();
		respData.put("result", externalModuleService.selectBOSList(req));
		
		return respData;
	}
	
	/**
	 * 	showExternalMaterialPopUp
	 */
	@RequestMapping(value = "/showExternalMaterialPopUp.do")
	public ModelAndView showExternalMaterialPopUp() throws Exception {		
		return new ModelAndView("/popup/ExternalMaterialPopUp");
	}
	
	/**
	 * 	updateModule
	 */
	@RequestMapping(value = "/updateModule.do", method = RequestMethod.POST)
	public BRespData updateModule(@RequestBody Map<String, Object> req) throws Exception {
		List<BMap> list = externalModuleService.updateModule(req);
				
		BRespData res = new BRespData(ResponseStatus.OK, list);
		return res;
	}
	
	
	/**
	 * 	removeModule
	 */
	@RequestMapping(value = "/removeModule.do", method = RequestMethod.POST)
	public BRespData removeModule(@RequestBody Map<String, Object> req) throws Exception {
		List<BMap> list = externalModuleService.removeModule(req);
				
		BRespData res = new BRespData(ResponseStatus.OK, list);
		return res;
	}
	
	
	/**
	 * 	updateModule
	 */
	@RequestMapping(value = "/updateBOS.do", method = RequestMethod.POST)
	public BRespData updateBOS(@RequestBody Map<String, Object> req) throws Exception {
		List<BMap> list = externalModuleService.updateBOS(req);
				
		BRespData res = new BRespData(ResponseStatus.OK, list);
		return res;
	}
	
	
	/**
	 * 	removeModule
	 */
	@RequestMapping(value = "/removeBOS.do", method = RequestMethod.POST)
	public BRespData removeBOS(@RequestBody Map<String, Object> req) throws Exception {
		List<BMap> list = externalModuleService.removeBOS(req);
				
		BRespData res = new BRespData(ResponseStatus.OK, list);
		return res;
	}	
	
	
	/**
	 * Product PopUp List 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectMatlPopList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectMatlPopList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		
		BRespData respData = new BRespData();
		
		respData.put("result", externalModuleService.selectMatlPopList(param));
		
		return respData;
	}
	
		
	/**
	 * 엑셀 BOM정보 조회
	 */
	@RequestMapping(value = "/selectModuleListAll.do", method = RequestMethod.POST)
	public void selectModuleListAll(@RequestParam Map<String,Object> reqData, HttpServletRequest req, HttpServletResponse resp) throws Exception{
		
		BMap param = new BMap();
		String lang = LoginInfo.getLang();
		String colNm = reqData.get("COL_NM").toString();
		colNm = colNm.replaceAll("%", "");
		String colNms[] = colNm.split(",");
		
		param.put("MATL_CD_ST", reqData.get("MATL_CD_ST"));
		param.put("MATL_NM_ST", reqData.get("MATL_NM_ST"));
		param.put("LANG", lang);
		
		//엑셀 헤더
		Locale locale ;
		
		if(lang.equals("KO")){
			locale = Locale.KOREA;
		}else if(lang.equals("DE")){
			locale = Locale.GERMANY;
		}else if(lang.equals("FR")){
			locale = Locale.FRENCH;
		}else {
			locale = Locale.ENGLISH;
		}

		// 엑셀 헤더
		LinkedHashMap<String,Object> headerMap = new LinkedHashMap<String,Object>();
		//headerMap.put("접수번호", "CCM_NO");
		for (int i = 0 ; i < colNms.length ; i ++) {
			String nms[] = colNms[i].split(":");
			headerMap.put(nms[0], nms[1]);
		}
		//브라우저가 IE인지 확인할 플래그
		boolean MSIE = req.getHeader("user-agent").toUpperCase().indexOf("MSIE") != -1;
		boolean MSIE11 = req.getHeader("user-agent").toUpperCase().indexOf("RV:11.0") != -1;
		
		String title = "external module List";
		String UTF8FileName = "";

		if (MSIE || MSIE11) {
		    // 공백이 '+'로 인코딩된것을 다시 공백으로 바꿔준다.
		    UTF8FileName = URLEncoder.encode(title, "UTF-8").replaceAll("\\+", " ");
		} else {
		    UTF8FileName = new String(title.getBytes("UTF-8"), "8859_1");
		}
		
		externalModuleService.selectModuleListAll(UTF8FileName, headerMap, resp, param);
	}
	
	@RequestMapping(value = "/selectCommonCodeList.do", method = RequestMethod.POST)	
	public BRespData getCommonCode(@RequestBody Map<String, Object> req, HttpServletRequest request) throws Exception{

		BRespData respData = new BRespData();
		respData.put("result", externalModuleService.selectCommonCodeList(req));
		
		return respData;
	}	
}
