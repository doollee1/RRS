package bt.reserve.service;
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
		   result = reserveDao.firstInvoiceSelectList(param);
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
	 * 인보이스 데이터 삽입 및 수정
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Boolean saveInvoiceManager(BMap param, List<BMap> detail) throws Exception{
		Boolean isValid = true;
		
		for(int i = 0; i < detail.size(); i++){
			BMap detailMap = new BMap(detail.get(i));
			
			detailMap.put("SEQ"       , (String) param.get("SEQ"));
			detailMap.put("REQ_DT"    , (String) param.get("REQ_DT"));
			detailMap.put("LOGIN_USER", LoginInfo.getUserId());
			
			try {
				if(detailMap.getString("STATUS_V").equals("I")){
					reserveDao.insertInvoiceDetailInfo(detailMap);
					reserveDao.addInvoiceDetailHis(detailMap);
				}else if(detailMap.getString("STATUS_V").equals("U")){
					reserveDao.updateInvoiceDetailInfo(detailMap);
					reserveDao.addInvoiceDetailHis(detailMap);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				isValid = false;
			}
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
	public Boolean pickupManager(BMap param , BReqData reqData) throws Exception{
		Boolean isValid = true;
		String pick_gbn = (String)reqData.get("PICK_GBN");
		Locale locale;
		locale = Locale.KOREA;
		param.put("ADD_AMT"      , reqData.get("ADD_AMT"));
		param.put("CAR_NUM"      , reqData.get("CAR_NUM"));
		param.put("PER_NUM"      , reqData.get("PER_NUM"));
		param.put("USE_AMT"      , reqData.get("USE_AMT"));
		param.put("PICK_GBN"     , reqData.get("PICK_GBN"));
		param.put("HD_PROD_SEQ"  , reqData.get("HD_PROD_SEQ"));;
		
		try {
			if("01".equals(pick_gbn)){
				//delete
				int deleteCnt = reserveDao.deletePickupInfo(param);
				if(deleteCnt != 1 ){
					throw new Exception(messageSource.getMessage("fail.common.msg", null, locale));	// 에러가 발생했습니다!
				}else{
					reserveDao.updatePickGbn(param);
				}
			}else{
				int selectPickCnt = reserveDao.selectPickListCnt(param);
				if (selectPickCnt == 0){
					//insert
					int insertCnt = reserveDao.insertPickupInfo(param);
					if(insertCnt != 1 ){
						//exeption
						throw new Exception(messageSource.getMessage("fail.common.msg", null, locale));	// 에러가 발생했습니다!
					}else{
						reserveDao.updatePickGbn(param);
					}
				}else if(selectPickCnt == 1){
					//update
					int updateCnt = reserveDao.updatePickupInfo(param);
					if(updateCnt != 1){
						//exeption
						throw new Exception(messageSource.getMessage("fail.common.msg", null, locale));	// 에러가 발생했습니다!
					}else{
						reserveDao.updatePickGbn(param);
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
	 * 예약현황 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> reserveReportInfoList(BMap param) throws Exception {
		return reserveDao.reserveReportInfoList(param);
	}
	
}