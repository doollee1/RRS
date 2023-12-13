package bt.report.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.net.URLEncoder;
import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gembox.spreadsheet.CellStyle;
import com.gembox.spreadsheet.ExcelFile;
import com.gembox.spreadsheet.ExcelRow;
import com.gembox.spreadsheet.ExcelWorksheet;
import com.gembox.spreadsheet.RowColumn;
import com.gembox.spreadsheet.SaveOptions;
import com.gembox.spreadsheet.SpreadsheetInfo;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.btframework.utils.ResponseStatus;
import bt.common.service.MailSendService;
import bt.report.service.TableReportService;
import bt.reserve.service.ReserveService;

@RestController
@RequestMapping("/report")
public class TableReportController {
	private static final Logger logger = LoggerFactory.getLogger(TableReportController.class);
	
	@Resource
	private TableReportService tableReportService;
	
	@Resource
    private ReserveService reserveService;
	
	@Resource
    private MailSendService mailSendService;
	
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
		
		/* 서비스 부분 start */
		
		ServletContext servletContext = req.getSession().getServletContext();
	    String realPath = servletContext.getRealPath("/WEB-INF/template/일반_INVOICE.xlsx");

	    ExcelFile workbook = ExcelFile.load(realPath);
	    
	    BMap param = new BMap();
        param.put("HEAD_CD"   , 500200);
        param.put("REF_CHR1"  ,  "H");
        param.put("REF_CHR2"  ,  reqData.get("MEM_GBN"));
       
        List<BMap> HList = reserveService.selectGetCommonCode(param);
        
        param.put("HEAD_CD"   , 500200);
        param.put("REF_CHR1"  ,  "D");
        param.put("REF_CHR2"  ,  reqData.get("MEM_GBN"));
        
        List<BMap> DList = reserveService.selectGetCommonCode(param);
        
        param.put("HEAD_CD"   , 500200);
        param.put("REF_CHR1"  ,  "T");
        param.put("REF_CHR2"  ,  reqData.get("MEM_GBN"));
        
        List<BMap> TList = reserveService.selectGetCommonCode(param);
      
        //LocalDateTime startDate = LocalDateTime.now().plusDays(-workingDays);

        LocalDateTime today = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd.");
        
        ExcelWorksheet worksheet = workbook.getWorksheet(0);

        // Find cells with placeholder text and set their values.
        RowColumn rowColumnPosition;
        //Date
        if ((rowColumnPosition = worksheet.getCells().findText("[DATE]", true, true)) != null)
            worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue(today.format(formatter));
        
        for(int i = 0; i < HList.size(); i++)
        {
            if(HList.get(i).get("CODE").equals("FROM"))
            {
                //From
                if ((rowColumnPosition = worksheet.getCells().findText("[FROM]", true, true)) != null)
                    worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue(HList.get(i).get("CODE_NM"));
            } 
            else if(HList.get(i).get("CODE").equals("PROD_NM"))
            {     
                //상품명
                if ((rowColumnPosition = worksheet.getCells().findText("[PROD_NM]", true, true)) != null)
                    worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue(HList.get(i).get("CODE_NM"));
            }
            else if(HList.get(i).get("CODE").equals("HOTEL"))
            {   
              //호텔
                if ((rowColumnPosition = worksheet.getCells().findText("[HOTEL]", true, true)) != null)
                    worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue(HList.get(i).get("CODE_NM"));
                
            }
            else if(HList.get(i).get("CODE").equals("GOLF_CLUB"))
            {   
                //골프장
                if ((rowColumnPosition = worksheet.getCells().findText("[GOLF_CLUB]", true, true)) != null)
                    worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue(HList.get(i).get("CODE_NM"));
            
            }
        }
        
        BMap paramData = new BMap();
        paramData.put("SEQ"   , (String) reqData.get("SEQ"));
        paramData.put("REQ_DT", (String) reqData.get("REQ_DT"));
        BMap resultDeptDetail = reserveService.reserveSelectDetail(paramData);
        
        //To.
        if ((rowColumnPosition = worksheet.getCells().findText("[NAME]", true, true)) != null)
            worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue(resultDeptDetail.get("REQ_HAN_NM")+" 님");
        
        //여행일
        if ((rowColumnPosition = worksheet.getCells().findText("[BETWEEN]", true, true)) != null)
        {   String startDt = (String) resultDeptDetail.get("CHK_IN_DT");
            String endDt = (String) resultDeptDetail.get("CHK_OUT_DT");
            worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue(startDt.substring(0, 4) +"."+startDt.substring(4, 6) + "."+startDt.substring(6, 8) + "~" + endDt.substring(0, 4) +"."+endDt.substring(4, 6) + "."+endDt.substring(6, 8));
        }
        //인원
        if ((rowColumnPosition = worksheet.getCells().findText("[TOT_PERSON]", true, true)) != null)
            worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue(resultDeptDetail.get("TOT_PERSON") +"인");
        //비행기 출발
        if ((rowColumnPosition = worksheet.getCells().findText("[FLIGHT_IN]", true, true)) != null)
            worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue(resultDeptDetail.get("FLIGHT_IN"));
        //비행기 도착
        if ((rowColumnPosition = worksheet.getCells().findText("[FLIGHT_OUT]", true, true)) != null)
            worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue(resultDeptDetail.get("FLIGHT_OUT"));
        
        paramData.put("LOGIN_USER", LoginInfo.getUserId());
        
        List<BMap> invoiceList = reserveService.invoiceSelectList(paramData);
        // Copy template row.
        int row = 14;
        
        worksheet.getRows().insertCopy(row+1, invoiceList.size()-1, worksheet.getRow(row));
        NumberFormat numFormatter = NumberFormat.getNumberInstance(); 
        
        //인보이스 내역
        for(int i = 0; i < invoiceList.size(); i++)
        {
            ExcelRow currentRow = worksheet.getRow(row);

            currentRow.getCell(2).setValue(i+1+". "+ invoiceList.get(i).get("ITEM_NM"));
            currentRow.getCell(3).setValue(invoiceList.get(i).get("AMT_SIGN"));
            currentRow.getCell(4).setValue(numFormatter.format(invoiceList.get(i).get("PER_AMT")));
            currentRow.getCell(6).setValue(invoiceList.get(i).get("USE_DAY").toString() + invoiceList.get(i).get("STR_DAY").toString());
            currentRow.getCell(8).setValue(invoiceList.get(i).get("USE_DAY").toString() + invoiceList.get(i).get("STR_UNIT").toString());
            currentRow.getCell(10).setValue(numFormatter.format(invoiceList.get(i).get("TOT_AMT")));
            
            row++;
        }

        //worksheet.calculate();
        int row2 = row+4 ; //5칸 = 합계 + 하나은행
        
        worksheet.getRows().insertCopy(row2+1, DList.size()+1, worksheet.getRow(row2));
        
       // 금액 및 잔액 안내사항
        for(int i = 0; i < DList.size(); i++)
        {  
            ExcelRow currentRow = worksheet.getRow(row2);
            
            if(DList.get(i).get("CODE").equals("D00")) // 입금계좌
            {
                currentRow = worksheet.getRow(row2);
                currentRow.getCell(1).setValue(DList.get(i).get("CODE_NM"));
            } 
            else 
            {
                String codeNm = DList.get(i).get("CODE_NM").toString();
                
                if(DList.get(i).get("CODE").equals("D04"))
                {
                    codeNm = codeNm.replace("[0]", "3,000,000" ); //총액
                    codeNm = codeNm.replace("[1]", "500,000" );  //예약금
                }
                else if(DList.get(i).get("CODE").equals("D05"))
                {
                    codeNm = codeNm.replace("[0]", "3,000,000" ); //잔금
                }           
                currentRow.getCell(1).setValue(codeNm);
            }
            row2++;
        }
        int row3 = row2;
        
        worksheet.getRows().insertCopy(row3+1, TList.size()+1, worksheet.getRow(row3));
        
        //특이사항
        for(int i = 0; i < TList.size(); i++)
        { 
            ExcelRow currentRow = worksheet.getRow(row3 + i);
            currentRow.getCell(1).setValue(TList.get(i).get("CODE_NM"));
        }
        worksheet.calculate();
        
        String wkGbn = (String) reqData.get("WK_GBN"); 
        
        if(wkGbn.equals("R"))
        {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            workbook.save(out, SaveOptions.getXlsxDefault());
            
            byte[] byteArray = out.toByteArray();
            
            /* 서비스 부분 end */
            
            
            //파일유형설정
    		resp.setContentType("application/octet-stream"); 
    	      //파일길이설정
    		resp.setContentLength(byteArray.length);
    	      //데이터형식/성향설정 (attachment: 첨부파일)
    		resp.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode("Invoice.xlsx","UTF-8")+"\";");
    	      //내용물 인코딩방식설정
    		resp.setHeader("Content-Transfer-Encoding", "binary");
    	      //버퍼의 출력스트림을 출력
    		resp.getOutputStream().write(byteArray);
    	      
    	      //버퍼에 남아있는 출력스트림을 출력
    		resp.getOutputStream().flush();
    	      //출력스트림을 닫는다
    		resp.getOutputStream().close();
        }
        else
        {
            System.out.println("================1");
            workbook.save("C:/excelTest/abc.xlsx");
            System.out.println("================2");
            BMap sendEmailparam = new BMap();
            sendEmailparam.put("FILE_FULL_NM"   , "C:/excelTest/abc.xlsx");
            sendEmailparam.put("FILE_NM"     , "abc.xlsx");
            sendEmailparam.put("TO_EMAIL"   , "noha85@naver.com");
            System.out.println("================3");
            mailSendService.sendMail(sendEmailparam);
            System.out.println("================4");
        }
      
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