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

import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.common.service.CommonService;
import bt.system.service.AuthService;

@Controller
public class AuthController {
	@Resource(name = "AuthService")
	private AuthService authService;

	@Resource(name = "CommonService")
	private CommonService commonService;

	@RequestMapping(value = "/system/AuthManager.do")
	public String AuthManager(ModelMap model) throws Exception{
		model.addAttribute("useyn", commonService.selectCommonCode("USED_OR_NOT"));
		model.addAttribute("griduseyn", commonService.selectCommonCodeGrid("USED_OR_NOT"));
		return "/system/AuthManager";
	}

	@RequestMapping(value = "/system/selectAuthInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectAuthInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();

		respData.put("result", authService.selectAuthInfo(param));

		return respData;
	}

	@RequestMapping(value = "/system/saveAuthInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveAuthInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		List<BMap> paramList = reqData.getParamDataList("gridData");

		BRespData respData = new BRespData();

		if(!authService.saveAuthInfo(param, paramList)){
			respData.put("dup", "Y");
		};

		return respData;
	}

	@RequestMapping(value = "/system/deleteAuthInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData deleteAuthInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		List<BMap> paramList = reqData.getParamDataList("gridData");
		BRespData respData = new BRespData();

		try {
			authService.deleteAuthInfo(paramList);
			respData.put("success", true);

		}catch(Exception e) {
			respData.put("success", false);
			respData.put("message", e.getMessage());
		}

		return respData;
	}
}
