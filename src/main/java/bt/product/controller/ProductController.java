package bt.product.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.common.service.CommonService;
import bt.product.service.ProductService;

@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Resource(name = "ProductService")
	private ProductService productService;
	
	@Resource(name = "CommonService")
	private CommonService commonService;
	
	
	@RequestMapping(value = "/product/Product.do")
	public String product() throws Exception {
		return "/product/Product";
	}
	
	@RequestMapping(value = "/popup/productPopUp.do")
	public String productPopUp() throws Exception {
		return "/popup/ProductPopUp";
	}

	@RequestMapping(value = "/popup/itemPopUp.do")
	public String itemPopUp() throws Exception {
		return "/popup/ItemPopUp";
	}
	
	/**
	 * Product 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/product/selectProductInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectNoticeList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		BMap resultProductInfo = productService.selectProductInfo(param);
		
		if(null == resultProductInfo || resultProductInfo.isEmpty()){
			respData.put("resultProductInfo", null);
		}else{
			respData.put("resultProductInfo", resultProductInfo);
		}
		
		
		return respData;
	}

	/**
	 * Product Desc List 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/product/selectDescList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectDescList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", productService.selectDescList(param));
		
		return respData;
	}
	
	/**
	 * Product Unit of Measure List 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/product/selectUOMList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectUOMList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", productService.selectUOMList(param));
		
		return respData;
	}
	
	/**
	 * Product Basic Data Text List 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/product/selectBasicList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectBasicList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", productService.selectBasicList(param));
		
		return respData;
	}
	
	/**
	 * Product PopUp List 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/product/selectMatlPopList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectMatlPopList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		
		BRespData respData = new BRespData();
		
		respData.put("result", productService.selectMatlPopList(param));
		
		return respData;
	}
	
	/**
	 * Product Code Check
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/product/chkMatlCd.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData chkMatlCd(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		String tempVal = productService.chkMatlCd(param);
		
		if(null != tempVal && !"".equals(tempVal)){
			if(1 < Integer.parseInt(tempVal)){
				respData.put("isOk", "N");
			}else{
				respData.put("isOk", "Y");
			}
		}else{
			respData.put("isOk", "N");
		}
		return respData;
	}
	
	/**
	 * Product Data 조회.
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/product/getMatlData.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData getMatlData(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		
		BRespData respData = new BRespData();
		
		respData.put("result", productService.getMatlData(param));
		
		return respData;
	}
}
