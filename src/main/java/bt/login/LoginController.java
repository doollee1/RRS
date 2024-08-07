package bt.login;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.RSAPublicKeySpec;
import java.util.Base64;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;

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
import egovframework.com.utl.sim.service.EgovFileScrty;
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
		
		logger.info("======== 로그인화면 =======");
		logger.info("======== 프로파일 : "+System.getProperty("spring.profiles.active"));
								
		return "/login/login";
	}
	
	
	/**
	 * RSA 초기화
	 * 
	 * @param reqData
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login/initRsaAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData initRsaAjax(@RequestBody BReqData reqData, HttpServletRequest request) throws Exception{
		
		logger.info("======== RSA 초기화  =======");
		
		BRespData respData = new BRespData();
		HttpSession session = request.getSession();
		 
        KeyPairGenerator generator;
        try {
            generator = KeyPairGenerator.getInstance(LoginController.RSA_INSTANCE);
            generator.initialize(1024);  //1024
 
            KeyPair keyPair = generator.genKeyPair();
            KeyFactory keyFactory = KeyFactory.getInstance(LoginController.RSA_INSTANCE);
            PublicKey publicKey = keyPair.getPublic();
            PrivateKey privateKey = keyPair.getPrivate();
 
            session.setAttribute(LoginController.RSA_WEB_KEY, privateKey); // session에 RSA 개인키를 세션에 저장
 
            RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
            String publicKeyModulus = publicSpec.getModulus().toString(16);
            String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
 
            respData.put("RSAModulus", publicKeyModulus); 	//rsa modulus 
            respData.put("RSAExponent", publicKeyExponent); //rsa exponent
                        
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		
        return respData;        
	}
	
	
	/**
	 * 로그인 처리
	 * 
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login/actionLogin.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData userOverlapCheck(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		
		logger.info("======== 로그인처리 =======");		
		
		BMap param = reqData.getParamDataMap("searchData");
		//logger.info("======== param : "+param);
		
		BRespData respData = new BRespData();
		
		HttpSession session = req.getSession();
		
		try{
										        
	        // 복호화	        	        	
	        String decryptedPasswd = decryptRsa(param.getString("PASSWORD"));
	        logger.info("======== decryptedPasswd : "+decryptedPasswd);	        	
	        param.put("PASSWORD", decryptedPasswd);
	        
	        			
	        // 다시 암호화
	        param.put("PASSWORD", EgovFileScrty.encryptPassword(param.getString("PASSWORD"), param.getString("USER_ID")));
	        
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
				//session.setMaxInactiveInterval(60*120);  //2시간 세션시간(60초 * 120)
				session.setAttribute("loginVO", loginVO);
			}
			
			String lang = param.getString("Language");

			if (lang != null) {
				WebUtils.setSessionAttribute((HttpServletRequest) req, SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, StringUtils.parseLocaleString(lang));
			}
			
		} catch(Exception e){
			
			logger.info("===== 로그인예외 : "+e.getMessage());
			e.printStackTrace();
			
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
			
		} finally {
			
			//개인키 세션에서 제거
			session.removeAttribute(LoginController.RSA_WEB_KEY);
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
		
		logger.info("======== 로그아웃 =======");
		
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
		
		logger.info("======== 세션아웃 =======");
		
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
        Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
        byte[] encryptedBytes = hexToByteArray(securedValue);
        
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
        return decryptedValue;
    }
    
    
    /**
     * RSA 복호화
     * 
     * @param encryptedText
     * @param stringPrivateKey
     * @return
     */
    public String decryptRsa(String encryptedText) {
		String decryptedText = "";
    	
		try {
			
			//RSA 개인키의 문자열
			org.springframework.core.io.Resource privateKeyResource = new ClassPathResource("/cert/private.key");
			String privateKeyContent = new BufferedReader(new InputStreamReader(privateKeyResource.getInputStream())).lines().collect(Collectors.joining("\n"));
			privateKeyContent = privateKeyContent
					.replace("-----BEGIN PRIVATE KEY-----", "")
					.replace("-----END PRIVATE KEY-----", "")
					.replaceAll("\\s+", "");
			
			//RSA 개인키를 Private 객체로 변환			
			byte[] privateKeyBytes = Base64.getDecoder().decode(privateKeyContent);
			PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(privateKeyBytes);
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			PrivateKey privateKey = keyFactory.generatePrivate(keySpec);

			//암호문을 바이트 배열로 변환하고 복호화
			byte[] encryptedBytes =  Base64.getDecoder().decode(encryptedText);
			Cipher cipher = Cipher.getInstance("RSA");
			cipher.init(Cipher.DECRYPT_MODE, privateKey);
			byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
			
			//복호화된 데이터 문자열로 변환					
			decryptedText = new String(decryptedBytes, StandardCharsets.UTF_8);
			
		} catch (Exception e) {
			e.printStackTrace();			
		}

		return decryptedText;
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
    	
    	logger.info("======= RSA 공개키, 개인키 생성 123 =========");
    	
        HttpSession session = request.getSession();
 
        KeyPairGenerator generator;
        try {
            generator = KeyPairGenerator.getInstance(LoginController.RSA_INSTANCE);
            generator.initialize(1024);   //1024
 
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
