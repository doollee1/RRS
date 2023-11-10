package bt.report.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.ResultHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository
public class TableReportDao extends DBAbstractMapper {
	private static final Logger logger = LoggerFactory.getLogger(TableReportDao.class);
	
	@SuppressWarnings("unchecked")
	public List<BMap> selectCustomerList(Map<String, Object> param) throws Exception {
		return list("ReportMapper.selectCustomerList", param);
	}
	
	@SuppressWarnings("unchecked")
	public void selectCustomerListAll(BMap param, ResultHandler<?> handler)throws Exception{
		listToOutUsingResultHandler("ReportMapper.selectCustomerList", param, handler);
	}	
	
	@SuppressWarnings("unchecked")
	public List<BMap> selectProductList(Map<String, Object> param) throws Exception {
		return list("ReportMapper.selectProductList", param);
	}

	@SuppressWarnings("unchecked")
	public void selectProductListAll(BMap param, ResultHandler<?> handler) throws Exception {
		listToOutUsingResultHandler("ReportMapper.selectProductList", param, handler);
	}
	
	@SuppressWarnings("unchecked")
	public List<BMap> selectBomList(Map<String, Object> param) throws Exception {
		return list("ReportMapper.selectBomList", param);
	}

	@SuppressWarnings("unchecked")
	public void selectBomListAll(BMap param, ResultHandler<?> handler)throws Exception{
		listToOutUsingResultHandler("ReportMapper.selectBomList", param, handler);
	}	
	
	@SuppressWarnings("unchecked")
	public List<BMap> selectQuotationList(Map<String, Object> param) throws Exception {
		return list("ReportMapper.selectQuotationList", param);
	}

	@SuppressWarnings("unchecked")
	public List<BMap> selectLeadList(Map<String, Object> param) throws Exception {
		return list("ReportMapper.selectLeadList", param);
	}
}
