package bt.btframework.excel;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.ibm.icu.text.SimpleDateFormat;

import bt.btframework.utils.BMap;

public class POIExcelUploadEx {
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
		                            		double v = (double)cell.getNumericCellValue(); 
		                            		
		                            		// DecimalFormat df = new DecimalFormat("#.##");      
		                            		// value =String.valueOf(Double.valueOf(df.format(v)));
		                            		value = String.format("%.2f", v);
		                            		value = value.replace(",", ".");
		                            		// value = String.valueOf((double)cell.getNumericCellValue());
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
		                            		double v = (double)cell.getNumericCellValue(); 
		                            		// DecimalFormat df = new DecimalFormat("#.##");      
		                            		// value =String.valueOf(Double.valueOf(df.format(v)));
		                            		
		                            		value = String.format("%.2f", v);
		                            		value = value.replace(",", ".");
		                            		// value = String.valueOf((double)cell.getNumericCellValue());
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
	                
	                list.add(map);
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
