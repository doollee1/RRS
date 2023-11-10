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
import bt.system.service.UserAuthService;

@Controller
public class UserAuthController {
	@Resource(name = "UserAuthService")
	private UserAuthService userAuthService;
	
	@Resource(name = "CommonService")
	private CommonService commonService;
	
	@RequestMapping(value = "/system/UserAuthManager.do")
	public String UserAuthManager(ModelMap model) throws Exception{
		model.addAttribute("griduseyn", commonService.selectCommonCodeGrid("USED_OR_NOT"));
		return "/system/UserAuthManager";
	}
	
	@RequestMapping(value = "/popup/UserPopup.do")
	public String UserPopup(ModelMap model) throws Exception{
		model.addAttribute("griduseyn", commonService.selectCommonCodeGrid("USED_OR_NOT"));
		return "/popup/UserPopup";
	}

	@RequestMapping(value = "/popup/UserPopup2.do")
	public String UserPopup2(ModelMap model) throws Exception{
		return "/popup/UserPopup2";
	}
	
	@RequestMapping(value = "/system/selectUserAuthInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectUserAuthInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", userAuthService.selectUserAuthInfo(param));
		
		return respData;
	}
	
	@RequestMapping(value = "/system/saveUserAuthInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveUserAuthInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		List<BMap> paramList = reqData.getParamDataList("gridData");
		BRespData respData = new BRespData();
		
		userAuthService.saveUserAuthInfo(paramList);
		
		return respData;
	}
	
	@RequestMapping(value = "/system/deleteUserAuthInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData deleteUserAuthInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		List<BMap> paramList = reqData.getParamDataList("gridData");
		BRespData respData = new BRespData();
		
		userAuthService.deleteUserAuthInfo(paramList);
		
		return respData;
	}
}
