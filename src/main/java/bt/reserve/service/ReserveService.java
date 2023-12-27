package bt.reserve.service;
import java.util.ArrayList;
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
import bt.btframework.utils.BReqData;
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
				sum_tot += detailMap.getInt("TOT_AMT");
				
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
        	reserveDao.depositComplete(param);
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
        		result.put("SEQ"     , param.getInt("SEQ"));
        	}else{
        		result.put("result", "");
        	}
		} catch (Exception e) {
		    // TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
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
	
	
	
}