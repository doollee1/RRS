package bt.api.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.commons.lang3.StringUtils;
import org.springframework.util.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.util.WebUtils;

import com.google.gson.Gson;

import bt.api.service.APIService;
import bt.btframework.utils.BMap;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.ResponseStatus;
import bt.common.service.SapIfService;

@RestController
@RequestMapping("/api")
public class APIController {
	private static final Logger logger = LoggerFactory.getLogger(APIController.class);
	
	private static final String OMS_API_TOKEN = "token";
	private static final String COMP_CD = "1000";
	
	@Resource
	private APIService apiService;
	
	@Resource
	private SapIfService sapService;
	
	@RequestMapping(value = "/sales/leads", method = RequestMethod.POST)
	public BRespData leads(@RequestBody Map<String, Object> req, HttpServletResponse res) throws Exception {
		// check validation
		//if (StringUtils.isBlank((String) req.get("appId")) || StringUtils.isBlank((String) req.get("surId")) ||
		//		StringUtils.isBlank((String) req.get("svyId")) || StringUtils.isBlank((String) req.get("svyVer"))) {
		if(null != req.get("appId") && !"".equals(req.get("appId")) || null != req.get("surId") && !"".equals(req.get("surId")) ||
				null != req.get("svyId") && !"".equals(req.get("svyId")) || null != req.get("svyVer") && !"".equals(req.get("svyVer"))){	
			logger.debug("check mandatory field (appId, surId, svyId, svyVer)");
			res.sendError(HttpStatus.BAD_REQUEST.value(), "check mandatory field (appId, surId, svyId, svyVer)");
			return null;
		}
		
		apiService.insertLead(req);
		BRespData response = new BRespData(ResponseStatus.OK);
		return response;
	}
	
	@RequestMapping(value = "/sales/orders", method = RequestMethod.POST)
	public ModelAndView orders(@RequestBody Map<String, Object> req, HttpServletRequest request, HttpServletResponse res) throws Exception {
		
		ModelAndView view = new ModelAndView("/external/orders");
		
		// add token info
		// String custCd = (String) request.getAttribute("custCd");	// 운영용
		
		String custCd = (String) req.get("custCd"); // 개발 테스트용
		
		String token = (String) request.getAttribute(OMS_API_TOKEN);
		req.put("COMP_CD", COMP_CD);
		req.put("CUST_CD", custCd);				
		req.put("TOKEN_ID", token);		
	
		view.addObject(OMS_API_TOKEN, token);
		
		// add external data
		Map<String, Object> externalMap  = null;
		try {
			externalMap = apiService.selectExternalInfo(req);
		} catch(Exception ex) {
			logger.debug(ex.getMessage());
		}
		
		BMap customerInfo = (BMap)externalMap.get("custinfo");
		String lang = (String)customerInfo.get("LANG_CD");

		if (lang != null) {
			WebUtils.setSessionAttribute(request, SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, StringUtils.parseLocaleString(lang));
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(externalMap);
		view.addObject("externalMap", json);
		
		return view;
	}
	
	@RequestMapping(value = "/sales/test", method = RequestMethod.POST)
	public ModelAndView test(@RequestBody Map<String, Object> req, HttpServletRequest request, HttpServletResponse res) throws Exception {
		
		ModelAndView view = new ModelAndView("/external/orders");
		
		// String custCd = (String) request.getAttribute("custCd");	// 운영용
		String custCd = (String) req.get("custCd"); // 개발 테스트용
		
		String token = (String) request.getAttribute(OMS_API_TOKEN);
		req.put("COMP_CD", COMP_CD);
		req.put("CUST_CD", custCd);				
		req.put("TOKEN_ID", token);		
	
		view.addObject(OMS_API_TOKEN, token);
		
		// add external data
		Map<String, Object> externalMap  = null;
		try {
			externalMap = apiService.selectExternalInfo(req);
		} catch(Exception ex) {
			logger.debug(ex.getMessage());
		}
		Gson gson = new Gson();
		String json = gson.toJson(externalMap);
		view.addObject("externalMap", json);
		
		return view;
	}
	
	
	@RequestMapping(value = "/sales/quotations", method = RequestMethod.POST)
	public BRespData quotations(@RequestBody Map<String, Object> req, HttpServletRequest request, HttpServletResponse res) throws Exception {
		
		// String custCd = (String) request.getAttribute("custCd");	// 운영용
		String custCd = (String) req.get("custCd"); // 개발 테스트용
		
		String token = (String) request.getAttribute(OMS_API_TOKEN);
		req.put("COMP_CD", COMP_CD);
		req.put("CUST_CD", custCd);
		req.put("TOKEN_ID", token);
		
		BRespData response = new BRespData();
		try {
			// 주문을 table 넣기
			apiService.insertSalesOrder(req);
			response.setStatus(ResponseStatus.OK);
		} catch(Exception ex) {
			response.setMessage(ex.getMessage());
			response.setStatus(ResponseStatus.Internal_Server_Error);
		}
		return response;
	}

	
	@RequestMapping(value = "/sales/confirm", method = RequestMethod.POST)
	public BRespData confirm(@RequestBody Map<String, Object> req, HttpServletRequest request, HttpServletResponse res) throws Exception {
		
		// String custCd = (String) request.getAttribute("custCd");	// 운영용
		String custCd = (String) req.get("custCd"); // 개발 테스트용

		String token = (String) request.getAttribute(OMS_API_TOKEN);		
		req.put("COMP_CD", COMP_CD);
		req.put("CUST_CD", custCd);
		req.put("TOKEN_ID", token);		 	

		BRespData response = new BRespData();
		try {
			apiService.confirmSales(req);
			response.setStatus(ResponseStatus.OK);
		} catch(Exception ex) {
			response.setMessage(ex.getMessage());
			response.setStatus(ResponseStatus.Internal_Server_Error);
		}
		return response;
	}
}