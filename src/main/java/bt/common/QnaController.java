package bt.common;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnaController {

	@RequestMapping(value="/common/QnaList.do")
	public String QnaList(ModelMap model) throws Exception{
		return "/common/QnaList";
	}
	
	@RequestMapping(value="/common/QnaView.do")
	public String QnaView(ModelMap model) throws Exception{
		return "/common/QnaView";
	}
	
	
}
