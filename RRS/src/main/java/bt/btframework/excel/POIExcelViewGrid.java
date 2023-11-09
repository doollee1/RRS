package bt.btframework.excel;

import java.awt.Color;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
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

import bt.btframework.utils.StringUtils;

/**
 * 그리드 엑셀 다운로드 처리
 */
public class POIExcelViewGrid {
	
	private short FONT_SIZE = 10;
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	public byte[] buildExcelXSSF(HashMap<String, Object> param, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		List<HashMap<String, Object>> colModelList = (List<HashMap<String, Object>>) param.get("colModel");
		List<HashMap<String, Object>> gridDataList = (List<HashMap<String, Object>>) param.get("gridData");
		String title = StringUtils.NULL(param.get("title"));
		int colModelLength = colModelList.size();
		int gridDataLength = gridDataList.size();
		
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
        XSSFCell xsCell = xsRow.createCell(0);
        xsCell.setCellStyle(xshCS);
        xsCell.setCellValue("NO");
		xsSheet.setColumnWidth(0, 40 * 35);
		XSSFCellStyle[] xsdCSs = new XSSFCellStyle[colModelLength]; // 셀스타일 Array
		XSSFDataFormat xsDFormat = xsWB.createDataFormat();
		
    	for (int i=0; i<colModelLength; i++) {
    		xsSheet.setColumnWidth(i + 1, 40 * (Integer.parseInt(StringUtils.NULL(colModelList.get(i).get("width"), "0"))));
    		xsCell = xsRow.createCell(i + 1);
    		xsCell.setCellStyle(xshCS);
    		xsCell.setCellValue(StringUtils.NULL(colModelList.get(i).get("label")));
			
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
    	
    	// Body 데이터 적용
    	for (int i=0; i<gridDataLength; i++) {
    		xsRow = xsSheet.createRow(i + 1);
    		xsRow.createCell(0).setCellStyle(xsdCSs[0]);
    		xsRow.createCell(0).setCellValue(String.valueOf(i + 1));
			
			for (int j=0; j<colModelLength; j++) {
				xsCell = xsRow.createCell(j + 1);

				if ("integer".equals(colModelList.get(j).get("formatter")) || "number".equals(colModelList.get(j).get("formatter"))) {
    				xsdCSs[j].setDataFormat(xsDFormat.getFormat("#,##0"));
    				if(gridDataList.get(i).get(colModelList.get(j).get("name")).toString().trim().length() != 0) {
    					xsCell.setCellType(XSSFCell.CELL_TYPE_NUMERIC);
    					xsCell.setCellValue(Double.valueOf(StringUtils.NULL(gridDataList.get(i).get(colModelList.get(j).get("name")), "0")));
    				}
    			} else {
    				xsCell.setCellType(XSSFCell.CELL_TYPE_STRING);
    				xsCell.setCellValue(StringUtils.NULL(gridDataList.get(i).get(colModelList.get(j).get("name"))));
    			}
    			
    			xsCell.setCellStyle(xsdCSs[j]);
    		}
        }
		
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		xsWB.write(bos);
	    
	    byte[] excelBinary = bos.toByteArray();
	    bos.close();
		
		return excelBinary;
    }
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	public byte[] buildExcelHSSF(HashMap<String, Object> param, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		List<HashMap<String, Object>> colModelList = (List<HashMap<String, Object>>) param.get("colModel");
		List<HashMap<String, Object>> gridDataList = (List<HashMap<String, Object>>) param.get("gridData");
		String title = StringUtils.NULL(param.get("title"));
		int colModelLength = colModelList.size();
		int gridDataLength = gridDataList.size();
		
		HSSFWorkbook hsWB = new HSSFWorkbook();
        HSSFSheet hsSheet = hsWB.createSheet(title);
        hsSheet.setDefaultColumnWidth(12);
        
        // Font 지정
        HSSFFont hshFont = hsWB.createFont();
        hshFont.setFontHeightInPoints(FONT_SIZE);
        hshFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
        HSSFFont hsdFont = hsWB.createFont();
        hsdFont.setFontHeightInPoints(FONT_SIZE);
        
        // Header 스타일 지정
        HSSFCellStyle hshCS = hsWB.createCellStyle();
        hshCS.setFillBackgroundColor(HSSFColor.SKY_BLUE.index);
        hshCS.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
        hshCS.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        hshCS.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        hshCS.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        hshCS.setFont(hshFont);
        
        // Header 데이터 적용 및 Body 스타일 설정
        HSSFRow hsRow = hsSheet.createRow(0);
        HSSFCell hsCell = hsRow.createCell(0);
        hsCell.setCellStyle(hshCS);
        hsCell.setCellValue("NO");
		hsSheet.setColumnWidth(0, 40 * 35);
		HSSFCellStyle[] hsdCSs = new HSSFCellStyle[colModelLength]; // 셀스타일 Array
		HSSFDataFormat hsDFormat = hsWB.createDataFormat();
		
    	for (int i=0; i<colModelLength; i++) {
    		hsSheet.setColumnWidth(i + 1, 40 * (Integer.parseInt(StringUtils.NULL(colModelList.get(i).get("width"), "0"))));
    		hsCell = hsRow.createCell(i + 1);
    		hsCell.setCellStyle(hshCS);
    		hsCell.setCellValue(StringUtils.NULL(colModelList.get(i).get("label")));
			
    		hsdCSs[i] = hsWB.createCellStyle();
    		hsdCSs[i].setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
    		hsdCSs[i].setFont(hsdFont);
			if ("center".equals(colModelList.get(i).get("align")))
				hsdCSs[i].setAlignment(HSSFCellStyle.ALIGN_CENTER);
 			else if ("right".equals(colModelList.get(i).get("align")))
 				hsdCSs[i].setAlignment(HSSFCellStyle.ALIGN_RIGHT);
 			else
 				hsdCSs[i].setAlignment(HSSFCellStyle.ALIGN_LEFT);
    	}
    	
    	// Body 데이터 적용
    	for (int i=0; i<gridDataLength; i++) {
    		hsRow = hsSheet.createRow(i + 1);
    		hsRow.createCell(0).setCellStyle(hsdCSs[0]);
    		hsRow.createCell(0).setCellValue(String.valueOf(i + 1));
			
			for (int j=0; j<colModelLength; j++) {
				hsCell = hsRow.createCell(j + 1);
    			
				if ("integer".equals(colModelList.get(j).get("formatter")) || "number".equals(colModelList.get(j).get("formatter"))) {
    				hsdCSs[j].setDataFormat(hsDFormat.getFormat("#,##0"));
    				if(gridDataList.get(i).get(colModelList.get(j).get("name")).toString().trim().length() != 0) {
        				hsCell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
        				hsCell.setCellValue(Double.valueOf(StringUtils.NULL(gridDataList.get(i).get(colModelList.get(j).get("name")), "0")));
    				}
    			} else {
    				hsCell.setCellType(HSSFCell.CELL_TYPE_STRING);
    				hsCell.setCellValue(StringUtils.NULL(gridDataList.get(i).get(colModelList.get(j).get("name"))));
    			}
    			
    			hsCell.setCellStyle(hsdCSs[j]);
    		}
        }
		
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		hsWB.write(bos);
	    
	    byte[] excelBinary = bos.toByteArray();
	    bos.close();
		
		return excelBinary;
    }
}
