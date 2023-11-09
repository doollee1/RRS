package bt.lead.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bt.btframework.common.vo.CodeVO;
import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("LeadDao")
public class LeadDao extends DBAbstractMapper {
	/**
	 * search Lead List
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> searchLeadList(BMap param) throws Exception{
		return list("LeadMapper.searchLeadList", param);
	}
	
	/**
	 * create Lead Seq
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String getLeadSeq(Map<String, Object> param) throws Exception{
		return (String)selectByPk("LeadMapper.getLeadSeq", param);
	}

	/**
	 * save Lead Info
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void insertLeadInfo(Map<String, Object> param) throws Exception{
		insert("LeadMapper.insertLeadInfo", param);		
	}
	
	/**
	 * save Lead INTACT
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void insertLeadIntact(Map<String, Object> param)throws Exception{
		insert("LeadMapper.insertLeadIntact", param);		
	}

	/**
	 * update Lead Info
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void updateLeadInfo(Map<String, Object> param) throws Exception{
		insert("LeadMapper.updateLeadInfo", param);		
	}

	/**
	 * save Lead Notes
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void insertLeadNotes(Map<String, Object> param) throws Exception{
		insert("LeadMapper.insertLeadNotes", param);		
	}
	
	/**
	 * update Lead Notes
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void updateLeadNotes(Map<String, Object> param) throws Exception{
		insert("LeadMapper.updateLeadNotes", param);		
	}

	/**
	 * save Lead Products
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void insertLeadProducts(Map<String, Object> param) throws Exception{
		insert("LeadMapper.insertLeadProducts", param);		
	}

	/**
	 * update Lead Products
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void updateLeadProducts(Map<String, Object> param) throws Exception{
		insert("LeadMapper.updateLeadProducts", param);		
	}

	/**
	 * save Lead PartInv
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void insertLeadPartInv(Map<String, Object> param) throws Exception{
		insert("LeadMapper.insertLeadPartInv", param);		
	}

	/**
	 * update Lead PartInv
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void updateLeadPartInv(Map<String, Object> param) throws Exception{
		insert("LeadMapper.updateLeadPartInv", param);		
	}

	/**
	 * edit Lead INTACT
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void updateLeadIntact(Map<String, Object> param)throws Exception{
		insert("LeadMapper.updateLeadIntact", param);		
	}
	
	/**
	 * Lead 리스트 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BMap selectLeadInfo(BMap param) throws Exception{
		return (BMap) selectByPk("LeadMapper.selectLeadInfo", param);
	}

	/**
	 * Lead Note 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BMap selectCustomNote(BMap param) throws Exception{
		return (BMap) selectByPk("LeadMapper.selectCustomNote", param);
	}

	/**
	 * Lead Note  Grid  
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectNoteGrid(BMap param) throws Exception{
		return list("LeadMapper.selectNoteGrid", param);
	}

	/**
	 * Lead Products Grid  
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> resultProductsGrid(BMap param) throws Exception{
		return list("LeadMapper.resultProductsGrid", param);
	}
	
	/**
	 * Lead PartInv Grid  
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> resultPartInvGrid(BMap param) throws Exception{
		return list("LeadMapper.resultPartInvGrid", param);
	}
		
	/**
	 * Lead Transaction 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BMap resultInteractionLog(BMap param)throws Exception{
		return (BMap) selectByPk("LeadMapper.resultInteractionLog", param);
	}
	
	/**
	 * Lead Transaction List 조회 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> resultContactReportGrid(BMap param) throws Exception{
		return list("LeadMapper.resultContactReportGrid", param);
	}
	
	/**
	 * Lead ChangeHistory List 조회 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> resultChangeHistoryGrid(BMap param) throws Exception{
		return list("LeadMapper.resultChangeHistoryGrid", param);
	}
	

	@SuppressWarnings("unchecked")
	public List<BMap> partnerSearchList(Map<String, Object> param) throws Exception {
		return list("LeadMapper.partnerSearchList", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<CodeVO> getLeadStatusReasonCode(BMap param) throws Exception{
		return list("LeadMapper.getLeadStatusReasonCode", param);
	}
	
	@SuppressWarnings("unchecked")
	public String getLeadTempSeq(Map<String, Object> param) throws Exception{
		return (String)selectByPk("LeadMapper.getLeadTempSeq", param);
	}

	@SuppressWarnings("unchecked")
	public void deleteLeadInfo(Map<String, Object> param) throws Exception{
		delete("LeadMapper.deleteLeadInfo", param);
	}

	@SuppressWarnings("unchecked")
	public void deleteLeadNotes(Map<String, Object> param) throws Exception{
		delete("LeadMapper.deleteLeadNotes", param);
	}

	@SuppressWarnings("unchecked")
	public void deleteLeadProducts(Map<String, Object> param) throws Exception{
		delete("LeadMapper.deleteLeadProducts", param);
	}

	@SuppressWarnings("unchecked")
	public void deleteLeadPartInv(Map<String, Object> param) throws Exception{
		delete("LeadMapper.deleteLeadPartInv", param);
	}

	@SuppressWarnings("unchecked")
	public BMap resultCustSalesData(BMap param) throws Exception{
		return (BMap) selectByPk("LeadMapper.resultCustSalesData", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<CodeVO> selectSalesOffice(BMap param) throws Exception{
		return list("LeadMapper.selectSalesOffice", param);
	}

	@SuppressWarnings("unchecked")
	public BMap setCustSalesData(BMap param) throws Exception{
		return (BMap) selectByPk("LeadMapper.setCustSalesData", param);
	}
	
	@SuppressWarnings("unchecked")
	public String getModiTms(Map<String, Object> param) throws Exception{
		return (String)selectByPk("LeadMapper.getModiTms", param);
	}
}
