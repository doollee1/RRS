package bt.reserve.controller;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BRespData;
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
		param.put("HEAD_CD", 500030);

		BMap param2 = new BMap();
		param2.put("HEAD_CD" , 500210);
		
		BMap param3 = new BMap();
		param3.put("HEAD_CD" , 500070);
		
		BMap param4 = new BMap();
		param4.put("HEAD_CD" , 500120);
		
		BMap param5 = new BMap();
		param5.put("HEAD_CD" , 500000);
		param5.put("REF_CHR1", 01);
		
		BMap param6 = new BMap();
		param6.put("HEAD_CD" , 500110);

		BMap param7 = new BMap();
		param7.put("HEAD_CD" , 500180);

		BMap param8 = new BMap();
		param8.put("HEAD_CD" , 500190);

		BMap param9 = new BMap();
		param9.put("HEAD_CD" , 500160);

		model.addAttribute("mgn_gbn"     , reserveService.selectGetCommonCode(param));
		model.addAttribute("region"      , reserveService.selectGetCommonCode(param2));
		model.addAttribute("roomtype"    , reserveService.selectGetCommonCode(param3));
		model.addAttribute("agency"      , reserveService.selectGetCommonCode(param4));
		model.addAttribute("prod_cd"     , reserveService.selectGetCommonCode(param5));
		model.addAttribute("cartype"     , reserveService.selectGetCommonCode(param6));
		model.addAttribute("flight_in"   , reserveService.selectGetCommonCode(param7));
		model.addAttribute("flight_out"  , reserveService.selectGetCommonCode(param8));
		model.addAttribute("late_flight" , reserveService.selectGetCommonCode(param9));
			
		return "/popup/ReserveRegiPopup";
	}
	
	/**
	 * 예약등록 팝업 호출
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
		param3.put("HEAD_CD" , 500170);
		
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
//		BMap param = new BMap();
//		param.put("HEAD_CD", 500030);
//		
//		BMap param2 = new BMap();
//		param2.put("HEAD_CD", 500020);
//
//		model.addAttribute("mem_gbn"  , reserveService.selectGetCommonCode(param));
//		model.addAttribute("prc_sts"  , reserveService.selectGetCommonCode(param2));
		return "/reserve/ReserveNoRoom"; 
	}
	
}
