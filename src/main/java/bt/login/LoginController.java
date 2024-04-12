package bt.login;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.List;

import javax.annotation.Resource;
import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller ;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.util.WebUtils;

import bt.btframework.common.vo.LoginVO;
import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.common.service.CommonService;
import bt.login.service.LoginService;
import egovframework.com.utl.sim.service.EgovClntInfo;
import egovframework.com.utl.slm.EgovMultiLoginPreventor;

@Controller
public class LoginController {
	@Resource(name = "LoginService")
	private LoginService loginService;
	
	@Resource(name = "CommonService")
	private CommonService commonService;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	public static String RSA_WEB_KEY = "_RSA_WEB_Key_"; // 개인키 session key
    public static String RSA_INSTANCE = "RSA"; // rsa transformation

	/**
	 * 로그인 인덱스 화면
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/index.do")
	public String index(ModelMap model) throws Exception{		
		double erpPrice = Double.parseDouble(changeNormForm(String.valueOf("33,00")));
		double reqPrice = Double.parseDouble(changeNormForm(String.valueOf("32,50")));
		
		System.err.println( (erpPrice - reqPrice) > 1);
		return "forward:/login/login.do";
	}
	
	public String changeNormForm(String num) throws Exception{
		String rtnNm = "";
		
		if(null != num && !"".equals(num)){
			if(-1 != num.indexOf(",")){
				String[] tempVal = num.split(",");
				rtnNm = tempVal[0].replaceAll("\\.", "") + "." + tempVal[1];
			}else{
				rtnNm = num.replaceAll("\\.", "");
			}
		}
		
		return rtnNm;
	}
	
	@RequestMapping(value = "/login/login.do")
	public String login(ModelMap model, HttpServletRequest request) throws Exception{
		initRsa(request);
				
		return "/login/login";
	}
	
	@RequestMapping(value = "/login/actionLogin.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData userOverlapCheck(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("searchData");
		BRespData respData = new BRespData();
		
		try{
			HttpSession session = req.getSession();
	        PrivateKey privateKey = (PrivateKey) session.getAttribute(LoginController.RSA_WEB_KEY);
	 
	        // 복호화
	        // param.put("PASSWORD", decryptRsa(privateKey, param.getString("PASSWORD")));
	        
	        // 다시 암호화
	        // param.put("PASSWORD", EgovFileScrty.encryptPassword(param.getString("PASSWORD"), param.getString("USER_ID")));
	        
	        param.put("PASSWORD", "Tzobb92c73rPD/768CoaUjNm6YYsfnIDdXAhuF7z9ag=");

			LoginVO loginVO = loginService.selectCmUserForContractReq(param);
			
			// 사용자 그리드 정보 가져오기
			List<BMap> resultGridInfoAll = commonService.getGridColInfoAll(loginVO.getCompCd(), loginVO.getUserId());

			respData.put("resultGridInfoAll", resultGridInfoAll);
						
			if(EgovMultiLoginPreventor.findByLoginId(param.getString("USER_ID"))) {
				respData.put("OVERLAP", true);
			} else {
				respData.put("OVERLAP", false);
			}
			
			respData.put("success", true);
			
			BMap mapCmSysConect = new BMap();
			mapCmSysConect.put("USER_ID", param.get("USER_ID"));
			mapCmSysConect.put("USER_IP", EgovClntInfo.getClntIP(req));
			mapCmSysConect.put("USER_OS", EgovClntInfo.getClntOsInfo(req));
			mapCmSysConect.put("USERBROWSER", EgovClntInfo.getClntWebKind(req));
			mapCmSysConect.put("STATUS", "LOGIN");
			
			
			if(loginService.chk_init(mapCmSysConect) < 1){
				respData.put("INIT", "Y");
			}else{
				loginService.insertCmSysConectByLogin(mapCmSysConect);
				session.removeAttribute(LoginController.RSA_WEB_KEY);
			}
			
			respData.put("INIT", "Y");
			
			// 성공시에만 세션정보 저장
			if(loginVO != null){
				// 로그인정보를 세션에 저장
				//session.setMaxInactiveInterval(10); 
				//session.setMaxInactiveInterval(60*300);
				session.setMaxInactiveInterval(60*100); // 30분 세션시간
				session.setAttribute("loginVO", loginVO);
			}
			
			String lang = param.getString("Language");

			if (lang != null) {
				WebUtils.setSessionAttribute((HttpServletRequest) req, SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, StringUtils.parseLocaleString(lang));
			}
		}catch(Exception e){
			//접속실패 이력 등록
			BMap mapCmSysConect = new BMap();
			mapCmSysConect.put("USER_ID", param.get("USER_ID"));
			mapCmSysConect.put("USER_IP", EgovClntInfo.getClntIP(req));
			mapCmSysConect.put("USER_OS", EgovClntInfo.getClntOsInfo(req));
			mapCmSysConect.put("USERBROWSER", EgovClntInfo.getClntWebKind(req));
			mapCmSysConect.put("STATUS", "FAIL");
			loginService.insertCmSysConectByLogin(mapCmSysConect);
			
			respData.put("success", false);
			respData.put("message", e.getMessage());
		}
		
		return respData;
	}
	
	/**
	 * 로그아웃 처리
	 * @param reqData
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login/logout.do")
	public String getDeptBalanceStatusList(HttpServletRequest req) throws Exception {
		BMap mapCmSysConect = new BMap();
		mapCmSysConect.put("USER_ID", LoginInfo.getUserId());
		mapCmSysConect.put("USER_IP", EgovClntInfo.getClntIP(req));
		mapCmSysConect.put("USER_OS", EgovClntInfo.getClntOsInfo(req));
		mapCmSysConect.put("USERBROWSER", EgovClntInfo.getClntWebKind(req));
		mapCmSysConect.put("STATUS", "LOGOUT");
		loginService.insertCmSysConectByLogin(mapCmSysConect);
		
		req.getSession().invalidate();
		
		return "redirect:/";
	}
	
	/**
	 * 세션아웃
	 */
	@RequestMapping(value = "/login/sessionout.do")
	public String sessionOut(HttpServletRequest req) throws Exception {
		return "/login/sessionout";
	}
	
	/**
     * 복호화
     * 
     * @param privateKey
     * @param securedValue
     * @return
     * @throws Exception
     */
    public String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
        Cipher cipher = Cipher.getInstance(LoginController.RSA_INSTANCE);
        byte[] encryptedBytes = hexToByteArray(securedValue);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
        return decryptedValue;
    }
 
    /**
     * 16진 문자열을 byte 배열로 변환한다.
     * 
     * @param hex
     * @return
     */
    public static byte[] hexToByteArray(String hex) {
        if (hex == null || hex.length() % 2 != 0) { return new byte[] {}; }
 
        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte) Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int) Math.floor(i / 2)] = value;
        }
        return bytes;
    }
 
    /**
     * rsa 공개키, 개인키 생성
     * 
     * @param request
     */
    public void initRsa(HttpServletRequest request) {
        HttpSession session = request.getSession();
 
        KeyPairGenerator generator;
        try {
            generator = KeyPairGenerator.getInstance(LoginController.RSA_INSTANCE);
            generator.initialize(1024);
 
            KeyPair keyPair = generator.genKeyPair();
            KeyFactory keyFactory = KeyFactory.getInstance(LoginController.RSA_INSTANCE);
            PublicKey publicKey = keyPair.getPublic();
            PrivateKey privateKey = keyPair.getPrivate();
 
            session.setAttribute(LoginController.RSA_WEB_KEY, privateKey); // session에 RSA 개인키를 세션에 저장
 
            RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
            String publicKeyModulus = publicSpec.getModulus().toString(16);
            String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
 
            request.setAttribute("RSAModulus", publicKeyModulus); // rsa modulus 를 request 에 추가
            request.setAttribute("RSAExponent", publicKeyExponent); // rsa exponent 를 request 에 추가
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
