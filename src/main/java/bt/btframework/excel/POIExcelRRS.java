package bt.btframework.excel;

import java.awt.Color;
import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFDataFormat;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.ibm.icu.text.SimpleDateFormat;

import bt.btframework.utils.BMap;
import bt.btframework.utils.StringUtils;

public class POIExcelRRS {
	
	private short FONT_SIZE = 10;
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	public byte[] buildExcelXSSF(HashMap<String, Object> param, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		List<HashMap<String, Object>> colModelList = (List<HashMap<String, Object>>) param.get("colModel");
		String title = StringUtils.NULL(param.get("title"));
		int colModelLength = colModelList.size();
		
		XSSFWorkbook xsWB = new XSSFWorkbook();
        XSSFSheet xsSheet = xsWB.createSheet(title);
        xsSheet.setDefaultColumnWidth(12);
        
        // Font 지정
        XSSFFont xshFont = xsWB.createFont();
        xshFont.setFontHeightInPoints(FONT_SIZE);
        xshFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
        XSSFFont xsdFont = xsWB.createFont();
        xsdFont.setFontHeightInPoints(FONT_SIZE);
        
        // Header 스타일 지정
        XSSFCellStyle xshCS = xsWB.createCellStyle();
        xshCS.setFillBackgroundColor(new XSSFColor(new Color(203, 208, 229)));
        xshCS.setFillForegroundColor(new XSSFColor(new Color(203, 208, 229)));
        xshCS.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
        xshCS.setAlignment(HorizontalAlignment.CENTER);
        xshCS.setVerticalAlignment(VerticalAlignment.CENTER);
        xshCS.setFont(xshFont);
        
        // Header 데이터 적용 및 Body 스타일 설정
        XSSFRow xsRow = xsSheet.createRow(0);
        XSSFCell xsCell;
		xsSheet.setColumnWidth(0, 40 * 35);
		XSSFCellStyle[] xsdCSs = new XSSFCellStyle[colModelLength]; // 셀스타일 Array
		XSSFDataFormat xsDFormat = xsWB.createDataFormat();
		
		for (int i=0; i<colModelLength; i++) {
    		xsSheet.setColumnWidth(i, 40 * (Integer.parseInt(StringUtils.NULL(colModelList.get(i).get("width"), "0"))));
    		xsCell = xsRow.createCell(i);
    		xsCell.setCellStyle(xshCS);
    		String colName = StringUtils.NULL(colModelList.get(i).get("name"));
    		String cellValue = StringUtils.NULL(colModelList.get(i).get("label"));
    		xsCell.setCellValue(colName.equals("TEL_NO") ? cellValue + "(숫자만 입력)" : cellValue);
    		
    		xsdCSs[i] = xsWB.createCellStyle();
    		xsdCSs[i].setVerticalAlignment(VerticalAlignment.CENTER);
    		xsdCSs[i].setFont(xsdFont);
			if ("center".equals(colModelList.get(i).get("align")))
				xsdCSs[i].setAlignment(HorizontalAlignment.CENTER);
 			else if ("right".equals(colModelList.get(i).get("align")))
 				xsdCSs[i].setAlignment(HorizontalAlignment.RIGHT);
 			else
 				xsdCSs[i].setAlignment(HorizontalAlignment.LEFT);
    	}
    	
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		xsWB.write(bos);
	    
	    byte[] excelBinary = bos.toByteArray();
	    bos.close();
		
		return excelBinary;
    }
	
	@SuppressWarnings("deprecation")
	public List<BMap> excelUpload(MultipartFile uploadfile, String[] header) throws Exception {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String savepath = request.getSession().getServletContext().getRealPath("/");
		List<BMap> list = new ArrayList<BMap>();

		if (uploadfile != null) {
	    	//엑셀파일 업로드 처리
	        String fileName = uploadfile.getOriginalFilename();
	        File file = new File(savepath + "upload\\" + fileName);
	                
	        if (!file.exists())
	    		file.mkdirs();

	        uploadfile.transferTo(file);

	        //엑셀 읽기
	        FileInputStream fis = new FileInputStream(savepath + "upload\\" + fileName);
	        
	        if (fileName.substring(fileName.lastIndexOf("."), fileName.length()).equals(".xls")) {
	            HSSFWorkbook workbook = new HSSFWorkbook(fis);
	            HSSFSheet sheet = workbook.getSheetAt(0);
	            int rowcnt = 0;
	            int rowcnt1 = sheet.getPhysicalNumberOfRows();
	            int rowcnt2 = sheet.getLastRowNum();
	            
	            if (rowcnt1 > rowcnt2){
	            	rowcnt = rowcnt1;
	            	}
	            else {
	            	rowcnt = rowcnt2;
	            	}
	            
	            int cellcnt = header.length;
	            
	            for (int rowindex=1; rowindex<rowcnt; rowindex++) {
	            	HSSFRow row = sheet.getRow(rowindex);
	            	BMap map = new BMap();
	                
	                if (row != null) {
	                    for (int columnindex=0; columnindex<cellcnt; columnindex++) {
	                    	HSSFCell cell = row.getCell(columnindex);
	                    	String value = "";
	                        
	                        if (cell == null) {
	                            continue;
	                        } else {
	                        	switch (cell.getCellType()) {
	                        		case HSSFCell.CELL_TYPE_STRING:
	                        			//value = cell.toString().trim();
	                        			value = cell.getStringCellValue().trim();
	                        			break;
	                        		case HSSFCell.CELL_TYPE_NUMERIC:
		                            	if (DateUtil.isCellDateFormatted(cell)) {
		                            		SimpleDateFormat objSimpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		                            		value = objSimpleDateFormat.format(cell.getDateCellValue());
		                            	} else {
		                            		value = String.valueOf((long)cell.getNumericCellValue());
		                            	}
		                            	break;
	                        		case HSSFCell.CELL_TYPE_BLANK:
	                        			value = "";
	                        			break;
	                        		case HSSFCell.CELL_TYPE_ERROR:
	                        			value = "";
	                        			break;
	                        		case HSSFCell.CELL_TYPE_BOOLEAN:
	                        			value = String.valueOf(cell.getBooleanCellValue());
	                        			break;
	                        		case XSSFCell.CELL_TYPE_FORMULA:
	                        			value = String.valueOf((long)cell.getNumericCellValue());
	                        			break;
	                        	}
	                        }
	                        
	                        map.put(header[columnindex], value);
	                	}
	                }
	                
	                list.add(map);
	            }
	            workbook.close();
	        } else if (fileName.substring(fileName.lastIndexOf("."), fileName.length()).equals(".xlsx")) {
	            XSSFWorkbook workbook = new XSSFWorkbook(fis);
	            XSSFSheet sheet = workbook.getSheetAt(0);
	            int rowcnt = sheet.getPhysicalNumberOfRows();
	            int cellcnt = header.length;

            	System.err.println("excel cellcnt :: " + cellcnt);
	            for (int rowindex=1; rowindex<rowcnt; rowindex++) {
	            	XSSFRow row = sheet.getRow(rowindex);
	            	BMap map = new BMap();
	                
	                if (row != null) {
	                    for (int columnindex=0; columnindex<cellcnt; columnindex++) {
	                    	XSSFCell cell = row.getCell(columnindex);
	                    	String value = "";
	                        
	                        if (cell == null) {
	                            continue;
	                        } else {
	                        	switch (cell.getCellType()) {
	                        		case XSSFCell.CELL_TYPE_STRING:
	                        			value = cell.toString().trim();
	                        			break;
	                        		case XSSFCell.CELL_TYPE_NUMERIC:
		                            	if (DateUtil.isCellDateFormatted(cell)) {
		                            		SimpleDateFormat objSimpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		                            		value = objSimpleDateFormat.format(cell.getDateCellValue());
		                            	} else {
		                            		value = String.valueOf((long)cell.getNumericCellValue());
		                            	}
		                            	break;
	                        		case XSSFCell.CELL_TYPE_BLANK:
	                        			value = "";
	                        			break;
	                        		case XSSFCell.CELL_TYPE_ERROR:
	                        			value = "";
	                        			break;
	                        		case XSSFCell.CELL_TYPE_BOOLEAN:
	                        			value = String.valueOf(cell.getBooleanCellValue());
	                        			break;
	                        		case XSSFCell.CELL_TYPE_FORMULA:
	                        			value = String.valueOf((long)cell.getNumericCellValue());
	                        			break;
	                        	}
	                        }
	                        
	                        map.put(header[columnindex], value);
	                	}
	                }
	                if(map.size() > 0) list.add(map);
	            }
	            workbook.close();
	        }
	        fis.close();
	        //엑셀 파일 제거
	        file.delete();
	    }
		
		return list;
	}
}
