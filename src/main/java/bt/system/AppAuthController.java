package bt.system;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bt.btframework.common.vo.CodeVO;
import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.common.service.CommonService;
import bt.system.service.AppAuthService;
import bt.system.service.SystemService;

@Controller
public class AppAuthController {
	@Resource(name = "AppAuthService")
	private AppAuthService appAuthService;

	@Resource(name = "CommonService")
	private CommonService commonService;

	@Resource(name = "SystemService")
	private SystemService systemService;

	@RequestMapping(value = "/system/AppAuthManager.do")
	public String AppAuthManager(ModelMap model) throws Exception{
		model.addAttribute("griduseyn", commonService.selectCommonCodeGrid("USED_OR_NOT"));
		return "/system/AppAuthManager";
	}

	@RequestMapping(value = "/popup/ProgPopup.do")
	public String selectAppAuthInfo(ModelMap model) throws Exception{
		BMap param = new BMap();
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("S_STATUS", "Y");
		param.put("LANG", LoginInfo.getLang());

		List<CodeVO> systemList = systemService.selectSystemInfoForMenu(param);

		model.addAttribute("useyn", commonService.selectCommonCode("USED_OR_NOT"));
		model.addAttribute("griduseyn", commonService.selectCommonCodeGrid("USED_OR_NOT"));
		model.addAttribute("systemlist", systemList);
		return "/popup/ProgPopup";
	}

	@RequestMapping(value = "/system/selectAppAuthInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectAppAuthInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();

		respData.put("result", appAuthService.selectAppAuthInfo(param));

		return respData;
	}

	@RequestMapping(value = "/system/saveAppAuthInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveAppAuthInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		List<BMap> paramList = reqData.getParamDataList("gridData");
		BRespData respData = new BRespData();

		appAuthService.saveAppAuthInfo(paramList);

		return respData;
	}

	@RequestMapping(value = "/system/delAppAuthInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData delAppAuthInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		List<BMap> paramList = reqData.getParamDataList("gridData");
		BRespData respData = new BRespData();

		appAuthService.deleteAppAuthInfo(paramList);

		return respData;
	}
}
