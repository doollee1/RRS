package bt.reserve.controller;
import java.util.List;
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
import bt.reserve.service.ReserveService;
import bt.rrs.dao.RrsUserDao;

@RestController
@RequestMapping("/reserve")
public class ReserveRestController {
	private static final Logger logger = LoggerFactory.getLogger(ReserveRestController.class);
	
	@Resource
	private ReserveService reserveService;
	
	@Resource(name = "RrsUserDao")
	private RrsUserDao rrsUserDao;
	
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
		
		respData.put("image", reserveService.selectAirlineImg(paramData));
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
		
	/*	BMap param = new BMap();
		param.put("HEAD_CD"   , 500140);
		param.put("REF_CHR1"  , (String)reqData.get("MEM_GBN"));
		param.put("ORDER_GBN" , 1);
		
		respData.put("selectList"   , reserveService.selectGetCommonCode(param));*/
		return respData;
	}
	
	/**
	 * 인보이스 아이템 코드 리스트 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/invoiceItemList.do", method = RequestMethod.POST)
	public BRespData invoiceItemList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BRespData respData = new BRespData();
	
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
		paramData.put("TOT_AMT"    , reqData.get("TOT_AMT"));
		paramData.put("PREV_ITEM_CD"  , (String) reqData.get("ITEM_CD"));
		paramData.put("PREV_ORDER"    , (String) reqData.get("ORDER"));
		paramData.put("ORDER"    		, (String) reqData.get("ORDER"));
		
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
		paramData.put("HEAD_CD"    , 500210);
		paramData.put("BAS_YY"     , String.valueOf( reqData.get("BAS_YY")));
		paramData.put("SSN_GBN"    , (String) reqData.get("SSN_GBN"));
		paramData.put("BAS_YY_SEQ" , Integer.parseInt(String.valueOf(reqData.get("BAS_YY_SEQ"))));
		respData.put("result"      , reserveService.selectPrdInfo(paramData));
		return respData;
	}
	
	/**
	 * 미팅샌딩 리스트 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectPickupList.do", method = RequestMethod.POST)
	public BRespData selectPickupList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BRespData respData = new BRespData();
		BMap paramData = new BMap();
		paramData.put("REQ_SEQ", reqData.get("REQ_SEQ"));
		paramData.put("REQ_DT" , (String)reqData.get("REQ_DT"));
		respData.put("result"  , reserveService.selectPickupList(paramData));
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
		List<BMap> detail = reqData.getParamDataList("detail");
		BRespData respData = new BRespData();
		
		BMap paramData = new BMap();
		paramData.put("REQ_SEQ"   , reqData.get("REQ_SEQ"));
		paramData.put("REQ_DT"    , (String)reqData.get("REQ_DT"));
		paramData.put("PICK_GBN"  , (String)reqData.get("PICK_GBN"));
		paramData.put("PROD_SEQ"  , reqData.get("PROD_SEQ"));
		paramData.put("LOGIN_USER", LoginInfo.getUserId());
		
		if(!reserveService.pickupManager(paramData , detail)){
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
	
	/**
	 * 여행사 이미지 불러오기
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectAirlineImg.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectAirlineImg(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BRespData respData = new BRespData();
		
		BMap paramData = new BMap();
		paramData.put("SEQ"          , reqData.get("SEQ"));
		paramData.put("REQ_DT"       , (String)reqData.get("REQ_DT"));
		
		respData.put("result", reserveService.selectAirlineImg(paramData));
		return respData;
	}
	
	/**
	 * 예약 데이터 저장 및 업데이트 
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ReserveManager.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData ReserveManager(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BRespData respData = new BRespData();
		BMap reserveInfo = reqData.getParamDataMap("reserveInfo");
		reserveInfo.put("V_FLAG"    , (String)reqData.get("V_FLAG"));
		reserveInfo.put("LOGIN_USER", LoginInfo.getUserId());
		
		if(!reserveService.ReserveManager(reserveInfo)){
			respData.put("dup", "Y");
		};
		return respData;
	}
	
	/**
	 * 예약 현황 리스트 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectSearchId.do", method = RequestMethod.POST)
	public BRespData selectSearchId(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		respData.put("result", rrsUserDao.selectUserInfo(param));
		return respData;
	}
	
	/**
	 * 예약최초데이터 insert
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertReserve.do", method = RequestMethod.POST)
	public BRespData insertReserve(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BRespData respData = new BRespData();
		BMap param = new BMap();
		param.put("REQ_DT"     , (String)reqData.get("REQ_DT"));
		param.put("USER_ID"    , (String)reqData.get("USER_ID"));
		param.put("LOGIN_USER" , LoginInfo.getUserId());
		
		
		//respData.put("result", reserveService.insertReserve(param));
		return respData;
	}
	
	/**
	 * 입금금액 UPDATE
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deposit.do", method = RequestMethod.POST)
	public BRespData depositComplete(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BRespData respData = new BRespData();
		BMap param = new BMap();
		param.put("REQ_DT"     , (String)reqData.get("REQ_DT"));
		param.put("REQ_SEQ"    , reqData.get("REQ_SEQ"));
		param.put("PAY_AMT"    , reqData.get("PAY_AMT"));
		param.put("BAL_AMT"    , reqData.get("BAL_AMT"));
		param.put("LOGIN_USER" , LoginInfo.getUserId());
	
		//respData.put("result", reserveService.depositComplete(param));
		return respData;
	}
	

	/**
	 * 상품시퀀스 확인(변경시)
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/checkBasYy.do", method = RequestMethod.POST)
	public BRespData checkBasYy(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BRespData respData = new BRespData();
		BMap param = new BMap();
		param.put("REQ_DT"     , (String)reqData.get("REQ_DT"));
		param.put("SEQ"        , reqData.get("SEQ"));
		param.put("CHK_IN_DT"  , reqData.get("CHK_IN_DT"));
		param.put("CHK_OUT_DT" , reqData.get("CHK_OUT_DT"));
	
		//respData.put("result", reserveService.checkBasYy(param));
		return respData;
	}
	
}