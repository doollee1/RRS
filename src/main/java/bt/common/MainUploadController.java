package bt.common;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bt.btframework.utils.BRespData;
import bt.common.service.MainUploadService;

@Controller
public class MainUploadController {

	@Resource(name = "MainUploadService")
	private MainUploadService mainUploadService;

	@RequestMapping(value = "/common/MainExcelUpload.do")
	public String MainExcelUpload(ModelMap model) throws Exception{
		return "/main/MainExcelUpload";
	}
	
	@RequestMapping(value = "/common/uploadMainExcel.do")
	@ResponseBody
	public BRespData uploadMainExcel(HttpServletRequest req) throws Exception {
		System.err.println("before upload  ");
		return mainUploadService.uploadMainExcel(req);
	}
}
