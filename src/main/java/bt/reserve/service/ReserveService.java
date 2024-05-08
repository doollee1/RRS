package bt.reserve.service;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import bt.btframework.common.vo.CodeVO;
import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.reserve.dao.ReserveDao;


@Service
public class ReserveService {
	private static final Logger logger = LoggerFactory.getLogger(ReserveService.class);
	
	@Resource
	private ReserveDao reserveDao;

	@Autowired MessageSource messageSource;
	
	/**
	 * 예약현황 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> reserveSelectList(BMap param) throws Exception {
		return reserveDao.reserveSelectList(param);
	}
	
	/**
	 * 공통코드 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectGetCommonCode(BMap param) throws Exception {
		return reserveDao.selectGetCommonCode(param);
	}

	/**
	 * 공통코드 리스트 조회1
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public String selectGetCommonCode1(BMap param) throws Exception {
		List<CodeVO> codeList = reserveDao.selectGetCommonCode1(param);
		
		String resultValue = "";
		for (int i=0; i<codeList.size(); i++) {
			if (i == 0) {
				resultValue += codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
			} else {
				resultValue += ";" + codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
			}
		}
		return resultValue;
	}
	
	/**
	 * 예약현황 상세 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap reserveSelectDetail(BMap param) throws Exception {
		
		return reserveDao.reserveSelectDetail(param);
	}
	
	/**
	 * 인보이스 현황 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> invoiceSelectList(BMap param) throws Exception {
		
		logger.info("======= 인보이스 현황 리스트 조회 ==========");
	    List<BMap> result = null; 
		int detailCnt = reserveDao.selectInvoiceListCnt(param);
		if(detailCnt == 0){
		    reserveDao.firstInvoiceSelectList(param);
		    result = reserveDao.invoiceSelectList(param);
		}else{
		    result = reserveDao.invoiceSelectList(param);
		}
		
		return result;
	}
	
	/**
	 * 멤버별 인보이스 셀렉트박스 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public String InvoiceSelectBoxList(String code) throws Exception {
		BMap param = new BMap();
		param.put("HEAD_CD", code);
		List<CodeVO> codeList = reserveDao.InvoiceSelectBoxList(param);
		
		String resultValue = "";
		for (int i=0; i<codeList.size(); i++) {
			if (i == 0) {
				resultValue += codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
			} else {
				resultValue += ";" + codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
			}
		}
		return resultValue;
	}
	
	/**
	 * 미팅샌딩 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectPickupList(BMap param) throws Exception {
		return reserveDao.selectPickupList(param);
	}
	
	/**
	 * 인보이스 데이터 삽입 및 수정
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Boolean saveInvoiceManager(BMap param, List<BMap> detail) throws Exception{
		Boolean isValid = true;
		int sum_tot = 0;
		int feeCnt  = 0;
		
		try {
			
			for(int i = 0; i < detail.size(); i++){
				BMap detailMap = new BMap(detail.get(i));
				detailMap.put("SEQ"       , (String) param.get("SEQ"));
				detailMap.put("REQ_DT"    , (String) param.get("REQ_DT"));
				detailMap.put("LOGIN_USER", LoginInfo.getUserId());
				feeCnt = reserveDao.selectFeeListCnt(detailMap);
				
				sum_tot += Integer.parseInt((String)detailMap.get("TOT_AMT"));
				
				if(detailMap.getString("STATUS_V").equals("I")){
					reserveDao.insertInvoiceDetailInfo(detailMap);
					reserveDao.addInvoiceDetailHis(detailMap);
				}else if(detailMap.getString("STATUS_V").equals("U")){
					reserveDao.updateInvoiceDetailInfo(detailMap);
					reserveDao.addInvoiceDetailHis(detailMap);
				}
			}
			
			BMap paramMap = new BMap();
			paramMap.put("SEQ"       , (String) param.get("SEQ"));      
			paramMap.put("REQ_DT"    , (String) param.get("REQ_DT"));   
			paramMap.put("LOGIN_USER", LoginInfo.getUserId());          
			paramMap.put("TOT_AMT"   , sum_tot);
			paramMap.put("EXP_DT"    , (String) param.get("EXP_DT"));      
			paramMap.put("DEP_AMT"   , param.get("DEP_AMT"));      
			
			if(feeCnt == 0){ //fee table insert
				reserveDao.insertFeeInfo(paramMap);
			}else if(feeCnt == 1 && sum_tot != reserveDao.selectFeeTOT_AMT(paramMap)){ //fee table update
				reserveDao.updateFeeInfo(paramMap);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			isValid = false;
		}
		
		return isValid;
	}
	
	/**
	 * 인보이스 데이터 삭제
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Boolean deleteInvoiceManager(BMap param ) throws Exception{
		Boolean isValid = true;

        try {
        	param.put("STATUS_V" , "D");
        	reserveDao.delInvoiceDetailHis(param);
		    reserveDao.deleteInvoiceManager(param);
		    reserveDao.deleteFeeInfo(param);
		} catch (Exception e) {
		    // TODO: handle exception
			e.printStackTrace();
			isValid = false;
		}
		return isValid;
	}
	
	
	/**
	 * 상품정보 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectPrdInfo(BMap param) throws Exception {
		return reserveDao.selectPrdInfo(param);
	}
	
	
	/**
	 * 인보이스 데이터 삽입 및 수정
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Boolean pickupManager(BMap param , List<BMap> detail) throws Exception{
		Boolean isValid = true;
		Locale locale = Locale.KOREA;
		
		try {
			if(param.getString("PICK_GBN").equals("01")){ //delete
				int deleteCnt = reserveDao.deletePickupInfo(param);
				if(deleteCnt == 1 || deleteCnt == 2){
					reserveDao.updatePickGbn(param);
				}else{
					throw new Exception(messageSource.getMessage("fail.common.msg", null, locale));	// 에러가 발생했습니다!
				}
			}else{
				int selectPickCnt = reserveDao.selectPickListCnt(param);
				for(int i = 0; i < detail.size(); i++){
					BMap detailMap = new BMap(detail.get(i));
					detailMap.put("REQ_SEQ"   , param.get("REQ_SEQ"));
					detailMap.put("REQ_DT"    , (String) param.get("REQ_DT"));
					detailMap.put("LOGIN_USER", LoginInfo.getUserId());
					
					if (selectPickCnt == 0 ) {
						int insertCnt = reserveDao.insertPickupInfo(detailMap);
						if(insertCnt == 1 || insertCnt == 2 ){
							reserveDao.updatePickGbn(detailMap);
						}else{
							//exeption
							throw new Exception(messageSource.getMessage("fail.common.msg", null, locale));	// 에러가 발생했습니다!
						}
					} else if(selectPickCnt == 1){
						if(detail.size() == 1){
							int updateCnt = reserveDao.updatePickupInfo(detailMap);
							if(updateCnt != 1){
								//exeption
								throw new Exception(messageSource.getMessage("fail.common.msg", null, locale));	// 에러가 발생했습니다!
							}else{
								reserveDao.updatePickGbn(detailMap);
							}
						}else if(detail.size() == 2){
							if(i == 0 ){
								int updateCnt = reserveDao.updatePickupInfo(detailMap);
								if(updateCnt != 1){
									//exeption
									throw new Exception(messageSource.getMessage("fail.common.msg", null, locale));	// 에러가 발생했습니다!
								}else{
									reserveDao.updatePickGbn(detailMap);
								}
							}else if( i == 1){
								int insertCnt = reserveDao.insertPickupInfo(detailMap);
								if(insertCnt == 1 ){
									reserveDao.updatePickGbn(detailMap);
								}else{
									//exeption
									throw new Exception(messageSource.getMessage("fail.common.msg", null, locale));	// 에러가 발생했습니다!
								}
							}
						}
					}else { 
						if(detail.size() == 1){
							//삭제후 insert 
							int deleteCnt = reserveDao.deletePickupInfo(param);
							if(deleteCnt == 1 || deleteCnt == 2){
								reserveDao.updatePickGbn(param);
							}else{
								throw new Exception(messageSource.getMessage("fail.common.msg", null, locale));	// 에러가 발생했습니다!
							}
							
							int insertCnt = reserveDao.insertPickupInfo(detailMap);
							if(insertCnt == 1 ){
								reserveDao.updatePickGbn(detailMap);
							}else{
								//exeption
								throw new Exception(messageSource.getMessage("fail.common.msg", null, locale));	// 에러가 발생했습니다!
							}
						}else{
							//둘다update
							int updateCnt = reserveDao.updatePickupInfo(detailMap);
							if(updateCnt == 1){
								reserveDao.updatePickGbn(detailMap);
							}else{
								//exeption
								throw new Exception(messageSource.getMessage("fail.common.msg", null, locale));	// 에러가 발생했습니다!
							}
						}
					}
					
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			isValid = false;
		}
		return isValid;
	}
	
	/**
	 * 예약상태 데이터 변경
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Boolean updateReserveStatus(BMap param ) throws Exception{
		Boolean isValid = true;

        try {
		    reserveDao.updateReserveStatus(param);
		    param.put("REQ_SEQ", param.getInt("SEQ"));
		    if(param.getString("CHG_PRC_STS").equals("08")){ //환불완료시
		    	reserveDao.depositRefund(param);
		    }else if(param.getString("CHG_PRC_STS").equals("07") || param.getString("CHG_PRC_STS").equals("09")){ //환불요청 or 예약취소
		    	int rPlanCnt = reserveDao.selectRplanCnt(param);
		    	if(rPlanCnt > 0 ){
		    		reserveDao.deleteRplanCnt(param);
		    	}
		    }
		} catch (Exception e) {
		    // TODO: handle exception
			e.printStackTrace();
			isValid = false;
		}
		return isValid;
	}
	
	/**
	 * 여행사 이미지 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap selectAirlineImg(BMap param) throws Exception {
		return reserveDao.selectAirlineImg(param);
	}
	
	/**
	 * 인보이스 등록일자 변경
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Boolean updateInvRegDt(BMap param ) throws Exception{
		Boolean isValid = true;
        try {
		    reserveDao.updateInvRegDt(param);
		    reserveDao.updateInvoiceDetailItem(param);
		} catch (Exception e) {
		    // TODO: handle exception
			e.printStackTrace();
			isValid = false;
		}
		return isValid;
	}
	

	/**
	 * 예약변경 및 등록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Boolean ReserveManager(BMap reserveInfo) throws Exception{
		Boolean isValid = true;
		int feeCnt = 0;
        try {
        	if(reserveInfo.getString("V_FLAG").equals("new")){ //insert
        		reserveDao.insertReserveInfo(reserveInfo);
        	}else if(reserveInfo.getString("V_FLAG").equals("detail")){ //update
        		reserveDao.updateReserveInfo(reserveInfo);
        		feeCnt = reserveDao.selectFeeListCnt(reserveInfo);
        		if(feeCnt == 0){
        			reserveDao.insertFeeInfoDetail(reserveInfo);
        		}else if(feeCnt == 1){
        			reserveDao.updateReserveFee(reserveInfo);
        		}
        	}
		} catch (Exception e) {
		    // TODO: handle exception
			e.printStackTrace();
			isValid = false;
		}
		return isValid;
	}
	
	/**
	 * 입금금액 UPDATE
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap depositComplete(BMap param) throws Exception{ 
		BMap result = new BMap(); 
		try {
        	//요금테이블 변경
			reserveDao.depositComplete(param);
        	if(param.getString("MEM_GBN").equals("01") || param.getString("MEM_GBN").equals("02")){ // 일반 , 멤버
        		param.put("CHG_PRC_STS", "06");
        	}else if(param.getString("MEM_GBN").equals("03")){
        		param.put("CHG_PRC_STS", "96");
        	}
        	param.put("SEQ", param.getInt("REQ_SEQ"));
        	
        	//예약 리조트컨펌번호(없을시)
        	reserveDao.updateReserveResortNum(param);
        	
        	//예약 상태변경
        	reserveDao.updateReserveStatus(param);
        	
        	//두날짜사이의 데이터 array 
        	ArrayList<String> data = calcDate(param.getString("CHK_IN_DT") , param.getString("CHK_OUT_DT"));
        	
        	int firstIndex = 0; 
        	int lastIndex = data.size() -1;
        	
        	for (int i = 0; i < data.size(); i++) {
        		BMap paramMap = new BMap();
        		paramMap.put("REQ_DT"  , param.get("REQ_DT"));
        		paramMap.put("REQ_SEQ" , param.get("REQ_SEQ"));
        		paramMap.put("BAS_YM"  , data.get(i).substring(0,6));
        		paramMap.put("DD"      , data.get(i).substring(6));
        		paramMap.put("REG_ID"  , param.get("LOGIN_USER"));
        		paramMap.put("UPD_ID"  , param.get("LOGIN_USER"));
        		
        		if(i == firstIndex){
        			paramMap.put("PER_STR" , param.getString("booleanIn"));
        		}else if( i == lastIndex){
        			paramMap.put("PER_STR" , param.getString("booleanOut"));
        		}else{
        			paramMap.put("PER_STR" , param.get("R_PERSON"));
        		}
        		reserveDao.insertRplan(paramMap);
        		paramMap.clear();
			}
        	
        	result.put("resultCd", "0000");
		} catch (Exception e) {
		    // TODO: handle exception
			e.printStackTrace();
			result.put("result", "");
		}
		return result;
	}
	
	/**
	 * 예약최초 등록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap insertReserve(BMap param) throws Exception{
		BMap result = new BMap();
        try {
        	int cnt = reserveDao.insertReserve(param);
        	if(cnt == 1){
        		result.put("resultCd", "0000");
        		result.put("SEQ"     , String.valueOf(param.get("SEQ")));
        	}else{
        		result.put("result", "");
        	}
		} catch (Exception e) {
		    // TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 기준년도 체크로직
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public boolean checkBasYy(BMap param) throws Exception{
		boolean result = false;
		BMap dataMap = reserveDao.reserveSelectDetail(param);
		String dbBAS_YY     = dataMap.getString("BAS_YY");
		int    dbBAS_YY_SEQ = dataMap.getInt("BAS_YY_SEQ");
		
		BMap chKMap = reserveDao.checkBasYy(param);
		String cllientBAS_YY    = chKMap.getString("BAS_YY");
		int    clientBAS_YY_SEQ = chKMap.getInt("BAS_YY_SEQ");
		
		if(!dbBAS_YY.equals(cllientBAS_YY) || dbBAS_YY_SEQ != clientBAS_YY_SEQ){
			result = false;
		}else{
			result = true;
		}
		return result;
	}
	

	/**
	 * 상품정보 선조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap selectProdSeq(BMap param) throws Exception {
		return reserveDao.selectProdSeq(param);
	}
	
	public BMap selectDayDiffChk(BMap param) throws Exception{
		BMap dataMap = reserveDao.selectDayDiffChk(param);
		
		if(dataMap.get("CHK_DIFF_DAY") == null || dataMap.get("BAS_YY_CHK_DAY") == null)
		{
			dataMap.put("resultCd", "9999");  //날짜 입력 오류
		} else if(!dataMap.getString("CHK_DIFF_DAY").equals(dataMap.getString("BAS_YY_CHK_DAY"))){
			dataMap.put("resultCd", "1001"); //기간 불일치
		} else {
			dataMap.put("resultCd", "0000"); //정상
		}
		return dataMap;
	}
	
	/**
	 * 날짜간 데이터 어레이
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public ArrayList<String> calcDate(String chk_in_dt , String chk_out_dt) throws ParseException{
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
        ArrayList<String> array = new ArrayList<>();
		//Date타입으로 변경
		java.util.Date d1 = df.parse( chk_in_dt );
		java.util.Date d2 = df.parse( chk_out_dt );

		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();

		//Calendar 타입으로 변경 add()메소드로 1일씩 추가해 주기위해 변경
		c1.setTime( d1 );
		c2.setTime( d2 );

		//시작날짜와 끝 날짜를 비교해, 시작날짜가 작거나 같은 경우 출력
			while( c1.compareTo( c2 ) !=1 ){
			    //출력
			    //시작날짜 + 1 일
			    c1.add(Calendar.DATE, 1);
			    array.add(df.format(c1.getTime()));
			}
			
			return array;
	}
	
	/**
	 * 기타 테이블삭제 및 최초등록(다시)
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap deleteEtcAll(BMap param) throws Exception{
		BMap resultMap = new BMap();
		try {
        	 int delCnt = reserveDao.deleteEtcAll(param);
             if(delCnt > 0 ){
            	 param.put("PREV_SEQ", param.get("SEQ"));
            	 reserveDao.insertReserveInfo(param);
             }
             resultMap.put("resultCd", "0000");
		} catch (Exception e) {
		    // TODO: handle exception
			e.printStackTrace();
		}
		return resultMap;
	}
	
	
	
	
}