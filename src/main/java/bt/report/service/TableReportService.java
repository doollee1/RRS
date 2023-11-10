package bt.report.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import bt.btframework.excel.ExcelDataListRowHandler;
import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.report.dao.TableReportDao;

@Service
public class TableReportService {
	private static final Logger logger = LoggerFactory.getLogger(TableReportService.class);
	
	@Resource
	private TableReportDao tableReportDao;
	
	public List<BMap> selectCustomerList(Map<String, Object> param) throws Exception {
		param.put("LANG", LoginInfo.getLang());
		return tableReportDao.selectCustomerList(param);
	}

	public void selectCustomerListAll(String title, LinkedHashMap<String,Object> header, HttpServletResponse response, BMap param) throws Exception{
		ExcelDataListRowHandler handler = null;
		try {
			handler = new ExcelDataListRowHandler(title, header, response);
			tableReportDao.selectCustomerListAll(param, handler);
		}catch(Exception ex){
			throw new RuntimeException(ex);
		}finally{
			if(handler != null){
				try{ handler.close();}catch(Exception ex){}
			}
		}
	}
	
	public List<BMap> selectProductList(BMap param) throws Exception {
		param.put("LANG", LoginInfo.getLang());
		return tableReportDao.selectProductList(param);
	}

	public void selectProductListAll(String title, LinkedHashMap<String,Object> header, HttpServletResponse response, BMap param) throws Exception{
		ExcelDataListRowHandler handler = null;
		try {
			handler = new ExcelDataListRowHandler(title, header, response);
			tableReportDao.selectProductListAll(param, handler);
		}catch(Exception ex){
			throw new RuntimeException(ex);
		}finally{
			if(handler != null){
				try{ handler.close();}catch(Exception ex){}
			}
		}
	}
	
	public List<BMap> selectBomList(BMap param) throws Exception {
		param.put("LANG", LoginInfo.getLang());
		return tableReportDao.selectBomList(param);
	}

	public void selectBomListAll(String title, LinkedHashMap<String,Object> header, HttpServletResponse response, BMap param) throws Exception{
		ExcelDataListRowHandler handler = null;
		try {
			handler = new ExcelDataListRowHandler(title, header, response);
			tableReportDao.selectBomListAll(param, handler);
		}catch(Exception ex){
			throw new RuntimeException(ex);
		}finally{
			if(handler != null){
				try{ handler.close();}catch(Exception ex){}
			}
		}
	}
	
	public List<BMap> selectQuotationList(BMap param) throws Exception {
		param.put("LANG", LoginInfo.getLang());
		return tableReportDao.selectQuotationList(param);
	}

	public List<BMap> selectLeadList(BMap param) throws Exception {
		param.put("LANG", LoginInfo.getLang());
		return tableReportDao.selectLeadList(param);
	}
}