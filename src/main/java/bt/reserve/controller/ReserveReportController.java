package bt.reserve.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.reserve.service.ReserveReportService;
import bt.rrs.service.RrsUserService;

@Controller
public class ReserveReportController {

	@Resource	
	private ReserveReportService reserveReportService;
	
	@Resource(name = "RrsUserService")
	private RrsUserService rrsUserService;
	
	/**
	 * 예약 현황 화면 호출
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserve/reserveReport.do")
	public String reserveList(ModelMap model,HttpServletRequest request) throws Exception {
		BMap param = new BMap();
		param.put( "HEAD_CD", 500030);
		
		model.addAttribute("mem_gbn" , rrsUserService.selectGetCommonCode(param));

		return "/reserve/ReserveReport"; 
	}
	
	/**
	 * 예약 현황 리스트 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserve/reserveReportSelectList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData reserveSelectList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		respData.put("result", reserveReportService.reserveReportSelectList(param));
		return respData;
	}
	
	/**
	 * 예약 현황 저장
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserve/saveReserveList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveReserveList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		respData.put("result", reserveReportService.saveReserveList(param)) ;
		return respData;
	}
}
