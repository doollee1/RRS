package bt.customer.controller;

import java.util.List;
import java.util.Map;

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
import bt.btframework.utils.LoginInfo;
import bt.btframework.utils.ResponseStatus;
import bt.customer.service.ContactPersonService;
import bt.login.dao.LoginDao;

@Controller
public class ContactPersonController {
	@Resource(name = "ContactPersonService")
	private ContactPersonService contactPersonService;
	
	
	/**
	 * ContactPerson 페이지 호출
	 */
	@RequestMapping(value = "/customer/ContactPerson.do")
	public String ContactPerson(ModelMap model) throws Exception{
		return "/customer/ContactPerson";
	}
	
	/**
	 * ContactPerson popup 호출
	 */
	@RequestMapping(value = "/popup/ContactPersonPopup.do")
	public String ContactPersonPopup(ModelMap model) throws Exception{
		return "/popup/ContactPersonPopup";
	}
	
	/**
	 * ContactPerson popup2 호출
	 */
	@RequestMapping(value = "/popup/ContactPersonPopup2.do")
	public String ContactPersonPopup2(ModelMap model) throws Exception{
		return "/popup/ContactPersonSearchPopup";
	}
	
	/**
	 * ContactPerson search popup 호출
	 */
	@RequestMapping(value = "/popup/ContactPersonSearchPopup.do")
	public String ContactPersonSearchPopup(ModelMap model) throws Exception {
		return "/popup/ContactPersonSearchPopup";
	}
	
	/**
	 * Vendor popup 호출
	 */
	@RequestMapping(value = "/popup/VendorPopup.do")
	public String VendorPopup(ModelMap model) throws Exception{
		return "/popup/VendorPopup";
	}
	
	
	
/*	@RequestMapping(value = "/retrieveGeneral.do", method = RequestMethod.POST)
	public BRespData retrieveGeneral(@RequestBody Map<String, Object> req) throws Exception {
		List<BMap> list = customerService.selectCustomerList(req);
		BRespData res = new BRespData(ResponseStatus.OK, list);
		return res;
	}*/
	
	/**
	 * Contact Person Popup 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/customer/selectContactPersonList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectContactPersonList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {

		BMap paramData = reqData.getParamDataMap("param");
		paramData.put("COMP_CD",LoginInfo.getCompCd());
		
		List<BMap> result = contactPersonService.selectContactPersonList(paramData);
		
		BRespData respData = new BRespData();
		respData.put("result", result);
		
		return respData;
	}
	
	
	/**
	 * Contact Person 저장
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/customer/saveContactPerson.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveContactPerson(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		
		BMap param = reqData.getParamDataMap("paramData");
		param.put("CUST_CD", (String) reqData.get("CUST_CD"));
		param.put("COMP_CD",LoginInfo.getCompCd());
		param.put("LOGIN_USER",LoginInfo.getUserId());
		
		BRespData respData = new BRespData();
		
		contactPersonService.saveContactPerson(param);
		return respData;
	}
	
	/**
	 * Contact Person List 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/customer/getContactList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getContactList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {

		BMap paramData = new BMap();
		paramData.put("CUST_CD", (String) reqData.get("CUST_CD"));
		paramData.put("COMP_CD",LoginInfo.getCompCd());
		
		List<BMap> result = contactPersonService.getContactList(paramData);
		
		BRespData respData = new BRespData();
		respData.put("result", result);
		
		return respData;
	}

	/**
	 * Contact Person Info 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/customer/getContactInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getContactInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {

		BMap paramData = reqData.getParamDataMap("param");
		paramData.put("COMP_CD",LoginInfo.getCompCd());
		
		BMap result = contactPersonService.getContactInfo(paramData);
		
		BRespData respData = new BRespData();
		respData.put("result", result);
		
		return respData;
	}
	
	/**
	 * Contact Person Popup 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/customer/selectContactPersonPopup.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectContactPersonPopup(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {

		BMap paramData = reqData.getParamDataMap("param");
		paramData.put("COMP_CD",LoginInfo.getCompCd());
		
		List<BMap> result = contactPersonService.selectContactPersonPopup(paramData);
		
		BRespData respData = new BRespData();
		respData.put("result", result);
		
		return respData;
	}
	
	/**
	 * Contact Person Popup 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/customer/selectContactPersonPopup2.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectContactPersonPopup2(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {

		BMap paramData = reqData.getParamDataMap("param");
		paramData.put("COMP_CD",LoginInfo.getCompCd());
		
		List<BMap> result = contactPersonService.selectContactPersonPopup2(paramData);
		
		BRespData respData = new BRespData();
		respData.put("result", result);
		
		return respData;
	}
	/**
	 * Contact Person Popup 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/customer/selectVendorPopup.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectVendorPopup(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {

		BMap paramData = reqData.getParamDataMap("param");
		paramData.put("COMP_CD",LoginInfo.getCompCd());
		
		List<BMap> result = contactPersonService.selectVendorPopup(paramData);
		
		BRespData respData = new BRespData();
		respData.put("result", result);
		
		return respData;
	}
	
	/**
	 * Customer 유무 체크
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/customer/selectCustomerCnt.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectCustomerCnt(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {

		BMap paramData = new BMap();
		paramData.put("COMP_CD", LoginInfo.getCompCd());
		paramData.put("CUST_CD", (String) reqData.get("CUST_CD"));
		
		int result = contactPersonService.selectCustomerCnt(paramData);
		
		BRespData respData = new BRespData();
		respData.put("result", result);
		
		return respData;
	}
}
