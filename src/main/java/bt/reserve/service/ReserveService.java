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
import java.util.Map;

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
	 * 사용자 정보 검색
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap setUserInfo(BMap param) throws Exception {
		
		return reserveDao.selectUserInfo(param);
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
		logger.info("===== 인보이스 건수 : "+detailCnt);
		
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
			
			
			String prev_itemCd = "";    //이전 아이템코드
			long prev_perAmt = 0;      //이전 금액
			long prev_useDay = 0;      //이전 사용횟수
			long use_num = 1;          //이용수량
			int invoiceDSeq = 0;			   //표시순서
			
			List<BMap> invoiceParamList = new ArrayList<BMap>();  //인보이스 파리미터
			
			for(BMap paramMap : resultAddList) {
			
				BMap paramData = new BMap();
				
				long packageAmt      = 0;  // 패키지가격
				long roomCharge      = 0;  // 숙박비				
				long nokidAmt = 0;  	   // 비라운드,소아 가격
				
				String dSeq        = paramMap.getString("DSEQ");          //상세일련번호
				String numGbn     = paramMap.getString("NUM_GBN");       //인원구분 
				String comHanNm   = paramMap.get("COM_HAN_NM") == null? "" : paramMap.getString("COM_HAN_NM");    //동반자한글명
				String chkInDt    = paramMap.getString("CHK_IN_DT");       //체크인일자
				String chkOutDt   = paramMap.getString("CHK_OUT_DT");      //체크인일자
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
				paramData.put("AGN_GB" , agnGb);   		  //에이전시 구분
				paramData.put("REQ_DT"  , reqDt);		  //예약일자
				paramData.put("SEQ"  , seq);			  //일련번호
				paramData.put("DSEQ"  , dSeq);            //상세일련번호
				
				
				logger.info("===== 인보이스 코드정보 조회 =====");
				BMap invoiceCdBmap = reserveDao.selectInvoiceCodeInfo(paramData);  //상품테이블에 정보가 있는지 확인
				logger.info(" === 인보이스 코드정보       : "+invoiceCdBmap);
				
				if(invoiceCdBmap == null) {  //null일 경우 다음레코드로 이동
					
					logger.info(" ===== 인보이스 상품정보 미존재 =====");
					
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
				
				logger.info(" === 이전 항목코드     	 	: "+prev_itemCd);
				logger.info(" === 이전 인보이스 금액     	: "+prev_perAmt);
				logger.info(" === 이전 인보이스 이용횟수 	: "+prev_useDay);
								
				String itemCd = invoiceCdBmap.getString("CODE"); 	//항목코드
				long perAmt = "02".equals(numGbn)? packageAmt :("01".equals(numGbn) ? roomCharge : nokidAmt);
				long useDay = Long.parseLong(invoiceCdBmap.getString("USE_DAY"));
				
				logger.info(" === 신규 항목코드     	  	: "+itemCd);
				logger.info(" === 신규 인보이스 금액     	: "+perAmt);
				logger.info(" === 신규 인보이스 이용횟수    : "+useDay);
				
											 
				if((!prev_itemCd.equals(itemCd))  || (prev_perAmt != perAmt)  || (prev_useDay != useDay)) {  //이전레코드와 항목코드, 금액, 이용횟수가 다른 경우
					
					logger.info("===== 이전레코드와 항목코드, 금액, 이용횟수가 다른 경우 =====");
					
					use_num = 1;   //수량
					
					BMap invoiceParamMap = new BMap();
					
					invoiceParamMap.put("REQ_DT"  , reqDt);		  //예약일자
					invoiceParamMap.put("SEQ"  , seq);			  //일련번호
					invoiceParamMap.put("ITEM_CD", invoiceCdBmap.getString("CODE"));       	 //항목코드
					invoiceParamMap.put("ORDER",  ++invoiceDSeq);  							 //표시순서
					invoiceParamMap.put("ITEM_NM", invoiceCdBmap.getString("CODE_NM"));      //항목명
					invoiceParamMap.put("AMT_SIGN", invoiceCdBmap.getString("AMT_SIGN"));  	 //통화기호
					invoiceParamMap.put("PER_AMT", perAmt);  								 //금액
					invoiceParamMap.put("USE_DAY",  useDay);   							 	 //이용횟수 (일)
					invoiceParamMap.put("UNIT_DAY", invoiceCdBmap.getString("UNIT_DAY"));  	 //횟수단위(D)
					invoiceParamMap.put("USE_NUM", use_num);                                 //이용수량(명)
					invoiceParamMap.put("UNIT_NUM", invoiceCdBmap.getString("UNIT_NUM"));  	 //수량단위(P)
					invoiceParamMap.put("TOT_AMT", perAmt * useDay);   					 	 //총금액(금액 * 이용획수)
					invoiceParamMap.put("LOGIN_USER" , LoginInfo.getUserId());			 	 //로그인ID
					
					invoiceParamList.add(invoiceParamMap);
					
				} else if((prev_itemCd.equals(itemCd)) && (prev_perAmt == perAmt)  && (prev_useDay == useDay)) {  //이전레코드와 항목코드, 금액, 이용횟수가 같은 경우
					
					logger.info("===== 이전레코드와 항목코드, 금액, 이용횟수가 같은 경우 =====");
					
					use_num++;		//이용수량 증가
					
					int prev_index = invoiceParamList.size() -1;   //이전레코드 순번
					logger.info(" === 이전레코드 순번     	: "+prev_index);
					
					invoiceParamList.get(prev_index).put("USE_NUM", use_num);  //이전항목 이용수량 증가
					invoiceParamList.get(prev_index).put("TOT_AMT", perAmt * useDay * use_num);  //이전항목 총금액 수정(금액 * 이용횟수 * 이용수량)
				}
				
				
				//신규 항목코드, 금액, 이용횟수를 이전항목코드, 금액, 이용횟수로 복사
				prev_itemCd = itemCd;
				prev_perAmt = perAmt;
				prev_useDay = useDay;
				
			}
			
			
			//지상비  인보이스 일괄등록
			logger.info("===== 지상비 인보이스 일괄등록 =====");
			for(BMap paramBMap : invoiceParamList) {
				
				reserveDao.insertInvoiceDetailInfo(paramBMap);
			}
			
			
			//예약기본 값 인보이스 삽입
			BMap invoiceHeaderMap = new BMap();
			logger.info("======= 싱글룸, 프리미엄룸, Early 체크인, Late 체크아웃, 미팅샌딩, 야간미팅샌딩 리스트 조회 ==========");
			
			int roomPerson = Integer.parseInt(String.valueOf(resultDeptDetail.get("M_PERSON"))) 
					   + Integer.parseInt(String.valueOf(resultDeptDetail.get("G_PERSON")))
					   + Integer.parseInt(String.valueOf(resultDeptDetail.get("N_PERSON")))
					   + Integer.parseInt(String.valueOf(resultDeptDetail.get("K_PERSON"))); 
			
			invoiceHeaderMap.put("ROOM_PERSON", roomPerson); // 숙박이용자(멤버/일반/비라운딩/소아)
			invoiceHeaderMap.put("REQ_DT" , resultDeptDetail.get("REQ_DT"));   // 체크인 일자
			invoiceHeaderMap.put("SEQ" , resultDeptDetail.get("SEQ"));   // 체크인 일자
			invoiceHeaderMap.put("CHK_IN_DT" , resultDeptDetail.get("CHK_IN_DT"));   // 체크인 일자
			invoiceHeaderMap.put("CHK_OUT_DT", resultDeptDetail.get("CHK_OUT_DT"));  // 체크아웃 일자
			invoiceHeaderMap.put("LOGIN_USER", LoginInfo.getUserId());
			
			
			// 싱글 룸 추가가 있는경우
			if(!"0".equals(String.valueOf(resultDeptDetail.get("ROOM_ADD_CNT")))) {
				
				logger.info(" ===== 싱글룸 추가  =====");
												
				BMap roomupCalc =  reserveDao.roomupCalc(invoiceHeaderMap);
				
				if(roomupCalc != null) {
				
					invoiceDSeq++;
					invoiceHeaderMap.put("ORDER", invoiceDSeq);
					invoiceHeaderMap.put("ITEM_CD",  roomupCalc.get("ITEM_CD"));
					invoiceHeaderMap.put("ITEM_NM",  roomupCalc.get("ITEM_NM"));
					invoiceHeaderMap.put("AMT_SIGN", roomupCalc.get("AMT_SIGN"));
					invoiceHeaderMap.put("PER_AMT",  roomupCalc.get("PER_AMT"));
					invoiceHeaderMap.put("USE_DAY",  roomupCalc.get("USE_DAY"));
					invoiceHeaderMap.put("UNIT_DAY", roomupCalc.get("UNIT_DAY"));
					invoiceHeaderMap.put("USE_NUM",  roomupCalc.get("USE_NUM"));
					invoiceHeaderMap.put("UNIT_NUM", roomupCalc.get("UNIT_NUM"));
					invoiceHeaderMap.put("TOT_AMT",  roomupCalc.get("TOT_AMT"));
					reserveDao.insertInvoiceDetailInfo(invoiceHeaderMap);
					
				} else {
					
					logger.info("===== 싱글룸 금액이 없음 =====");
				}
			}
			
			
			// 프리미엄 추가가 있는경우
			if(!"0".equals(String.valueOf(resultDeptDetail.get("PRIM_ADD_CNT")))) {
				
				logger.info(" ===== 프리미엄 추가 계산 =====");
												
				BMap primCalc =  reserveDao.primCalc(invoiceHeaderMap);
				
				if(primCalc != null) {
				
					invoiceDSeq++;
					invoiceHeaderMap.put("ORDER", invoiceDSeq);
					invoiceHeaderMap.put("ITEM_CD",  primCalc.get("ITEM_CD"));
					invoiceHeaderMap.put("ITEM_NM",  primCalc.get("ITEM_NM"));
					invoiceHeaderMap.put("AMT_SIGN", primCalc.get("AMT_SIGN"));
					invoiceHeaderMap.put("PER_AMT",  primCalc.get("PER_AMT"));
					invoiceHeaderMap.put("USE_DAY",  primCalc.get("USE_DAY"));
					invoiceHeaderMap.put("UNIT_DAY", primCalc.get("UNIT_DAY"));
					invoiceHeaderMap.put("USE_NUM",  primCalc.get("USE_NUM"));
					invoiceHeaderMap.put("UNIT_NUM", primCalc.get("UNIT_NUM"));
					invoiceHeaderMap.put("TOT_AMT",  primCalc.get("TOT_AMT"));
					reserveDao.insertInvoiceDetailInfo(invoiceHeaderMap);
					
				} else {
					
					logger.info("===== 프리미엄추가 금액이 없음 =====");
				}
			}
			
			
			// Early Check In 이용 시
			if(("1".equals((String)resultDeptDetail.get("LATE_CHECK_IN"))) && (resultDeptDetail.get("LATE_CHECK_IN") != null)) {
				
				logger.info("===== EARLY 체크인 계산 =====");
												
				BMap earlyCheckInCalc =  reserveDao.earlyCheckInCalc(invoiceHeaderMap);
				
				if(earlyCheckInCalc != null) {
					
					invoiceDSeq++;
					invoiceHeaderMap.put("ORDER", invoiceDSeq);
					invoiceHeaderMap.put("ITEM_CD",  earlyCheckInCalc.get("ITEM_CD"));
					invoiceHeaderMap.put("ITEM_NM",  earlyCheckInCalc.get("ITEM_NM"));
					invoiceHeaderMap.put("AMT_SIGN", earlyCheckInCalc.get("AMT_SIGN"));
					invoiceHeaderMap.put("PER_AMT",  earlyCheckInCalc.get("PER_AMT"));
					invoiceHeaderMap.put("USE_DAY",  earlyCheckInCalc.get("USE_DAY"));
					invoiceHeaderMap.put("UNIT_DAY", earlyCheckInCalc.get("UNIT_DAY"));
					invoiceHeaderMap.put("USE_NUM",  earlyCheckInCalc.get("USE_NUM"));
					invoiceHeaderMap.put("UNIT_NUM", earlyCheckInCalc.get("UNIT_NUM"));
					invoiceHeaderMap.put("TOT_AMT",  earlyCheckInCalc.get("TOT_AMT"));
					reserveDao.insertInvoiceDetailInfo(invoiceHeaderMap);
					
				} else {
					
					logger.info("===== EARLY 체크인 금액이 없음 =====");
				}
			}
			
			
			// Late Check Out 이용시
			if((!"3".equals((String)resultDeptDetail.get("LATE_CHECK_OUT"))) && (resultDeptDetail.get("LATE_CHECK_OUT") != null)) {
				
				logger.info("===== LATE 체크아웃 계산 =====");
												
				if("1".equals((String)resultDeptDetail.get("LATE_CHECK_OUT"))) {
					invoiceHeaderMap.put("LATE_CODE", "LATECHECKOUT01");
					invoiceHeaderMap.put("LATE_HDNG_GBN", "16");
				}else if("2".equals((String)resultDeptDetail.get("LATE_CHECK_OUT"))) {
					invoiceHeaderMap.put("LATE_CODE", "LATECHECKOUT02");
					invoiceHeaderMap.put("LATE_HDNG_GBN", "17");
				}
				
				BMap lateCheckOutCalc =  reserveDao.lateCheckOutCalc(invoiceHeaderMap);
				
				if(lateCheckOutCalc != null) {
					
					invoiceDSeq++;
					invoiceHeaderMap.put("ORDER", invoiceDSeq);
					invoiceHeaderMap.put("ITEM_CD",  lateCheckOutCalc.get("ITEM_CD"));
					invoiceHeaderMap.put("ITEM_NM",  lateCheckOutCalc.get("ITEM_NM"));
					invoiceHeaderMap.put("AMT_SIGN", lateCheckOutCalc.get("AMT_SIGN"));
					invoiceHeaderMap.put("PER_AMT",  lateCheckOutCalc.get("PER_AMT"));
					invoiceHeaderMap.put("USE_DAY",  lateCheckOutCalc.get("USE_DAY"));
					invoiceHeaderMap.put("UNIT_DAY", lateCheckOutCalc.get("UNIT_DAY"));
					invoiceHeaderMap.put("USE_NUM",  lateCheckOutCalc.get("USE_NUM"));
					invoiceHeaderMap.put("UNIT_NUM", lateCheckOutCalc.get("UNIT_NUM"));
					invoiceHeaderMap.put("TOT_AMT",  lateCheckOutCalc.get("TOT_AMT"));
					reserveDao.insertInvoiceDetailInfo(invoiceHeaderMap);
				
				} else {
					
					logger.info("===== LATE 체크아웃 금액이 없음 =====");
				}
			}
			
			
			// 미팅샌딩 신청 시 
			if((!"01".equals((String)resultDeptDetail.get("PICK_GBN"))) && (resultDeptDetail.get("PICK_GBN") != null)) {
				
				logger.info("===== 미팅샌딩 계산 =====");
											
				if("02".equals((String)resultDeptDetail.get("PICK_GBN"))) {
					invoiceHeaderMap.put("SEND_GBN", "18");  //스나이
				}else if("03".equals((String)resultDeptDetail.get("PICK_GBN"))) {
					invoiceHeaderMap.put("SEND_GBN", "19");  //싱가폴
				}
				
				//미팅샌딩 계산 리스트
				List<BMap> sendingCalcList =  reserveDao.sendingCalc(invoiceHeaderMap);
				
				int cnt=0;
				for (BMap sendingCalc : sendingCalcList) {
																
					invoiceDSeq++;
					invoiceHeaderMap.put("ORDER", invoiceDSeq);
					
					invoiceHeaderMap.put("ITEM_CD",  sendingCalc.get("ITEM_CD"));
					invoiceHeaderMap.put("ITEM_NM",  sendingCalc.get("ITEM_NM"));
					invoiceHeaderMap.put("AMT_SIGN", sendingCalc.get("AMT_SIGN"));
					invoiceHeaderMap.put("PER_AMT",  sendingCalc.get("PER_AMT"));
					invoiceHeaderMap.put("USE_DAY",  sendingCalc.get("USE_DAY"));
					invoiceHeaderMap.put("UNIT_DAY", sendingCalc.get("UNIT_DAY"));
					invoiceHeaderMap.put("USE_NUM",  sendingCalc.get("USE_NUM"));
					invoiceHeaderMap.put("UNIT_NUM", sendingCalc.get("UNIT_NUM"));
					invoiceHeaderMap.put("TOT_AMT",  sendingCalc.get("TOT_AMT"));
					reserveDao.insertInvoiceDetailInfo(invoiceHeaderMap);
						
					
					//마지막 레코드
					if(cnt == sendingCalcList.size() -1) { 
					
						if(Integer.parseInt(String.valueOf(sendingCalc.get("SURCHARGE_CNT"))) > 0 && "19".equals(invoiceHeaderMap.get("SEND_GBN"))) {  //싱가폴
							
							logger.info("===== 야간 미팅샌딩 계산 =====");
														
							invoiceHeaderMap.put("SEND_GBN", "19");
							
							//야간 미팅샌딩 계산 리스트
							List<BMap> sendingSubCalcList =  reserveDao.sendingSubCalc(invoiceHeaderMap);
							
							for(BMap sendingSubCalc : sendingSubCalcList) {
																
								invoiceDSeq++;
								invoiceHeaderMap.put("ORDER", invoiceDSeq);
								invoiceHeaderMap.put("ITEM_CD",  sendingSubCalc.get("ITEM_CD"));
								invoiceHeaderMap.put("ITEM_NM",  sendingSubCalc.get("ITEM_NM"));
								invoiceHeaderMap.put("AMT_SIGN", sendingSubCalc.get("AMT_SIGN"));
								invoiceHeaderMap.put("PER_AMT",  sendingSubCalc.get("PER_AMT"));
								invoiceHeaderMap.put("USE_DAY",  sendingSubCalc.get("USE_DAY"));
								invoiceHeaderMap.put("UNIT_DAY", sendingSubCalc.get("UNIT_DAY"));
								invoiceHeaderMap.put("USE_NUM",  sendingSubCalc.get("USE_NUM"));
								invoiceHeaderMap.put("UNIT_NUM", sendingSubCalc.get("UNIT_NUM"));
								invoiceHeaderMap.put("TOT_AMT",  sendingSubCalc.get("TOT_AMT"));
								reserveDao.insertInvoiceDetailInfo(invoiceHeaderMap);
							
							}
							
						}
					
					}
				
					cnt++;
				}
												
			}
			
			// 총 금액 계산 후 삽입
			BMap sumData = new BMap();
			sumData.put("REQ_DT", reqDt);
			sumData.put("SEQ", seq);
			sumData.put("LOGIN_USER", LoginInfo.getUserId());
			
			int totAmt = reserveDao.invoiceSumTot(sumData);
			int feeCnt = reserveDao.selectFeeListCnt(sumData);
			
			sumData.put("TOT_AMT", totAmt);
			
			 if(feeCnt == 0){ //fee table insert
				reserveDao.insertFeeInfo(sumData);
			}else if(feeCnt == 1){ //fee table update, 	예약금액(DEP_AMT) 업데이트
				reserveDao.updateFeeInfo(sumData);
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
			
			
			logger.info("===== feeCnt : "+feeCnt);
			logger.info("===== sum_tot : "+sum_tot);
			//logger.info("===== fee_Tot_amt : "+reserveDao.selectFeeTOT_AMT(paramMap));
			
			
			if(feeCnt == 0){ //fee table insert
				reserveDao.insertFeeInfo(paramMap);
			//}else if(feeCnt == 1 && sum_tot != reserveDao.selectFeeTOT_AMT(paramMap)){ //fee table update
			}else if(feeCnt == 1){ //fee table update, 예약금기한일자(EXP_DT), 	예약금액(DEP_AMT) 업데이트
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
	public int deleteInvoiceManager(BMap param ) throws Exception{
		int isStatus    = 1;

        try {
        	param.put("STATUS_V" , "D");
        	reserveDao.delInvoiceDetailHis(param);
		    reserveDao.deleteInvoiceManager(param);

		    int listCnt = reserveDao.selectInvoiceListCnt(param);
		    
		    if(listCnt == 0) {
		    	reserveDao.deleteAllFeeInfo(param);
		    	reserveDao.deleteInvRegDt(param);
		    	isStatus = 0;
		    } else {
		    	reserveDao.deleteFeeInfo(param);
		    }
		} catch (Exception e) {
		    // TODO: handle exception
			e.printStackTrace();
			isStatus = -1;
		}
		return isStatus;
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
				if(deleteCnt > 0){
					reserveDao.updateDeletePickGbn(param);
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
					
					if (selectPickCnt > 0 && i == 0 ) {
						//삭제후 insert 
						int deleteCnt = reserveDao.deletePickupInfo(param);
						if(deleteCnt > 0){
							reserveDao.updateDeletePickGbn(param);
						}
					}
					
					int insertCnt = reserveDao.insertPickupInfo(detailMap);
					if(insertCnt > 0 ){
						reserveDao.updatePickGbn(param);
					}else{
						//exeption
						throw new Exception(messageSource.getMessage("fail.common.msg", null, locale));	// 에러가 발생했습니다!
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
        	
// master start //
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
// master end //  	    	
// detail start //
			for(int i = 0; i < detail.size(); i++){
				BMap detailMap = new BMap(detail.get(i));
				detailMap.put("REQ_DT"    , (String) reserveInfo.get("REQ_DT"));
				detailMap.put("DSEQ"      , i + 1);
				
				String CHK_IN_DT = (String) reserveInfo.get("CHK_IN_DT");
				String CHK_OUT_DT = (String) reserveInfo.get("CHK_OUT_DT");
				
				detailMap.put("CHK_IN_DT"       , CHK_IN_DT);
				detailMap.put("CHK_OUT_DT"       , CHK_OUT_DT);
				detailMap.put("LOGIN_USER", LoginInfo.getUserId());
				
				feeCntList = reserveDao.selectFeeListCnt(detailMap);
				
				if(detailMap.getString("STATUS_V").equals("I")){
					reserveDao.addReserveDetail(detailMap);
				}else if(detailMap.getString("STATUS_V").equals("U")){
					reserveDao.updateReserveDetailInfo(detailMap);
				}
			}
// detail end //	
        	
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
        		
//        		if(i == firstIndex){
//        			paramMap.put("PER_STR" , param.getString("booleanIn"));
//        		}else if( i == lastIndex){
//        			paramMap.put("PER_STR" , param.getString("booleanOut"));
//        		}else{
//        			paramMap.put("PER_STR" , param.get("R_PERSON"));
//        		}
        		paramMap.put("PER_STR" , param.get("R_PERSON"));
        		
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
	public List<BMap> reserveNoRoomList(Map<String, Object> param) throws Exception {
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
			
			reserveDao.insertNoRoomInfo(list);
			
		} catch (Exception e) {
			e.toString();
			isValid = false;
		}
		
		return isValid;
	}

	public Boolean deleteNoRoomInfo(BMap param) throws Exception {
		Boolean isValid = true;
		try {
			reserveDao.deleteNoRoomInfo(param);
		} catch (Exception e) {
			e.toString();
			isValid = false;
		}
		return isValid;
	}

	/**
	 * 체크인 일자 변경 시 상품 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectHdngGbnList_M(BMap param) throws Exception{
		return reserveDao.selectHdngGbnList_M(param);
	}
	public List<BMap> selectHdngGbnList_A(BMap param) throws Exception{
		return reserveDao.selectHdngGbnList_A(param);
	}

	/**
	 * 예약 데이터 동반자정보 삭제
	 * @param param
	 * @param detail 
	 * @return
	 * @throws Exception
	 */
	public boolean deleteReserveDetail(BMap param, List<BMap> detail) throws Exception {
		Boolean isValid = true;
		try {
			reserveDao.deleteReserveDetail(param);
			
			param.remove("DSEQ");
			reserveDao.deleteReserveDetail(param);

			for(int i = 0; i < detail.size(); i++){
				BMap detailMap = new BMap(detail.get(i));

				detailMap.put("LOGIN_USER", LoginInfo.getUserId());

				reserveDao.addReserveDetail(detailMap);
			}
		} catch (Exception e) {
			e.toString();
			isValid = false;
		}
		return isValid;
		}
	
	/**
	 * 패키지 리스트 호출
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> packageResetList(BMap param) throws Exception {
		return reserveDao.packageResetList(param);
	}

	public void updateReservePerson(BMap param) throws Exception {
		reserveDao.updateReservePerson(param);
	}
	
	/**
	 * 객실 풀 체크
	 * @param param
	 * @return list
	 * @throws Exception
	 */
	public List<Map<String, Object>> noRoomChk(Map<String, Object> param) throws Exception {
		return reserveDao.noRoomChk(param);
	}
	
}