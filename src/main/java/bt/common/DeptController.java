package bt.common;

import java.util.ArrayList;
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
import bt.common.service.DeptService;

@Controller
public class DeptController {
	@Resource(name = "DeptService")
	private DeptService deptService;

	/**
	 * 부서 팝업 호출
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/DeptPopup.do")
	public String DeptPopup(ModelMap model,HttpServletRequest request) throws Exception{
		return "/popup/DeptPopup";
	}
	
	/**
	 * 부서 정보 조회 (팝업)
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/selectDeptPopup.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectDeptPopup(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", deptService.selectDeptPopup(param));
		
		return respData;
	}
	
	/**
	 * 부서관리 페이지 호출
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/common/DeptManager.do")
	public String DeptManager(ModelMap model) throws Exception{
		
		return "/common/DeptManager";
	}
	
	/**
	 * 부서 조회(계층)
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/getDeptList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getDeptList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {

		BMap searchData = new BMap();
		searchData.put("LANG", LoginInfo.getLang());
		
		BRespData respData = new BRespData();
		
		List<BMap> resultDeptList = deptService.getDeptList(searchData);
		

		// 트리 리스트 생성
		List<BMap> treeList = new ArrayList<BMap>();
		for(int i = 0; i < resultDeptList.size(); i++){
			BMap dept = new BMap(resultDeptList.get(i));
			BMap map = new BMap();
	
			map.put("id", dept.get("DEPT_CD"));
			map.put("pId", dept.get("UPPER_CD"));
			map.put("name", dept.get("DEPT_NM"));
			map.put("open", "true");
			map.put("click", "detailSearch('"+ dept.get("DEPT_CD") + "'); userSearch('"+ dept.get("DEPT_CD") + "')");
			if(dept.get("ISPRT").equals(0)){
				map.put("isParent", "false");
			}else{
				map.put("isParent", "true");
			}
			treeList.add(map);
		}
		respData.put("result", treeList);
		
		return respData;
	}
	
	/**
	 * 부서상세 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/common/getDeptDetail.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getDeptDetail(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		
		BMap paramData = new BMap();
		paramData.put("DEPT_CD", (String) reqData.get("DEPT_CD"));
		paramData.put("LANG", LoginInfo.getLang());
		
		BMap resultDeptDetail = deptService.getDeptDetail(paramData);
		
		BRespData respData = new BRespData();
		respData.put("resultDeptDetail", resultDeptDetail);
		
		return respData;
	}
	
	/**
	 * 부서별 사용자 검색
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/common/getDeptUser.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getDeptUser(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {

		BMap paramData = new BMap();
		paramData.put("DEPT_CD", (String) reqData.get("DEPT_CD"));
		paramData.put("LANG", LoginInfo.getLang());
		List<BMap> resultUserList = deptService.getDeptUser(paramData);
		
		BRespData respData = new BRespData();
		respData.put("resultUserList", resultUserList);
		
		return respData;
	}
	
	/**
	 * 부서 정보 저장
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/saveDeptInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveDeptInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		
		BMap param = reqData.getParamDataMap("paramData");

		BRespData respData = new BRespData();
		
		if(!deptService.saveDeptInfo(param)){
			respData.put("dup", "Y");
		}
		return respData;
	}
		
}
