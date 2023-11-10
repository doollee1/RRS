package bt.common.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;

@Repository("SapCrmIfRecvCustomerDao")
public class SapCrmIfRecvCustomerDao  extends DBAbstractMapper  {
    
	/**
	 * SAP CRM Interface Receive Customer BPMAST -> IF_GET_CRM_BPMAST
	 */
	public void insertSapCrmIfRecvBPMAST(Map<String, Object> param) throws Exception{
		insert("SapCrmIfRecvCustomerMapper.insertSapCrmIfRecvBPMAST", param);
	}

	/**
	 * SAP CRM Interface Receive Customer BPREL -> IF_GET_CRM_BPREL
	 */
	public void insertSapCrmIfRecvBPREL(Map<String, Object> param) throws Exception{
		insert("SapCrmIfRecvCustomerMapper.insertSapCrmIfRecvBPREL", param);
	}

	/**
	 * SAP CRM Interface Receive Customer BP_SALES1 -> IF_GET_CRM_BP_SALES1
	 */
	public void insertSapCrmIfRecvBP_SALES1(Map<String, Object> param) throws Exception{
		insert("SapCrmIfRecvCustomerMapper.insertSapCrmIfRecvBP_SALES1", param);
	}

	/**
	 * SAP CRM Interface Receive Customer BP_SALES2 -> IF_GET_CRM_BP_SALES2
	 */
	public void insertSapCrmIfRecvBP_SALES2(Map<String, Object> param) throws Exception{
		insert("SapCrmIfRecvCustomerMapper.insertSapCrmIfRecvBP_SALES2", param);
	}

	/**
	 * SAP CRM Interface Receive Customer BP_SALES3 -> IF_GET_CRM_BP_SALES3
	 */
	public void insertSapCrmIfRecvBP_SALES3(Map<String, Object> param) throws Exception{
		insert("SapCrmIfRecvCustomerMapper.insertSapCrmIfRecvBP_SALES3", param);
	}

	/**
	 * SAP CRM Interface Receive Customer BP_SALES4 -> IF_GET_CRM_BP_SALES4
	 */
	public void insertSapCrmIfRecvBP_SALES4(Map<String, Object> param) throws Exception{
		insert("SapCrmIfRecvCustomerMapper.insertSapCrmIfRecvBP_SALES4", param);
	}

	/**
	 * SAP CRM Interface Receive Customer BP_TAXES -> IF_GET_CRM_BP_TAXES
	 */
	public void insertSapCrmIfRecvBP_TAXES(Map<String, Object> param) throws Exception{
		insert("SapCrmIfRecvCustomerMapper.insertSapCrmIfRecvBP_TAXES", param);
	}

	/**
	 * Stored Procedure call callSpSapCrmIfRecvCustomer -> Insert into MS_Customer Table (INSERT/UPDATE)
	 */
	public void callSpSapCrmIfRecvCustomer(Map<String, Object> param) throws Exception{
		insert("SapCrmIfRecvCustomerMapper.callSpSapCrmIfRecvCustomer", param);
	}
	
	/**
	 * Stored Procedure call callSpSapCrmIfRecvCustomer -> Insert into MS_Customer Table (INSERT/UPDATE)
	 */
	public void callMappingCustNo() throws Exception{
		selectByPk("SapCrmIfRecvCustomerMapper.callMappingCustNo", null);
	}

}
