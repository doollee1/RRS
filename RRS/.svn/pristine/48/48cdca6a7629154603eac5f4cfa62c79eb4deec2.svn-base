package bt.common.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;

@Repository("SapIfRecvMsPartnerDao")
public class SapIfRecvMsPartnerDao  extends DBAbstractMapper  {
    
	/**
	 * SAP Interface Receive Partner T_LFA1 -> Insert into IF_GET_MS_PARTNER Table (INSERT)
	 */
	public void insertSapIfRecvMsPartner(Map<String, Object> param) throws Exception{
		insert("SapIfRecvMsPartnerMapper.insertSapIfRecvMsPartner", param);
	}

	/**
	 * Stored Procedure call SP_IF_ERP_RECV_PARTNER -> Insert into MS_ITEM_BOM Table (INSERT/UPDATE)
	 */
	public void callSpSapIfRecvMsPartner(Map<String, Object> param) throws Exception{
		insert("SapIfRecvMsPartnerMapper.callSpSapIfRecvMsPartner", param);
	}

}
