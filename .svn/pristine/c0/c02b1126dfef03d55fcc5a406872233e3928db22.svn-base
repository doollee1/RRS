package bt.common.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;

@Repository("SapIfRecvCreditBlockDao")
public class SapIfRecvCreditBlockDao  extends DBAbstractMapper  {
    
	/**
	 * SAP Interface Receive Partner T_DATA -> Insert into IF_GET_CRDT_DATA Table (INSERT)
	 */
	public void insertSapIfRecvCreditBlockTData(Map<String, Object> param) throws Exception{
		insert("SapIfRecvCreditBlockMapper.insertSapIfRecvCreditBlockTData", param);
	}

	/**
	 * Stored Procedure call SP_IF_ERP_RECV_PARTNER -> Insert into MS_ITEM_BOM Table (INSERT/UPDATE)
	 */
	public void callSpSapIfRecvCreditBlock(Map<String, Object> param) throws Exception{
		insert("SapIfRecvCreditBlockMapper.callSpSapIfRecvCreditBlock", param);
	}

}
