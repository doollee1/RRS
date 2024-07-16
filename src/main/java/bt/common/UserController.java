package bt.common;

import java.security.PrivateKey;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import bt.common.service.CommonService;
import bt.common.service.UserService;
import bt.login.LoginController;
import egovframework.com.utl.sim.service.EgovFileScrty;

@Controller
public class UserController {
	@Resource(name = "UserService")
	private UserService userService;
	
	@Resource(name = "CommonService")
	private CommonService commonService;
	
	/**
	 * 사용자관리 페이지 호출
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/UserManager.do")
	public String UserManager(ModelMap model) throws Exception{
		// return "/common/UserManager";
		return "/rrs/Manager";
	}
	
	/**
	 * 사용자 정보 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/selectUserInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectUserInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", userService.selectUserInfo(param));
		
		return respData;
	}
	
	/**
	 * 사용자 정보 디테일 팝업 호출
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/UserInfoPopup.do")
	public String UserInfoPopup(ModelMap model,HttpServletRequest request) throws Exception{
		model.addAttribute("usertype", commonService.selectCommonCode("USER_TP"));
		//return "/popup/UserInfoPopup";
		return "/popup/rrs/ManagerInfoPopup";
	}
	
	/**
	 * 사용자 정보 저장
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/saveUserInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveUserInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		if(!userService.saveUserInfo(param)){
			respData.put("dup", "Y");
		}
		
		return respData;
	}
	
	/**
	 * 사용자 정보 삭제
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/deleteUserInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData deleteUserInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		userService.deleteUserInfo(param);
		
		return respData;
	}
	
	/**
	 * 패스워드 변경 팝업 호출
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/PwChangePopup.do")
	public String PwChangePopup(ModelMap model, HttpServletRequest req) throws Exception{
		LoginController loginController = new LoginController();
		loginController.initRsa(req);
		return "/popup/PwChangePopup";
	}
	
	@RequestMapping(value = "/common/PwInitChangePopup.do")
	public String PwInitChangePopup(ModelMap model, HttpServletRequest req) throws Exception{
		return "/popup/PwChangePopup";
	}
	
	@RequestMapping(value = "/common/changePw.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData changePw(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("COMP_CD", LoginInfo.getCompCd());
		BRespData respData = new BRespData();
		
		try{
			LoginController loginController = new LoginController();
			HttpSession session = req.getSession();
	        PrivateKey privateKey = (PrivateKey) session.getAttribute(LoginController.RSA_WEB_KEY);
	 
	        // 복호화
	        param.put("CURR_PASSWORD", loginController.decryptRsa(privateKey, param.getString("CURR_PASSWORD")));
	        param.put("NEW_PASSWORD", loginController.decryptRsa(privateKey, param.getString("NEW_PASSWORD")));
	        param.put("CONF_PASSWORD", loginController.decryptRsa(privateKey, param.getString("CONF_PASSWORD")));
	        
	        // 다시 암호화
	        param.put("CURR_PASSWORD", EgovFileScrty.encryptPassword(param.getString("CURR_PASSWORD"), param.getString("USER_ID")));
	        param.put("NEW_PASSWORD", EgovFileScrty.encryptPassword(param.getString("NEW_PASSWORD"), param.getString("USER_ID")));
	        param.put("CONF_PASSWORD", EgovFileScrty.encryptPassword(param.getString("CONF_PASSWORD"), param.getString("USER_ID")));
	        
	        userService.changePw(param);
	        
	        respData.put("success", true);
		}catch(Exception e){
			respData.put("success", false);
			respData.put("message", e.getMessage());
		}
		
		return respData;
	}
	
	@RequestMapping(value = "/common/initPw.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData initPw(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();

        param.put("NEW_PASSWORD", EgovFileScrty.encryptPassword("oms1234", param.getString("USER_ID")));
        
        userService.initPw(param);
        respData.put("success", true);

		return respData;
	}
}
