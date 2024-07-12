/**
 *  Class Name : EgovClntInfo.java
 *  Description : 클라이언트(Client)의 IP주소, OS정보, 웹브라우저정보를 조회하는 Business Interface class
 *  Modification Information
 * 
 *     수정일         수정자                   수정내용
 *   -------    --------    ---------------------------
 *   2009.01.19    박지욱          최초 생성
 *
 *  @author 공통 서비스 개발팀 박지욱
 *  @since 2009. 01. 19
 *  @version 1.0
 *  @see 
 * 
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
package egovframework.com.utl.sim.service;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EgovClntInfo {
	
	private static final Logger logger = LoggerFactory.getLogger(EgovClntInfo.class);
			
	/**
	 * 클라이언트(Client)의 IP주소를 조회하는 기능
	 * @param HttpServletRequest request Request객체
	 * @return String ipAddr IP주소
	 * @exception Exception
	*/
	public static String getClntIP(HttpServletRequest request) throws Exception {
		
		logger.info("===== 클라이언트IP 확인 =====");
		
	    String ip = request.getHeader("X-Forwarded-For");
	    logger.info("> X-FORWARDED-FOR : " + ip);

	    if (ip == null) {
	        ip = request.getHeader("Proxy-Client-IP");
	        logger.info("> Proxy-Client-IP : " + ip);
	    }
	    if (ip == null) {
	        ip = request.getHeader("WL-Proxy-Client-IP");
	        logger.info(">  WL-Proxy-Client-IP : " + ip);
	    }
	    if (ip == null) {
	        ip = request.getHeader("HTTP_CLIENT_IP");
	        logger.info("> HTTP_CLIENT_IP : " + ip);
	    }
	    if (ip == null) {
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	        logger.info("> HTTP_X_FORWARDED_FOR : " + ip);
	    }
	    if (ip == null) {
	        ip = request.getRemoteAddr();
	        logger.info("> getRemoteAddr : "+ip);
	    }
	    logger.info("> Result : IP Address : "+ip);
		
	    // IP주소
		//String ipAddr = request.getRemoteAddr();
		return ip;
	}
	
	/**
	 * 클라이언트(Client)의 OS 정보를 조회하는 기능
	 * @param HttpServletRequest request Request객체
	 * @return String osInfo OS 정보
	 * @exception Exception
	*/
	public static String getClntOsInfo(HttpServletRequest request) throws Exception {
	
		String userAgent = request.getHeader("user-agent").toUpperCase();
		String osInfo = "";
		if (userAgent.indexOf("WINDOWS NT 6.1") > -1) {
			osInfo = "Windows 7";
		}
		else if (userAgent.indexOf("WINDOWS NT 6.2") > -1) {
			osInfo = "Windows 8";
		}
		else if (userAgent.indexOf("WINDOWS NT 6.3") > -1) {
			osInfo = "Windows 8.1";
		}
		else if (userAgent.indexOf("WINDOWS NT 10.0") > -1) {
			osInfo = "Windows 10";
		}
		else if (userAgent.indexOf("WINDOWS NT 6.0") > -1) {
			osInfo = "Windows Vista";
		}
		else if (userAgent.indexOf("WINDOWS NT 5.1") > -1) {
			osInfo = "Windows XP";
		}
		else if (userAgent.indexOf("WINDOWS NT 5.0") > -1) {
			osInfo = "Windows 2000";
		}
		else if (userAgent.indexOf("WINDOWS NT 4.0") > -1) {
			osInfo = "Windows NT";
		}
		else if (userAgent.indexOf("WINDOWS 98") > -1) {
			osInfo = "Windows 98";
		}
		else if (userAgent.indexOf("WINDOWS 95") > -1) {
			osInfo = "Windows 95";
		}
		//window 외
		else if (userAgent.indexOf("IPHONE") > -1) {
			osInfo = "iPhone";
		}
		else if (userAgent.indexOf("IPAD") > -1) {
			osInfo = "iPad";
		}
		else if (userAgent.indexOf("ANDROID") > -1) {
			osInfo = "Android";
		}
		else if (userAgent.indexOf("MAC") > -1) {
			osInfo = "Mac";
		}
		else if (userAgent.indexOf("LINUX") > -1) {
			osInfo = "Linux";
		}
		else {
			osInfo = "OtherOS";
		}
		return osInfo;
	}
	
	/**
	 * 클라이언트(Client)의 웹브라우저 종류를 조회하는 기능
	 * @param HttpServletRequest request Request객체
	 * @return String webKind 웹브라우저 종류
	 * @exception Exception
	*/
	public static String getClntWebKind(HttpServletRequest request) throws Exception {
		
		String user_agent = request.getHeader("user-agent");
		
		// 웹브라우저 종류 조회
		String webKind = "";
		if (user_agent.toUpperCase().indexOf("GECKO") != -1) {
			if (user_agent.toUpperCase().indexOf("NESCAPE") != -1) {
				webKind = "Netscape (Gecko/Netscape)";
			} else if (user_agent.toUpperCase().indexOf("FIREFOX") != -1) {
				webKind = "Mozilla Firefox (Gecko/Firefox)";
			} else {
				webKind = "Mozilla (Gecko/Mozilla)";
			}
		} else if (user_agent.toUpperCase().indexOf("MSIE") != -1) {
			if (user_agent.toUpperCase().indexOf("OPERA") != -1) {
				webKind = "Opera (MSIE/Opera/Compatible)";
			} else {
				webKind = "Internet Explorer (MSIE/Compatible)";
			}
		} else if (user_agent.toUpperCase().indexOf("SAFARI") != -1) {
			if (user_agent.toUpperCase().indexOf("CHROME") != -1) {
				webKind = "Google Chrome";
			} else {
				webKind = "Safari";
			}
		} else if (user_agent.toUpperCase().indexOf("THUNDERBIRD") != -1) {
			webKind = "Thunderbird";
		} else {
			webKind = "Other Web Browsers";
		}
		return webKind;
	}
	
	/**
	 * 클라이언트(Client)의 웹브라우저 버전을 조회하는 기능
	 * @param HttpServletRequest request Request객체
	 * @return String webVer 웹브라우저 버전
	 * @exception Exception
	*/
	public static String getClntWebVer(HttpServletRequest request) throws Exception {
		
		String user_agent = request.getHeader("user-agent");
		
		// 웹브라우저 버전 조회
		String webVer = "";
		String [] arr = {"MSIE", "OPERA", "NETSCAPE", "FIREFOX", "SAFARI"};
		for (int i = 0; i < arr.length; i++) {
			int s_loc = user_agent.toUpperCase().indexOf(arr[i]);
			if (s_loc != -1) {
				int f_loc = s_loc + arr[i].length();
				webVer = user_agent.toUpperCase().substring(f_loc, f_loc+5);
				webVer = webVer.replaceAll("/", "").replaceAll(";", "").replaceAll("^", "").replaceAll(",", "").replaceAll("//.", "");
			}
		}
		return webVer;
	}
}
