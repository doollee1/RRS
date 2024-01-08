package bt.product.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.product.service.ProductService;

@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Resource(name = "ProductService")
	private ProductService productService;

	@RequestMapping(value = "/product/Product.do")
	public String product(ModelMap model) throws Exception {
		model.addAttribute("basyy", productService.selectBasYY(null));
		
		BMap param = new BMap();
		param.put("HEAD_CD", 500090);
		param.put("Season", true);
		model.addAttribute("season"  , productService.selectGetCommonCode(param));
		return "/product/Product";
	}
	
	@RequestMapping(value = "/popup/ProductDetailPopUp.do")
	public String ProductDetailPopUp(ModelMap model) throws Exception {
		model.addAttribute("basyy", productService.selectBasYY(null));

		BMap param = new BMap();
		param.put("HEAD_CD", 500090);
		param.put("Season", true);
		model.addAttribute("season"  , productService.selectGetCommonCode(param));
		
		BMap param2 = new BMap();
		param2.put("HEAD_CD", 500000);
		model.addAttribute("hdng"  , productService.selectGetCommonCode(param2));
		
//		BMap param3 = new BMap();
//		model.addAttribute("cond", productService.selectCond(param3));
		
		return "/popup/ProductDetailPopUp";
	}
	
	@RequestMapping(value = "/popup/ProductSelectCond.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData ProductSelectCond(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BMap param = new BMap();
		param.put("code", reqData.get("code"));
		
		BRespData respData = new BRespData();
		respData.put("cond", productService.selectCond(param));
		
		return respData;
	}
	
	@RequestMapping(value = "/popup/ProductPeriodPopUp.do")
	public String ProductPeriodPopUp(ModelMap model) throws Exception {
		model.addAttribute("basyy", productService.selectBasYY(null));
		return "/popup/ProductPeriodPopUp";
	}
	
	@RequestMapping(value = "/popup/ProductPeriodDetailPopUp.do")
	public String ProductPeriodDetailPopUp(ModelMap model) throws Exception {
		BMap param = new BMap();
		param.put("HEAD_CD", 500090);
		param.put("Season", true);
		model.addAttribute("season"  , productService.selectGetCommonCode(param));
		return "/popup/ProductPeriodDetailPopUp";
	}
	
	@RequestMapping(value = "/popup/ProductCopyPopUp.do")
	public String ProductCopyPopUp(ModelMap model) throws Exception {
		model.addAttribute("basyy", productService.selectBasYY(null));
		return "/popup/ProductCopyPopUp";
	}
	
	@RequestMapping(value = "/popup/ProductSelectPeriodPopUp.do")
	public String ProductSelectPeriodPopUp(ModelMap model) throws Exception {
		return "/popup/ProductSelectPeriodPopUp";
	}
	
	/**
	 * Product Info 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/product/selectProductInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectProductInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = new BMap();
		param.put("SSN_GBN", reqData.get("SSN_GBN"));
		param.put("BAS_YY", reqData.get("BAS_YY"));
		
		BRespData respData = new BRespData();
		
		respData.put("result", productService.selectProductInfo(param));
		return respData;
	}
	
	/**
	 * Product Info 저장
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/product/saveProductInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveProductInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();

		if(!productService.saveProductInfo(param)){
			respData.put("SAVE", "N");
		}
		
		return respData;
	}
	
	/**
	 * Product Info 삭제
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/product/deleteProductInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData deleteProductInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		productService.deleteProductInfo(param);
		
		return respData;
	}	
	
	
	/**
	 * Period Info 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/product/selectPeriodInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectPeriodInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = new BMap();
		param.put("BAS_YY", reqData.get("BAS_YY"));
		
		BRespData respData = new BRespData();
		
		respData.put("result", productService.selectPeriodInfo(param));
		return respData;
	}
	
	/**
	 * Period Info 저장
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/product/savePeriodInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData savePeriodInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();

		if(!productService.savePeriodInfo(param)){
			respData.put("SAVE", "N");
		}
		
		return respData;
	}
	
	/**
	 * Period Info 삭제
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/product/deletePeriodInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData deletePeriodInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		productService.deletePeriodInfo(param);
		
		return respData;
	}	
	
	/**
	 * Period Copy 등록
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/product/saveCopyInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveCopyInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		if(!productService.saveCopyInfo(param)){
			respData.put("SAVE", "N");
		}
		return respData;
	}
	
	/**
	 * Period Info PopUp 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/product/selectPeriodPopUp.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectPeriodPopUp(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = new BMap();
		param.put("SSN_GBN", reqData.get("SSN_GBN"));
		param.put("BAS_YY", reqData.get("BAS_YY"));
		
		BRespData respData = new BRespData();
		
		respData.put("result", productService.selectPeriodPopUp(param));
		return respData;
	}
}
