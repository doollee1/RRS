package bt.Bom.controller;

import java.net.URLEncoder;
import java.util.LinkedHashMap;
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

import bt.Bom.service.BOMService;
import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;

@Controller
public class BOMController {
	@Resource(name = "BOMService")
	private BOMService bomService;
	
	@Autowired MessageSource messageSource;
	
	/**
	 * BOM 조회 페이지 호출
	 */
	@RequestMapping(value = "/Bom/BOMSearch.do")
	public String UserManager(ModelMap model) throws Exception{
		return "/Bom/BOMSearch";
	}
	
	/**
	 * BOM 정보 조회
	 */
	@RequestMapping(value = "/Bom/selectMaterialList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectMaterialList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", bomService.selectMaterialList(param));
		
		return respData;
	}
	
	/**
	 * BOM 팝업 조회
	 */
	@RequestMapping(value = "/Bom/bomPopup.do")
	public String BOMPopUp() throws Exception {
		return "/popup/bomPopup";
	}
	
	/**
	 * Material 코드 조회
	 * 
	 */
	@RequestMapping(value = "/Bom/selectMaterialCode.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectMaterialCode(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{

		BMap paramData = new BMap();
		paramData.put("MATL_CD", reqData.get("MATL_CD"));
		
		BRespData respData = new BRespData();
		respData.put("result", bomService.selectMaterialCode(paramData));
		
		return respData;
	}
	
	/**
	 * Material 정보 조회
	 */
	@RequestMapping(value = "/Bom/selectBOMList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectBOMList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", bomService.selectBOMList(param));
		
		return respData;
	}
		
	/**
	 * 엑셀 BOM정보 조회
	 */
	@RequestMapping(value = "/Bom/selectBOMListAll.do", method = RequestMethod.POST)
	public void selectBOMListAll(@RequestParam Map<String,Object> reqData, HttpServletRequest req, HttpServletResponse resp) throws Exception{
		
		BMap param = new BMap();
		String lang = LoginInfo.getLang();
		String colNm = reqData.get("COL_NM").toString();
		colNm = colNm.replaceAll("%", "");
		String colNms[] = colNm.split(",");
		
		param.put("MATL_CD_ST", reqData.get("MATL_CD_ST"));
		param.put("MATL_NM_ST", reqData.get("MATL_NM_ST"));
		param.put("PLANT_CD", reqData.get("PLANT_CD"));
		param.put("BOM_USAGE", reqData.get("BOM_USAGE"));
		param.put("VALID_DT", reqData.get("VALID_DT"));
		param.put("EXC_HD", reqData.get("EXC_HD"));
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
		
		String title = "BOM List";
		String UTF8FileName = "";

		if (MSIE || MSIE11) {
		    // 공백이 '+'로 인코딩된것을 다시 공백으로 바꿔준다.
		    UTF8FileName = URLEncoder.encode(title, "UTF-8").replaceAll("\\+", " ");
		} else {
		    UTF8FileName = new String(title.getBytes("UTF-8"), "8859_1");
		}
		
		bomService.selectBOMListAll(UTF8FileName, headerMap, resp, param);
	}
}
