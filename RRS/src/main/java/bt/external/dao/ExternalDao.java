package bt.external.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("ExternalDao")
public class ExternalDao extends DBAbstractMapper {
		
	/**
	 * Sales List 조회
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectSalesMster(BMap param) {
		return list("ExternalMapper.selectSalesMster", param);
	}
	
	/**
	 * Sales List 조회
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectSalesDetail(BMap param) {
		return list("ExternalMapper.selectSalesDetail", param);
	}
	
	/**
	 * Mdoule List 조회
	 * @param param
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectModuleList(BMap param) {
		return list("ExternalMapper.selectModuleList", param);
	}
	
	/**
	 * Bom List 조회
	 * @param param
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectBomList(BMap param) {
		return list("ExternalMapper.selectBomList", param);
	}
	
	/**
	 * Ship to List조회
	 * @param param
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectShiptoList(BMap param) {
		return list("ExternalMapper.selectShiptoList", param);
	}
	
	
	/**
	 * Mdoule List 조회
	 * @param param
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectModuleWpOutList(BMap param) {
		return list("ExternalMapper.selectModuleWpOutList", param);
	}
	
	/**
	 * Invoice Addr 조회
	 */
	public BMap selectInvoiceAddr(BMap param) {
		return (BMap) selectByPk("ExternalMapper.selectInvoiceAddr", param);
	}
	
	/**
	 * Order Process 조회
	 */
	public BMap selectOrderProcess(BMap param) {
		return (BMap) selectByPk("ExternalMapper.selectOrderProcess", param);
	}
	
	/**
	 * customer 언어 조회
	 */
	public BMap selectCustomerLang(BMap param) {
		return (BMap) selectByPk("ExternalMapper.selectCustomerLang", param);
	}
	
	/**
	 *  조회
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectContactPerson(BMap param) {
		return list("ExternalMapper.selectContactPerson", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<BMap> selectCommonCodeList(Map<String, Object> param) {
		return list("ExternalMapper.selectCommonCodeList", param);
	}
	
	
	/**
	 * insert confirm history
	 */	
	public void insertConfirmHis(Map<String, Object> param) throws Exception {		
		insert("ExternalMapper.insertConfirmHis", param);
	}
	
	
	/**
	 * insert confirm history
	 */	
	public void confirmSalesOrderHead(Map<String, Object> param) throws Exception {		
		update("ExternalMapper.confirmSalesOrderHead", param);
	}
	
	/**
	 * insert confirm history
	 */	
	public void confirmSalesOrderItem(Map<String, Object> param) throws Exception {		
		update("ExternalMapper.confirmSalesOrderItem", param);
		update("ExternalMapper.rejectSalesOrderItem", param);
	}
	
	
	private String getDivisionCode(List<Map<String, Object>> partlist, String divcd) throws Exception {
		
		String mindivcd = "";
		for (Map<String, Object> map : partlist) {
			String _divcd = (String)map.get("DIV_CD");
			mindivcd = _divcd;
			if (divcd.equals(_divcd))
			{
				return divcd;
			}
		}
		return mindivcd;
	}
	
	@SuppressWarnings({ "unchecked" })
	private String getShipToDivision(Map<String, Object> param, 
							   		List<Map<String, Object>> moduleList, 
							   		List<Map<String, Object>> bosList) throws Exception {
		
		final String _MODULE_ = "20";
		final String _BOS_ = "40";
		String stdivision = "";
		
		// 해당 division 정보가 없으면 20, 40순에서 처음 나오는 division 사용	
		List<Map<String, Object>> partlist = list("ExternalMapper.selectShipToCustPartList", param);
		
		if ((moduleList != null && moduleList.size()>0) && (bosList != null && bosList.size()>0))	{
		// module + BOS 같이 있으면 40				
			stdivision = this.getDivisionCode(partlist, _BOS_);
			if ("".equals(stdivision)) {
				throw new Exception("incorrect ship to infomation.");
			}							
		} else if (moduleList != null && moduleList.size()>0) {
		// module 만 있으면 20		
			stdivision = this.getDivisionCode(partlist, _MODULE_);
			if ("".equals(stdivision)) {
				throw new Exception("incorrect ship to infomation.");
			}					
		} else if (bosList != null && bosList.size()>0) {
		// BOS 만 있으면 40				
			stdivision = this.getDivisionCode(partlist, _BOS_);
			if ("".equals(stdivision)) {
				throw new Exception("incorrect ship to infomation.");
			}
		} else {
			throw new Exception("incorrect ship to infomation.");
		}
		
		return stdivision;
	}
	
	
	@SuppressWarnings({ "unchecked" })
	private String getSoldToDivision(Map<String, Object> param, 
							   		List<Map<String, Object>> moduleList, 
							   		List<Map<String, Object>> bosList) throws Exception {
		
		final String _MODULE_ = "20";
		final String _BOS_ = "40";
		String stdivision = "";
		
		// 해당 division 정보가 없으면 20, 40순에서 처음 나오는 division 사용	
		List<Map<String, Object>> partlist = list("ExternalMapper.selectSoldToCustPartList", param);
		
		if ((moduleList != null && moduleList.size()>0) && (bosList != null && bosList.size()>0))	{
		// module + BOS 같이 있으면 40				
			stdivision = this.getDivisionCode(partlist, _BOS_);
			if ("".equals(stdivision)) {
				throw new Exception("incorrect ship to infomation.");
			}							
		} else if (moduleList != null && moduleList.size()>0) {
		// module 만 있으면 20		
			stdivision = this.getDivisionCode(partlist, _MODULE_);
			if ("".equals(stdivision)) {
				throw new Exception("incorrect ship to infomation.");
			}					
		} else if (bosList != null && bosList.size()>0) {
		// BOS 만 있으면 40				
			stdivision = this.getDivisionCode(partlist, _BOS_);
			if ("".equals(stdivision)) {
				throw new Exception("incorrect ship to infomation.");
			}
		} else {
			throw new Exception("incorrect ship to infomation.");
		}
		
		return stdivision;
	}
	
	
	/**
	 * insert confirm history
	 */	
	@SuppressWarnings("unchecked")
	public void insertSalesOrder(Map<String, Object> param) throws Exception {
		
		final String _DELIMIT_ = ":";
		final String _EXW_ = "EXW";
		final String _ONE_TIME_CUST_ = "1100001";
		
		String companycd = (String)param.get("COMP_CD");
		String custcd = (String)param.get("CUST_CD");// sold to
		String order_h_num = String.valueOf(param.get("ORDER_H_NUM"));
		String incotermscd = String.valueOf(param.get("DELIV_DIV"));
		List<Map<String, Object>> moduleList = (List<Map<String, Object>>)param.get("moduleList");
		List<Map<String, Object>> bosList = (List<Map<String, Object>>)param.get("bosList"); 		
		
		if (!_EXW_.equals(incotermscd)) {
				
			String shipto = (String)param.get("SHIP_TO");		
			String[] shiptokey = shipto.split(_DELIMIT_);		
			
			String stPFPSNO = "";
			String storgcd = "";
			String stdistrbch = "";
			String stdivision = "";
			
			// ship 정보가 있을경우
			if (shiptokey.length > 0) {
				
				stPFPSNO = shiptokey[0];
				param.put("SHIP_TO_PF_PS_NO", stPFPSNO);
				
				if (!_ONE_TIME_CUST_.equals(stPFPSNO)) {
					
					storgcd = shiptokey[1];		
					stdistrbch = shiptokey[2];
					
					param.put("SHIP_TO_SALES_ORG_CD", storgcd);
					param.put("SHIP_TO_DISTRB_CH", stdistrbch);	
					
					stdivision = this.getShipToDivision(param, moduleList, bosList);	
					
					param.put("SHIP_TO_DIV_CD", stdivision);	
				} else {	
										
					param.put("SHIP_TO_SALES_ORG_CD", "1000");
					param.put("SHIP_TO_DISTRB_CH", "10");	
					
					stdivision = this.getSoldToDivision(param, moduleList, bosList);	
					param.put("SHIP_TO_DIV_CD", stdivision);
				}
							
			} else {
				throw new Exception("incorrect ship to infomation.");
			}			
		} else {
			param.put("SHIP_TO_PF_PS_NO", custcd);// ship to = sold to 자기자신			
			param.put("SHIP_TO_SALES_ORG_CD", "1000");
			param.put("SHIP_TO_DISTRB_CH", "10");	
			
			String stdivision = "";
			stdivision = this.getSoldToDivision(param, moduleList, bosList);	
			param.put("SHIP_TO_DIV_CD", stdivision);
		}
				
		param.put("SALES_ORG_CD", "1000");
		param.put("DISTRB_CH", "10");
		String soldtodivision = "";
		soldtodivision = this.getSoldToDivision(param, moduleList, bosList);	
		param.put("DIV_CD", soldtodivision);
		
		insert("ExternalMapper.insertQCSalesOrderHead", param);
		insert("ExternalMapper.insertQCSalesOrderDelivInfo", param);
		
		int seq = 0;		
		for (Map<String, Object> map : moduleList) {
			++ seq;
			map.put("COMP_CD", companycd);
			map.put("CUST_CD", custcd);
			map.put("ORDER_H_NUM", order_h_num);
			map.put("ORDER_MODU_SEQ", String.valueOf(seq));
			
			insert("ExternalMapper.insertQCSalesOrderModule", map);
		}	
		
		seq = 0;		
		for (Map<String, Object> map : bosList) {
			++ seq;			
			map.put("COMP_CD", companycd);
			map.put("CUST_CD", custcd);
			map.put("ORDER_H_NUM", order_h_num);
			map.put("ORDER_BOS_SEQ", String.valueOf(seq));
			
			insert("ExternalMapper.insertQCSalesOrderBOSInfo", map);
		}
	}	
}
