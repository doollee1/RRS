package bt.reserve.controller;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import bt.btframework.utils.BMap;
import bt.reserve.service.ReserveService;

@Controller
public class ReserveController {

	@Resource	
	private ReserveService reserveService;
	
	/**
	 * 예약리스트 화면 호출
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserve/reserveList.do")
	public String reserveList(ModelMap model,HttpServletRequest request) throws Exception {
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
	 * 예약등록 팝업 호출
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserve/reserveListRegi.do")
	public String ReserveListRegiPopup(ModelMap model,HttpServletRequest request) throws Exception{
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
			
		return "/popup/ReserveListRegiPopup";
	}
	
	
}
