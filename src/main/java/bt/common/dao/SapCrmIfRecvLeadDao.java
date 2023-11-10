package bt.common.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;

@Repository("SapCrmIfRecvLeadDao")
public class SapCrmIfRecvLeadDao  extends DBAbstractMapper  {
    
	/**
	 * SAP CRM Interface Receive Lead HEAD -> IF_GET_CRM_LEAD_HEAD
	 */
	public void insertSapCrmIfRecvLeadHEAD(Map<String, Object> param) throws Exception{
		insert("SapCrmIfRecvLeadMapper.insertSapCrmIfRecvLeadHEAD", param);
	}

	/**
	 * SAP CRM Interface Receive Lead PROD -> IF_GET_CRM_LEAD_PROD
	 */
	public void insertSapCrmIfRecvLeadPROD(Map<String, Object> param) throws Exception{
		insert("SapCrmIfRecvLeadMapper.insertSapCrmIfRecvLeadPROD", param);
	}

	/**
	 * SAP CRM Interface Receive Lead PART -> IF_GET_CRM_LEAD_PART
	 */
	public void insertSapCrmIfRecvLeadPART(Map<String, Object> param) throws Exception{
		insert("SapCrmIfRecvLeadMapper.insertSapCrmIfRecvLeadPART", param);
	}

	/**
	 * SAP CRM Interface Receive Lead ITEM -> IF_GET_CRM_LEAD_ITEM
	 */
	public void insertSapCrmIfRecvLeadITEM(Map<String, Object> param) throws Exception{
		insert("SapCrmIfRecvLeadMapper.insertSapCrmIfRecvLeadITEM", param);
	}

	/**
	 * SAP CRM Interface Receive Lead TEXT -> IF_GET_CRM_LEAD_TEXT
	 */
	public void insertSapCrmIfRecvLeadTEXT(Map<String, Object> param) throws Exception{
		insert("SapCrmIfRecvLeadMapper.insertSapCrmIfRecvLeadTEXT", param);
	}

	/**
	 * Stored Procedure call callSpSapCrmIfRecvLead -> Insert into MS_Lead Table (INSERT/UPDATE)
	 */
	public void callSpSapCrmIfRecvLead(Map<String, Object> param) throws Exception{
		insert("SapCrmIfRecvLeadMapper.callSpSapCrmIfRecvLead", param);
	}

}
