package bt.common;

import java.util.List;
import java.util.Map;

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
import bt.btframework.utils.ResponseStatus;
import bt.common.service.CommonCodeService;
import bt.common.service.CommonService;

@Controller
public class CommonCodeController {
	@Resource(name = "CommonCodeService")
	private CommonCodeService commonCodeService;

	@Resource(name = "CommonService")
	private CommonService commonService;

	/********************************************
	 * @Subject : 공통코드 관리 화면 호출
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	@RequestMapping(value = "/common/CommonCodeManager.do")
	public String CommonCodeManager(ModelMap model) throws Exception{
		model.addAttribute("status", commonService.selectCommonCodeGrid("USED_OR_NOT"));
		return "/common/CommonCodeManager";
	}

	/********************************************
	 * @Subject : 공통코드 마스터 조회
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	@RequestMapping(value = "/common/selectCommonCodeMasterInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectCommonCodeMasterInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();

		respData.put("result", commonCodeService.selectCommonCodeMasterInfo(param));

		return respData;
	}

	/********************************************
	 * @Subject : 공통코드 마스터 저장
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	@RequestMapping(value = "/common/saveCommonCodeMasterInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveCommonCodeMasterInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap master = reqData.getParamDataMap("master");
		List<BMap> detail  = reqData.getParamDataList("detail");
		BRespData respData = new BRespData();

		if(!commonCodeService.saveCommonCodeMasterInfo(master, detail)){
			respData.put("dup", "Y");
		};

		return respData;
	}

	/********************************************
	 * @Subject : 공통코드 마스터 삭제
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	@RequestMapping(value = "/common/deleteCommonCodeMasterInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData deleteCommonCodeMasterInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		List<BMap> paramList = reqData.getParamDataList("gridData");
		BRespData respData = new BRespData();

		commonCodeService.deleteCommonCodeMasterInfo(paramList);

		return respData;
	}

	/********************************************
	 * @Subject : 공통코드 디테일 삭제
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	@RequestMapping(value = "/common/deleteCommonCodeDetailInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData deleteCommonCodeDetailInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BRespData respData = new BRespData();

		try {
			List<BMap> paramList = reqData.getParamDataList("gridData");
			commonCodeService.deleteCommonCodeDetailInfo(paramList);

			respData.put("success", true);
		}catch(Exception e) {
			respData.put("success", false);
			respData.put("message", e.getMessage());
		}

		return respData;
	}

	/********************************************
	 * @Subject : 공통코드 디테일 조회
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	@RequestMapping(value = "/common/selectCommonCodeDetailInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectCommonCodeDetailInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();

		respData.put("result", commonCodeService.selectCommonCodeDetailInfo(param));

		return respData;
	}

	/********************************************
	 * @Subject : 공통코드 조회
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	@RequestMapping(value = "/common/getCommonCode.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getCommonCode(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BRespData respData = new BRespData();

		String[] tempVal = reqData.getParamDataVal("param").split(";");

		BMap param = new BMap();
		param.put("HEAD_CD", tempVal[0]);
		param.put("LANG"   , LoginInfo.getLang());

		respData.put("result", commonService.selectCommonCodeByAjax(param));
		return respData;
	}

	@RequestMapping(value = "/common/retrieveCommonCodeList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData retrieveCommonCodeList(@RequestBody final Map<String, Object> req) throws Exception {
		List<BMap> list = commonCodeService.selectCommonCodeList(req);
		BRespData res = new BRespData(ResponseStatus.OK, list);
		return res;
	}

	@RequestMapping(value = "/common/retrieveCommonCodeByRef.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData retrieveCommonCodeByRef(@RequestBody final Map<String, Object> req) throws Exception {
		List<BMap> list = commonCodeService.selectCommonCodeByRef(req);
		BRespData res = new BRespData(ResponseStatus.OK, list);
		return res;
	}

	@RequestMapping(value = "/popup/CommPopup.do")
	public String CommPopup(ModelMap model,HttpServletRequest request) throws Exception{
		return "/popup/CommPopup";
	}

	@RequestMapping(value = "/common/selectCommPopup.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectCommPopup(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();

		respData.put("result", commonCodeService.selectCommPopup(param));

		return respData;
	}

	@RequestMapping(value = "/common/getCodeNm.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getCodeNm(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();

		respData.put("codeNm", commonCodeService.getCodeNm(param));

		return respData;
	}
}
