package bt.common;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.common.service.QnaService;
import bt.reserve.controller.ReserveRestController;

@RestController
public class QnaRestController {
	private static final Logger logger = LoggerFactory.getLogger(QnaRestController.class);
	
	@Resource
	private QnaService qnaService;
	
	
	@RequestMapping(value="/common/qnaSelectList.do")
	public BRespData qnaSelectList(@RequestBody BReqData reqData,HttpServletRequest req)throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		respData.put("result", qnaService.qnaSelectList(param));
		return respData;
	}
	
	@RequestMapping(value="/common/QnaViewDetail.do")
	public BRespData qnaViewDetail(@RequestBody BReqData reqData,HttpServletRequest req)throws Exception{
		BMap paramData = new BMap();
		BRespData respData = new BRespData();
		paramData.put("QNA_SEQ"   , (String) reqData.get("QNA_SEQ"));
		respData.put("result", qnaService.qnaViewDetail(paramData));
		respData.put("answer", qnaService.qnaViewAnswer(paramData));
		return respData;
	}
	
	@RequestMapping(value = "/common/qnaAnswerInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData pickupManager(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BRespData respData = new BRespData();
		
		BMap paramData = new BMap();
		paramData.put("QNA_SEQ"   , reqData.get("QNA_SEQ"));
		paramData.put("CONTENT"    , (String)reqData.get("CONTENT"));

		if(!qnaService.qnaInsertAnswer(paramData)){
			respData.put("dup", "Y");
		};
		
		return respData;
	}
	
	
	

}
