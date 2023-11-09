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
import bt.system.service.AppService;
import bt.system.service.SystemService;

@Controller
public class AppController {
	@Resource(name = "AppService")
	private AppService appService;
	
	@Resource(name = "SystemService")
	private SystemService systemService;

	@Resource(name = "CommonService")
	private CommonService commonService;
	
	@RequestMapping(value = "/system/AppManager.do")
	public String home(ModelMap model) throws Exception{
		BMap param = new BMap();
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("S_STATUS", "Y");
		List<CodeVO> systemList = systemService.selectSystemInfoForMenu(param);
		
		model.addAttribute("useyn", commonService.selectCommonCode("USED_OR_NOT"));
		model.addAttribute("griduseyn", commonService.selectCommonCodeGrid("USED_OR_NOT"));
		model.addAttribute("systemlist", systemList);
		return "/system/AppManager";
	}
	
	@RequestMapping(value = "/system/selectProgInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectProgInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", appService.selectProgInfo(param));
		
		return respData;
	}
	
	@RequestMapping(value = "/system/saveProgInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveProgInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		List<BMap> paramList = reqData.getParamDataList("gridData");
		
		BRespData respData = new BRespData();
		
		if(!appService.saveProgInfo(param, paramList)){
			respData.put("dup","Y");
		}
		return respData;
	}
	
	@RequestMapping(value = "/system/selectMiddleMenuCombo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectMiddleMenuCombo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		
		List<CodeVO> list = appService.selectMiddleMenuCombo(param);
		
		BRespData respData = new BRespData();
		respData.put("menulist", list);
		return respData;
	}
	
	@RequestMapping(value = "/system/selectProgramCombo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectProgramCombo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		
		List<CodeVO> list = appService.selectProgramCombo(param);
		
		BRespData respData = new BRespData();
		respData.put("proglist", list);
		return respData;
	}
}
