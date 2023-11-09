package bt.common;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.common.service.MailSendService;

@Controller
public class MailController {
	@Resource(name = "MailSendService")
	private MailSendService mailSendService;
	
	/**
	 * Send mail test
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/sendMail.do")
	public void SendMail(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		
		mailSendService.sendMail(param);
	}
}
