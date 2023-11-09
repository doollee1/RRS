package bt.system;

import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.common.service.CommonService;
import bt.system.service.SystemService;

@Controller
public class SystemController {
	@Resource(name = "SystemService")
	private SystemService systemService;
	
	@Resource(name = "CommonService")
	private CommonService commonService;
	
	@RequestMapping(value = "/system/SystemManager.do")
	public String home(ModelMap model) throws Exception{
		model.addAttribute("griduseyn", commonService.selectCommonCodeGrid("USED_OR_NOT"));
		return "/system/SystemManager";
	}
	
	@RequestMapping(value = "/system/selectSystemInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectSystemInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", systemService.selectSystemInfo(param));
		
		return respData;
	}
	
	@RequestMapping(value = "/system/saveSystemInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveSystemInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		List<BMap> paramList = reqData.getParamDataList("gridData");
		
		BRespData respData = new BRespData();
		
		String tempVal = systemService.checkSystemCode(param, paramList);
		
		if(null != tempVal && !"".equals(tempVal)){
			respData.put("isDup", tempVal);
		}else{
			systemService.saveSystemInfo(param, paramList);
			respData.put("isDup", "N");
		}
		
		return respData;
	}
	@RequestMapping(value = "/system/deleteSystemMasterInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData deleteSystemMasterInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		List<BMap> paramList = reqData.getParamDataList("gridData");
		BRespData respData = new BRespData();
				
		systemService.deleteSystemMasterInfo(paramList);
		return respData;
	}

	@RequestMapping(value = "/system/deleteSystemDetailInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData deleteSystemDetailInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		List<BMap> paramList = reqData.getParamDataList("gridData");
		BRespData respData = new BRespData();
				
		systemService.deleteSystemDetailInfo(paramList);
		return respData;
	}
	
	@RequestMapping(value = "/system/excelSystemInfo.do", method = RequestMethod.POST)
	public void excelSystemInfo(@RequestParam Map<String,Object> reqData, HttpServletRequest req, HttpServletResponse resp) throws Exception{
		BMap param = new BMap();
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("S_STATUS", reqData.get("S_STATUS").toString());
		
		String title = reqData.get("TITLE").toString();
		String colNm = reqData.get("COL_NM").toString();
		colNm = colNm.replaceAll("%", "");
		String colNms[] = colNm.split(",");
		
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
		
		String UTF8FileName = "";

		if (MSIE || MSIE11) {
		    // 공백이 '+'로 인코딩된것을 다시 공백으로 바꿔준다.
		    UTF8FileName = URLEncoder.encode(title, "UTF-8").replaceAll("\\+", " ");
		} else {
		    UTF8FileName = new String(title.getBytes("UTF-8"), "8859_1");
		}
		
		systemService.excelSystemInfo(UTF8FileName, headerMap, resp, param);
	}

	@RequestMapping(value = "/system/Interface.do")
	public String SAPInterface(ModelMap model) throws Exception{
		return "/system/Interface";
	}
}