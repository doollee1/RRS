package bt.common;

import java.util.List;

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
import bt.common.service.FlightService;


@Controller
public class FlightController {	
	@Resource(name = "FlightService")
	private FlightService flightService;
	
	@RequestMapping(value = "/common/FlightManager.do")
	public String CommonCodeManager(ModelMap model) throws Exception{
		
		return "/common/FlightManager";
	}
	
	/**
	 * 항공편관리 리스트 호출
	 * @param reqData
	 * @param request
	 * @return respData
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/selectFlightInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectFlightInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = new BMap();
		param.put("TIME", reqData.get("TIME"));
		param.put("NAME", reqData.get("NAME"));
		
		BRespData respData = new BRespData();
		
		respData.put("result", flightService.selectFlightInfo(param));
		
		return respData;
	}
	/**
	 * 항공편관리 추가 및 수정
	 * @param reqData
	 * @param request
	 * @return respData
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/saveFlightInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveFlightInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BRespData respData = new BRespData();
		
		List<BMap> insertParam = reqData.getParamDataList("IData");
		if(insertParam.size() == 0) {
			List<BMap> updateParam = reqData.getParamDataList("UData");
			if(flightService.updateFlightInfo(updateParam)) {
				respData.put("success", true);
			}
			else {
				respData.put("success", false);
			}
		}else {
			if( flightService.insertFlightInfo(insertParam) ) 
			{
				List<BMap> updateParam = reqData.getParamDataList("UData");
				if(flightService.updateFlightInfo(updateParam)) {
					respData.put("success", true);
				}
				else {
					respData.put("success", false);
				}
			}
			else {
				respData.put("success", false);
			}
		}
		return respData;
	}
	/**
	 * 항공편관리 삭제
	 * @param reqData
	 * @param request
	 * @return respData
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/deleteFlightInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData deleteFlightInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BRespData respData = new BRespData();
		List<BMap> paramList = reqData.getParamDataList("gridData");
		
		if(flightService.deleteFlightInfo(paramList)) {
			respData.put("success", true);
		}
		else {
			respData.put("success", false);
		}
		
		return respData;
	}
}
