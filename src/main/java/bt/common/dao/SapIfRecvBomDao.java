package bt.common.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;

@Repository("SapIfRecvBomDao")
public class SapIfRecvBomDao  extends DBAbstractMapper  {
    
	/**
	 * SAP Interface Receive BOM MAST -> Insert into IF_GET_BOM_MAST Table (INSERT)
	 */
	public void insertSapIfRecvBomMast(Map<String, Object> param) throws Exception{
		insert("SapIfRecvBomMapper.insertSapIfRecvBomMast", param);
	}

	/**
	 * SAP Interface Receive BOM STKO -> Insert into IF_GET_BOM Table (INSERT)
	 */
	public void insertSapIfRecvBomTStko(Map<String, Object> param) throws Exception{
		insert("SapIfRecvBomMapper.insertSapIfRecvBomTStko", param);
	}

	/**
	 * SAP Interface Receive BOM T_MVKE -> Insert into IF_GET_MVKE Table (INSERT)
	 */
	public void insertSapIfRecvBomTStpo(Map<String, Object> param) throws Exception{
		insert("SapIfRecvBomMapper.insertSapIfRecvBomTStpo", param);
	}

	/**
	 * Stored Procedure call SP_IF_ERP_RECV_BOM -> Insert into MS_ITEM_BOM Table (INSERT/UPDATE)
	 */
	public void callSpSapIfRecvBom(Map<String, Object> param) throws Exception{
		insert("SapIfRecvBomMapper.callSpSapIfRecvBom", param);
	}

	/**
	 * SAP Interface Receive Merge BOM -> Insert into MS_ITEM_BOM Table (INSERT/UPDATE)
	 */
	public void mergeSapIfRecvBom(Map<String, Object> param) throws Exception{
		insert("SapIfRecvBomMapper.mergeSapIfRecvBom", param);
	}

}
