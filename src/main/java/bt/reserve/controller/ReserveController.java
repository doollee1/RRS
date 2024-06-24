package bt.reserve.controller;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.reserve.service.ReserveService;
import bt.btframework.utils.BReqData;
import bt.common.service.FileService;

@Controller
public class ReserveController {

	@Resource	
	private ReserveService reserveService;
	
	@Resource(name = "FileService")
	private FileService fileService;
	
	@Autowired
    private Environment env;
	
	private static final Logger logger = LoggerFactory.getLogger(ReserveController.class);
	
	
	/**
	 * 예약리스트 화면 호출
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserve/reserveList.do")
	public String reserveList(ModelMap model,HttpServletRequest request) throws Exception {
		
		logger.info("====== 예약리스트화면출력=======");
		
		BMap param = new BMap();
		param.put("HEAD_CD", 500030);
		
		BMap param2 = new BMap();
		param2.put("HEAD_CD", 500020);

		model.addAttribute("mem_gbn"  , reserveService.selectGetCommonCode(param));
		model.addAttribute("prc_sts"  , reserveService.selectGetCommonCode(param2));
		return "/reserve/Reserve"; 
	}
	
	/**
	 * 예약등록 팝업 호출
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserve/reserveRegi.do")
	public String ReserveRegiPopup(ModelMap model,HttpServletRequest request) throws Exception{
		BMap param = new BMap();
		param.put("HEAD_CD", 500030);				//회원구분

		BMap param2 = new BMap();
		param2.put("HEAD_CD" , 500210);				//미팅샌딩
		
		BMap param3 = new BMap();
		param3.put("HEAD_CD" , 500070);				//객실타입
		
		BMap param4 = new BMap();
		param4.put("HEAD_CD" , 500120);				//예약상태
		
		BMap param5 = new BMap();
		param5.put("HEAD_CD" , 500000);				//항목구분
		param5.put("REF_CHR1", 01);
		
		BMap param6 = new BMap();
		param6.put("HEAD_CD" , 500110);				//픽업차량회사

		BMap param7 = new BMap();
		param7.put("HEAD_CD" , 500180);				//도착항공편

		BMap param8 = new BMap();
		param8.put("HEAD_CD" , 500190);				//도착항공편

		BMap param9 = new BMap();
		param9.put("HEAD_CD" , 500160);				//야간할증 항공편

		BMap param10 = new BMap();
		param10.put("HEAD_CD" , 500260);			//에이전시구분

		BMap param11 = new BMap();
		param11.put("HEAD_CD" , 500040);			//인원구분(멤버,일반,비라운딩,소아,영유아)

		BMap param12 = new BMap();
		param12.put("HEAD_CD" , 500150);			//LATE_CHECK_IN

		BMap param13 = new BMap();
		param13.put("HEAD_CD" , 500060);			//LATE_CHECK_OUT

		BMap param14 = new BMap();
		param14.put("HEAD_CD" , 500000);				//그리드 상품 멤버
		param14.put("REF_CHR1", 01);
		param14.put("REF_CHR2", "PROD01");

		BMap param15 = new BMap();
		param15.put("HEAD_CD" , 500000);				//그리드 상품 일반
		param15.put("REF_CHR1", 01);
		param15.put("REF_CHR2", "PROD02");

		BMap param16 = new BMap();
		param16.put("HEAD_CD" , 500000);				//그리드 상품 비라운딩
		param16.put("REF_CHR1", 01);
		param16.put("REF_CHR2", "PROD03");

		BMap param17 = new BMap();
		param17.put("HEAD_CD" , 500000);				//항목구분 - 상품일반
		param17.put("REF_CHR1", 01);
		param17.put("REF_CHR2", "PROD02");
		
		model.addAttribute("COM_GBN"   , reserveService.selectGetCommonCodeCom_Gbn(param));			//회원구분
		model.addAttribute("NUM_GBN"   , reserveService.selectGetCommonCode2(param11));			//인원구분
		model.addAttribute("FLIGHT_IN"   , reserveService.selectGetCommonCode2(param7));		//출발항공편
		model.addAttribute("FLIGHT_IN_HH"   , reserveService.selectGetCommonCodeHH(param7));	//출발항공시간
		model.addAttribute("FLIGHT_OUT"   , reserveService.selectGetCommonCode2(param8));		//도착항공편
		model.addAttribute("FLIGHT_OUT_HH"   , reserveService.selectGetCommonCodeHH(param7));	//도착항공시간
		model.addAttribute("ROOM_TYPE"   , reserveService.selectGetCommonCode2(param3));		//객실타입
		model.addAttribute("LATE_CHECK_IN"   , reserveService.selectGetCommonCode2(param12));		//LATE_CHECK_IN
		model.addAttribute("LATE_CHECK_OUT"   , reserveService.selectGetCommonCode2(param13));		//LATE_CHECK_OUT
		model.addAttribute("list_hdng_gbn_m"   , reserveService.selectGetCommonCode2(param14));		//그리드 상품 멤버
		model.addAttribute("list_hdng_gbn_g"   , reserveService.selectGetCommonCode2(param15));		//그리드 상품 일반
		model.addAttribute("list_hdng_gbn_n"   , reserveService.selectGetCommonCode2(param16));		//그리드 상품 비라운딩
		model.addAttribute("mgn_gbn"     , reserveService.selectGetCommonCode(param));
		model.addAttribute("region"      , reserveService.selectGetCommonCode(param2));
		model.addAttribute("roomtype"    , reserveService.selectGetCommonCode(param3));
		model.addAttribute("agency"      , reserveService.selectGetCommonCode(param4));
		model.addAttribute("hdng_gbn"     , reserveService.selectGetCommonCode(param5));
		model.addAttribute("cartype"     , reserveService.selectGetCommonCode(param6));
		model.addAttribute("flight_in"   , reserveService.selectGetCommonCode(param7));
		model.addAttribute("flight_out"  , reserveService.selectGetCommonCode(param8));
		model.addAttribute("late_flight" , reserveService.selectGetCommonCode(param9));
		model.addAttribute("agency_gbn"  , reserveService.selectGetCommonCode(param10));
		model.addAttribute("hdng_gbn_g"     , reserveService.selectGetCommonCode3(param17));
		
		return "/popup/ReserveRegiPopup";
	}
	
	
	/**
	 * 예약등록 팝업 호출2
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserve/reserveRegi2.do")
	public String ReserveRegiPopup2(ModelMap model,HttpServletRequest request) throws Exception{
		
		logger.info("====== 예약등록 팝업2 호출 ======");
		
		BMap param = new BMap();
		param.put("HEAD_CD", 500030);				//회원구분

		BMap param2 = new BMap();
		param2.put("HEAD_CD" , 500210);				//미팅샌딩
		
		BMap param3 = new BMap();
		param3.put("HEAD_CD" , 500070);				//객실타입
		
		BMap param4 = new BMap();
		param4.put("HEAD_CD" , 500120);				//예약상태
		
		BMap param5 = new BMap();
		param5.put("HEAD_CD" , 500000);				//항목구분
		param5.put("REF_CHR1", 01);
		
		BMap param6 = new BMap();
		param6.put("HEAD_CD" , 500110);				//픽업차량회사

		BMap param7 = new BMap();
		param7.put("HEAD_CD" , 500180);				//도착항공편

		BMap param8 = new BMap();
		param8.put("HEAD_CD" , 500190);				//도착항공편

		BMap param9 = new BMap();
		param9.put("HEAD_CD" , 500160);				//야간할증 항공편

		BMap param10 = new BMap();
		param10.put("HEAD_CD" , 500260);			//에이전시구분

		BMap param11 = new BMap();
		param11.put("HEAD_CD" , 500040);			//인원구분(멤버,일반,비라운딩,소아,영유아)

		BMap param12 = new BMap();
		param12.put("HEAD_CD" , 500150);			//LATE_CHECK_IN

		BMap param13 = new BMap();
		param13.put("HEAD_CD" , 500060);			//LATE_CHECK_OUT

		BMap param14 = new BMap();
		param14.put("HEAD_CD" , 500000);				//그리드 상품 멤버
		param14.put("REF_CHR1", 01);
		param14.put("REF_CHR2", "PROD01");

		BMap param15 = new BMap();
		param15.put("HEAD_CD" , 500000);				//그리드 상품 일반
		param15.put("REF_CHR1", 01);
		param15.put("REF_CHR2", "PROD02");

		BMap param16 = new BMap();
		param16.put("HEAD_CD" , 500000);				//그리드 상품 비라운딩
		param16.put("REF_CHR1", 01);
		param16.put("REF_CHR2", "PROD03");

		BMap param17 = new BMap();
		param17.put("HEAD_CD" , 500000);				//항목구분 - 상품일반
		param17.put("REF_CHR1", 01);
		param17.put("REF_CHR2", "PROD02");
		
		model.addAttribute("COM_GBN"           , reserveService.selectGetCommonCodeCom_Gbn(param));	//회원구분
		model.addAttribute("NUM_GBN"           , reserveService.selectGetCommonCode2(param11));		//인원구분
		
		model.addAttribute("FLIGHT_IN"         , reserveService.selectGetCommonCode2(param7));		//출발항공편
		model.addAttribute("FLIGHT_IN_HH"      , reserveService.selectGetCommonCodeHH(param7));	    //출발항공시간
		model.addAttribute("FLIGHT_OUT"        , reserveService.selectGetCommonCode2(param8));		//도착항공편
		model.addAttribute("FLIGHT_OUT_HH"     , reserveService.selectGetCommonCodeHH(param7));	    //도착항공시간
		
		model.addAttribute("ROOM_TYPE"         , reserveService.selectGetCommonCode2(param3));		//객실타입
		model.addAttribute("LATE_CHECK_IN"     , reserveService.selectGetCommonCode2(param12));		//LATE_CHECK_IN
		model.addAttribute("LATE_CHECK_OUT"    , reserveService.selectGetCommonCode2(param13));		//LATE_CHECK_OUT
		model.addAttribute("list_hdng_gbn_m"   , reserveService.selectGetCommonCode2(param14));		//그리드 상품 멤버
		model.addAttribute("list_hdng_gbn_g"   , reserveService.selectGetCommonCode2(param15));		//그리드 상품 일반
		model.addAttribute("list_hdng_gbn_n"   , reserveService.selectGetCommonCode2(param16));		//그리드 상품 비라운딩
		
		
		
		model.addAttribute("mgn_gbn"           , reserveService.selectGetCommonCode(param));
		model.addAttribute("region"            , reserveService.selectGetCommonCode(param2));
		model.addAttribute("roomtype"          , reserveService.selectGetCommonCode(param3));
		model.addAttribute("agency"            , reserveService.selectGetCommonCode(param4));
		model.addAttribute("hdng_gbn"          , reserveService.selectGetCommonCode(param5));
		model.addAttribute("cartype"           , reserveService.selectGetCommonCode(param6));
		model.addAttribute("flight_in"         , reserveService.selectGetCommonCode(param7));
		model.addAttribute("flight_out"        , reserveService.selectGetCommonCode(param8));
		model.addAttribute("late_flight"       , reserveService.selectGetCommonCode(param9));
		model.addAttribute("agency_gbn"        , reserveService.selectGetCommonCode(param10));
		model.addAttribute("hdng_gbn_g"        , reserveService.selectGetCommonCode3(param17));
		model.addAttribute("lete_check_in"     , reserveService.selectGetCommonCode(param12));		//LATE_CHECK_IN
		model.addAttribute("lete_check_out"    , reserveService.selectGetCommonCode(param13));		//LATE_CHECK_OUT
		return "/popup/ReserveRegiPopup2";
	}
	
	/**
	 * 미팅샌딩등록 팝업 호출
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserve/pickUpGbnPopup.do")
	public String pickUpGbnPopup(ModelMap model,HttpServletRequest request) throws Exception{
		BMap param = new BMap();
		param.put("HEAD_CD" , 500000);
		param.put("REF_CHR1", 03);
		
		BMap param2 = new BMap();
		param2.put("HEAD_CD" , 500210);
		
		BMap param3 = new BMap();
		param3.put("HEAD_CD" , 500220);
		
		model.addAttribute("prod_seq" , reserveService.selectGetCommonCode(param));
		model.addAttribute("region"   , reserveService.selectGetCommonCode(param2));
		model.addAttribute("prod_gbn" , reserveService.selectGetCommonCode(param3));
		return "/popup/pickUpGbnPopup";
	}
	
	/**
	 * 인보이스 팝업 호출
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserve/InvoicePopup.do")
	public String invoicePopup(ModelMap model,HttpServletRequest request) throws Exception{
		/*BMap param = new BMap();
		param.put("HEAD_CD" , 500140);
		param.put("REF_CHR" , "REF_CHR2");
		param.put("VAL"     , "\\");
		param.put("KOR_1"   , "\\\\");
		param.put("KOR_2"   , "$");*/

		BMap param2 = new BMap();
		param2.put("HEAD_CD" , 500140);
		param2.put("REF_CHR" , "REF_CHR3");
		param2.put("VAL"     , "D");
		param2.put("KOR_1"   , "일");
		param2.put("KOR_2"   , "회");
		
		BMap param3 = new BMap();
		param3.put("HEAD_CD" , 500140);
		param3.put("REF_CHR" , "REF_CHR4");
		param3.put("VAL"     , "P");
		param3.put("KOR_1"   , "인");
		param3.put("KOR_2"   , "개");
		
		
		
		//model.addAttribute("REF_CHR2"   , reserveService.selectGetCommonCode1(param ));
		model.addAttribute("REF_CHR3"   , reserveService.selectGetCommonCode1(param2));
		model.addAttribute("REF_CHR4"   , reserveService.selectGetCommonCode1(param3));
		return "/popup/InvoicePopup";
	}

	
	/**
	 * 예약 상태변경 팝업 호출
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserve/chgStatusPopup.do")
	public String chgStatusPopup(ModelMap model,HttpServletRequest request) throws Exception{
		return "/popup/chgStatusPopup";
	}
	
	/**
	 * 이미지 팝업 호출
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserve/arrImg.do")
	public String arrImgPopup(ModelMap model,HttpServletRequest request) throws Exception{
		return "/popup/arrImgPopup";
	}
	
	/**
	 * 아이디 팝업 호출
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserve/searchId.do")
	public String searchId(ModelMap model,HttpServletRequest request) throws Exception{

		logger.info("====== 예약 아이디 찾기 팝업 호출=======");
		
		BMap param = new BMap();
		param.put("HEAD_CD", 500030);
		
		model.addAttribute("pop_mem_gbn"  , reserveService.selectGetCommonCode(param));
		return "/popup/searchId";
	}

	/**
	 * PDF 파일 첨부 업로드
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserve/uploadPdf.do")
	@ResponseBody
	public BRespData uploadPdf(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		List<BMap> list = reserveService.uploadPdf(req);
		BRespData respData = new BRespData();
		respData.put("result", list);
		return respData;
	}
	
	/**
	 * PDF 첨부파일 다운로드
	 * @param req
	 * @param resp
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserve/downloadInvoicePdf", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public void downloadInvoicePdf(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		reserveService.downloadInvoicePdf(req, resp);
	}
	
	/**
	 * PDF 첨부파일 삭제
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserve/deleteInvoicePdf.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData deleteNoticeAttach(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("FILE_UID", param.getString("fileUid"));
		param.put("NEW_FILE_NM", param.getString("fileName"));
		BRespData respData = new BRespData();

		reserveService.deleteInvoicePdf(param,req);
		
		return respData;
	}
	
	/**
	 * 객실 풀관리 화면 호출
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserve/reserveNoRoom.do")
	public String reserveNoRoom(ModelMap model,HttpServletRequest request) throws Exception {
		return "/reserve/ReserveNoRoom"; 
	}
	
	/**
	 * 패키지 리스트 호출
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserve/packageResetList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData packageResetList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = new BMap();
		param.put("CHK_IN_DT", reqData.get("CHK_IN_DT"));
		param.put("CHK_OUT_DT", reqData.get("CHK_OUT_DT"));
		BRespData respData = new BRespData();
		respData.put("result", reserveService.packageResetList(param));
		return respData;
	}
	
}
