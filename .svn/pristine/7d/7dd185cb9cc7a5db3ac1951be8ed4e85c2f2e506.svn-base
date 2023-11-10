package bt.common;

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
import bt.btframework.utils.LoginInfo;
import bt.common.service.CommonService;
import bt.common.service.DeputyService;

@Controller
public class DeputyController {

	@Resource(name = "DeputyService")
	private DeputyService deputyService;
	
	@Resource(name = "CommonService")
	private CommonService commonService;
	
	@RequestMapping(value = "/common/DeputyManager.do")
	public String DeputyManager(ModelMap model) throws Exception{
		model.addAttribute("griduseyn", commonService.selectCommonCodeGrid("USED_OR_NOT"));
		return "/common/DeputyManager";
	}
	
	@RequestMapping(value = "/common/DeputyManagerEX.do")
	public String DeputyManagerEX(ModelMap model) throws Exception{
		model.addAttribute("griduseyn", commonService.selectCommonCodeGrid("USED_OR_NOT"));
		return "/common/DeputyManagerEX";
	}
		
	@RequestMapping(value = "/common/selectApprovalIdList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectApprovalIdList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		
		BMap param = reqData.getParamDataMap("param");
		param.put("LANG", LoginInfo.getLang());
		param.put("COMP_CD", LoginInfo.getCompCd());
		
		BRespData respData = new BRespData();
		
		respData.put("result", deputyService.selectApprovalIdList(param));
		
		return respData;
	}
	
	@RequestMapping(value = "/common/selectDeputyDetail.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectDeputyDetail(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		
		BMap param = reqData.getParamDataMap("param");
		
		BRespData respData = new BRespData();
		
		respData.put("result", deputyService.selectDeputyDetail(param));
		
		return respData;
	}
	
	@RequestMapping(value = "/common/savedDeputy.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData savedDeputy(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap master = reqData.getParamDataMap("master");
		master.put("APRV_TP", reqData.get("type"));
		List<BMap> detail = reqData.getParamDataList("detail");
		BRespData respData = new BRespData();
		
		deputyService.savedDeputy(master, detail);
		return respData;
	}
	
	@RequestMapping(value = "/common/savedDeputyEX.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData savedDeputyEX(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{

		BRespData respData = new BRespData();		
		deputyService.savedDeputyEX(reqData);
		return respData;
	}
}
