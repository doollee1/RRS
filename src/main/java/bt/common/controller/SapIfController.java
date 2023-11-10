package bt.common.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.common.service.SapIfService;


@RestController
@RequestMapping("/common")
public class SapIfController {
	private static final Logger logger = LoggerFactory.getLogger(SapIfController.class);
	
	
	
	@Resource
	private SapIfService sapIfService;
	
	@RequestMapping(value = "/callSapIfErpProduct.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData callSapIfErpProduct(@RequestBody Map<String, Object> req) throws Exception {
		System.err.println("cont req" + req);
		return sapIfService.callErpProduct(req);
	}
	
	@RequestMapping(value = "/callSapIfErpBom.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData callSapIfErpBom(@RequestBody Map<String, Object> req) throws Exception {
		return sapIfService.callErpBom(req);
	}
	
	@RequestMapping(value = "/retrieveOpenArList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData retrieveOpenArList(@RequestBody Map<String, Object> req) throws Exception {
		return sapIfService.selectOpenArList(req);
	}
	
	@RequestMapping(value = "/callSapIfErpEmp.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectEmpList(@RequestBody Map<String, Object> req) throws Exception {
		return sapIfService.selectEmpList(req);
	}
	
	@RequestMapping(value = "/retrievePhysicalSockList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData retrievePhysicalSockList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BMap param = reqData.getParamDataMap("param");
		return sapIfService.selectPhysicalSockList(param);
	}
	
	@RequestMapping(value = "/callErpMsPartner.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData callErpMsPartner(@RequestBody Map<String, Object> req) throws Exception {
		return sapIfService.callErpMsPartner(req);
	}
	
	@RequestMapping(value = "/connCRM.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData connCRM(@RequestBody Map<String, Object> req) throws Exception {
		return sapIfService.connCRM(req);
	}
	
	@RequestMapping(value = "/retrieveCreditBlock.do", method = RequestMethod.POST)
	public BRespData retrieveCreditBlock(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BMap param = reqData.getParamDataMap("param");
		return sapIfService.selectCreditBlockList(param);
	}
	
	@RequestMapping(value = "/retrieveSalesOrder.do", method = RequestMethod.POST)
	public BRespData retrieveSalesOrder(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BMap param = reqData.getParamDataMap("param");
		return sapIfService.selectSalesOrder(param);
	}
	
	@RequestMapping(value = "/retrieveCredit.do", method = RequestMethod.POST)
	public BRespData retrieveCredit(@RequestBody Map<String, Object> req) throws Exception {
		return sapIfService.selectCredit(req);
	}
	
	@RequestMapping(value = "/retrieveCreditAll.do", method = RequestMethod.POST)
	public BRespData retrieveCreditAll(@RequestBody Map<String, Object> req) throws Exception {
		return sapIfService.selectCreditAll(req);
	}
	
	@RequestMapping(value = "/updateCredit.do", method = RequestMethod.POST)
	public BRespData updateCredit(@RequestBody Map<String, Object> req) throws Exception {
		return sapIfService.updateCredit(req);
	}
	
	@RequestMapping(value = "/updateCreditAll.do", method = RequestMethod.POST)
	public BRespData updateCreditAll(@RequestBody Map<String, Object> req) throws Exception {
		return sapIfService.updateCreditAll(req);
	}

	@RequestMapping(value = "/retrieveAvailableStockList.do", method = RequestMethod.POST)
	public BRespData retrieveAvailableStockList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BMap param = reqData.getParamDataMap("param");
		return sapIfService.selectAvailableStockList(param);
	}
	
	/*Popup에서 사용*/
	@RequestMapping(value = "/retrieveAvailableStockList2.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData retrieveAvailableStockList2(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		List<BMap> param = reqData.getParamDataList("param");
		return sapIfService.selectAvailableStockList2(param);
	}
	
	@RequestMapping(value = "/requireCreditBlock.do", method = RequestMethod.POST)
	public BRespData releaseCreditBlock(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		
		BMap paramData = new BMap();
		paramData.put("G_COMP_CD", LoginInfo.getCompCd());
		paramData.put("IS_ORDER", (String) reqData.get("IS_ORDER"));
		paramData.put("USER_ID", LoginInfo.getUserId());
		
		BRespData result = new BRespData();
		result = sapIfService.requireCreditBlock(paramData);
		
		if(null != result.get("RESULT") && !"".equals(result.get("RESULT"))){
			//salesOrderService.releaseCreditBlock(paramData);
			result.put("SUCCESS", "Y");
		}
		return result;
	}

	@RequestMapping(value = "/callErpCustomer.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData callErpCustomer(@RequestBody Map<String, Object> req) throws Exception {
		return sapIfService.callErpCustomer(req);
	}

	@RequestMapping(value = "/callErpSalesOrder.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData callErpSalesOrder(@RequestBody Map<String, Object> req) throws Exception {
		return sapIfService.callErpSalesOrder(req);
	}

	@RequestMapping(value = "/callCrmCustomer.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData callCrmCustomer(@RequestBody Map<String, Object> req) throws Exception {
		return sapIfService.callCrmCustomer(req);
	}

	@RequestMapping(value = "/callCrmLead.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData callCrmLead(@RequestBody Map<String, Object> req) throws Exception {
		return sapIfService.callCrmLead(req);
	}

	@RequestMapping(value = "/callCrmQuot.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData callCrmQuot(@RequestBody Map<String, Object> req) throws Exception {
		return sapIfService.callCrmQuot(req);
	}

	@RequestMapping(value = "/retrieveIncommingPaymentList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData retrieveIncommingPaymentList(@RequestBody BReqData req) throws Exception {
		BMap param = req.getParamDataMap("param");
		return sapIfService.selectIncommingPaymentList(param);
	}
	
	@RequestMapping(value = "/retrievePriceList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData retrievePriceList(@RequestBody BReqData req) throws Exception {
		BMap param = req.getParamDataMap("param");
		return sapIfService.selectPriceList(param);
	}
	
	@RequestMapping(value = "/retrieveCustomer.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData retrieveCustomer(@RequestBody BReqData req) throws Exception {
		return sapIfService.selectCustomer(req);
	}
	
	@RequestMapping(value = "/callMappingCustNo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData CallMappingCustNo(@RequestBody Map<String, Object> req) throws Exception {
		return sapIfService.callMappingCustNo(req);
	}
	
	@RequestMapping(value = "/callERPConnTest.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData callERPConnTest(@RequestBody Map<String, Object> req) throws Exception {
		System.err.println("cont req" + req);
		return sapIfService.selectSapTestList(req);
	}
	

	@RequestMapping(value = "/callCRMConnTest.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData callCRMConnTest(@RequestBody Map<String, Object> req) throws Exception {
		System.err.println("cont req" + req);
		return sapIfService.selectCrmTestList(req);
	}
	

	@RequestMapping(value = "/callERPSOBatch.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData callERPSOBatch(@RequestBody Map<String, Object> req) throws Exception {
		return sapIfService.callERPSalesOrderChanged(req);
	}
	
	@RequestMapping(value = "/callErpCustomerKLBABC.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData callErpCustomerKLBABC(@RequestBody Map<String, Object> req) throws Exception {
		return sapIfService.callErpCustomerKLBABC(req);
	}
	

	@RequestMapping(value = "/retrieveSalesReportList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData retrieveSalesReportList(@RequestBody Map<String, Object> req) throws Exception {
		return sapIfService.retrieveSalesReportList(req);
	}
}