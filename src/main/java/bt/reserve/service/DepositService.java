/**
 * 
 */
package bt.reserve.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.btframework.utils.StringUtils;
import bt.reserve.dao.DepositDao;
import bt.reserve.dao.ReserveDao;

/**
 * 입금관리 서비스
 * 
 * @author DOOLLEE2
 *
 */
@Service
public class DepositService {

	private static final Logger logger = LoggerFactory.getLogger(DepositService.class);
	
	@Resource
	private ReserveDao reserveDao;  //예약 dao
	
	@Resource
	private DepositDao depositDao;  //입금관리 dao
	
	
	/**
	 * 입금상단조회 서비스
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap selectDepositHdrInfo(BMap param) throws Exception {
		
		logger.info("======= 입금상단 조회 서비스 ==========");
		
		return depositDao.selectDepositHdrInfo(param);
	}
	
	
	
	/**
	 * 입금목록조회 서비스
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectDepositList(BMap param) throws Exception {
		
		logger.info("======= 입금목록 조회 서비스 ========");
		
		return depositDao.selectDepositList(param);
	}
	
	
	/**
	 * 입금등록 서비스
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap registDeposit(BMap param) throws Exception {
		
		logger.info("======= 입금등록 서비스 ========");
		
		BMap resultRegist = new BMap();   //결과반환		
		
		//비용헤더정보 조회
		BMap depositHdrInfo = this.selectDepositHdrInfo(param);
		long depAmt = depositHdrInfo.get("DEP_AMT") == null? 0 : Long.parseLong(depositHdrInfo.getString("DEP_AMT"));		
		long dctAmt = param.get("DCT_AMT") == null? 0 : Long.parseLong(param.getString("DCT_AMT"));				
		String payDt   =  param.get("PAY_DT") == null? "" : param.getString("PAY_DT");
		String payType =  param.get("PAY_TYPE") == null? "" : param.getString("PAY_TYPE"); 
		long payAmt = (param.get("PAY_AMT") == null? 0 : Long.parseLong(param. getString("PAY_AMT")));
		
		
		logger.info("===== 입금일자 : "+payDt);
		logger.info("===== 입금유형 : "+ ("01".equals(payType)?"입금" : ("02".equals(payType)?"환급" : "예약")));	
		logger.info("===== 예약금액 : "+depAmt);
		logger.info("===== 할인금액 : "+dctAmt);									
		logger.info("===== 입금금액 : "+payAmt);
		
		
		//누적(납부)금액 조회
		param.put("PAY_AMT", payAmt);
		String accuAmtStr = depositDao.selectAccuAmt(param);
		
		
		long accuAmt = StringUtils.isEmpty(accuAmtStr) ? 0 : Long.parseLong(accuAmtStr);
		logger.info("===== 입금후 누적(총입금)금액 ; "+accuAmt);
				
				
		//잔액계산(최초 : 마스터 잔액 - 입금금액, 레코드 존재 : 이전잔액  -입금금액 -(신규 할인금액) 
		int cnt = Integer.parseInt(depositDao.selectTbReqFeeDCnt(param));
		logger.info("===== 비용상세갯수 : "+cnt);
		
		long balAmt = 0;
		if(cnt == 0) {
			
			//비용헤더 잔액
			balAmt = depositHdrInfo.get("BAL_AMT") == null? 0 : Long.parseLong(depositHdrInfo.getString("BAL_AMT"));
			logger.info("===== 비용헤더 잔액 : "+balAmt);
			
			
			if("02".equals(payType)) {  //환불
				
				balAmt= balAmt + payAmt - (dctAmt <= 0? 0 : dctAmt); //잔액 = 잔액 + 입금금액 -(할인금액이 0 이상일시)
				
			} else if("01".equals(payType) || "03".equals(payType)){ //입금, 예약
				
				balAmt= balAmt - payAmt - (dctAmt <= 0? 0 : dctAmt); //잔액 = 잔액 + 입금금액 -(할인금액이 0 이상일시)
			}
						 
		
		} else if(cnt > 0) {
			
			//마지막 비용상세정보
			BMap resultBMap = depositDao.selectLastTbReqFeedInfo(param);
			logger.info("===== 마지막 비용상세정보 : "+resultBMap);
			
			balAmt = resultBMap.get("BAL_AMT") == null? 0 : Long.parseLong(resultBMap.getString("BAL_AMT"));			
			
			if("02".equals(payType)) {  //환불
								
				balAmt= balAmt + payAmt - (dctAmt <= 0? 0 : dctAmt);   //잔액 = 잔액 + 입금금액 -(할인금액이 0 이상일시)
				
			} else if("01".equals(payType) || "03".equals(payType)){ //입금, 예약
				
				balAmt= balAmt - payAmt - (dctAmt <= 0? 0 : dctAmt);   //잔액 = 잔액 - 입금금액 -(할인금액이 0 이상일시)
			}
		}
		logger.info("===== 잔액 : "+balAmt);
		
				
		//비용 마스터 세팅
		logger.info("===== 비용 메인 테이블 세팅 =====");
		BMap paramFee = new BMap();
		
		paramFee.put("REQ_DT", param.getString("REQ_DT"));
		paramFee.put("SEQ", param.getString("SEQ"));
		paramFee.put("PAY_AMT", accuAmt);  	//잔액
		paramFee.put("LOGIN_USER", LoginInfo.getUserId());
		
		
		//입력 할인금액이 0 이 아닌 경우
		if(dctAmt != 0) {
			
			logger.info("===== 이전할인금액과 신규할인금액이 같지 않음=====");
			
			paramFee.put("DCT_AMT", dctAmt);  //메인 할인금액					
		} 
		
		int resultUpd = depositDao.updateTbReqFee(paramFee);
		logger.info("===== 비용 메인 업데이트 결과 : "+resultUpd);
		
		
		if(resultUpd < 1) {
			
			logger.info("===== 비용 메인 업데이트 실패 =====");
			
			resultRegist.put("RESULT", " FAIL");
			return resultRegist;
		}
				
				
		param.put("ACCU_AMT", accuAmt);  //상세 누적금액
		param.put("BAL_AMT", balAmt);	 //상세 잔액	
		param.put("DCT_AMT",  dctAmt <= 0 ? 0 : dctAmt);     //상세 할인금액(최초, 할인금액이 0보다 클경우)
		
		
		//비용상세등록
		int resultReg = depositDao.insertTbReqFeeD(param);
		logger.info("===== 비용상세등록 결과 : "+resultReg);
		
		
		if(resultReg < 1) {
			
			logger.info("===== 비용상세 등록실패 =====");
			
			resultRegist.put("RESULT", " FAIL");
			return resultRegist;
		}
		
		
		//입금예약금 조회
		String payAccutAmt  =  depositDao.selectPayAccuAmt(param);	
		
		//예약상태의 누적금액이 예약금액보다 크거나 같을 경우 
		if(depAmt <= Long.parseLong(payAccutAmt)) {
			
			//예약메인
			param.put("PRC_STS", "06");  //예약확정(06)
			int updateRslt = depositDao.updatePrcSts(param);			
			logger.info("==== 예약확정 상태로 변경 결과 : "+updateRslt);
			
			
			if(updateRslt < 1) {
				
				logger.info("===== 예약확정 상태로 변경실패 =====");
				
				resultRegist.put("RESULT", " FAIL");
				return resultRegist;
			}
				
		}
		
		
		//비용메인 입금예약금, 예약금입금일자 업데이트
		param.put("PAY_DEP_AMT", Long.parseLong(payAccutAmt));  //입금예약금
		param.put("DEP_IN_DT", payDt);  //예약금입금일자
		int updateRslt = depositDao.updatePayDepInfo(param);			
		logger.info("==== 입금예약금, 예약금일금일자 업데이트 결과 : "+updateRslt);
		
		
		if(updateRslt < 1) {
			
			logger.info("===== 입금예약금, 예약금일금일자 업데이트실패 =====");
			
			resultRegist.put("RESULT", " FAIL");
			return resultRegist;
		}
		
		
		//잔액이 0보다 작거나 같을시 입금완료(10) 상태로 변경
		if(balAmt <=0) {
			
			param.put("PRC_STS", "10");  //입금완료(10)
			updateRslt = depositDao.updatePrcSts(param);
			
			logger.info("==== 입금완료 상태로 변경 결과 : "+updateRslt);
			
			if(updateRslt < 1) {
				
				logger.info("===== 입금완료 상태로 변경 실패 =====");
				
				resultRegist.put("RESULT", " FAIL");
				return resultRegist;
			}
		}
		
		resultRegist.put("RESULT", "SUCCESS");  //성공
		
		return resultRegist;
	}
	
	
	/**
	 * 팝업반환결과 서비스
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap selectPopupReturnRslt(BMap param) throws Exception {
		
		logger.info("======= 팝업반환결과 서비스 ==========");
		
		BMap depositHdrInfo = this.selectDepositHdrInfo(param);
		String depInDt = depositHdrInfo.get("DEP_IN_DT") == null? "" : depositHdrInfo.getString("DEP_IN_DT");		
		String payAccutAmt  =  depositDao.selectPayAccuAmt(param);					
		String prcStsNm = depositDao.selectPrcStsNm(param); //예약상태명 조회
		
		
		logger.info("==== 예약금입금일자 : "+depInDt);
		logger.info("==== 입금예약금액 : "+payAccutAmt);		
		logger.info("==== 예약상태명 : "+prcStsNm);
		
		
		BMap resultBMap = new BMap();
		resultBMap.put("pay_dep_amt", payAccutAmt);
		resultBMap.put("dep_in_dt", depInDt);
		resultBMap.put("prc_sts_nm", prcStsNm);		
		
		return resultBMap;
	}
	
	
	/**
	 * 마지막 비용상세정보 조회
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap selectLastTbReqFeedInfo(BMap param) throws Exception {
		
		logger.info("======= 마지막 비용상세정보조회 서비스 ==========");
		
		 return depositDao.selectLastTbReqFeedInfo(param); 
	}
	
}
