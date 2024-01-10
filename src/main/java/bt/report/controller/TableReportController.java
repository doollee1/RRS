package bt.report.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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


import com.gembox.spreadsheet.ColorName;
import com.gembox.spreadsheet.ExcelFile;


import com.gembox.spreadsheet.ExcelRow;
import com.gembox.spreadsheet.ExcelWorksheet;
import com.gembox.spreadsheet.RowColumn;
import com.gembox.spreadsheet.SaveOptions;
import com.gembox.spreadsheet.SpreadsheetColor;
import com.gembox.spreadsheet.SpreadsheetInfo;

import bt.btframework.common.vo.CodeVO;
import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.btframework.utils.ResponseStatus;
import bt.common.service.CommonCodeService;
import bt.common.service.CommonService;
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
    private CommonCodeService codeService;
	
	@Resource
    private CommonService commonService;
	
	
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
	 * 인보이스 계산서 엑셀 미리보기
	 */
	@RequestMapping(value = "/retrieveCustomerReportAll.do", method = RequestMethod.POST)
	public void retrieveCustomerReportAll(@RequestParam Map<String,Object> reqData, HttpServletRequest req, HttpServletResponse resp)  throws Exception {
	    
	   SpreadsheetInfo.setLicense("FREE-LIMITED-KEY");

		/* 서비스 부분 start */
		
		ServletContext servletContext = req.getSession().getServletContext();
	    String realPath = servletContext.getRealPath("/WEB-INF/template");

	    ExcelFile workbook = ExcelFile.load(realPath+"/일반_INVOICE.xlsx");
	  
	    BMap param = new BMap();
        param.put("REF_CHR1"  ,  "H");
       
        List<CodeVO> HList = commonService.selectCommonCode("500200", param);
        
        param.put("REF_CHR1"  ,  "D");
        param.put("REF_CHR2"  ,  reqData.get("MEM_GBN"));
        
        List<CodeVO> DList = commonService.selectCommonCode("500200", param);
        
        param.put("REF_CHR1"  ,  "T");
        param.put("REF_CHR2"  ,  reqData.get("MEM_GBN"));
        
        List<CodeVO> TList = commonService.selectCommonCode("500200", param);
      
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
            if(HList.get(i).getCode().equals("FROM"))
            {
                //From
                if ((rowColumnPosition = worksheet.getCells().findText("[FROM]", true, true)) != null)
                    worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue(HList.get(i).getValue());
            } 
            else if(HList.get(i).getCode().equals("PROD_NM"))
            {     
                //상품명
                if ((rowColumnPosition = worksheet.getCells().findText("[PROD_NM]", true, true)) != null)
                    worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue(HList.get(i).getValue());
            }
            else if(HList.get(i).getCode().equals("HOTEL"))
            {   
              //호텔
                if ((rowColumnPosition = worksheet.getCells().findText("[HOTEL]", true, true)) != null)
                    worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue(HList.get(i).getValue());
                
            }
            else if(HList.get(i).getCode().equals("GOLF_CLUB"))
            {   
                //골프장
                if ((rowColumnPosition = worksheet.getCells().findText("[GOLF_CLUB]", true, true)) != null)
                    worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue(HList.get(i).getValue());
            
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
            currentRow.getCell(6).setValue(invoiceList.get(i).get("USE_DAY").toString());
            currentRow.getCell(8).setValue(invoiceList.get(i).get("USE_NUM").toString());
            currentRow.getCell(10).setValue(numFormatter.format(invoiceList.get(i).get("TOT_AMT")));
            
            row++;
        }

        //worksheet.calculate();
        int row2 = row+4 ; //5칸 = 합계 + 하나은행
        worksheet.getRow(row).getCell(4).setValue(numFormatter.format(resultDeptDetail.get("TOT_AMT")));
        worksheet.getRows().insertCopy(row2+1, DList.size()+1, worksheet.getRow(row2));
        
       // 금액 및 잔액 안내사항
        for(int i = 0; i < DList.size(); i++)
        {  
            ExcelRow currentRow = worksheet.getRow(row2);
          
            if(DList.get(i).getCode().equals("D00")) // 입금계좌
            {
                currentRow = worksheet.getRow(row2-1);
                currentRow.getCell(1).setValue(DList.get(i).getValue());
            } 
            else 
            {
                String codeNm = DList.get(i).getValue();

                if(DList.get(i).getCode().equals("D04") || DList.get(i).getCode().equals("D32"))
                {
                    codeNm = codeNm.replace("[0]", numFormatter.format(resultDeptDetail.get("TOT_AMT"))); //총액
                    codeNm = codeNm.replace("[1]", numFormatter.format(resultDeptDetail.get("DEP_AMT")));  //예약금
                }
                else if(DList.get(i).getCode().equals("D05") || DList.get(i).getCode().equals("D33"))
                {
                    codeNm = codeNm.replace("[0]", numFormatter.format(resultDeptDetail.get("BAL_AMT")) ); //잔금
                }           
                currentRow.getCell(1).setValue(codeNm);
            }
            
            if(DList.get(i).getRefChr3().length() > 0)
            {
                if(DList.get(i).getRefChr3().equals("skyblue"))
                {
                    currentRow.getCell(1).zzeInternal().setColor(SpreadsheetColor.fromName(ColorName.LIGHT_BLUE));
                }
                else  if(DList.get(i).getRefChr3().equals("yellow"))
                {
                    currentRow.getCell(1).zzeInternal().setColor(SpreadsheetColor.fromName(ColorName.YELLOW));
                }
                else  if(DList.get(i).getRefChr3().equals("red"))
                {
                    currentRow.getCell(1).zzeInternal().setColor(SpreadsheetColor.fromName(ColorName.RED));
                }
            }

            if(DList.get(i).getRefChr4().length() > 0)
            {
                if(TList.get(i).getRefChr3().equals("skyblue"))
                {
                    currentRow.getCell(1).getStyle().getFillPattern().setSolid(SpreadsheetColor.fromName(ColorName.LIGHT_BLUE)); //배경색
                }
                else if(DList.get(i).getRefChr4().equals("yellow"))
                {
                    currentRow.getCell(1).getStyle().getFillPattern().setSolid(SpreadsheetColor.fromName(ColorName.YELLOW)); //배경색
                }
                else  if(DList.get(i).getRefChr4().equals("red"))
                {
                    currentRow.getCell(1).getStyle().getFillPattern().setSolid(SpreadsheetColor.fromName(ColorName.RED)); //배경색
                }
               
            }
            row2++;
        }
        
        worksheet.getRow(row2).getCell(1).setValue("");
        
        int row3 = row2;
        
        worksheet.getRows().insertCopy(row3+1, TList.size()+2, worksheet.getRow(row3));
       
        //특이사항
        for(int i = 0; i < TList.size(); i++)
        { 
            ExcelRow currentRow = worksheet.getRow((row3+1) + i);
           
            currentRow.getCell(1).setValue(TList.get(i).getValue());
            
            if(TList.get(i).getRefChr3().length() > 0)
            {
                if(TList.get(i).getRefChr3().equals("skyblue"))
                {
                    currentRow.getCell(1).zzeInternal().setColor(SpreadsheetColor.fromName(ColorName.LIGHT_BLUE));//폰트
                }
                else  if(TList.get(i).getRefChr3().equals("yellow"))
                {
                    currentRow.getCell(1).zzeInternal().setColor(SpreadsheetColor.fromName(ColorName.YELLOW));//폰트
                }
                else  if(TList.get(i).getRefChr3().equals("red"))
                {
                    currentRow.getCell(1).zzeInternal().setColor(SpreadsheetColor.fromName(ColorName.RED));//폰트
                }
            }

            if(TList.get(i).getRefChr4().length() > 0)
            {
                if(TList.get(i).getRefChr3().equals("skyblue"))
                {
                    currentRow.getCell(1).getStyle().getFillPattern().setSolid(SpreadsheetColor.fromName(ColorName.LIGHT_BLUE)); //배경색
                }
                else if(TList.get(i).getRefChr4().equals("yellow"))
                {
                     currentRow.getCell(1).getStyle().getFillPattern().setSolid(SpreadsheetColor.fromName(ColorName.YELLOW)); //배경색
                }
                else  if(TList.get(i).getRefChr4().equals("red"))
                {
                    currentRow.getCell(1).getStyle().getFillPattern().setSolid(SpreadsheetColor.fromName(ColorName.RED)); //배경색
                }
            }
            
        }
        worksheet.calculate();
        
        String wkGbn = (String) reqData.get("WK_GBN"); 
       
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        workbook.save(out, SaveOptions.getXlsxDefault());
        
        byte[] byteArray = out.toByteArray();
        
        String filenm = resultDeptDetail.get("REQ_HAN_NM")+"_"+resultDeptDetail.get("REQ_DT")+".xlsx";
       
    	if(wkGbn.equals(""))
        {
    	    BMap paramPath = new BMap();
    	    paramPath.put("REF_CHR1"        ,  "PATH");
    	    
            List<CodeVO> pathList = commonService.selectCommonCode("500200", paramPath);
            
            String path = pathList.get(0).getValue();
            
    	    File f = new File(path);
    	    
    	    if(!f.exists())
    	    {
    	        f.mkdir();
    	    }
    	    path = path.replace("\\\\","/");
            System.out.println("================1:"+path);
            workbook.save(path + "/" + filenm);
        } else {
        	 /* 서비스 부분 end */
            //파일유형설정
    		resp.setContentType("application/octet-stream"); 
    	      //파일길이설정
    		resp.setContentLength(byteArray.length);
          
    	      //데이터형식/성향설정 (attachment: 첨부파일)
    		resp.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(filenm,"UTF-8")+"\";");
    	      //내용물 인코딩방식설정
    		resp.setHeader("Content-Transfer-Encoding", "binary");
    	      //버퍼의 출력스트림을 출력
    		resp.getOutputStream().write(byteArray);
    	      
    	      //버퍼에 남아있는 출력스트림을 출력
    		resp.getOutputStream().flush();
    	      //출력스트림을 닫는다
    		resp.getOutputStream().close();
        }
	}
	
	@RequestMapping(value = "/retrieveCustomerReportSend.do", method = RequestMethod.POST)
    public BRespData emailSend(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
	    BMap param = new BMap();
        param.put("SEQ"        , (String) reqData.get("SEQ"));
        param.put("REQ_DT"     , (String) reqData.get("REQ_DT"));
        param.put("LOGIN_USER" , LoginInfo.getUserId());
        param.put("DEP_AMT"    , reqData.get("DEP_AMT"));
        param.put("EXP_DT"     , (String) reqData.get("EXP_DT"));
       
        SpreadsheetInfo.setLicense("FREE-LIMITED-KEY");

		/* 서비스 부분 start */
		
		ServletContext servletContext = req.getSession().getServletContext();
	    String realPath = servletContext.getRealPath("/WEB-INF/template");

	    ExcelFile workbook = ExcelFile.load(realPath+"/일반_INVOICE.xlsx");
	  
	    param.put("REF_CHR1"  ,  "H");
       
        List<CodeVO> HList = commonService.selectCommonCode("500200", param);
        
        param.put("REF_CHR1"  ,  "D");
        param.put("REF_CHR2"  ,  reqData.get("MEM_GBN"));
        
        List<CodeVO> DList = commonService.selectCommonCode("500200", param);
        
        param.put("REF_CHR1"  ,  "T");
        param.put("REF_CHR2"  ,  reqData.get("MEM_GBN"));
        
        List<CodeVO> TList = commonService.selectCommonCode("500200", param);
      
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
            if(HList.get(i).getCode().equals("FROM"))
            {
                //From
                if ((rowColumnPosition = worksheet.getCells().findText("[FROM]", true, true)) != null)
                    worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue(HList.get(i).getValue());
            } 
            else if(HList.get(i).getCode().equals("PROD_NM"))
            {     
                //상품명
                if ((rowColumnPosition = worksheet.getCells().findText("[PROD_NM]", true, true)) != null)
                    worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue(HList.get(i).getValue());
            }
            else if(HList.get(i).getCode().equals("HOTEL"))
            {   
              //호텔
                if ((rowColumnPosition = worksheet.getCells().findText("[HOTEL]", true, true)) != null)
                    worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue(HList.get(i).getValue());
                
            }
            else if(HList.get(i).getCode().equals("GOLF_CLUB"))
            {   
                //골프장
                if ((rowColumnPosition = worksheet.getCells().findText("[GOLF_CLUB]", true, true)) != null)
                    worksheet.getCell(rowColumnPosition.getRow(), rowColumnPosition.getColumn()).setValue(HList.get(i).getValue());
            
            }
        }
        
        BMap paramData = new BMap();
        paramData.put("SEQ"   , (String) param.get("SEQ"));
        paramData.put("REQ_DT", (String) param.get("REQ_DT"));
 
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
            currentRow.getCell(6).setValue(invoiceList.get(i).get("USE_DAY").toString());
            currentRow.getCell(8).setValue(invoiceList.get(i).get("USE_NUM").toString());
            currentRow.getCell(10).setValue(numFormatter.format(invoiceList.get(i).get("TOT_AMT")));
            
            row++;
        }

        //worksheet.calculate();
        int row2 = row+4 ; //5칸 = 합계 + 하나은행
        worksheet.getRow(row).getCell(4).setValue(numFormatter.format(resultDeptDetail.get("TOT_AMT")));
        worksheet.getRows().insertCopy(row2+1, DList.size()+1, worksheet.getRow(row2));
        
       // 금액 및 잔액 안내사항
        for(int i = 0; i < DList.size(); i++)
        {  
            ExcelRow currentRow = worksheet.getRow(row2);
          
            if(DList.get(i).getCode().equals("D00")) // 입금계좌
            {
                currentRow = worksheet.getRow(row2-1);
                currentRow.getCell(1).setValue(DList.get(i).getValue());
            } 
            else 
            {
                String codeNm = DList.get(i).getValue();

                if(DList.get(i).getCode().equals("D04") || DList.get(i).getCode().equals("D32"))
                {
                    codeNm = codeNm.replace("[0]", numFormatter.format(resultDeptDetail.get("TOT_AMT"))); //총액
                    codeNm = codeNm.replace("[1]", numFormatter.format(resultDeptDetail.get("DEP_AMT")));  //예약금
                }
                else if(DList.get(i).getCode().equals("D05") || DList.get(i).getCode().equals("D33"))
                {
                    codeNm = codeNm.replace("[0]", numFormatter.format(resultDeptDetail.get("BAL_AMT")) ); //잔금
                }           
                currentRow.getCell(1).setValue(codeNm);
            }
            
            if(DList.get(i).getRefChr3().length() > 0)
            {
                if(DList.get(i).getRefChr3().equals("skyblue"))
                {
                    currentRow.getCell(1).zzeInternal().setColor(SpreadsheetColor.fromName(ColorName.LIGHT_BLUE));
                }
                else  if(DList.get(i).getRefChr3().equals("yellow"))
                {
                    currentRow.getCell(1).zzeInternal().setColor(SpreadsheetColor.fromName(ColorName.YELLOW));
                }
                else  if(DList.get(i).getRefChr3().equals("red"))
                {
                    currentRow.getCell(1).zzeInternal().setColor(SpreadsheetColor.fromName(ColorName.RED));
                }
            }

            if(DList.get(i).getRefChr4().length() > 0)
            {
                if(TList.get(i).getRefChr3().equals("skyblue"))
                {
                    currentRow.getCell(1).getStyle().getFillPattern().setSolid(SpreadsheetColor.fromName(ColorName.LIGHT_BLUE)); //배경색
                }
                else if(DList.get(i).getRefChr4().equals("yellow"))
                {
                    currentRow.getCell(1).getStyle().getFillPattern().setSolid(SpreadsheetColor.fromName(ColorName.YELLOW)); //배경색
                }
                else  if(DList.get(i).getRefChr4().equals("red"))
                {
                    currentRow.getCell(1).getStyle().getFillPattern().setSolid(SpreadsheetColor.fromName(ColorName.RED)); //배경색
                }
               
            }
            row2++;
        }
        
        worksheet.getRow(row2).getCell(1).setValue("");
        
        int row3 = row2;
        
        worksheet.getRows().insertCopy(row3+1, TList.size()+2, worksheet.getRow(row3));
       
        //특이사항
        for(int i = 0; i < TList.size(); i++)
        { 
            ExcelRow currentRow = worksheet.getRow((row3+1) + i);
           
            currentRow.getCell(1).setValue(TList.get(i).getValue());
            
            if(TList.get(i).getRefChr3().length() > 0)
            {
                if(TList.get(i).getRefChr3().equals("skyblue"))
                {
                    currentRow.getCell(1).zzeInternal().setColor(SpreadsheetColor.fromName(ColorName.LIGHT_BLUE));//폰트
                }
                else  if(TList.get(i).getRefChr3().equals("yellow"))
                {
                    currentRow.getCell(1).zzeInternal().setColor(SpreadsheetColor.fromName(ColorName.YELLOW));//폰트
                }
                else  if(TList.get(i).getRefChr3().equals("red"))
                {
                    currentRow.getCell(1).zzeInternal().setColor(SpreadsheetColor.fromName(ColorName.RED));//폰트
                }
            }

            if(TList.get(i).getRefChr4().length() > 0)
            {
                if(TList.get(i).getRefChr3().equals("skyblue"))
                {
                    currentRow.getCell(1).getStyle().getFillPattern().setSolid(SpreadsheetColor.fromName(ColorName.LIGHT_BLUE)); //배경색
                }
                else if(TList.get(i).getRefChr4().equals("yellow"))
                {
                     currentRow.getCell(1).getStyle().getFillPattern().setSolid(SpreadsheetColor.fromName(ColorName.YELLOW)); //배경색
                }
                else  if(TList.get(i).getRefChr4().equals("red"))
                {
                    currentRow.getCell(1).getStyle().getFillPattern().setSolid(SpreadsheetColor.fromName(ColorName.RED)); //배경색
                }
            }
            
        }
        worksheet.calculate();

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        workbook.save(out, SaveOptions.getXlsxDefault());
        
        byte[] byteArray = out.toByteArray();
        
		FileOutputStream fileOut = null;

        String filenm = resultDeptDetail.get("REQ_HAN_NM")+"_"+resultDeptDetail.get("REQ_DT")+".xlsx";
       
	    BMap paramPath = new BMap();
	    paramPath.put("REF_CHR1"        ,  "PATH");
	    
        List<CodeVO> pathList = commonService.selectCommonCode("500200", paramPath);
        
        String path = pathList.get(0).getValue();
        
        paramPath.put("REF_CHR1"        ,  "MSG");
	    
        pathList = commonService.selectCommonCode("500200", paramPath);
        
        String msg = pathList.get(0).getValue();
        
        paramPath.put("REF_CHR1"        ,  "SUBJECT");
	    
        pathList = commonService.selectCommonCode("500200", paramPath);
        
        String subject = pathList.get(0).getValue();
        System.out.println("================0:"+path);
	    File f = new File(path);
	    
	    if(!f.exists())
	    {
	        f.mkdir();
	    }
	   // path = path.replace("\\\\","\\");
        System.out.println("================1:"+path);
        //workbook.save(path  +"/"+ filenm);
        try {
        	File f2 = new File(path+filenm);
        	 System.out.println("================2:"+f2.canExecute());
        	 System.out.println("================3:"+f2.canWrite());
        	 f2.setWritable(true);
			fileOut = new FileOutputStream(f2, false);
		} catch (FileNotFoundException e) {
			System.out.println(e);
		}
		try {
			fileOut.write(out.toByteArray(), 0, out.toByteArray().length);
			fileOut.flush();
			fileOut.close();
		} catch (IOException e) {
			System.out.println(e);
		}
		
        BMap sendEmailparam = new BMap();
        sendEmailparam.put("FILE_FULL_NM", path  + filenm);
        sendEmailparam.put("FILE_NM"     	, filenm);
        sendEmailparam.put("TO_EMAIL"   	, resultDeptDetail.get("EMAIL"));
        sendEmailparam.put("MSG"     		, msg);
        sendEmailparam.put("SUBJECT"   	, subject);
       
        boolean res = mailSendService.sendMail(sendEmailparam);
        
        System.out.println("================"+res);
        if(res)
        {
            //인보이스 발행일자 수정
            reserveService.updateInvRegDt(param);
        }
        BRespData respData = new BRespData();
        respData.put("resultCd", res);
        
       return respData;
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