package bt.reserve.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import bt.btframework.utils.BMap;
import bt.common.service.CommonService;
import bt.reserve.service.ReserveService;

@Controller
public class ReserveController {

	@Resource
	private ReserveService reserveService;
	
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
		param2.put("HEAD_CD" , 500050);
		BMap param3 = new BMap();
		param3.put("HEAD_CD" , 500070);
		BMap param4 = new BMap();
		param4.put("HEAD_CD" , 500120);
		BMap param5 = new BMap();
		param5.put("HEAD_CD" , 500000);
		param5.put("REF_CHR1", 01);

		model.addAttribute("mgn_gbn"  , reserveService.selectGetCommonCode(param));
		model.addAttribute("region"   , reserveService.selectGetCommonCode(param2));
		model.addAttribute("roomtype" , reserveService.selectGetCommonCode(param3));
		model.addAttribute("agency"   , reserveService.selectGetCommonCode(param4));
		model.addAttribute("prod_cd"  , reserveService.selectGetCommonCode(param5));
			
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
		param2.put("HEAD_CD" , 500050);
		
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
	@RequestMapping(value = "/reserve/invoicePopup.do")
	public String invoicePopup(ModelMap model,HttpServletRequest request) throws Exception{
		model.addAttribute("selectList"   , reserveService.InvoiceSelectBoxList("500140"));
		return "/popup/InvoicePopup";
	}
}
