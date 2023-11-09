package bt.api.aop;

import java.io.IOException;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class APIAuthenticationInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(APIAuthenticationInterceptor.class);
	
	private static final String COMMON_PROPERTIES_PATH = "/egovframework/properties/common.properties";
	
	private static final String QCELL_SSO_URI = "oms.q-cells.de";
	private static final String QCELL_SSO_VERIFY_URL = "https://" + QCELL_SSO_URI + "/sso/verify-sso-hash/";
	private static final String SSO_HASH = "hash";
	private static final String OMS_API_TOKEN = "token";
	private static final int OMS_API_TOKEN_EXPIRE_MINUTE = 30;
	
	private static final String OMS_API_LEADS = "/api/sales/leads";
	private static final String OMS_API_ORDERS = "/api/sales/orders";
	private static final String OMS_API_QUOTATIONS = "/api/sales/quotations";
	private static final String OMS_API_TEST = "/api/sales/test";
	private static final String OMS_API_CONFIRM = "/api/sales/confirm";
	
	private static final String HTTP_HEADER_AUTHORIZATION = "Authorization";
	private static final String HTTP_HEADER_AUTHORIZATION_BASIC = "Basic ";
	private static final String HTTP_HEADER_AUTHORIZATION_BEARER = "Bearer ";
	private static final String SSO_HTTP_ACCEPT_LANGUAGE = "HTTP_ACCEPT_LANGUAGE";
	private static final String SSO_HTTP_X_FORWARDED_FOR = "HTTP_X_FORWARDED_FOR";
	private static final String SSO_REMOTE_ADDR = "REMOTE_ADDR";
	private static final String SSO_HTTP_USER_AGENT = "HTTP_USER_AGENT";
	private static final String SSO_BASIC_AUTHORIZATION = "Basic cWNlbGxzLW9tczpBYkh6MzlmWUI2UVB0dVZNRE5H";
	
	private Properties properties;
	
	public APIAuthenticationInterceptor() {
		org.springframework.core.io.Resource resource = new ClassPathResource(COMMON_PROPERTIES_PATH);
		try {
			properties = PropertiesLoaderUtils.loadProperties(resource);
		} catch (IOException ioe) {
			logger.error(ioe.getLocalizedMessage());
		}
	}
	
	private boolean authenticate(String id, String password) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		// check authorization basic (id, password base) 
		if (!StringUtils.isEmpty(id) && !StringUtils.isEmpty(password)) {
			String userId = properties.getProperty("API.USERIDHASH");
			String userPassword = properties.getProperty("API.PASSWORDHASH");
			if (userId.equals(id) && userPassword.equals(password)) {
				return true;
			}
		}
		return false;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String reqUri = request.getRequestURI();
		logger.debug(reqUri);
		if (reqUri.equals(OMS_API_LEADS)) {
			String Authorization = request.getHeader(HTTP_HEADER_AUTHORIZATION);
			logger.debug("Authorization: " + Authorization);
			if (Authorization == null) {
				response.sendError(HttpStatus.UNAUTHORIZED.value());
				return false;
			}
			
			String decoded = Authorization.substring(HTTP_HEADER_AUTHORIZATION_BASIC.length(), Authorization.length());
			String authorizationValue = new String(Base64.getDecoder().decode(decoded), StandardCharsets.UTF_8);
			
			String[] values = authorizationValue.split(":");
			String id = values[0];
			String password = values[1];
			logger.debug("Authorization id: " + id + " password: " + password);
			if (!authenticate(id, password)) {
				response.sendError(HttpStatus.UNAUTHORIZED.value());
				return false;
			}
		} else if (reqUri.equals(OMS_API_QUOTATIONS) || reqUri.equals(OMS_API_CONFIRM)) {
			String Authorization = request.getHeader(HTTP_HEADER_AUTHORIZATION);
			logger.debug("Authorization: " + Authorization);
			if (Authorization == null) {
				response.sendError(HttpStatus.UNAUTHORIZED.value());
				return false;
			}
			
			String token = Authorization.substring(HTTP_HEADER_AUTHORIZATION_BEARER.length(), Authorization.length());
			
			try {
				// validate token (json web token base)
				String custCd = APITokenManager.authenticate(token);
				logger.debug("OMS_API_QUOTATIONS custCd: " + Authorization);
				request.setAttribute("custCd", custCd);
			} catch (HttpServerErrorException e) {
				logger.error(e.getLocalizedMessage());
				response.sendError(HttpStatus.UNAUTHORIZED.value(), e.getLocalizedMessage());
				return false;
			}
		} else if (reqUri.equals(OMS_API_TEST)) {
			// TODO
			// for test
			String omsToken = APITokenManager.createOmsToken(5, "custIdtest");
			request.setAttribute(OMS_API_TOKEN, omsToken);
			
			
		} else if (reqUri.equals(OMS_API_ORDERS)) {
			StringWriter writer = new StringWriter();
			IOUtils.copy(request.getInputStream(), writer, StandardCharsets.UTF_8);
			String param = writer.toString();
			logger.debug(">>> param: " + param);
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(param);
			String hash = (String) jsonObj.get("hash");
			
			MultiValueMap<String, String> body= new LinkedMultiValueMap<String, String>();
			body.add(SSO_HASH, hash);
			body.add(SSO_HTTP_ACCEPT_LANGUAGE, request.getHeader("Accept-Language"));
			body.add(SSO_HTTP_X_FORWARDED_FOR, request.getHeader("X-FORWARDED-FOR"));
			body.add(SSO_REMOTE_ADDR, request.getRemoteAddr());
			body.add(SSO_HTTP_USER_AGENT, request.getHeader("User-Agent"));
			
			HttpHeaders headers = new HttpHeaders();
			headers.set(HTTP_HEADER_AUTHORIZATION, SSO_BASIC_AUTHORIZATION);
			HttpEntity<MultiValueMap<String, String>> ssoReq = new HttpEntity<MultiValueMap<String, String>>(body, headers);
			
			RestTemplate restTemplate = new RestTemplate();
			logger.debug("request data: " + ssoReq.toString());
			String ssoRes = restTemplate.postForObject(QCELL_SSO_VERIFY_URL, ssoReq, String.class);
			logger.debug("verify result: " + ssoRes);
			
			JSONParser parser = new JSONParser();
			JSONObject json = (JSONObject) parser.parse(ssoRes);
			
			Boolean result = (Boolean) json.get("result");
			if (result != null && !result.booleanValue()) {
				logger.error(ssoRes);
				response.sendError(HttpStatus.UNAUTHORIZED.value());
				return false;
			}
			
			// create token from oms (json web token base)
			String omsToken = APITokenManager.createOmsToken(OMS_API_TOKEN_EXPIRE_MINUTE, (String) json.get("customerNumber"));
			request.setAttribute(OMS_API_TOKEN, omsToken);
			//request.setAttribute("custCd", (String) json.get("uid"));
			request.setAttribute("custCd", (String) json.get("customerNumber"));
					
		} else {
			response.sendError(HttpStatus.FORBIDDEN.value());
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}
	
	static {
		javax.net.ssl.HttpsURLConnection.setDefaultHostnameVerifier(new javax.net.ssl.HostnameVerifier() {
			public boolean verify(String hostname, javax.net.ssl.SSLSession sslSession) {
				if (QCELL_SSO_URI.equals(hostname)) {
					return true;
				} else {
					return false;
				}
			}
		});
	}
}
