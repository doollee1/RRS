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

@Controller
public class ReserveReportController {

	@Resource	
	private ReserveReportService reserveReportService;
	
	/**
	 * 예약 현황 화면 호출
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reserve/reserveReport.do")
	public String reserveReport(ModelMap model,HttpServletRequest request) throws Exception {
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
	public BRespData reserveReportSelectList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		System.out.println("reserveReportSelectList controller");
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		respData.put("result", reserveReportService.reserveReportSelectList(param));
		System.out.println("respData: " + respData);
		return respData;
	}
	
}
