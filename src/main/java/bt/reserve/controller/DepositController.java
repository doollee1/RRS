/**
 * 
 */
package bt.reserve.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import bt.reserve.service.DepositService;
import bt.reserve.service.ReserveService;

/**
 * 입금관리 Controller
 * 
 * @author DOOLLEE2
 *
 */
@Controller
public class DepositController {

	private static final Logger logger = LoggerFactory.getLogger(DepositController.class);
			
	@Resource	
	private DepositService depositService;  //입금관리 서비스
	
	
	@Resource	
	private ReserveService reserveService;  //예약관리 서비스
	
	
	/**
	 * 입금관리 팝업 호출
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deposit/depositMngPopup.do")
	public String depositMngPopup(ModelMap model,HttpServletRequest request) throws Exception{
	
	  logger.info("======== 입금관리팝업 호출 ==========");
	  
	  BMap param = new BMap();
	  param.put("HEAD_CD" , 500270);   //입금관리
	  param.put("ORDER_GBN" , 1);	   //정렬순서	
		
	  
	  List<BMap> resultBMap = reserveService.selectGetCommonCode(param);
	  model.addAttribute("depositType", resultBMap);  //입금유형
	  
	  List<BMap> searchBMap = reserveService.selectGetCommonCode(param);
	  
	  //전체 항목 추가
	  BMap codeMap = new BMap();
	  codeMap.put("CODE", "00");
	  codeMap.put("CODE_NM", "전체");
	  searchBMap.add(0, codeMap);
	  
	  model.addAttribute("searchType", searchBMap);  //조회 입금유형		
	  
	  return "/popup/depositMngPopup";
	}	 
	
	
	/**
	 * 입금헤더정보 조회 ajax
	 * 
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deposit/selectDepositHdrAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectDepositHdrAjax(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {

		logger.info("======== 입금헤더정보조회 ajax ==========");
		logger.info("======== param : "+reqData);
		
		BMap paramData = new BMap();
		paramData.put("REQ_DT"     , (String) reqData.get("REQ_DT"));
		paramData.put("SEQ"  	   , (String) reqData.get("SEQ"));
		
		
		//입금헤더정보 조회
		BMap result = depositService.selectDepositHdrInfo(paramData);		
		logger.info("===== 입금헤더 정보 : "+result);
		
		
		BRespData respData = new BRespData();
		respData.put("result", result);
		
		return respData;
	}
	
	
	/**
	 * 입금목록 조회 ajax
	 * 
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deposit/selectDepositListAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectDepositListAjax(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {

		logger.info("======== 입금목록조회 ajax ==========");
		logger.info("======== param : "+reqData);
		
		BMap paramData = new BMap();
		paramData.put("REQ_DT"     , (String) reqData.get("REQ_DT"));
		paramData.put("SEQ"  	   , (String) reqData.get("SEQ"));
		paramData.put("PAY_TYPE"   , (String) reqData.get("PAY_TYPE"));
		
		
		//입금목록조회
		List<BMap> resultList = depositService.selectDepositList(paramData);
		logger.info("===== 입금목록 조회 : "+resultList);
		
		
		BRespData respData = new BRespData();
		respData.put("result", resultList);
		
		return respData;
	}
	
	
	/**
	 * 입금등록 ajax
	 * 
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deposit/registDepositAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData registDeposit(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		
		logger.info("======== 입금등록 ajax ==========");
		logger.info("======== param : "+reqData);
		
		BMap paramData = new BMap();
		paramData.put("REQ_DT"     , (String) reqData.get("REQ_DT"));
		paramData.put("SEQ"  	   , (String) reqData.get("SEQ"));		
		paramData.put("PAY_TYPE"   , (String) reqData.get("PAY_TYPE"));
		paramData.put("PAY_DT"   , (String) reqData.get("PAY_DT"));
		paramData.put("PAY_AMT"   , (String) reqData.get("PAY_AMT"));
		paramData.put("DCT_AMT"   , (String) reqData.get("DCT_AMT"));
		paramData.put("LOGIN_USER" , LoginInfo.getUserId());
		
		//입금등록
		BMap resultRegist = depositService.registDeposit(paramData);
		
		BRespData respData = new BRespData();
		respData.put("result", resultRegist);
		
		return respData;
	}
	
	
	/**
	 * 비용상세 마지막 레코드조회 ajax
	 * 
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deposit/selectLastTbReqFeeInfoAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectLastTbReqFeeInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		
		logger.info("======== 비용상세 마지막 레코드조회 ajax ==========");
		logger.info("======== param : "+reqData);
		
		BMap paramData = new BMap();
		paramData.put("REQ_DT"     , (String) reqData.get("REQ_DT"));
		paramData.put("SEQ"  	   , (String) reqData.get("SEQ"));	
		
		
		//마지막 비용상세정보 조회
		BMap result = depositService.selectLastTbReqFeedInfo(paramData);
		
		
		BRespData respData = new BRespData();
		respData.put("result", result);
		
		return respData;
	}
	
	
	/**
	 * 팝업반환결과 조회 ajax
	 * 
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deposit/selectPopupReturnRsltAjx.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectPopupReturnRslt(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		
		logger.info("======== 팝업반환결과조회 ajax ==========");
		logger.info("======== param : "+reqData);
		
		BMap paramData = new BMap();
		paramData.put("REQ_DT"     , (String) reqData.get("REQ_DT"));
		paramData.put("SEQ"  	   , (String) reqData.get("SEQ"));	
		paramData.put("LOGIN_USER" , LoginInfo.getUserId());
				
		//팝업반환결과 조회
		BMap popupReturnRslt = depositService.selectPopupReturnRslt(paramData);
		
		BRespData respData = new BRespData();
		respData.put("result", popupReturnRslt);
		
		return respData;
	}
	
}
