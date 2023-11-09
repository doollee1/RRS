package bt.btframework.excel;

import java.awt.Color;
import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFDataFormat;

import bt.btframework.utils.BMap;
import bt.btframework.utils.StringUtils;

public class ExcelDataListRowHandler implements ResultHandler<Object> {
	private HttpServletResponse response;
	private SXSSFWorkbook workbook;
	private SXSSFSheet sheet;
	private boolean isStarted = false;
	private LinkedHashMap<String,Object> headerMap;
	private String title = "";
	
	private XSSFCellStyle headerStyle = null;
	private XSSFCellStyle bodyStyle = null;
	private XSSFCellStyle bodyIntStyle = null;
	
	private int currentRows = 0;
	
	public ExcelDataListRowHandler(String title, LinkedHashMap<String,Object> headerMap, HttpServletResponse response){
    	this.response = response;
    	this.headerMap = headerMap;
    	workbook = new SXSSFWorkbook();
    	sheet = workbook.createSheet();
    	this.title = title;
    	try {
        	if(!isStarted){
        		open();
        		isStarted = true;
        	}
		} catch (Exception e) {
			throw new RuntimeException("JSON streaming Exception", e);
		}
	}
	
	@Override
	public void handleResult(ResultContext<?> result) {
        try {
        	if(!isStarted){
        		open();
        		isStarted = true;
        	}
        	
        	BMap dataRow = (BMap)result.getResultObject();        	
        	
            addRow(dataRow);
            
            dataRow = null;
		} catch (Exception e) {
			throw new RuntimeException("JSON streaming Exception", e);
		}
	}
	
	private void open() {		
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition","attachment;filename=" + title + ".xlsx");
		headerStyle();
		bodyStyle();
		bodyIntStyle();
		createSheetTiles();
	}
	
	private void createSheetTiles(){
		Row rows = sheet.createRow(0);
		
		int i = 1;
		
		try {
	        Cell cellNo = rows.createCell(0);
	        cellNo.setCellStyle(headerStyle);
	        cellNo.setCellValue("NO");
	        sheet.setColumnWidth(0, 40 * 35);
	        
			Set<String> set = headerMap.keySet();
        	Iterator<String> iter = set.iterator();
        	while(iter.hasNext()){
        		String key = (String)iter.next();
        		String value = (String)headerMap.get(key);

        		Cell cell = rows.createCell(i);
        		cell.setCellStyle(headerStyle);
        		cell.setCellValue(value);
            	sheet.setColumnWidth(i, 40 * 80);
        		i++;
        	}
        } catch (Exception ex) {
            throw new RuntimeException (ex);
        }
		
        this.currentRows++;
    }

	private void addRow(BMap map) throws RuntimeException {
		Row row = sheet.createRow(this.currentRows);
		
		int i = 1;
		
		try {
			row.createCell(0).setCellValue(String.valueOf(currentRows));
			
			Set<String> set = headerMap.keySet();
        	Iterator<String> iter = set.iterator();
        	
        	while(iter.hasNext()){
    			
        		String key = (String)iter.next();
        		String value = String.valueOf(map.get(key) == null ? "" : map.get(key));

        		Cell cell = row.createCell(i);
        		if(key.indexOf("_II") > 0 ){
    				cell.setCellStyle(bodyIntStyle);
    				cell.setCellType(CellType.NUMERIC);
    				cell.setCellValue(Double.valueOf(StringUtils.NULL(value, "0")));
    			} else {
    				cell.setCellStyle(bodyStyle);
    				cell.setCellValue(StringUtils.NULL(value, ""));
    			}
        		i++;
        	}
        } catch (Exception ex) {
            throw new RuntimeException (ex);
        }
		
        this.currentRows++;
    }
	
	@SuppressWarnings("deprecation")
	private void headerStyle(){
		XSSFCellStyle headerCS = (XSSFCellStyle) workbook.createCellStyle();
	    headerCS.setFillBackgroundColor(new XSSFColor(new Color(203, 208, 229)));
	    headerCS.setFillForegroundColor(new XSSFColor(new Color(203, 208, 229)));
	    headerCS.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
	    headerCS.setAlignment(HorizontalAlignment.CENTER);
	    headerCS.setVerticalAlignment(VerticalAlignment.CENTER);
	    
	    headerStyle = headerCS;
	}
	
	private void bodyStyle(){
		XSSFCellStyle bodyCS = (XSSFCellStyle) workbook.createCellStyle();
        bodyCS.setVerticalAlignment(VerticalAlignment.CENTER);
        bodyCS.setAlignment(HorizontalAlignment.LEFT);
        bodyCS.setBorderBottom(BorderStyle.THIN);
        bodyCS.setBorderTop(BorderStyle.THIN);
        bodyCS.setBorderRight(BorderStyle.THIN);
        bodyCS.setBorderLeft(BorderStyle.THIN);
        bodyStyle = bodyCS;
	}
	
	private void bodyIntStyle(){
		XSSFCellStyle bodyCSInt = (XSSFCellStyle) workbook.createCellStyle();
        bodyCSInt.setVerticalAlignment(VerticalAlignment.CENTER);
        bodyCSInt.setAlignment(HorizontalAlignment.RIGHT);
        bodyCSInt.setBorderBottom(BorderStyle.THIN);
        bodyCSInt.setBorderTop(BorderStyle.THIN);
        bodyCSInt.setBorderRight(BorderStyle.THIN);
        bodyCSInt.setBorderLeft(BorderStyle.THIN);
        XSSFDataFormat xsDFormat = (XSSFDataFormat) workbook.createDataFormat();
        bodyCSInt.setDataFormat(xsDFormat.getFormat("#,##0"));
        bodyIntStyle = bodyCSInt;
	}
		
	public void close() throws IOException{
		try {
	        workbook.write(response.getOutputStream());
	    } finally {
	    	if(workbook != null){
	    		try { workbook.close(); }catch(Exception ex){}
	    	}
	    }		
	}
}