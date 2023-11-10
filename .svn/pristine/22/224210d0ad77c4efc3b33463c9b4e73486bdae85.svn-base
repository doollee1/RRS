package bt.common;

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

import bt.btframework.common.vo.CodeVO;
import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.common.dao.SapIfRecvBomDao;
import bt.common.dao.SapIfRecvProductDao;
import bt.common.service.CommonService;
import bt.common.service.SampleService;
import bt.system.service.SystemService;

@Controller
public class SampleController {
	@Resource(name = "SystemService")
	private SystemService systemService;

	@Resource(name = "CommonService")
	private CommonService commonService;
	
	@Resource(name = "SampleService")
	private SampleService sampleService;
	
	@Resource(name = "SapIfRecvProductDao")
	private SapIfRecvProductDao sapIfRecvProductDao;

	@Resource(name = "SapIfRecvBomDao")
	private SapIfRecvBomDao sapIfRecvBomDao;
	
	
	
	/**
	 * 그리드 샘플 페이지 호출
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sample/GridSample.do")
	public String GridSample(ModelMap model) throws Exception{
		BMap param = new BMap();
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("LANG", LoginInfo.getLang());
		param.put("S_STATUS", "Y");
		List<CodeVO> systemList = systemService.selectSystemInfoForMenu(param);
		
		model.addAttribute("useyn", commonService.selectCommonCode("USED_OR_NOT"));
		model.addAttribute("griduseyn", commonService.selectCommonCodeGrid("USED_OR_NOT"));
		model.addAttribute("systemlist", systemList);
		return "/sample/GridSample";
	}
	
	/**
	 * 엑셀 다운르도 샘플
	 * @param reqData
	 * @param req
	 * @param resp
	 * @throws Exception
	 */
	@RequestMapping(value = "/sample/excelSample.do", method = RequestMethod.POST)
	public void excelSample(@RequestParam Map<String,Object> reqData, HttpServletRequest req, HttpServletResponse resp) throws Exception{
		BMap param = new BMap();
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		
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
		
		sampleService.excelSample(UTF8FileName, headerMap, resp, param);
	}
	
	/**
	 * 엑셀 업로드 샘플 페이지 호출
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sample/ExcelUploadSample.do")
	public String ExcelUploadSample(ModelMap model) throws Exception{
		model.addAttribute("griduseyn", commonService.selectCommonCodeGrid("USED_OR_NOT"));
		return "/sample/ExcelUploadSample";
	}
	
	/**
	 * 엑셀 업로드 
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sample/uploadExcelSample.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData uploadExcelSample(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		List<BMap> list = sampleService.uploadExcelSample(req);
		BRespData respData = new BRespData();
		respData.put("result", list);
		return respData;
	}
	
	/**
	 * 폼 샘플 페이지 호출
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sample/FormSample.do")
	public String FormSample(ModelMap model) throws Exception{
		model.addAttribute("griduseyn", commonService.selectCommonCodeGrid("USED_OR_NOT"));
		return "/sample/FormSample";
	}
	
	@RequestMapping(value = "/sample/ajaxSample.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData ajaxSample(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		respData.put("result", "1");
		return respData;
	}
	
	/**
	 * 팝업 샘플 페이지 호출
	 */
	@RequestMapping(value = "/popup/samplePopup.do")
	public String samplePopup(ModelMap model) throws Exception{
		return "/popup/samplePopup";
	}
	
	/**
	 * Interface 샘플 페이지 호출
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sample/InterfaceSample.do")
	public String InterfaceSample(ModelMap model) throws Exception{
		return "/sample/InterfaceSample";
	}
	
}