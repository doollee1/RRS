package bt.reserve.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.util.Streams;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import bt.btframework.common.FileManager;
import bt.btframework.common.fileupload.FileExtFilter;
import bt.btframework.common.fileupload.FileMaxUploadFilter;
import bt.btframework.common.fileupload.FileTransferManager;
import bt.btframework.common.vo.CodeVO;
import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.btframework.utils.StringUtils;
import bt.common.service.FileService;
import bt.reserve.dao.ReserveDao;

@Service
@PropertySource("classpath:/egovframework/properties/common.properties")
public class ReserveService {
	private static final Logger logger = LoggerFactory.getLogger(ReserveService.class);
	
	@Resource
	private ReserveDao reserveDao;

	@Resource(name = "FileService")
	private FileService fileService;

    @Autowired
    private Environment env;
	
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
	 * 예약현황 현황 리스트(그리드) 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> reserveSelectAddList(BMap param) throws Exception {
		
		logger.info("======= 예약현황 현황 리스트(그리드) 조회 ==========");
	    List<BMap> result = null; 
		int detailCnt = reserveDao.reserveSelectAddListCnt(param);
		if(detailCnt == 0){
		    result = reserveDao.reserveSelectAddList(param);
		}else{
		    result = reserveDao.reserveSelectAddList(param);
		}
		
		return result;
	}
	
	
	/**
	 * 예약상세유무 조회 서비스
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public String selectReserveDetlYn(BMap param) throws Exception {
		
		logger.info("======= 예약상세유무 조회 서비스 ==========");
		
		int detailCnt = reserveDao.reserveSelectAddListCnt(param);
		logger.info("===== 예약상세갯수 : "+detailCnt);
		
		return detailCnt > 0? "Y" : "N";
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
	 * 공통코드 리스트 조회2
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public String selectGetCommonCode2(BMap param) throws Exception {
		List<CodeVO> codeList = reserveDao.selectGetCommonCode2(param);
		
		String resultValue = "";
		for (int i=0; i<codeList.size(); i++) {
			if (i == 0) {
				resultValue += "" + ":" + "-선택-";
				resultValue += ";" + codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
			} else {
				resultValue += ";" + codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
			}
		}
		return resultValue;
	}

//	public String selectGetCommonCode3(BMap param) throws Exception {
////		List<CodeVO> codeList = reserveDao.selectGetCommonCode3(param);
////		
////		String resultValue = "";
////		for (int i=0; i<codeList.size(); i++) {
////			if (i == 0) {
////				resultValue += "" + ":" + "-선택-";
////				resultValue += ";" + codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
////			} else {
////				resultValue += ";" + codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
////			}
////		}
////		return resultValue;
//		return reserveDao.selectGetCommonCode3(param);
//	}

	/**
	 * 공통코드 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectGetCommonCode3(BMap param) throws Exception {
		return reserveDao.selectGetCommonCode3(param);
	}

	public String selectGetCommonCodeHH(BMap param) throws Exception {
		
		String resultValue = "";
		for (int i=0; i<24; i++) {
			if (i == 0) {
				resultValue += "" + ":" + "-선택-";
				resultValue += ";00" + ":" + "00";
			} else {
				if (i < 10) {
					resultValue += ";0" + i + ":0" + i;
				}else{
					resultValue += ";" + i + ":" + i;
				}
			}
		}
		return resultValue;
	}

	public String selectGetCommonCodeCom_Gbn(BMap param) throws Exception {
		
		String resultValue = "";
		
		resultValue += "" + ":" + "-선택-";
		resultValue += ";1" + ":" + "예약자";
		resultValue += ";2" + ":" + "동반자";
		
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
	 * 예약현황 상세  리스트(그리드) 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> firstReserveSelectAddList(BMap param) throws Exception {
		
		logger.info("======= 예약현황 상세  리스트(그리드) 조회 ==========");
	    List<BMap> result = null; 
		int detailCnt = reserveDao.reserveSelectAddListCnt(param);
		if(detailCnt == 0){
		    result = reserveDao.reserveSelectAddList(param);
		}else{
		    result = reserveDao.reserveSelectAddList(param);
		}
		
		return result;
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
			
			//기존로직
		    //reserveDao.firstInvoiceSelectList(param);
			//result = reserveDao.invoiceSelectList(param);
			
			/* 신규로직 : 20240612 */
			BMap resultDeptDetail = reserveDao.reserveSelectDetail(param); 
			
			String reqDt  = resultDeptDetail.getString("REQ_DT");
			String seq    = resultDeptDetail.getString("SEQ");
			String memGbn = resultDeptDetail.getString("MEM_GBN");			
			String agnGb  = "";						
			
			if("04".equals(memGbn)) { //에이전시회원
				agnGb  = resultDeptDetail.get("AGN_GB") ==  null? "" : resultDeptDetail.getString("AGN_GB");
			}
			
			logger.info(" === 기본 예약일자        : "+reqDt);
			logger.info(" === 기본 일련번호        : "+seq);
			logger.info(" === 기본 회원구분       : "+memGbn);						
			logger.info(" === 기본 에이전시구분   : "+agnGb);
			
			
			//예약상세조회
			List<BMap> resultAddList = reserveDao.reserveSelectAddList(param);
			
						
			for(BMap paramMap : resultAddList) {
			
				BMap paramData = new BMap();
				
				long packageAmt      = 0;  // 패키지가격
				long roomCharge      = 0;  // 숙박비				
				long nokidAmt = 0;  	   // 비라운드,소아 가격
				
				String dSeq       = paramMap.getString("DSEQ");          //상세일련번호
				String numGbn     = paramMap.getString("NUM_GBN");       //인원구분 
				String comHanNm   = paramMap.getString("COM_HAN_NM");    //동반자한글명
				String chkInDt  = paramMap.getString("CHK_IN_DT");       //체크인일자
				String chkOutDt = paramMap.getString("CHK_OUT_DT");      //체크인일자
				String hdngGbn    = paramMap.getString("HDNG_GBN");      //항목구분
				
				
				logger.info(" === 상세 일련번호  : "+dSeq);
				logger.info(" === 상세 인원구분       : "+numGbn);
				logger.info(" === 상세 동반자한글명  : "+comHanNm);
				logger.info(" === 상세 체크인일자     : "+chkInDt);
				logger.info(" === 상세 체크아웃일자  : "+chkOutDt);
				logger.info(" === 상세 항목구분       : "+hdngGbn);
				
				
				//영유아일경우 다음 레코드로 이동
				if("05".equals(numGbn)) {
					continue;
				}
				
				paramData.put("CHK_IN_DT"  , chkInDt);  //체크인일자
				paramData.put("CHK_OUT_DT" , chkOutDt); //체크아웃일자
				paramData.put("HDNG_GBN" , hdngGbn);      //항목구분
				paramData.put("agnGb" , agnGb);   		  //에이전시 구분
				paramData.put("REQ_DT"  , reqDt);		  //예약일자
				paramData.put("SEQ"  , seq);			  //일련번호
				paramData.put("DSEQ"  , dSeq);            //상세일련번호
				
				
				logger.info("===== 인보이스 코드정보 조회 =====");
				BMap invoiceCdBmap = reserveDao.selectInvoiceCodeInfo(paramData);  //상품테이블에 정보가 있는지 확인
				logger.info(" === 인보이스 코드정보       : "+invoiceCdBmap);
				
				if(invoiceCdBmap == null) {  //null일 경우 다음레코드로 이동
					continue;   
				}
				
				
				//일반일 경우 패키지 금액 계산
				if("02".equals(numGbn)) {
					
					logger.info(" ===== 일반 패키지비 계산 =====");
					
					BMap packageBmap = reserveDao.selectPackageCharge(paramData);
					
					packageAmt = Long.parseLong(packageBmap.getString("PACKAGE_AMT"));
					logger.info(" === 패키지금액       : "+packageAmt);
					
					
					
				} else if("01".equals(numGbn)) {  //멤버일 경우 숙박비 계산
					
					logger.info(" ===== 멤버 숙박비 계산 =====");
					
					BMap roomChgBmap = reserveDao.selectMemRoomChargeCalc(paramData);
					
					roomCharge = Long.parseLong(roomChgBmap.getString("MEM_ROOM_CHARGE"));
					logger.info(" === 숙박비금액       : "+roomCharge);
				
					
				} else if("03".equals(numGbn) || "04".equals(numGbn)) {  //비라운딩, 소아일경우 추가숙박비 계산
					
					logger.info(" ===== 추가숙박비(노키드) 계산 =====");
					
					BMap nokidChgBmap = reserveDao.selectNokidChargeCalc(paramData);
					
					nokidAmt  = Long.parseLong(nokidChgBmap.getString("NOKID_AMT"));
					logger.info(" === 추가숙박비 금액       : "+nokidAmt);
					
				}
				
				
				
				
				long perAmt = "02".equals(numGbn)? packageAmt :("01".equals(numGbn) ? roomCharge : nokidAmt);
				long useDay = Long.parseLong(invoiceCdBmap.getString("USE_DAY"));
				
				logger.info(" === 인보이스 금액     : "+perAmt);
				logger.info(" === 인보이스 이용횟수    : "+useDay);
				
				paramData.put("ITEM_CD", invoiceCdBmap.getString("CODE"));       //항목코드
				paramData.put("ORDER", dSeq);  								     //표시순서
				paramData.put("ITEM_NM", invoiceCdBmap.getString("CODE_NM")+" "+comHanNm);  //항목명(항목명_동반자한글명)
				paramData.put("AMT_SIGN", invoiceCdBmap.getString("AMT_SIGN"));  //통화기호
				paramData.put("PER_AMT", perAmt);  								 //금액
				paramData.put("USE_DAY",  useDay);   							 //이용횟수 (일)
				paramData.put("UNIT_DAY", invoiceCdBmap.getString("UNIT_DAY"));  //횟수단위(D)
				paramData.put("USE_NUM", 1);                                     //이용수량(명)
				paramData.put("UNIT_NUM", invoiceCdBmap.getString("UNIT_NUM"));  //수량단위(P)
				paramData.put("TOT_AMT", perAmt * useDay);   					 //총금액(금액 * 이용획수)
				paramData.put("LOGIN_USER" , LoginInfo.getUserId());			 //로그인ID
				
				//인보이스 등록
				logger.info("===== 인보이스 등록 =====");
				reserveDao.insertInvoiceDetailInfo(paramData);
			}
			
			
			//인보이스 조회
		    result = reserveDao.invoiceSelectList(param);
		    
		}else {  //인보이스 항목 1건이상
			
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
				detailMap.put("FILE_UID"  , (String) param.get("FILE_UID"));
				
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
	public Boolean ReserveManager(BMap reserveInfo, List<BMap> detail) throws Exception{
		Boolean isValid = true;
		int feeCnt = 0;
		int sum_tot = 0;
		int feeCntList  = 0;
		
		
		DateFormat df2 = new SimpleDateFormat("yyyyMMdd");
		
        try {
        	
// master start /////
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
// master end /////       	
        	
// detail start /////
			for(int i = 0; i < detail.size(); i++){
				BMap detailMap = new BMap(detail.get(i));
				detailMap.put("REQ_DT"    , (String) reserveInfo.get("REQ_DT"));
				detailMap.put("SEQ"       , (String) reserveInfo.get("SEQ"));
				
				String CHK_IN_DT = (String) reserveInfo.get("CHK_IN_DT");
				String CHK_OUT_DT = (String) reserveInfo.get("CHK_OUT_DT");
//				CHK_IN_DT = CHK_IN_DT.replaceAll(".", "");
//				CHK_OUT_DT = CHK_OUT_DT.replaceAll(".", "");
				
				detailMap.put("CHK_IN_DT"       , CHK_IN_DT);
				detailMap.put("CHK_OUT_DT"       , CHK_OUT_DT);
				
				detailMap.put("LOGIN_USER", LoginInfo.getUserId());
//				detailMap.put("FILE_UID"  , (String) reserveInfo.get("FILE_UID"));
				
				feeCntList = reserveDao.selectFeeListCnt(detailMap);
				
//				sum_tot += Integer.parseInt((String) reserveInfo.get("TOT_AMT"));
				
				if(detailMap.getString("STATUS_V").equals("I")){
					
					reserveDao.addReserveDetail(detailMap);
//					reserveDao.addInvoiceDetailHis(detailMap);
					
				}else if(detailMap.getString("STATUS_V").equals("U")){
					reserveDao.updateReserveDetailInfo(detailMap);
//					reserveDao.addInvoiceDetailHis(detailMap);
				}
			}
			
//			BMap paramMap = new BMap();
//			paramMap.put("SEQ"       , (String) param.get("SEQ"));      
//			paramMap.put("REQ_DT"    , (String) param.get("REQ_DT"));   
//			paramMap.put("LOGIN_USER", LoginInfo.getUserId());          
//			paramMap.put("TOT_AMT"   , sum_tot);
//			paramMap.put("EXP_DT"    , (String) param.get("EXP_DT"));      
//			paramMap.put("DEP_AMT"   , param.get("DEP_AMT"));      
//			
//			if(feeCntList == 0){ //fee table insert
//				reserveDao.insertFeeInfo(paramMap);
//			}else if(feeCntList == 1 && sum_tot != reserveDao.selectFeeTOT_AMT(paramMap)){ //fee table update
//				reserveDao.updateFeeInfo(paramMap);
//			}
// detail end /////       	
        	
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
        	param.put("REQ_SEQ", param.getInt("REQ_SEQ"));
        	
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
        		paramMap.put("BAS_DT"  , data.get(i).substring(0,8));
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
//		} else if(!dataMap.getString("CHK_DIFF_DAY").equals(dataMap.getString("BAS_YY_CHK_DAY"))){
//			dataMap.put("resultCd", "1001"); //기간 불일치
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
	
	/**
	 * PDF 첨부파일 업로드
	 * @param req
	 * @return
	 * @throws Exception
	 */
	public List<BMap> uploadPdf(HttpServletRequest req) throws Exception{
		
		logger.info("========= PDF 첨부파일 업로드 =========");
		
		String seq    = req.getParameter("seq");
		String req_dt = req.getParameter("req_dt");
		String fuid = "";
		
		if (!StringUtils.isNotEmpty(fuid)) {
			fuid = StringUtils.getUUID();
		}

		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest) req;
		
		List<MultipartFile> files =  mpRequest.getFiles("fileupload[]");
	    List<BMap> list = new ArrayList<BMap>();
		int cnt = 0;
		
		for(MultipartFile file : files){
			cnt++;
			BMap map = new BMap();
			CommonsMultipartFile cmf = (CommonsMultipartFile) file;
			String filename = new String(cmf.getOriginalFilename().getBytes("8859_1"), "UTF-8");  //한글깨짐 문제 해결.
			logger.info("===== 원본파일명 : "+filename);

			long filesize = cmf.getSize();
			System.out.println(filesize);
	    	String temp = StringUtils.getUUID();
	    	String ext = FileManager.getExtension(filename);
	    	String nFileName = temp + "." + ext;

	    	// 임시로 파일 저장
	    	FileManager.mkDir(env.getProperty("TEMPPATH"));
	    	File temfile = new File(env.getProperty("TEMPPATH")+ nFileName);
	        FileOutputStream fos = new FileOutputStream(temfile);
	    	Streams.copy(cmf.getInputStream(), fos, true);
	    	req.getInputStream().close();
	    	fos.close();

			// 파일 업로더 처리 PDF_ATTACHFILEPATH
	    	FileManager.mkDir(env.getProperty("PDF_ATTACHFILEPATH"));
	    	FileTransferManager transferManager = new FileTransferManager(env.getProperty("PDF_ATTACHFILEPATH"));

	    	transferManager.addFilter( new FileExtFilter(env.getProperty("EXTENDWHITELIST"), filename) ); // 확장자 필터링
	    	transferManager.addFilter( new FileMaxUploadFilter(Integer.parseInt(env.getProperty("MAXFILESIZE")), temfile.length())); // 업로더 최대 용량 필터링
	    	
	    	if ( transferManager.upload(nFileName, temfile) ) {
				map.put("FILE_UID", fuid);
				map.put("SRC_FILE_NM", filename);
				map.put("NEW_FILE_NM", nFileName);
				map.put("FILE_SEQ", cnt);
				map.put("FILE_SIZE", filesize);
				map.put("REAL_FILE_PATH", env.getProperty("PDF_ATTACHFILEPATH") + nFileName);
				map.put("FLAG", "success");
				fileService.insertFileInfo(map);
				list.add(map);
	    	}else{
	    		map.put("FILE_UID", fuid);
	    		map.put("SRC_FILE_NM", filename);
	    		map.put("FLAG", "fail");
				list.add(map);
	    	}
		}

		return list;
	}
	
	/**
	 * PDF 첨부파일 다운로드
	 * @param req
	 * @param resp
	 * @throws Exception
	 */
	public void downloadInvoicePdf(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		String filename = req.getParameter("f");        
        //String filename = new String(fname.getBytes("iso-8859-1"),"UTF-8");
        String of = req.getParameter("of"); //인코딩 서버 기본값 ("iso-8859-1")
        
        logger.info("NEW_FILE_NM(f)="+filename);
        logger.info("SRC_FILE_NM(of)="+of);
        
        String dirid = req.getParameter("dirid");
		if(dirid == null || "".equals(dirid)){
			dirid = "common";
		}
        
        if(filename==null||filename.trim().equals("")){
            return;
        }
        
        //업로드 경로와 파일이름을 가지고 File인스턴스 생성
        File downloadFile = new File(env.getProperty("PDF_ATTACHFILEPATH") + filename);
        
        String userAgent 	= req.getHeader("User-Agent");
		if(userAgent.indexOf("MSIE") > -1){
			filename = URLEncoder.encode(filename, "utf-8");
		}else if (userAgent.indexOf("Trident") > -1) { //MS IE 11
			filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "\\ ");
	    }else{
	    	filename = new String(filename.getBytes("utf-8"), "iso-8859-1");
		}

        //웹브라우저가 파일을 다운로드 받로록 하려면 다음과 같이 컨테츠타입지정
        resp.setContentType("application/octet-stream");
        //response.setContentType("application/download; charset=utf-8");         
        resp.setContentLength((int)downloadFile.length());//콘텐트 크기 지정
        //Content-Disposition헤더를 이용해서 전송되는 파일의 이름을 명시
        resp.setHeader("Content-Disposition", "attachment; filename=\""+ of +"\"");
        //전송되는 데이터의 인코딩이 바이너리 타입이라는것을 명시
        resp.setHeader("Content-Transfer-Encoding","binary");
        resp.setHeader("Pragma",  "no-cache;");
        resp.setHeader("Expires", "-1;");
        
        OutputStream out = resp.getOutputStream();         
        FileInputStream fis = null;         
        try {             
            fis = new FileInputStream(downloadFile);             
            FileCopyUtils.copy(fis, out);
        } catch(FileNotFoundException e){
        	System.out.println(e.getMessage());
        } catch(Exception e) {             
        	System.out.println(e.getMessage());             
        } finally {             
            if (fis != null) {                 
                try { fis.close(); } catch (Exception e) {}
            }             
        }
         
        out.flush();
	}
	
	/**
	 * PDF 첨부파일 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteInvoicePdf(BMap param, HttpServletRequest req) throws Exception{
		BMap deParam = new BMap();
		
		deParam.put("SEQ"        , req.getParameter("seq"));
		deParam.put("REQ_DT"     , req.getParameter("req_dt"));
		
		reserveDao.deletePdfInfo(deParam);
		fileService.deleteFileInfo(param);
	}
	
	/**
	 * 객실풀 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> reserveNoRoomList(BMap param) throws Exception {
		return reserveDao.reserveNoRoomList(param);
	}
	
	/**
	 * 객실풀 데이터 삽입 및 삭제
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Boolean saveNoRoom(List<BMap> detail) throws Exception{
		Boolean isValid = true;
		try {
			List<BMap> list = new ArrayList<BMap>();
			
			for(int i = 0; i < detail.size(); i++){
				BMap detailMap = new BMap(detail.get(i));
				
				detailMap.put("REG_ID"    , LoginInfo.getUserId());
				detailMap.put("UPD_ID"    , LoginInfo.getUserId());
				
				list.add(detailMap);
			}
			
			reserveDao.insertnoRoomInfo(list);
			
		} catch (Exception e) {
			e.printStackTrace();
			isValid = false;
		}
		
		return isValid;
	}

	public boolean deletenoRoomInfo(BMap param) throws Exception {
		reserveDao.deletenoRoomInfo(param);
		return false;
	}
	
}