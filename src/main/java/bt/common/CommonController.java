package bt.common;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bt.api.controller.APIController;
import bt.btframework.excel.POIExcelViewGrid;
import bt.btframework.pdf.PdfCreate;
import bt.btframework.pdf.PdfPageEvent;
import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.common.service.CommonService;

@Controller
public class CommonController {
	@Resource(name = "CommonService")
	private CommonService commonService;

	private static final Logger logger = LoggerFactory.getLogger(APIController.class);

	/********************************************
	 * @Subject : 그리드 엑셀 저장
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	@RequestMapping(value = "/common/saveGridExcel.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveGridExcel(@RequestBody BReqData reqData, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("colModel", reqData.getParamDataList("colModel"));
		param.put("gridData", reqData.getParamDataList("gridData"));
		param.put("title"   , reqData.getParamDataVal("title"));

		POIExcelViewGrid excelview = new POIExcelViewGrid();
		byte[] binary    = excelview.buildExcelXSSF(param, req, resp);
		String binaryStr = DatatypeConverter.printBase64Binary(binary);

		BRespData respData = new BRespData();
		respData.put("exceldata", binaryStr);

		return respData;
	}

	/******************************************** 
	 * @Subject : 그리드 PDF 저장
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	@RequestMapping(value = "/common/saveGridPdf.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveGridPdf(@RequestBody BReqData reqData, HttpServletRequest req, HttpServletResponse resp) {
		BRespData respData = new BRespData();

		try {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("colModel", reqData.getParamDataList("colModel"));
			param.put("gridData", reqData.getParamDataList("gridData"));
			param.put("title"   , reqData.getParamDataVal("title"));

			PdfCreate pdf    = new PdfCreate();
			PdfPageEvent pdfEvent = new PdfPageEvent(param, req);
			byte[] binary    = pdf.setPDF(req, resp, pdfEvent);
			String binaryStr = DatatypeConverter.printBase64Binary(binary);

			respData.put("pdfdata", binaryStr);

		}catch(Exception e) {
			e.printStackTrace();
		}

		return respData;
	}
	/******************************************** 
	 * @Subject : 그리드 컬럼 정보 저장
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	@RequestMapping(value = "/common/saveGridInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData saveGridInfo(@RequestBody BReqData reqData) throws Exception {
		List<BMap> gridinfoList = reqData.getParamDataList("gridinfoList");

		commonService.saveGridInfo(gridinfoList);
		BRespData respData = new BRespData();

		return respData;
	}

	/******************************************** 
	 * @Subject : 그리드 컬럼 정보 초기화
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	@RequestMapping(value = "/common/delGridInfoAll.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData delGridInfoAll(@RequestBody BReqData reqData) throws Exception {
		BMap param = reqData.getParamDataMap("paramData");

		commonService.delGridInfoAll(param);
		BRespData respData = new BRespData();

		return respData;
	}

	/******************************************** 
	 * @Subject : 엑셀 업로드 팝업 호춯
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	@RequestMapping(value = "/common/ExcelUploadPopup.do")
	public String ExcelUploadPopup(ModelMap model) throws Exception{
		return "/popup/ExcelUploadPopup";
	}

	@RequestMapping(value = "/common/uploadQuotationExcel.do")
	@ResponseBody
	public BRespData uploadQuotationExcel(HttpServletRequest req) throws Exception {
		/*
		try {
			commonService.uploadQuotationExcel(req);
		} catch(Exception ex) {
			logger.debug(">>>>> uploadQuotationExcel" + ex.getMessage());
		}
		*/
		return commonService.uploadQuotationExcel(req);
	}
}
