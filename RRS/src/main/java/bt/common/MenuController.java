package bt.common;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.common.service.MenuService;
import bt.system.service.MyMenuService;
import egovframework.com.utl.cas.service.EgovSessionCookieUtil;

@Controller
public class MenuController {
	@Resource(name = "MenuService")
	private MenuService menuService;
	
	@Resource(name = "MyMenuService")
	private MyMenuService mymenuService;
	
	@RequestMapping(value = "/common/selectSystemMenuList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectSystemMenuList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = new BMap();
		BRespData respData = new BRespData();
		
		String lang = EgovSessionCookieUtil.getCookie(req, "Language");
				
		param.put("COMP_CD", LoginInfo.getCompCd());
		param.put("USER_ID", LoginInfo.getUserId());
		//param.put("LANG", WebUtils.getSessionAttribute(req, SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME));
		param.put("LANG", lang);
		
		respData.put("result", menuService.selectSystemMenuList(param));
		//respData.put("auth", menuService.selectAuth(param));
		
		return respData;
	}
	
	@RequestMapping(value = "/common/selectMenuList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectMenuList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = new BMap();
		BRespData respData = new BRespData();
		
		String lang = EgovSessionCookieUtil.getCookie(req, "Language");
				
		param.put("COMP_CD", LoginInfo.getCompCd());
		param.put("USER_ID", LoginInfo.getUserId());
		param.put("LANG", lang);
		
		String system_cd = "", group_nm = "";
		
		List<BMap> menuList = menuService.selectMenuList(param);
		
		// 트리 리스트 생성
		List<BMap> treeList = new ArrayList<BMap>();
		for(int i = 0; i < menuList.size(); i++){
			BMap menu = new BMap(menuList.get(i));
			BMap map = new BMap();
			if("0".equals(String.valueOf(menu.get("LV")))){
				map.put("id", menu.get("PROG_CD"));
				map.put("pId", "");
				map.put("name", menu.get("PROG_NM"));
				map.put("open", "false");
				map.put("isParent", "true");
				system_cd = menu.getString("PROG_CD");
			}else if("1".equals(String.valueOf(menu.get("LV")))){
				map.put("id", menu.get("PROG_CD"));
				map.put("pId", system_cd);
				map.put("name", menu.get("PROG_NM"));
				map.put("open", "false");
				map.put("isParent", "true");
				group_nm = menu.getString("PROG_CD");
			}else if("2".equals(String.valueOf(menu.get("LV")))){
				map.put("id", menu.get("PROG_CD"));
				map.put("pId", group_nm);
				map.put("name", menu.get("PROG_NM"));
				map.put("open", "false");
				map.put("click", "addTab('" + menu.get("PROG_CD") + "', '" + menu.get("PROG_URL") + "', '" + menu.get("PROG_NM") + "')");
				map.put("isParent", "false");
			}
			treeList.add(map);
		}
		
		respData.put("result", treeList);
		
		return respData;
	}
	
	@RequestMapping(value = "/common/selectButtonList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectButtonList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		param.put("COMP_CD", LoginInfo.getCompCd());
		param.put("USER_ID", LoginInfo.getUserId());

		String auth = menuService.selectButtonList(param);
		
		respData.put("result", auth);
		respData.put("LANG", LoginInfo.getLang());
		if(!(mymenuService.selectMyMenuData(param))){
			respData.put("mymenu", true);
		}
		//respData.put("policy", menuService.selectAuth(param));
		return respData;
	}

}
