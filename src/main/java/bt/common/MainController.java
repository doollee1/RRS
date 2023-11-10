package bt.common;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.util.WebUtils;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.common.service.CommonService;
import bt.common.service.MainService;


@Controller
public class MainController {
	
	@Resource(name = "MainService")
	private MainService mainService;
	
	@Resource(name = "CommonService")
	private CommonService commonService;
	
	@RequestMapping(value = "/home/home.do")
	public String home(ModelMap model) throws Exception{
		return "/home/home";
	}

	@RequestMapping(value = "/home/home2.do")
	public String home2(ModelMap model) throws Exception{
		return "/home/home2";
	}
	
	@RequestMapping(value = "/home/home3.do")
	public String home3(ModelMap model) throws Exception{
		return "/home/home3";
	}
	
	@RequestMapping(value = "/import/import.do")
	public String importCommon(ModelMap model) throws Exception{
		return "/import/import";
	}
	
	@RequestMapping(value = "/import/top.do")
	public String top(ModelMap model) throws Exception{
		model.addAttribute("selectLang", commonService.selectCommonCode("LANGUAGE"));
		return "/import/top";
	}

	@RequestMapping(value = "/import/top2.do")
	public String top2(ModelMap model) throws Exception{
		model.addAttribute("selectLang", commonService.selectCommonCode("LANGUAGE"));
		return "/import/top2";
	}
	
	@RequestMapping(value = "/import/left.do")
	public String left(ModelMap model) throws Exception{
		return "/import/left";
	}
	
	@RequestMapping(value = "/main/main.do")
	public String main(ModelMap model) throws Exception{
		return "/main/main";
	}
	

	@RequestMapping(value = "/main/main3.do")
	public String main3(ModelMap model) throws Exception{
		return "/main/main3";
	}
	
	@RequestMapping(value = "/main/main2.do")
	public String main2(ModelMap model) throws Exception{
		return "/main/main2";
	}
	@RequestMapping(value = "/main/changeLocale.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData changeLoclae(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		
		String lang = param.getString("lang");

		if (lang != null) {
			WebUtils.setSessionAttribute((HttpServletRequest) req, SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, StringUtils.parseLocaleString(lang));
		}
		
		BRespData respData = new BRespData();
		
		return respData;
	}
	
	/**
	 * 메인화면 공지사항 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/main/selectMainInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectMainInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = new BMap();
		param.put("COMP_CD", LoginInfo.getCompCd());
		param.put("LANG", LoginInfo.getLang());
		BRespData respData = new BRespData();
		
		respData.put("MainNotice", mainService.selectMainNotice(param));
		
		//respData.put("SalesOrderStatus", mainService.selectOrderStatus(param));

		//respData.put("QuotationStatus", mainService.selectQuotationStatus(param));
		
		return respData;
	}
	
	/**
	 * 메인 Notice 팝업
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup/NoticePopup.do")
	public String NoticePopup(ModelMap model,HttpServletRequest request) throws Exception{
		return "/popup/NoticePopup";
	}
}
