package bt.rrs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		BMap param = new BMap();

		param.put( "HEAD_CD", 500030);

		model.addAttribute("mem_gbn"        , rrsUserService.selectGetCommonCode(param));
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
		BMap param = new BMap();
		BMap param2 = new BMap();

		param.put( "HEAD_CD", 500030);
		param2.put("HEAD_CD", 500240);

		model.addAttribute("mem_gbn"        , rrsUserService.selectGetCommonCode(param));
		model.addAttribute("ret_yn"         , rrsUserService.selectGetCommonCode(param2));

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

		BMap result = rrsUserService.saveUserInfo(param);
		if(!result.getString("result").equals("success")){
			if(result.getString("result").equals("isExistUser")) respData.put("isExistUser", "Y");
			if(result.getString("result").equals("isExistMember")) respData.put("isExistMember", "N");
			if(result.getString("result").equals("isExistMemberID")) respData.put("isExistMemberID", "Y");
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
	 * 관리자 멤버 찾기 팝업
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/UserInfoSearchPopup.do")
	public String UserInfoSearchPopup(ModelMap model) throws Exception{
		return "/popup/rrs/UserInfoSearchPopup";
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
		BMap param  = reqData.getParamDataMap("param");
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
		BMap param  = new BMap();
		BMap param2 = new BMap();

		param.put("HEAD_CD", 500240);
		param2.put("HEAD_CD", 500250);

		model.addAttribute("ret_yn"         , rrsUserService.selectGetCommonCode(param));
		model.addAttribute("partner_gender" , rrsUserService.selectGetCommonCode(param2));

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

		BMap result = rrsUserService.saveMemberUserInfo(param);
		if(!result.getString("result").equals("success")){
			if(result.getString("result").equals("isExistMember")) respData.put("isExistMember", "Y");
			if(result.getString("result").equals("isExistMemberID")) respData.put("isExistMemberID", "Y");
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
			BMap result = rrsUserService.uploadMemberUserExcel(req);
			if(result.getString("result").equals("failure")) {
				respData.put("success", false);
				respData.put("message", result.get("message"));
			} else {
				respData.put("success", true);
			}
			respData.put("result", rrsUserService.uploadMemberUserExcel(req));
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

		BMap result = rrsUserService.deleteMemberUserInfo(paramList);

		if(!result.getString("result").equals("success")){
			if(result.getString("result").equals("isExistUserMember")) {
				respData.put("isExistUserMember", "Y");
			}
		}

		return respData;
	}

	/**
	 * 공통코드 조회
	 * @param reqData
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/selectMemCodeInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectMemCodeInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();

		respData.put("result", rrsUserService.selectGetCommonCode(param));
		return respData;
	}

	/**
	 * 멤버회원 정보 조회(팝업)
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/selectSearchUserInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectSearchUserInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param  = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();

		respData.put("result", rrsUserService.selectSearchUserInfo(param));
		return respData;
	}

	/**
	 * 아이디 중복체크
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/UserIdCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData UserIdCheck(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();

		BMap result = rrsUserService.UserIdCheck(param);

		if(!result.getString("result").equals("isExistUser")){
			respData.put("isExistUser", "Y");
		}

		return respData;
	}
	/**
	 * 에이전시관리 페이지 호출
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/agencyManager.do")
	public String agencyManager(ModelMap model) throws Exception{

		BMap param = new BMap();
		param.put( "HEAD_CD", 500260);

		model.addAttribute("agency_gbn" , rrsUserService.selectGetCommonCode(param));
		model.addAttribute("agency_gbn_grid" , rrsUserService.selectGetCommonCode2(param));

		return "/rrs/AgencyManager";
	}
	/**
	 * 에이전시 컴퍼니 정보 조회
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/selectAgencyComp.do" , method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectAgencyComp(@RequestParam Map<String, Object> param, Model model) throws Exception {
		BRespData respData = new BRespData();

		try {
			respData.put("result"   , rrsUserService.selectAgencyComp(param));
		} catch (Exception e) {
			respData.put("dup", "N");
			respData.put("message", e.getMessage());
		}

		return respData;
	}
	/**
	 * 에이전시 담당자 정보 조회
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/selectAgencyUser.do" , method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectAgencyUser(@RequestParam Map<String, Object> param, Model model) throws Exception {
		BRespData respData = new BRespData();

		try {
			respData.put("result"   , rrsUserService.selectAgencyUser(param));
		} catch (Exception e) {
			respData.put("dup", "N");
			respData.put("message", e.getMessage());
		}

		return respData;
	}
	/**
	 * 에이전시 컴퍼니 정보 삭제
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/deleteAgencyComp.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData deleteAgencyComp(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{

		List<BMap> paramList = reqData.getParamDataList("gridData");

		BRespData respData = new BRespData();

		rrsUserService.deleteAgencyComp(paramList);

		return respData;
	}

	/**
	 * 에이전시 컴퍼니 추가 등록 팝업창 호출
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/AgencyCompAddPopup.do")
	public String AgencyAddPopup(ModelMap model,HttpServletRequest request) throws Exception{
		BMap param = new BMap();

		param.put( "HEAD_CD", 500260);

		model.addAttribute("agency_gbn"        , rrsUserService.selectGetCommonCode(param));

		return "/popup/rrs/AgencyCompAddPopup";
	}

	/**
	 * 에이전시 컴퍼니 추가 등록
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/addAgencyComp.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData addAgencyComp(@RequestParam Map<String, Object> param, Model model) throws Exception{
		BRespData respData = new BRespData();

		BMap result = rrsUserService.addAgencyComp(param);

		/* 추가등록에 실패한 경우 */
		if(!result.getString("result").equals("success")){
			/* 시스템에서 문제가 생긴 경우 */
			if(result.getString("result").equals("false")) {
				respData.put("result", "false");
				respData.put("message", result.getString("message"));
			}
			/* 이미 등록된 컴퍼니 인 경우 */
			if(result.getString("result").equals("isExistAgencyComp")) {
				respData.put("result", "isExistAgencyComp");
			}
		}
		else {
			respData.put("result", "success");
		}
		return respData;
	}

	/**
	 * 에이전시 담당자 등록 팝업창 호출
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/AgencyUserInfoPopup.do")
	public String AgencyInfoPopup(ModelMap model,HttpServletRequest request) throws Exception{
		BMap param = new BMap();
		BMap param2 = new BMap();

		param.put( "HEAD_CD", 500260);
		param2.put("HEAD_CD", 500240);

		model.addAttribute("agency_gbn", rrsUserService.selectGetCommonCode(param));
		model.addAttribute("ret_yn"    , rrsUserService.selectGetCommonCode(param2));

		return "/popup/rrs/AgencyUserInfoPopup";
	}

	/**
	 * 에이전시 담당자 등록
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/addAgencyUser.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData addAgencyUser(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();

		BMap result = rrsUserService.addAgencyUser(param);

		if(!result.getString("result").equals("success")){
			/* 시스템에서 문제가 생긴 경우 */
			if(result.getString("result").equals("false")) {
				respData.put("result", "false");
				respData.put("message", result.getString("message"));
			}
			/* 이미 등록된 담당자인 경우 */
			if(result.getString("result").equals("isExistUser")) {
				respData.put("result", "isExistUser");
			}
		}

		return respData;
	}

	/**
	 * 에이전시 담당자 정보 수정
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/updateAgencyUser.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData updateAgencyUser(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BRespData respData = new BRespData();

		List<BMap> paramList = reqData.getParamDataList("gridData");

		if(!rrsUserService.updateAgencyUser(paramList)){
			respData.put("dup", "N");
		};

		return respData;
	}
}
