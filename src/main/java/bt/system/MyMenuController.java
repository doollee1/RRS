package bt.system;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import bt.system.service.MyMenuService;
import bt.system.service.SystemService;

/**
 * 마이메뉴 Controller
 * @author DOOLLEE2
 */
@Controller
public class MyMenuController {

	private static final Logger logger = LoggerFactory.getLogger(MyMenuController.class);

	@Resource(name = "MyMenuService")
	private MyMenuService mymenuService;

	@Resource(name = "SystemService")
	private SystemService systemService;

	// 메인화면 호출
	@RequestMapping(value = "/system/Mymenu.do")
	public String Mymenu(ModelMap model,HttpServletRequest request) throws Exception {
		BMap param = new BMap();
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		List<CodeVO> systemList = systemService.selectSystemInfoForMenu(param);
		model.addAttribute("systemlist", systemList);

		return "/system/Mymenu";
	}

	//전체 메뉴 검색
	@RequestMapping(value = "/system/getMenuList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getMenuList(@RequestBody BReqData reqData) throws Exception {
		BMap searchData = reqData.getParamDataMap("searchData");
		searchData.put("USER_ID", LoginInfo.getUserId());
		List<BMap> resultMenuList = mymenuService.getMenuList(searchData);

		BRespData respData = new BRespData();
		respData.put("resultMenuList", resultMenuList);

		return respData;
	}

	//마이 메뉴 조회
	@RequestMapping(value = "/system/getMyMenuList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getMyMenuList(@RequestBody BReqData reqData) throws Exception {
		BMap searchData = reqData.getParamDataMap("searchData");
		searchData.put("USER_ID", LoginInfo.getUserId());
		List<BMap> resultMenuList = mymenuService.getMyMenuList(searchData);

		BRespData respData = new BRespData();
		respData.put("resultMenuList", resultMenuList);

		return respData;
	}

	//마이 메뉴 저장
	@RequestMapping(value = "/system/saveMyMenuList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveMyMenuList(@RequestBody BReqData reqData, HttpServletRequest request) throws Exception {
		
		logger.info("===== 마이메뉴 저장 =====");
		logger.info("===== reqData : "+reqData);
		
		List<BMap> paramDataList = reqData.getParamDataList("paramDataList");
		BMap paramData = reqData.getParamDataMap("paramData");
		paramData.put("USER_ID", LoginInfo.getUserId());
		mymenuService.saveMyMenuList(paramData, paramDataList);

		BRespData respData = new BRespData();
		return respData;
	}

	/**
	 * 마이메뉴 개별 저장
	 * @param reqData
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/system/saveMyMenuData.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveMyMenuData(@RequestBody BReqData reqData, HttpServletRequest request) throws Exception {

		logger.info("====== 마이메뉴 개별 저장 =====");
		logger.info("====== param : "+reqData);

		BMap paramData = new BMap();
		paramData.put("PROG_CD", (String) reqData.get("PROG_CD"));
		paramData.put("USER_ID", LoginInfo.getUserId());

		BRespData respData = new BRespData();
		if(!mymenuService.saveMyMenuData(paramData)){
			//respData.put("dup", "Y");
			respData.put("result", "D");
		};
		return respData;
	}
}