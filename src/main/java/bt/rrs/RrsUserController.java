package bt.rrs;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bt.btframework.excel.POIExcelRRS;
import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.rrs.service.RrsUserService;

@Controller
public class RrsUserController {
	
	@Resource(name = "RrsUserService")
	private RrsUserService rrsUserService;
	
	/**
	 * 회원관리 페이지 호출
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/User.do")
	public String UserManager(ModelMap model) throws Exception{
		return "/rrs/User";
	}
	
	/**
	 * 회원 정보 리스트 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/selectUserInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectUserInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		respData.put("result", rrsUserService.selectUserInfo(param));
		
		return respData;
	}
	
	/**
	 * 회원 등록/수정 팝업 호출
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/UserPopup.do")
	public String UserPopup(ModelMap model,HttpServletRequest request) throws Exception{
		return "/popup/rrs/UserInfoPopup";
	}
	
	/**
	 * 회원 정보 저장
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/saveUserInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveUserInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		if(!rrsUserService.saveUserInfo(param)){
			respData.put("isExistMember", "N");
		}
		
		return respData;
	}
	
	/**
	 * 회원 정보 삭제
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/deleteUserInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData deleteUserInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		List<BMap> paramList = reqData.getParamDataList("gridData");
		BRespData respData = new BRespData();
		
		rrsUserService.deleteUserInfo(paramList);
		
		return respData;
	}
	
	/**
	 * 멤버회원 관리 팝업 호출
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/MemberUserPopup.do")
	public String MemberUserPopup(ModelMap model,HttpServletRequest request) throws Exception{
		return "/popup/rrs/MemberUserPopup";
	}
	
	/**
	 * 멤버회원 정보 조회(팝업)
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/selectMemberUserInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectMemberUserInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		respData.put("result", rrsUserService.selectMemberUserInfo(param));
		
		return respData;
	}
	
	/**
	 * 멤버회원 등록 팝업 호출
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/MemberUserAddPopup.do")
	public String MemberUserAddPopup(ModelMap model,HttpServletRequest request) throws Exception{
		return "/popup/rrs/MemberUserAddPopup";
	}
	
	/**
	 * 멤버 회원 정보 저장
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/saveMemberUserInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveMemberUserInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		if(!rrsUserService.saveMemberUserInfo(param)){
			respData.put("dup", "Y");
		}
		
		return respData;
	}
	
	/**
	 * 엑셀 샘플 다운로드
	 * @param reqData
	 * @param req
	 * @param resp
	 * @throws Exception
	 */
	//그리드 엑셀 저장
	@RequestMapping(value = "/rrs/downloadExcelSample.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveGridExcel(@RequestBody BReqData reqData, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("colModel", reqData.getParamDataList("COL_NM"));
		param.put("title", reqData.getParamDataVal("TITLE"));
		
		POIExcelRRS excelview = new POIExcelRRS();
		byte[] binary = excelview.buildExcelXSSF(param, req, resp);
		String binaryStr = DatatypeConverter.printBase64Binary(binary);
		
		BRespData respData = new BRespData();
		respData.put("exceldata", binaryStr);
		
		return respData;
	}
	
	/**
	 * 엑셀 업로드 팝업 호출
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/MemberUserExcelUploadPopup.do")
	public String MemberUserExcelUploadPopup(ModelMap model,HttpServletRequest request) throws Exception{
		return "/popup/rrs/MemberUserExcelUploadPopup";
	}
	
	@RequestMapping(value = "/rrs/uploadMemberUserExcel.do")
	@ResponseBody
	public BRespData uploadMemberUserExcel(HttpServletRequest req) throws Exception {
		BRespData respData = new BRespData();
		try {
			respData.put("result", rrsUserService.uploadMemberUserExcel(req));
			respData.put("success", true);
		} catch(Exception e) {
			respData.put("success", false);
			respData.put("message", e.getMessage());
		}
		return respData;
	}
	
	/**
	 * 멤버회원 정보 삭제
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/deleteMemberUserInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData deleteMemberUserInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		List<BMap> paramList = reqData.getParamDataList("gridData");
		BRespData respData = new BRespData();
		
		rrsUserService.deleteMemberUserInfo(paramList);
		
		return respData;
	}

}
