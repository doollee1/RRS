package bt.report.controller;

import java.io.File;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gembox.spreadsheet.ExcelFile;
import com.gembox.spreadsheet.ExcelRow;
import com.gembox.spreadsheet.ExcelWorksheet;
import com.gembox.spreadsheet.RowColumn;
import com.gembox.spreadsheet.SpreadsheetInfo;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.btframework.utils.ResponseStatus;
import bt.report.service.TableReportService;

@RestController
@RequestMapping("/report")
public class TableReportController {
	private static final Logger logger = LoggerFactory.getLogger(TableReportController.class);
	
	@Resource
	private TableReportService tableReportService;
	
	@RequestMapping(value = "/customer.do")
	public ModelAndView customer() throws Exception {
		return new ModelAndView("/report/Customer");
	}
	
	@RequestMapping(value = "/physicalStock.do")
	public ModelAndView physicalStock() throws Exception {
		return new ModelAndView("/report/PhysicalStock");
	}
	
	@RequestMapping(value = "/openAr.do")
	public ModelAndView openAr() throws Exception {
		return new ModelAndView("/report/OpenAr");
	}
	
	@RequestMapping(value = "/retrieveCustomerReport.do", method = RequestMethod.POST)
	public BRespData retrieveCustomerReport(@RequestBody Map<String, Object> req) throws Exception {
		List<BMap> list = tableReportService.selectCustomerList(req);
		BRespData res = new BRespData(ResponseStatus.OK, list);
		return res;
	}

	/**
	 * 인보이스 계산서 엑셀 샘플 
	 */
	@RequestMapping(value = "/retrieveCustomerReportAll.do", method = RequestMethod.POST)
	public void retrieveCustomerReportAll(@RequestParam Map<String,Object> reqData, HttpServletRequest req, HttpServletResponse resp)  throws Exception {
		
		SpreadsheetInfo.setLicense("FREE-LIMITED-KEY");

		ServletContext servletContext = req.getSession().getServletContext();
	    String realPath = servletContext.getRealPath("/WEB-INF/template/InvoiceTemplate.xlsx");

	    ExcelFile workbook = ExcelFile.load(realPath);
	    

        int workingDays = 8;

        LocalDateTime startDate = LocalDateTime.now().plusDays(-workingDays);
        LocalDateTime endDate = LocalDateTime.now();

        ExcelWorksheet worksheet = workbook.getWorksheet(0);

        // Find cells with placeholder text and set their values.
        RowColumn rowColumnPosition;
        if ((rowColumnPosition = worksheet.getCells().findText("[Company Name]", true, true)) != null)
            worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue("ACME Corp");
        if ((rowColumnPosition = worksheet.getCells().findText("[Company Address]", true, true)) != null)
            worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue("240 Old Country Road, Springfield, IL");
        if ((rowColumnPosition = worksheet.getCells().findText("[Start Date]", true, true)) != null)
            worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue(startDate);
        if ((rowColumnPosition = worksheet.getCells().findText("[End Date]", true, true)) != null)
            worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue(endDate);

        // Copy template row.
        int row = 17;
        worksheet.getRows().insertCopy(row + 1, workingDays - 1, worksheet.getRow(row));

        // Fill inserted rows with sample data.
        Random random = new Random();
        for (int i = 0; i < workingDays; i++) {
            ExcelRow currentRow = worksheet.getRow(row + i);
            currentRow.getCell(1).setValue(startDate.plusDays(i));
            currentRow.getCell(2).setValue(random.nextInt(11) + 1);
        }

        // Calculate formulas in worksheet.
        worksheet.calculate();
        
        String folderPath = System.getProperty("user.home") + "\\My Documents";
        logger.debug("folderPath::::::::::::::" + folderPath);
        logger.debug("folderPath::::::::::::::" + folderPath);
        logger.debug("folderPath::::::::::::::" + folderPath);
        logger.debug("folderPath::::::::::::::" + folderPath);
        logger.debug("folderPath::::::::::::::" + folderPath);
 
        workbook.save(folderPath + "\\Template Use.xlsx");
	
		
//		BMap param = new BMap();
//		String colNm = reqData.get("COL_NM").toString();
//		colNm = colNm.replaceAll("%", "");
//		String colNms[] = colNm.split(",");
//		
//		param.put("CUST_CD", reqData.get("CUST_CD"));
//		param.put("CUST_NM", reqData.get("CUST_NM"));
//		param.put("SEARCH_NM1", reqData.get("SEARCH_NM1"));
//		param.put("SEARCH_NM2", reqData.get("SEARCH_NM2"));
//		param.put("SALES_ORG_CD", reqData.get("SALES_ORG_CD"));
//		param.put("DISTRB_CH", reqData.get("DISTRB_CH"));
//		param.put("DIV_CD", reqData.get("DIV_CD"));
//		param.put("GRADE", reqData.get("GRADE"));
//		param.put("SALES_GR", reqData.get("SALES_GR"));
//		param.put("CUST_GR", reqData.get("CUST_GR"));
//		param.put("LANG",  LoginInfo.getLang());
//		
//		// 엑셀 헤더
//		LinkedHashMap<String,Object> headerMap = new LinkedHashMap<String,Object>();
//		//headerMap.put("접수번호", "CCM_NO");
//		for (int i = 0 ; i < colNms.length ; i ++) {
//			String nms[] = colNms[i].split(":");
//			headerMap.put(nms[0], nms[1]);
//		}
//		//브라우저가 IE인지 확인할 플래그
//		boolean MSIE = req.getHeader("user-agent").toUpperCase().indexOf("MSIE") != -1;
//		boolean MSIE11 = req.getHeader("user-agent").toUpperCase().indexOf("RV:11.0") != -1;
//		
//		String title = "Customer List";
//		String UTF8FileName = "";
//
//		if (MSIE || MSIE11) {
//		    // 공백이 '+'로 인코딩된것을 다시 공백으로 바꿔준다.
//		    UTF8FileName = URLEncoder.encode(title, "UTF-8").replaceAll("\\+", " ");
//		} else {
//		    UTF8FileName = new String(title.getBytes("UTF-8"), "8859_1");
//		}
//		
//		tableReportService.selectCustomerListAll(UTF8FileName, headerMap, resp, param);
	}

	@RequestMapping(value = "/product.do")
	public ModelAndView product() throws Exception {
		return new ModelAndView("/report/Product");
	}
	
	@RequestMapping(value = "/retrieveProductReport.do", method = RequestMethod.POST)
	public BRespData retrieveProductReport(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();

		respData.put("result", tableReportService.selectProductList(param));
		
		return respData;
	}

	@RequestMapping(value = "/retrieveProductReportAll.do", method = RequestMethod.POST)
	public void retrieveProductReportAll(@RequestParam Map<String,Object> reqData, HttpServletRequest req, HttpServletResponse resp)  throws Exception {

		BMap param = new BMap();
		String colNm = reqData.get("COL_NM").toString();
		colNm = colNm.replaceAll("%", "");
		String colNms[] = colNm.split(",");

		param.put("MATL_CD", reqData.get("MATL_CD"));
		param.put("MATL_NM", reqData.get("MATL_NM"));
		param.put("PLANT_CD", reqData.get("PLANT_CD"));
		param.put("SALES_ORG_CD", reqData.get("SALES_ORG_CD"));
		param.put("DISTRB_CH", reqData.get("DISTRB_CH"));
		param.put("DIV_CD", reqData.get("DIV_CD"));
		param.put("LANG",  LoginInfo.getLang());

		// 엑셀 헤더
		LinkedHashMap<String,Object> headerMap = new LinkedHashMap<String,Object>();
		//headerMap.put("접수번호", "CCM_NO");
		for (int i = 0 ; i < colNms.length ; i ++) {
			String nms[] = colNms[i].split(":");
			headerMap.put(nms[0], nms[1]);
		}
		//브라우저가 IE인지 확인할 플래그
		boolean MSIE = req.getHeader("user-agent").toUpperCase().indexOf("MSIE") != -1;
		boolean MSIE11 = req.getHeader("user-agent").toUpperCase().indexOf("RV:11.0") != -1;
		
		String title = "Product List";
		String UTF8FileName = "";

		if (MSIE || MSIE11) {
		    // 공백이 '+'로 인코딩된것을 다시 공백으로 바꿔준다.
		    UTF8FileName = URLEncoder.encode(title, "UTF-8").replaceAll("\\+", " ");
		} else {
		    UTF8FileName = new String(title.getBytes("UTF-8"), "8859_1");
		}
		
		tableReportService.selectProductListAll(UTF8FileName, headerMap, resp, param);
	}
	
	@RequestMapping(value = "/bom.do")
	public ModelAndView bom() throws Exception {
		return new ModelAndView("/report/Bom");
	}

	@RequestMapping(value = "/retrieveBomReport.do", method = RequestMethod.POST)
	public BRespData retrieveBomReport(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();

		respData.put("result", tableReportService.selectBomList(param));
		
		return respData;
	}
	
	@RequestMapping(value = "/retrieveBomReportAll.do", method = RequestMethod.POST)
	public void retrieveBomReportAll(@RequestParam Map<String,Object> reqData, HttpServletRequest req, HttpServletResponse resp)  throws Exception {

		BMap param = new BMap();
		String colNm = reqData.get("COL_NM").toString();
		colNm = colNm.replaceAll("%", "");
		String colNms[] = colNm.split(",");

		param.put("MATL_CD_ST", reqData.get("MATL_CD_ST"));
		param.put("MATL_NM_ST", reqData.get("MATL_NM_ST"));
		param.put("PLANT_CD", reqData.get("PLANT_CD"));
		param.put("BOM_USAGE", reqData.get("BOM_USAGE"));
		param.put("LANG",  LoginInfo.getLang());

		// 엑셀 헤더
		LinkedHashMap<String,Object> headerMap = new LinkedHashMap<String,Object>();
		//headerMap.put("접수번호", "CCM_NO");
		for (int i = 0 ; i < colNms.length ; i ++) {
			String nms[] = colNms[i].split(":");
			headerMap.put(nms[0], nms[1]);
		}
		//브라우저가 IE인지 확인할 플래그
		boolean MSIE = req.getHeader("user-agent").toUpperCase().indexOf("MSIE") != -1;
		boolean MSIE11 = req.getHeader("user-agent").toUpperCase().indexOf("RV:11.0") != -1;
		
		String title = "Bom List";
		String UTF8FileName = "";

		if (MSIE || MSIE11) {
		    // 공백이 '+'로 인코딩된것을 다시 공백으로 바꿔준다.
		    UTF8FileName = URLEncoder.encode(title, "UTF-8").replaceAll("\\+", " ");
		} else {
		    UTF8FileName = new String(title.getBytes("UTF-8"), "8859_1");
		}
		
		tableReportService.selectBomListAll(UTF8FileName, headerMap, resp, param);
	}
	
	@RequestMapping(value = "/quotation.do")
	public ModelAndView quotation() throws Exception {
		return new ModelAndView("/report/Quotation");
	}

	@RequestMapping(value = "/retrieveQuotationReport.do", method = RequestMethod.POST)
	public BRespData retrieveQuotationReport(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();

		respData.put("result", tableReportService.selectQuotationList(param));
		
		return respData;
	}
	
	@RequestMapping(value = "/creditBlock.do")
	public ModelAndView creditBlock() throws Exception {
		return new ModelAndView("/report/CreditBlock");
	}
	
	@RequestMapping(value = "/salesOrder.do")
	public ModelAndView salesOrder() throws Exception {
		return new ModelAndView("/report/SalesOrder");
	}
	
	@RequestMapping(value = "/lead.do")
	public ModelAndView lead() throws Exception {
		return new ModelAndView("/report/Lead");
	}

	@RequestMapping(value = "/retrieveLeadReport.do", method = RequestMethod.POST)
	public BRespData retrieveLeadReport(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();

		respData.put("result", tableReportService.selectLeadList(param));
		
		return respData;
	}
	
	@RequestMapping(value = "/availableStock.do")
	public ModelAndView availableStockReport() throws Exception {
		return new ModelAndView("/report/AvailableStock");
	}
	
	@RequestMapping(value = "/price.do")
	public ModelAndView price() throws Exception {
		return new ModelAndView("/report/Price");
	}
	
	@RequestMapping(value = "/incommingPayment.do")
	public ModelAndView incommingPayment() throws Exception {
		return new ModelAndView("/report/IncommingPayment");
	}
	

	@RequestMapping(value = "/salesReport.do")
	public ModelAndView salesReport() throws Exception {
		return new ModelAndView("/report/SalesReport");
	}
	
}