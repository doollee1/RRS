package bt.quotation.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("QuotationDao")
public class QuotationDao extends DBAbstractMapper {
	
	/**
	 * search Quotation List
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> searchQuotationList(BMap param) throws Exception{
		return list("SalesOrderMapper.searchQuotationList", param);
	}
	
	/**
	 * search Approval List
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> searchApprovalList(BMap param) throws Exception{
		return list("SalesOrderMapper.searchApprovalList", param);
	}
}