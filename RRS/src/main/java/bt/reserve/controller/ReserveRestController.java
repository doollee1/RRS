package bt.reserve.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.reserve.service.ReserveService;

@RestController
@RequestMapping("/reserve")
public class ReserveRestController {
	private static final Logger logger = LoggerFactory.getLogger(ReserveRestController.class);
	
	@Resource
	private ReserveService reserveService;
	
	/**
	 * 예약 현황 리스트 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserveSelectList.do", method = RequestMethod.POST)
	public BRespData reserveSelectList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		respData.put("result", reserveService.reserveSelectList(param));
		return respData;
	}
	
	/**
	 * 예약 현황 상세 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserveSelectDetail.do", method = RequestMethod.POST)
	public BRespData reserveSelectDetail(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BMap paramData = new BMap();
		paramData.put("SEQ"   , (String) reqData.get("SEQ"));
		paramData.put("REQ_DT", (String) reqData.get("REQ_DT"));
		BMap resultDeptDetail = reserveService.reserveSelectDetail(paramData);

		System.out.println(resultDeptDetail);
		BRespData respData = new BRespData();
		respData.put("result", resultDeptDetail);
		return respData;
	}
	
	/**
	 * 인보이스 현황 리스트 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/invoiceSelectList.do", method = RequestMethod.POST)
	public BRespData invoiceSelectList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		
		BMap paramData = new BMap();
		paramData.put("SEQ"   , (String) reqData.get("SEQ"));
		paramData.put("REQ_DT", (String) reqData.get("REQ_DT"));
		paramData.put("LOGIN_USER", LoginInfo.getUserId());
		
		List<BMap> resultDeptDetail = reserveService.invoiceSelectList(paramData);

		BRespData respData = new BRespData();
		respData.put("result", resultDeptDetail);
		return respData;
	}
	
	
	/**
	 * 인보이스 디테일 저장 
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/saveInvoiceManager.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveInvoiceManager(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		List<BMap> detail = reqData.getParamDataList("detail");
		BRespData respData = new BRespData();
		
		BMap paramData = new BMap();
		paramData.put("SEQ"        , (String) reqData.get("SEQ"));
		paramData.put("REQ_DT"     , (String) reqData.get("REQ_DT"));
		paramData.put("LOGIN_USER" , LoginInfo.getUserId());
		
		if(!reserveService.saveInvoiceManager(paramData , detail)){
			respData.put("dup", "Y");
		};
		
		return respData;
	}
	
	/**
	 * 인보이스 디테일 삭제
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteInvoiceManager.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData deleteInvoiceManager(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BRespData respData = new BRespData();
		
		BMap paramData = new BMap();
		paramData.put("SEQ"        , (String) reqData.get("SEQ"));
		paramData.put("REQ_DT"     , (String) reqData.get("REQ_DT"));
		paramData.put("ITEM_CD"    , (String) reqData.get("ITEM_CD"));
		
		if(!reserveService.deleteInvoiceManager(paramData)){
			respData.put("resultCd", "-1");
		};
		
		return respData;
	}
	
}