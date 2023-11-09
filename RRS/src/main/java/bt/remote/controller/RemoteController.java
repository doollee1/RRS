package bt.remote.controller;

import java.io.InputStream;
import java.io.StringReader;
import java.io.StringWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.util.JAXBSource;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.util.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.ResourceAccessException;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.btframework.utils.ResponseStatus;
import bt.customer.service.CustomerService;
import bt.remote.AtradiusXmlElement;
import bt.remote.EutaxationXmlElement;

@RestController
@RequestMapping("/remote")
public class RemoteController {
	private static final Logger logger = LoggerFactory.getLogger(RemoteController.class);
	
	private static final String ATRADIUS_XSL = "/xsl/atradius.xsl";
	private static final String EUTAXATION_XSL = "/xsl/eutaxation.xsl";

	// atradius - product
	private static final String ATRADIUS_URI = "https://www.atradius.com";
	private static final String ATRADIUS_ORGANISATION_URI = ATRADIUS_URI + "/PRODORGSEARCH/services/OrgSearchSoapPort" ;   
	private static final String ATRADIUS_COVERAPPLICATION_URI = ATRADIUS_URI + "/PRODConnectWS/services/CoverApplication"; 
	private static final String ATRADIUS_COVERDECISION_URI = ATRADIUS_URI + "/PRODConnectWS/services/CoverDecision"; 
	private static final String ATRADIUS_PORTFOLIO_URI = ATRADIUS_URI + "/PRODConnectWS/services/CoverPortfolioSynchronisation";  

	// atradius - dev
//	private static final String ATRADIUS_URI = "https://servatnettest.atradius.com";
//	private static final String ATRADIUS_ORGANISATION_URI = ATRADIUS_URI + "/BATORGSEARCH/services/OrgSearchSoapPort";  		 
//	private static final String ATRADIUS_COVERAPPLICATION_URI = ATRADIUS_URI + "/BATConnectWS/services/CoverApplication";		
//	private static final String ATRADIUS_COVERDECISION_URI = ATRADIUS_URI + "/BATConnectWS/services/CoverDecision";				
//	private static final String ATRADIUS_PORTFOLIO_URI = ATRADIUS_URI + "/BATConnectWS/services/CoverPortfolioSynchronisation";	
	
	// eu commission
	private static final String EUTAXATION_VATSERVICE_URI = "http://ec.europa.eu/taxation_customs/vies/services/checkVatService";
	
	private static final String GERMAN_REVENUE_URL = "https://evatr.bff-online.de/evatrRPC";
	private static final String GERMAN_REVENUE_PARAM_USTID1 = "UstId_1";
	private static final String GERMAN_REVENUE_PARAM_USTID2 = "UstId_2";
	private static final String GERMAN_REVENUE_PARAM_FIRMENNAME = "Firmenname";
	private static final String GERMAN_REVENUE_PARAM_ORT = "Ort";
	private static final String GERMAN_REVENUE_PARAM_PLZ = "PLZ";
	private static final String GERMAN_REVENUE_PARAM_STRASSE = "Strasse";
	private static final String GERMAN_REVENUE_PARAM_DRUCK = "Druck";
	private static final String GERMAN_REVENUE_RESULT = "ErrorCode";
	private static final String DE_COMP_CD = "1000";
	private static final String FR_COMP_CD = "3500";
	private static final String DE_POLICY_NO = "369446";
	private static final String FR_POLICY_NO = "907912";
	
	@Resource
	private CustomerService customerService;
	
	@RequestMapping(value = "/checkEuropeanCommission.do", method = RequestMethod.POST)
	public BRespData checkEuropeanCommission(@RequestBody Map<String, String> req) throws Exception {
		BRespData res = new BRespData(ResponseStatus.Internal_Server_Error);
		String vatRegNo = req.get("VAT_REG_NO");
		if (StringUtils.isEmpty(vatRegNo)) {
			return new BRespData(ResponseStatus.Bad_Request);
		}
		
		try {
			EutaxationXmlElement element = new EutaxationXmlElement();
			element.setCountryCode(vatRegNo.substring(0, 2));
			element.setVatNumber(vatRegNo.substring(2, vatRegNo.length()));
			
			RestTemplate restTemplate = new RestTemplate();
			String param = transformXML(EUTAXATION_XSL, element);
			logger.debug(param.toString());
			String response = restTemplate.postForObject(EUTAXATION_VATSERVICE_URI, param, String.class);
			logger.debug(response);
			
			return new BRespData(ResponseStatus.OK, response);
		} catch (RestClientException e) {
			if (e instanceof HttpStatusCodeException) {
				HttpStatusCodeException hsce = (HttpStatusCodeException) e;
				res.setMessage(hsce.getResponseBodyAsString());
				logger.warn(hsce.getResponseBodyAsString());
			} else {
				res.setMessage(e.getLocalizedMessage());
				logger.error(e.getLocalizedMessage());
			}
		}
		
		return res;
	}
	
	@RequestMapping(value = "/checkGermanRevenue.do", method = RequestMethod.POST)
	public BRespData checkGermanRevenue(@RequestBody Map<String, String> req) throws Exception {
		
		
		StringBuilder sb = new StringBuilder();
		sb.append(GERMAN_REVENUE_URL)
			.append("?")
			.append(GERMAN_REVENUE_PARAM_USTID1)
			.append("=")
			.append(req.get("GERMAN_REVENUE_PARAM_USTID1"))
			.append("&")
			.append(GERMAN_REVENUE_PARAM_USTID2)
			.append("=")
			.append(req.get("GERMAN_REVENUE_PARAM_USTID2"))
			.append("&")
			.append(GERMAN_REVENUE_PARAM_FIRMENNAME)
			.append("=")
			.append(req.get("GERMAN_REVENUE_PARAM_FIRMENNAME"))
			.append("&")
			.append(GERMAN_REVENUE_PARAM_ORT)
			.append("=")
			.append(req.get("GERMAN_REVENUE_PARAM_ORT"))
			.append("&")
			.append(GERMAN_REVENUE_PARAM_PLZ)
			.append("=")
			.append(req.get("GERMAN_REVENUE_PARAM_PLZ"))
			.append("&")
			.append(GERMAN_REVENUE_PARAM_STRASSE)
			.append("=")
			.append(req.get("GERMAN_REVENUE_PARAM_STRASSE"))
			.append("&")
			.append(GERMAN_REVENUE_PARAM_DRUCK)
			.append("=")
			.append(req.get("GERMAN_REVENUE_PARAM_DRUCK"));
		
		
		BRespData res = new BRespData(ResponseStatus.Internal_Server_Error);
		String vatRegNo = req.get("VAT_REG_NO");
//		if (StringUtils.isEmpty(vatRegNo)) {
//			return new BRespData(ResponseStatus.Bad_Request);
//		}
		
		RestTemplate restTemplate = new RestTemplate();
		
		try {
			String result = restTemplate.getForObject(sb.toString(), String.class);
			int idx = result.indexOf(GERMAN_REVENUE_RESULT);
			
			System.err.println(result);
			
			if (idx > 0) {
				idx += 42;
				if ("200".equals(result.substring(idx, idx + 3))) {
					res.setStatus(ResponseStatus.OK);
				}
			}
		} catch (IllegalArgumentException iae) {
			res.setData(iae.getLocalizedMessage());
			logger.error(iae.getLocalizedMessage());
		} catch (ResourceAccessException rae) {
			res.setData(rae.getLocalizedMessage());
			logger.error(rae.getLocalizedMessage());
		} catch (RestClientException e) {
			if (e instanceof HttpStatusCodeException) {
				HttpStatusCodeException hsce = (HttpStatusCodeException) e;
				res.setData(hsce.getResponseBodyAsString());
				logger.warn(hsce.getResponseBodyAsString());
			} else {
				res.setData(e.getLocalizedMessage());
				logger.error(e.getLocalizedMessage());
			}
		}
		
		return res;
	}
	
	@RequestMapping(value = "/retrieveOrganisationID.do", method = RequestMethod.POST)
	public BRespData retrieveOrganisationID(@RequestBody Map<String, String> req) throws Exception {
		BRespData res = new BRespData(ResponseStatus.Internal_Server_Error);
		
		try {
			AtradiusXmlElement atradiusXmlElement = new AtradiusXmlElement();
			atradiusXmlElement.setApi("getOrganisations");
			atradiusXmlElement.setId("DEHT68J");		// product
			atradiusXmlElement.setPassword("winter77");	// product
//			atradiusXmlElement.setId("ZZHT681");		// dev
//			atradiusXmlElement.setPassword("summer18");	// dev
			
			atradiusXmlElement.setName(req.get("CUST_NM"));
			atradiusXmlElement.setVatNumber(req.get("VAT_REG_NO"));
			//atradiusXmlElement.setStreetLine(req.get("STREET_NM") + ' ' + req.get("HAUS_NO"));
			//atradiusXmlElement.setPostcode(req.get("POST_CD"));
			//atradiusXmlElement.setCity(req.get("CITY_NM"));
			Locale locale = new Locale("", req.get("COUNTRY_CD"));
			String country = locale.getISO3Country();
			atradiusXmlElement.setCountry(country);
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.TEXT_XML);
			headers.set("SOAPAction", "");
			
			RestTemplate restTemplate = new RestTemplate();
			String param = transformXML(ATRADIUS_XSL, atradiusXmlElement);
			HttpEntity<String> request = new HttpEntity<String>(param, headers);
			logger.debug(request.toString());
			String response = restTemplate.postForObject(ATRADIUS_ORGANISATION_URI, request, String.class);
			logger.debug(response);
			
			return new BRespData(ResponseStatus.OK, response);
		} catch (RestClientException e) {
			if (e instanceof HttpStatusCodeException) {
				HttpStatusCodeException hsce = (HttpStatusCodeException) e;
				logger.warn(hsce.getResponseBodyAsString());
				return new BRespData(ResponseStatus.OK, hsce.getResponseBodyAsString());
			} else {
				res.setMessage(e.getLocalizedMessage());
				logger.error(e.getLocalizedMessage());
			}
		}
		
		return res;
	}
	
	@RequestMapping(value = "/checkCredit.do", method = RequestMethod.POST)
	public BRespData checkCredit(@RequestBody Map<String, String> req) throws Exception {
		BRespData res = new BRespData(ResponseStatus.Internal_Server_Error);
		
		try {
			AtradiusXmlElement atradiusXmlElement = new AtradiusXmlElement();
			atradiusXmlElement.setApi("checkCredit");
			atradiusXmlElement.setId("DEHT68J");		// product
			atradiusXmlElement.setPassword("winter77");	// product
//			atradiusXmlElement.setId("ZZHT681");		// dev
//			atradiusXmlElement.setPassword("summer18");	// dev
			atradiusXmlElement.setPolicy("369446");			
			//TODO
			atradiusXmlElement.setOrganisationID("");
			atradiusXmlElement.setBuyerId("");
			atradiusXmlElement.setBuyerCountryTypeIdentifier("");
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.TEXT_XML);
			headers.set("SOAPAction", "");
			
			RestTemplate restTemplate = new RestTemplate();
			String param = transformXML(ATRADIUS_XSL, atradiusXmlElement);
			HttpEntity<String> request = new HttpEntity<String>(param, headers);
			logger.debug(request.toString());
			String response = restTemplate.postForObject(ATRADIUS_COVERAPPLICATION_URI, request, String.class);
			logger.debug(response);
			
			return new BRespData(ResponseStatus.OK, response);
		} catch (RestClientException e) {
			if (e instanceof HttpStatusCodeException) {
				HttpStatusCodeException hsce = (HttpStatusCodeException) e;
				logger.warn(hsce.getResponseBodyAsString());
				return new BRespData(ResponseStatus.OK, hsce.getResponseBodyAsString());
			} else {
				res.setMessage(e.getLocalizedMessage());
				logger.error(e.getLocalizedMessage());
			}
		}
		
		return res;
	}
	
	@RequestMapping(value = "/creditLimit.do", method = RequestMethod.POST)
	public BRespData creditLimit(@RequestBody Map<String, String> req) throws Exception {
		BRespData res = new BRespData(ResponseStatus.Internal_Server_Error);		
		String compcd = req.get("COMP_CD");		

		// updateCustomerRemoteCredit
	 	Map<String, Object> map = new HashMap<String, Object>();
	 	map.put("USER_ID", LoginInfo.getUserId());
	 	map.put("REQ_CREDIT", req.get("REQUEST_AMOUNT"));
	 	map.put("CUST_CD", req.get("CUST_CD"));
	 	
		customerService.updateCustomerRemoteCredit(map);
		
		try {
			AtradiusXmlElement atradiusXmlElement = new AtradiusXmlElement();
			atradiusXmlElement.setApi("creditLimit");
			atradiusXmlElement.setId("DEHT68J");		// product
			atradiusXmlElement.setPassword("winter77");	// product
//			atradiusXmlElement.setId("ZZHT681");		// dev
//			atradiusXmlElement.setPassword("summer18");	// dev
			
			if (DE_COMP_CD.equals(compcd)) {
				atradiusXmlElement.setPolicy(DE_POLICY_NO);
			} else if (FR_COMP_CD.equals(compcd)) {
				atradiusXmlElement.setPolicy(FR_POLICY_NO);
			} else {				
				throw new Exception("invalid company code.");
			}			
			
			atradiusXmlElement.setCustomerReference(req.get("CUST_CD"));			
			atradiusXmlElement.setBuyerId(req.get("EASY_NO"));
			
			atradiusXmlElement.setRequestedAmount(req.get("REQUEST_AMOUNT"));
			atradiusXmlElement.setCurrencyCode("EUR");
			
			Date date = new Date();
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			atradiusXmlElement.setEffectFromDate(dateFormat.format(date));
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.TEXT_XML);
			headers.set("SOAPAction", "");
			
			RestTemplate restTemplate = new RestTemplate();
			String param = transformXML(ATRADIUS_XSL, atradiusXmlElement);
			
			// TODO
			param = param.replaceAll("rassxmlns", "xmlns");
			
			HttpEntity<String> request = new HttpEntity<String>(param, headers);
			try {
				logger.debug(request.toString());
				String response = restTemplate.postForObject(ATRADIUS_COVERAPPLICATION_URI, request, String.class);
				logger.debug(response);
				
				return new BRespData(ResponseStatus.OK, response);
			} catch (RestClientException rce) {
				HttpStatusCodeException hsce = (HttpStatusCodeException) rce;
				DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
				Document doc = builder.parse(new InputSource(new StringReader(hsce.getResponseBodyAsString())));
				NodeList errorCodeNode = doc.getElementsByTagName("ns2:errorCode");
				String errorCode = errorCodeNode.item(0).getTextContent();
				
				if ("X022A".equals(errorCode)) {
					atradiusXmlElement.setApi("creditSupersedeLimit");
					Calendar cal = Calendar.getInstance();
					cal.setTime(date);
					cal.add(Calendar.MONTH, 3);
					atradiusXmlElement.setEffectToDate(dateFormat.format(cal.getTime()));
				} else {
					return new BRespData(ResponseStatus.OK, hsce.getResponseBodyAsString());
				}
			}
			
			param = transformXML(ATRADIUS_XSL, atradiusXmlElement);
			request = new HttpEntity<String>(param, headers);
			
			logger.debug(request.toString());
			String response = restTemplate.postForObject(ATRADIUS_COVERAPPLICATION_URI, request, String.class);
			logger.debug(response);
			
			
			return new BRespData(ResponseStatus.OK, response);
		} catch (RestClientException e) {
			if (e instanceof HttpStatusCodeException) {
				HttpStatusCodeException hsce = (HttpStatusCodeException) e;
				logger.warn(hsce.getResponseBodyAsString());
				return new BRespData(ResponseStatus.OK, hsce.getResponseBodyAsString());
			} else {
				res.setMessage(e.getLocalizedMessage());
				logger.error(e.getLocalizedMessage());
			}
		}
		
		return res;
	}
	
	@RequestMapping(value = "/cancelCredit.do", method = RequestMethod.POST)
	public BRespData cancelCredit(@RequestBody Map<String, String> req) throws Exception {
		BRespData res = new BRespData(ResponseStatus.Internal_Server_Error);
		String compcd = req.get("COMP_CD");
		
		try {
			AtradiusXmlElement atradiusXmlElement = new AtradiusXmlElement();
			atradiusXmlElement.setApi("cancelCredit");
			atradiusXmlElement.setId("DEHT68J");		// product
			atradiusXmlElement.setPassword("winter77");	// product
//			atradiusXmlElement.setId("ZZHT681");		// dev
//			atradiusXmlElement.setPassword("summer18");	// dev
						
			if (DE_COMP_CD.equals(compcd)) {
				atradiusXmlElement.setPolicy(DE_POLICY_NO);
			} else if (FR_COMP_CD.equals(compcd)) {
				atradiusXmlElement.setPolicy(FR_POLICY_NO);
			} else {				
				throw new Exception("invalid company code.");
			}	
			
			atradiusXmlElement.setBuyerId(req.get("EASY_NO"));
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.TEXT_XML);
			headers.set("SOAPAction", "");
			
			RestTemplate restTemplate = new RestTemplate();
			String param = transformXML(ATRADIUS_XSL, atradiusXmlElement);
			HttpEntity<String> request = new HttpEntity<String>(param, headers);
			logger.debug(request.toString());
			String response = restTemplate.postForObject(ATRADIUS_COVERDECISION_URI, request, String.class);
			logger.debug(response);
			
			return new BRespData(ResponseStatus.OK, response);
		} catch (RestClientException e) {
			if (e instanceof HttpStatusCodeException) {
				HttpStatusCodeException hsce = (HttpStatusCodeException) e;
				logger.warn(hsce.getResponseBodyAsString());
				return new BRespData(ResponseStatus.OK, hsce.getResponseBodyAsString());
			} else {
				res.setMessage(e.getLocalizedMessage());
				logger.error(e.getLocalizedMessage());
			}
		}
		
		return res;
	}
	
	@RequestMapping(value = "/retrievePortfolio.do", method = RequestMethod.POST)
	public BRespData retrievePortfolio(@RequestBody Map<String, String> req) throws Exception {
		BRespData res = new BRespData(ResponseStatus.Internal_Server_Error);
		String compcd = req.get("COMP_CD");
		
		try {
			AtradiusXmlElement atradiusXmlElement = new AtradiusXmlElement();
			atradiusXmlElement.setApi("retrievePortfolio");
			atradiusXmlElement.setId("DEHT68J");		// product
			atradiusXmlElement.setPassword("winter77");	// product
//			atradiusXmlElement.setId("ZZHT681");		// dev
//			atradiusXmlElement.setPassword("summer18");	// dev
						
			if (DE_COMP_CD.equals(compcd)) {
				atradiusXmlElement.setPolicy(DE_POLICY_NO);
			} else if (FR_COMP_CD.equals(compcd)) {
				atradiusXmlElement.setPolicy(FR_POLICY_NO);
			} else {				
				throw new Exception("invalid company code.");
			}				
			
			atradiusXmlElement.setEffectFromDate(req.get("From"));
			atradiusXmlElement.setEffectToDate(req.get("To"));
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.TEXT_XML);
			headers.set("SOAPAction", "");
			
			RestTemplate restTemplate = new RestTemplate();
			String param = transformXML(ATRADIUS_XSL, atradiusXmlElement);
			HttpEntity<String> request = new HttpEntity<String>(param, headers);
			logger.debug(request.toString());
			String response = restTemplate.postForObject(ATRADIUS_PORTFOLIO_URI, request, String.class);
			logger.debug(response);
			
			return new BRespData(ResponseStatus.OK, response);
		} catch (RestClientException e) {
			if (e instanceof HttpStatusCodeException) {
				HttpStatusCodeException hsce = (HttpStatusCodeException) e;
				logger.warn(hsce.getResponseBodyAsString());
				return new BRespData(ResponseStatus.OK, hsce.getResponseBodyAsString());
			} else {
				res.setMessage(e.getLocalizedMessage());
				logger.error(e.getLocalizedMessage());
			}
		}
		
		return res;
	}
	
	private String transformXML(String xslFile, Object obj) {
		String xml = "";
		InputStream iStream = null;
		StringWriter writer = null;
		
		try {
			iStream = RemoteController.class.getClassLoader().getResourceAsStream(xslFile);
			TransformerFactory tFactory = TransformerFactory.newInstance();
			Transformer transformer = tFactory.newTransformer(new StreamSource(iStream));
			
			JAXBContext context = JAXBContext.newInstance(obj.getClass());
			JAXBSource source = new JAXBSource(context, obj);
			
			writer = new StringWriter();
			StreamResult result = new StreamResult(writer);
			transformer.transform(source, result);
			xml = writer.toString();
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
		} finally {
			IOUtils.closeQuietly(iStream);
			IOUtils.closeQuietly(writer);
		}
		
		return xml;
	}
}