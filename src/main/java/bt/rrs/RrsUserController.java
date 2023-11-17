package bt.rrs;

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
		System.out.println("user.do! !");
		return "/rrs/User";
	}
	
	/**
	 * 회원 정보 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rrs/selectRrsUserInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectUserInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", rrsUserService.selectUserInfo(param));
		
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
		System.out.println("MemberUserPopup");
		// model.addAttribute("usertype", commonService.selectCommonCode("USER_TP"));
		return "/popup/rrs/MemberUserPopup";
	}
	
	/**
	 * 멤버 회원 정보 조회(팝업)
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
		System.out.println("selectMemberUserInfo");
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
		System.out.println("MemberUserAddPopup");
		return "/popup/rrs/MemberUserAddPopup";
	}
	
	/**
	 * 사용자 정보 저장
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
	

}
