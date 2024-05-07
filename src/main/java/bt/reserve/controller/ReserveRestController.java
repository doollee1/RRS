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
import bt.common.service.MailSendService;
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
	
	@Resource
    private MailSendService mailSendService; //메일전송서비스
	
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
	 * 예약자와 동반자 리스트
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserveSelectAddList.do", method = RequestMethod.POST)
	public BRespData reserveSelectAddList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {

		BMap paramData = new BMap();
		paramData.put("SEQ"  			 , (String) reqData.get("SEQ"));
		paramData.put("REQ_DT"		 , (String) reqData.get("REQ_DT"));
		
		List<BMap> resultDeptDetail = reserveService.reserveSelectAddList(paramData);

		BRespData respData = new BRespData();
		respData.put("result", resultDeptDetail);
		
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
		paramData.put("SEQ"  			 , (String) reqData.get("SEQ"));
		paramData.put("REQ_DT"		 , (String) reqData.get("REQ_DT"));
		paramData.put("CHK_IN_DT"	 , (String)reqData.get("CHK_IN_DT"));
		paramData.put("CHK_OUT_DT" , (String)reqData.get("CHK_OUT_DT"));
		paramData.put("LOGIN_USER" , LoginInfo.getUserId());
		
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
		paramData.put("DEP_AMT"    , reqData.get("DEP_AMT"));
		paramData.put("EXP_DT"     , (String) reqData.get("EXP_DT"));
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
		paramData.put("CHK_IN_DT"  , (String)reqData.get("CHK_IN_DT"));
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
		
		logger.info("=========== 예약상태변경 ===========");
		
		BRespData respData = new BRespData();
		
		BMap paramData = new BMap();
		paramData.put("SEQ"          , reqData.get("SEQ"));
		paramData.put("REQ_DT"       , (String)reqData.get("REQ_DT"));
		paramData.put("CHG_PRC_STS"  , reqData.get("CHG_PRC_STS"));
		paramData.put("LOGIN_USER"   , LoginInfo.getUserId());
		
		if(!reserveService.updateReserveStatus(paramData)){
			respData.put("dup", "Y");
		};
		
		
		logger.info("========== 일반(02),예약가능(03) 메일전송 ======= ");
		
		String memGbn = reqData.get("MEM_GBN").toString();
		logger.info("========== 회원구분 : "+memGbn);
		
		String chgPrcSts = reqData.get("CHG_PRC_STS").toString();
		logger.info("========== 변경상태 : "+chgPrcSts);
		
		if("02".equals(memGbn)  && "03".equals(chgPrcSts)) {
		
			
	        BMap resultDeptDetail = reserveService.reserveSelectDetail(paramData);
	        
	        String toEmail = resultDeptDetail.get("EMAIL").toString();
	        logger.info("TO_EMAIL : "+toEmail);
	        
	        String msg = "예약가능 상태로 변경";
		    String subject = "예약가능 알림";
		    
		    BMap sendEmailparam = new BMap();
	        sendEmailparam.put("TO_EMAIL"   	, toEmail);
	        sendEmailparam.put("MSG"     		, msg);
	        sendEmailparam.put("SUBJECT"   	, subject);
	        
		    boolean res = mailSendService.sendMailNoAttach(sendEmailparam);
		    
		    if(res) {
		    	logger.info("이메일전송 완료");
		    }
		}
		
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
		param.put("REQ_DT"       , (String)reqData.get("REQ_DT"));
		param.put("USER_ID"      , (String)reqData.get("USER_ID"));
		param.put("MEM_GBN"      , (String)reqData.get("MEM_GBN"));
		param.put("REQ_ENG_NM"   , (String)reqData.get("ENG_NAME"));
		param.put("REQ_HAN_NM"   , (String)reqData.get("HAN_NAME"));
		param.put("REQ_TEL_NO"   , (String)reqData.get("TEL_NO"));
		param.put("LOGIN_USER"   , LoginInfo.getUserId());
		
		
		respData.put("result", reserveService.insertReserve(param));
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
		
		logger.info("========= 입금금액 UPDATE =========");
		
		BRespData respData = new BRespData();
		BMap param = new BMap();
		
		param.put("REQ_DT"     , (String)reqData.get("REQ_DT"));
		param.put("REQ_SEQ"    , reqData.get("REQ_SEQ"));
		param.put("PAY_AMT"    , reqData.get("PAY_AMT"));
		param.put("MEM_GBN"    , (String)reqData.get("MEM_GBN"));
		param.put("CHK_IN_DT"  , (String)reqData.get("CHK_IN_DT"));
		param.put("CHK_OUT_DT" , (String)reqData.get("CHK_OUT_DT"));
		param.put("booleanIn"  , (String)reqData.get("booleanIn"));
		param.put("booleanOut" , (String)reqData.get("booleanOut"));
		param.put("R_PERSON"   , (String)reqData.get("R_PERSON"));
		param.put("CONFIRM_NO" , (String)reqData.get("CONFIRM_NO"));	
		param.put("PICK_IN"    , (String)reqData.get("PICK_IN"));	
		param.put("PICK_OUT"   , (String)reqData.get("PICK_OUT"));	
		param.put("DCT_AMT"    , reqData.get("DCT_AMT"));	
		param.put("LOGIN_USER" , LoginInfo.getUserId());
		
		logger.info("입금금액 업데이트 param : "+param.toString());
		
		respData.put("result", reserveService.depositComplete(param));
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
	
		respData.put("result", reserveService.checkBasYy(param));
		return respData;
	}
	
	/**
	 * 체크아웃-체크인 일자 수와 기준년도 등록된 일자 비교
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectDayDiffChk.do", method = RequestMethod.POST)
	public BRespData invoicePopupChk(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BRespData respData = new BRespData();
		BMap param = new BMap();
		param.put("REQ_DT"     	, (String)reqData.get("REQ_DT"));
		param.put("SEQ"        		, reqData.get("SEQ"));
		param.put("CHK_IN_DT"  	, reqData.get("CHK_IN_DT"));
		param.put("CHK_OUT_DT" , reqData.get("CHK_OUT_DT"));
		try{
			respData.put("result", reserveService.selectDayDiffChk(param));
		} catch(Exception ex){
			BMap dataMap = new BMap();
			dataMap.put("resultCd", "9999");
			respData.put("result",dataMap);
		}
		return respData;
	}
	
	/**
	 * 예약 상품 선조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectProdSeq.do", method = RequestMethod.POST)
	public BRespData selectProdSeq(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BMap reserveInfo = reqData.getParamDataMap("reserveInfo");
		BRespData respData = new BRespData();
		respData.put("result", reserveService.selectProdSeq(reserveInfo));
		return respData;
	}
	
	/**
	 * 예약 상품 선조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteEtcAll.do", method = RequestMethod.POST)
	public BRespData deleteEtcAll(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BMap reserveInfo = reqData.getParamDataMap("reserveInfo");
		BRespData respData = new BRespData();
		respData.put("result", reserveService.deleteEtcAll(reserveInfo));
		return respData;
	}
	

	
	
}