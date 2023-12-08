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
import org.springframework.web.servlet.ModelAndView;

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
	
	/*@RequestMapping(value = "/reserveList.do")
	public ModelAndView reserveList() throws Exception {
		return new ModelAndView("/reserve/Reserve");
	}*/
	
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
		
		BMap param = new BMap();
		param.put("HEAD_CD"   , 500140);
		param.put("REF_CHR1"  , (String)reqData.get("MEM_GBN"));
		param.put("ORDER_GBN" , 1);
		
		
		respData.put("selectList"   , reserveService.selectGetCommonCode(param));
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
		paramData.put("LOGIN_USER" , LoginInfo.getUserId());
		
		if(!reserveService.deleteInvoiceManager(paramData)){
			respData.put("resultCd", "-1");
		};
		
		return respData;
	}
	

	/**
	 * 상품정보 리스트 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectPrdInfo.do", method = RequestMethod.POST)
	public BRespData selectPrdInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BRespData respData = new BRespData();
		BMap paramData = new BMap();
		paramData.put("HEAD_CD"    , 500050);
		paramData.put("BAS_YY"     , String.valueOf( reqData.get("BAS_YY")));
		paramData.put("SSN_GBN"    , (String) reqData.get("SSN_GBN"));
		paramData.put("BAS_YY_SEQ" , Integer.parseInt(String.valueOf(reqData.get("BAS_YY_SEQ"))));
		respData.put("result", reserveService.selectPrdInfo(paramData));
		return respData;
	}
	
	/**
	 * 미팅샌딩 데이터 저장 및 업데이트 
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/pickupManager.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData pickupManager(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BRespData respData = new BRespData();
		
		BMap paramData = new BMap();
		paramData.put("REQ_SEQ"   , reqData.get("REQ_SEQ"));
		paramData.put("REQ_DT"    , (String)reqData.get("REQ_DT"));
		paramData.put("PROD_SEQ"  , reqData.get("PROD_SEQ"));
		paramData.put("LOGIN_USER", LoginInfo.getUserId());
		
		if(!reserveService.pickupManager(paramData , reqData)){
			respData.put("dup", "Y");
		};
		
		return respData;
	}
	
	
	/**
	 * 예약 현황 상태 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectReserveStatus.do", method = RequestMethod.POST)
	public BRespData selectReserveStatus(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BMap paramData = new BMap();
		paramData.put("HEAD_CD", 500020);
		paramData.put("CODE"   , Integer.parseInt(String.valueOf(reqData.get("CODE"))));
		
		List<BMap> resultStateList = reserveService.selectGetCommonCode(paramData);

		BRespData respData = new BRespData();
		respData.put("result", resultStateList);
		return respData;
	}
	
	/**
	 * 미팅샌딩 데이터 저장 및 업데이트 
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateReserveStatus.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData updateReserveStatus(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BRespData respData = new BRespData();
		
		BMap paramData = new BMap();
		paramData.put("SEQ"          , reqData.get("SEQ"));
		paramData.put("REQ_DT"       , (String)reqData.get("REQ_DT"));
		paramData.put("CHG_PRC_STS"  , reqData.get("CHG_PRC_STS"));
		paramData.put("LOGIN_USER"   , LoginInfo.getUserId());
		
		if(!reserveService.updateReserveStatus(paramData)){
			respData.put("dup", "Y");
		};
		
		return respData;
	}
	
	
}