package bt.external.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import bt.api.service.APIService;

@Controller
public class ExternalController {

	@Resource
	private APIService apiService;

	@RequestMapping(value = "/external/External_1.do")
	public String External_1(ModelMap model) throws Exception {
		return "/external/External_1";
	}

	@RequestMapping(value = "/external/External_2.do")
	public String External_2(ModelMap model) throws Exception {
		return "/external/External_2";
	}

	@RequestMapping(value = "/external/External_3.do")
	public String External_3(ModelMap model) throws Exception {
		return "/external/External_3";
	}
	
	@RequestMapping(value = "/external/qshopopen.do")
	public String showQShop(ModelMap model) throws Exception {
		return "/external/qshopopen";
	}
	
	@RequestMapping(value = "/external/External_4.do")
	public ModelAndView External_4(ModelMap model) throws Exception {

		ModelAndView view = new ModelAndView("/external/orders");

		// add token info
		view.addObject("token", "12345");

		// add external data
		Map<String, Object> externalMap = apiService.selectExternalInfo(null);

		Gson gson = new Gson();
		String json = gson.toJson(externalMap);
		view.addObject("externalMap", json);

		return view;
	}
}
