package bt.btframework.utils;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import bt.btframework.common.vo.LoginVO;
import egovframework.com.utl.cas.service.EgovSessionCookieUtil;

public class LoginInfo {
	public static String getUserId() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		LoginVO loginUser = (LoginVO) request.getSession().getAttribute("loginVO");
		String userid = "";		
	
		if (loginUser != null)
			userid = loginUser.getUserId();
		
		return userid;
	}
	
	public static String getCompCd(){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		LoginVO loginUser = (LoginVO) request.getSession().getAttribute("loginVO");
		String compCd = "";		
	
		if (loginUser != null)
			compCd = loginUser.getCompCd();
		
		try {
			String lang = EgovSessionCookieUtil.getCookie(request, "Language");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return compCd;
	}
	
	//셋팅되어있는 language를 가져오기 위함.
	public static String getLang(){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		LoginVO loginUser = (LoginVO) request.getSession().getAttribute("loginVO");
		String lang = "";		
	
		if (loginUser != null){
			try {
				lang = EgovSessionCookieUtil.getCookie(request, "Language");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return lang;
	}
	
	public static String getEmail() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		LoginVO loginUser = (LoginVO) request.getSession().getAttribute("loginVO");
		String email = "";		
	
		if (loginUser != null)
			email = loginUser.getEmail();
		
		return email;
	}
	
	public static String getUserNm() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		LoginVO loginUser = (LoginVO) request.getSession().getAttribute("loginVO");
		String userNm = "";		
	
		if (loginUser != null)
			userNm = loginUser.getNameFull();
		
		return userNm;
	}
	
	public static String getErpId() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		LoginVO loginUser = (LoginVO) request.getSession().getAttribute("loginVO");
		String erpId = "";		
	
		if (loginUser != null)
			erpId = loginUser.getErpId();
		
		return erpId;
	}
}
