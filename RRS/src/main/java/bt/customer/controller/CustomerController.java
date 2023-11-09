package bt.customer.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.btframework.utils.ResponseStatus;
import bt.customer.service.CustomerService;

@RestController
@RequestMapping("/customer")
public class CustomerController {
	//private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Resource
	private CustomerService customerService;
	
	@RequestMapping(value = "/customerSearchPopup.do")
	public ModelAndView openCustomerSearchPopup() throws Exception {
		return new ModelAndView("/popup/CustomerSearchPopup");
	}
	
	@RequestMapping(value = "/creditCustomerSearchPopup.do")
	public ModelAndView openCreditCustomerSearchPopup() throws Exception {
		return new ModelAndView("/popup/CreditCustomerSearchPopup");
	}
	
	@RequestMapping(value = "/creditCustomerPortfolioPopup.do")
	public ModelAndView openCreditCustomerPortfolioPopup() throws Exception {
		return new ModelAndView("/popup/CreditCustomerPortfolioPopup");
	}
	
	@RequestMapping(value = "/vatSearchPopup.do")
	public ModelAndView openVatSearchPopup() throws Exception {
		return new ModelAndView("/popup/VatSearchPopup");
	}
	
	@RequestMapping(value = "/employeeSearchPopup.do")
	public ModelAndView openEmployeeSearchPopup() throws Exception {
		return new ModelAndView("/popup/EmployeeSearchPopup");
	}
	
	@RequestMapping(value = "/customerOpenInvoicePopup.do")
	public ModelAndView openCustomerOpenInvoicePopup() throws Exception {
		return new ModelAndView("/popup/CustomerOpenArPopup");
	}
	
	@RequestMapping(value = "/Customer.do")
	public ModelAndView customer() throws Exception {
		return new ModelAndView("/customer/Customer");
	}
	
	@RequestMapping(value = "/CreditCustomer.do")
	public ModelAndView creditCustomer() throws Exception {
		return new ModelAndView("/customer/CreditCustomer");
	}
	
	@RequestMapping(value = "/InternalMessagePopup.do")
	public ModelAndView InternalMessagePopup(ModelMap model) throws Exception {
		return new ModelAndView("/popup/InternalMessagePopup");		
	}
	
	@RequestMapping(value = "/retrieveGeneral.do", method = RequestMethod.POST)
	public BRespData retrieveGeneral(@RequestBody Map<String, Object> req) throws Exception {
		List<BMap> list = customerService.selectCustomerList(req);
		BRespData res = new BRespData(ResponseStatus.OK, list);
		return res;
	}
	
	@RequestMapping(value = "/insertGeneral.do", method = RequestMethod.POST)
	public BRespData insertGeneral(@RequestBody Map<String, Object> req) throws Exception {
		List<BMap> list = customerService.insertCustomerInfo(req);
		BRespData res = new BRespData(ResponseStatus.OK, list);
		return res;
	}
	
	@RequestMapping(value = "/updateGeneral.do", method = RequestMethod.POST)
	public BRespData updateGeneral(@RequestBody Map<String, Object> req) throws Exception {
		List<BMap> list = customerService.updateCustomerInfo(req);
		BRespData res = new BRespData(ResponseStatus.OK, list);
		return res;
	}
	
	@RequestMapping(value = "/retrieveEmployee.do", method = RequestMethod.POST)
	public BRespData retrieveEmployee(@RequestBody Map<String, Object> req) throws Exception {
		List<BMap> list = customerService.selectEmployeeList(req);
		BRespData res = new BRespData(ResponseStatus.OK, list);
		return res;
	}
	
	@RequestMapping(value = "/retrieveHeader.do", method = RequestMethod.POST)
	public BRespData retrieveHeader(@RequestBody Map<String, Object> req) throws Exception {
		List<BMap> list = customerService.selectCustomerHeaderList(req);
		BRespData res = new BRespData(ResponseStatus.OK, list);
		return res;
	}
	
	@RequestMapping(value = "/retrieveCustomerByAttradiusId.do", method = RequestMethod.POST)
	public BRespData retrieveCustomerByAttradiusId(@RequestBody Map<String, Object> req) throws Exception {
		List<BMap> list = customerService.selectCustomerByAttradiusIdList(req);
		BRespData res = new BRespData(ResponseStatus.OK, list);
		return res;
	}
	
	@RequestMapping(value = "/updateAtradiusId.do", method = RequestMethod.POST)
	public BRespData updateAtradiusId(@RequestBody Map<String, Object> req) throws Exception {
		customerService.updateAtradiusId(req);
		return new BRespData(ResponseStatus.OK);
	}
	
	/**
	 * credit history
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/CreditRequestHis.do")
	public ModelAndView CreditRequestHistory(ModelMap model) throws Exception {
		return new ModelAndView("/customer/CreditRequestHistory");
	}

	
	@RequestMapping(value = "/selectCreditRequestHistory.do", method = RequestMethod.POST)
	public BRespData selectCreditRequestHistory(@RequestBody Map<String, Object> req) throws Exception{
		
		BRespData respData = new BRespData();		
		respData.put("result", customerService.selectCreditRequestHistory(req));
				
		return respData;
	}
	
	@RequestMapping(value = "/getCustText.do", method = RequestMethod.POST)
	public BRespData getCustText(@RequestBody Map<String, Object> req) throws Exception {
		// System.out.println(req);
		req.put("COMP_CD", LoginInfo.getCompCd());
		List<BMap> list = customerService.getCustText(req);
		BRespData res = new BRespData(ResponseStatus.OK, list);
		return res;
	}
	
	@RequestMapping(value = "/selectContactReportTab.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectContactReportTab(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("DOC_GR", "LD");
		
		BRespData respData = new BRespData();
		
		BMap resultInteractionLog = customerService.resultInteractionLog(param);
		
		respData.put("resultInteractionLog", resultInteractionLog);
		respData.put("resultContactReportGrid", customerService.resultContactReportGrid(param));
		
		return respData;
	}
	
	@RequestMapping(value = "/saveContactReport.do")
	@ResponseBody
	public BRespData saveContactReport(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		
		BRespData respData = new BRespData();
		
		respData.put("docNo", customerService.saveContactReport(param));
		
		return respData;
	}
}