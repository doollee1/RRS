package bt.salesOrder.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bt.btframework.common.vo.CodeVO;
import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("SalesOrderDao")
public class SalesOrderDao extends DBAbstractMapper {
	
	
	/**
	 * search searchSalesS_Test
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> searchSalesS_Test(BMap param) throws Exception{
		return list("SalesOrderMapper.searchSalesS_Test", param);
	}
	
	
	
	/**
	 * search SalesOrder List
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> searchSalesOrderList(BMap param) throws Exception{
		return list("SalesOrderMapper.searchSalesOrderList", param);
	}
	
	/**
	 * create Sales Order Seq
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String getSalesSeq(Map<String, Object> param) throws Exception{
		return (String)selectByPk("SalesOrderMapper.getSalesSeq", param);
	}
	
	/**
	 * checkDupPf
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String checkDupPf(Map<String, Object> param) throws Exception{
		return (String)selectByPk("SalesOrderMapper.checkDupPf", param);
	}
	
	
	/**
	 * insert Sales Order Head
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void insertSalesHeader(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.insertSalesHeader", param);
	}
	
	/**
	 * update Sales Order Head
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void updateSalesHeader(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.updateSalesHeader", param);
	}
	
	/**
	 * insert Sales Order Partner Function
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void insertSalesPf(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.insertSalesPf", param);
	}
	
	/**
	 * update Sales Order Partner Function
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void updateSalesPf(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.updateSalesPf", param);
	}
	
	/**
	 * insert Sales Order item 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void insertSalesItem(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.insertSalesItem", param);
	}
	
	/**
	 * insert Sales Order item 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void updateSalesItem(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.updateSalesItem", param);
	}
	
	/**
	 * insert Sales Order Scdl
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void insertSalesScdl(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.insertSalesScdl", param);
	}
	
	/**
	 * update Sales Order Scdl
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void updateSalesScdl(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.updateSalesScdl", param);
	}
	
	/**
	 * update Sales Order Scdl By Item
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void updateSalesScdlItem(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.updateSalesScdlItem", param);
	}
	
	/**
	 * Sales Order 리스트 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BMap selectSalesOrderInfo(BMap param) throws Exception{
		return (BMap) selectByPk("SalesOrderMapper.selectSalesOrderInfo", param);
	}

	/**
	 * Approval Item 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectApprovalItem(BMap param) throws Exception{
		return list("SalesOrderMapper.selectApprovalItem", param);
	}
	
	/**
	 * Approval info 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BMap selectApprovalInfo(BMap param) throws Exception{
		return (BMap) selectByPk("SalesOrderMapper.selectApprovalInfo", param);
	}
	
	/**
	 * Sales Order Partner Fnc 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectPartnerFnc(BMap param) throws Exception{
		return list("SalesOrderMapper.selectPartnerFnc", param);
	}
	
	/**
	 * Sales Order Partner Text 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectText(BMap param) throws Exception{
		return list("SalesOrderMapper.selectText", param);
	}
	
	/**
	 * Sales Order Item 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectItemTab(BMap param) throws Exception{
		return list("SalesOrderMapper.selectItemTab", param);
	}
	
	/**
	 * Approval List 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectApprovalList(BMap param) throws Exception{
		return list("SalesOrderMapper.selectApprovalList", param);
	}
	
	
	/**
	 * Sales Order Scdl 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectScdlTab(BMap param) throws Exception{
		return list("SalesOrderMapper.selectScdlTab", param);
	}

	/**
	 * Sales Order Scdl 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void updateApproval(BMap param) throws Exception{
		update("SalesOrderMapper.updateApproval", param);
	}
	
	/**
	 * Sales Order Scdl 조회
	 * @param tempMap
	 * @return
	 * @throws Exception
	 */
	public void updateApprovalAll(Map<String, Object> tempMap) throws Exception{
		update("SalesOrderMapper.updateApproval", tempMap);
	}
	
	/**
	 * Sales Order Scdl 조회
	 * @param tempMap
	 * @return
	 * @throws Exception
	 */
	public void updateApprovalAll_pre(Map<String, Object> tempMap) throws Exception{
		update("SalesOrderMapper.updateApproval_pre", tempMap);
	}
	
	/**
	 * Sales Order 승인 업데이트 (1차 승인)
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void updateApproval_pre(BMap param) throws Exception{
		update("SalesOrderMapper.updateApproval_pre", param);
	}
	
	/**
	 * 승인 여부 확인
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectApprovalCnt(BMap param) throws Exception{
		return (int)selectByPk("SalesOrderMapper.selectApprovalCnt", param);
	}
	

	/**
	 * 승인 여부 확인
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectApprovalCntAll(Map<String, Object> param) throws Exception{
		return (int)selectByPk("SalesOrderMapper.selectApprovalCnt", param);
	}
	
	/**
	 * Item Matl > Bom 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectBomList(BMap param) throws Exception{
		return list("SalesOrderMapper.selectBomList", param);
	}
	
	/**
	 * Partner Function 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectPfList(BMap param) throws Exception{
		return list("SalesOrderMapper.selectPfList", param);
	}
	
	/**
	 * Sales Order Partner Function List 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectPfPopList(BMap param) throws Exception{
		return list("SalesOrderMapper.selectPfPopList", param);
	}
	
	/**
	 * Sales Order Partner Function List 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectTextList(BMap param) throws Exception{
		return list("SalesOrderMapper.selectTextList", param);
	}
	
	public Object callSpIfErpSendOrderInsert(Map<String, Object> param) throws Exception {
		return selectByPk("SalesOrderMapper.callSpIfErpSendOrderInsert", param);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectIfSalesHeader(Map<String, Object> param) throws Exception{
		return (Map<String, Object>) selectByPk("SalesOrderMapper.selectIfSalesHeader", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIfSalesItems(Map<String, Object> param) throws Exception{
		return list("SalesOrderMapper.selectIfSalesItems", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIfSalesSchedules(Map<String, Object> param) throws Exception{
		return list("SalesOrderMapper.selectIfSalesSchedules", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIfSalesPartners(Map<String, Object> param) throws Exception{
		return list("SalesOrderMapper.selectIfSalesPartners", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIfSalesPartnerchanges(Map<String, Object> param) throws Exception{
		return list("SalesOrderMapper.selectIfSalesPartnerchanges", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIfSalesConditions(Map<String, Object> param) throws Exception{
		return list("SalesOrderMapper.selectIfSalesConditions", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIfSalesText(Map<String, Object> param) throws Exception{
		return list("SalesOrderMapper.selectIfSalesText", param);
	}
	
	public Object callSpIfErpSendOrderStsUpdate(Map<String, Object> param) throws Exception {
		return selectByPk("SalesOrderMapper.callSpIfErpSendOrderStsUpdate", param);
	}
	
	/**
	 * insert Sales Order Text
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void insertSalesText(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.insertSalesText", param);
	}
	
	/**
	 * update Sales Order Text
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void updateSalesText(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.updateSalesText", param);
	}
	
	/**
	 * get Sales TempSeq
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String getSalesTempSeq(Map<String, Object> param) throws Exception{
		return (String)selectByPk("SalesOrderMapper.getSalesTempSeq", param);
	}
	
	/**
	 * Delete Temp Sales Header Data
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void deleteSalesHeader(Map<String, Object> param) throws Exception{
		delete("SalesOrderMapper.deleteSalesHeader", param);
	}
	
	/**
	 * Delete Temp Sales Partner Fnc Data
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void deleteSalesPf(Map<String, Object> param) throws Exception{
		delete("SalesOrderMapper.deleteSalesPf", param);
	}
	
	/**
	 * Delete Temp Sales Partner Text Data
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void deleteSalesText(Map<String, Object> param) throws Exception{
		delete("SalesOrderMapper.deleteSalesText", param);
	}
	
	/**
	 * Delete Temp Sales Item Data
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void deleteSalesItem(Map<String, Object> param) throws Exception{
		delete("SalesOrderMapper.deleteSalesItem", param);
	}
	
	/**
	 * Delete Temp Sales Schedule Data
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void deleteSalesScdl(Map<String, Object> param) throws Exception{
		delete("SalesOrderMapper.deleteSalesScdl", param);
	}
	
	/**
	 * Sales Order Header Create
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void createSalesHeader(Map<String, Object> param) throws Exception{
		update("SalesOrderMapper.createSalesHeader", param);
	}
	
	/**
	 * Sales Order Partner Function Create
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void createSalesPf(Map<String, Object> param) throws Exception{
		update("SalesOrderMapper.createSalesPf", param);
	}
	
	/**
	 * Sales Order Text Create
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void createSalesText(Map<String, Object> param) throws Exception{
		update("SalesOrderMapper.createSalesText", param);
	}
	
	/**
	 * Sales Order Item Create
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void createSalesItem(Map<String, Object> param) throws Exception{
		update("SalesOrderMapper.createSalesItem", param);
	}
	
	/**
	 * Sales Order Scdl Create
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void createSalesScdl(Map<String, Object> param) throws Exception{
		update("SalesOrderMapper.createSalesScdl", param);
	}
	
	/**
	 * Sales Order Scdl Condition
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void createSalesCondition(Map<String, Object> param) throws Exception{
		update("SalesOrderMapper.createSalesCondition", param);
	}
	
	/**
	 * Confirm Sales Order
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void confirmSalesOrder(BMap param) throws Exception{
		update("SalesOrderMapper.confirmSalesOrder", param);
	}
	
	/**
	 * Salse Sales Order
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void deleteSalesOrder(BMap param) throws Exception{
		update("SalesOrderMapper.deleteSalesOrder", param);
	}
	
	/**
	 * 그리드용 Item Cat Grp 값 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String checkItemCatGrpCodeGrid(Map<String, Object> param) throws Exception{
		return (String)selectByPk("SalesOrderMapper.checkItemCatGrpCodeGrid", param);
	}
	
	/**
	 * 그리드용 Item Cat Grp 값 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String getItemCatGrpCodeGrid(Map<String, Object> param) throws Exception{
		return (String)selectByPk("SalesOrderMapper.getItemCatGrpCodeGrid", param);
	}
	
	/**
	 * Delete Temp Sales Price Condition
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void deletePriceCondition(Map<String, Object> param) throws Exception{
		delete("SalesOrderMapper.deletePriceCondition", param);
	}
	
	/**
	 * insert Sales Order Price Condition
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void insertPriceCondition(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.insertPriceCondition", param);
	}
	
	/**
	 * search sales grp
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CodeVO> selectSalesGrp(BMap param) throws Exception{
		return list("SalesOrderMapper.selectSalesGrp", param);
	}
	
	/**
	 * Sales Order Condition Tab 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectConditionTab(BMap param) throws Exception{
		return list("SalesOrderMapper.selectConditionTab", param);
	}
	
	/**
	 * Sales Order Condition Dtl Tab 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectConditionDtlTab(BMap param) throws Exception{
		return list("SalesOrderMapper.selectConditionDtlTab", param);
	}
	
	/**
	 * Sales Order Header Copy
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void copySalesHeader(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.copySalesHeader", param);
	}
	
	/**
	 * Sales Order Partner Function Copy
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void copySalesPf(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.copySalesPf", param);
	}
	
	/**
	 * Sales Order Text Copy
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void copySalesText(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.copySalesText", param);
	}
	
	/**
	 * Sales Order Item Copy
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void copySalesItem(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.copySalesItem", param);
	}
	
	/**
	 * Item Cat Group 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CodeVO> selectItemCatCode(BMap param) throws Exception{
		return list("SalesOrderMapper.selectItemCatCode", param);
	}
	
	/**
	 * Sales Order Customer 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectCustomerInfo(BMap param) throws Exception{
		return list("SalesOrderMapper.selectCustomerInfo", param);
	}

	
	/**
	 * Report Header 데이터 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BMap selectQuotationReport(Map<String, Object> param) throws Exception{
		return (BMap) selectByPk("SalesOrderMapper.selectQuotationReport", param);
	}

	/**
	 * ContactPerson 데이터 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BMap selectContactPersonReport(Map<String, Object> param) throws Exception{
		return (BMap) selectByPk("SalesOrderMapper.selectContactPersonReport", param);
	}

	/**
	 * selectByOrderOf 데이터 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BMap selectByOrderOf(Map<String, Object> param) throws Exception{
		return (BMap) selectByPk("SalesOrderMapper.selectByOrderOf", param);
	}

	/**
	 * selectCreateFor 데이터 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BMap selectCreateFor(Map<String, Object> param) throws Exception{
		return (BMap) selectByPk("SalesOrderMapper.selectCreateFor", param);
	}
	
	
	
	/**
	 * Customer Address 데이터 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BMap selectCustAddr(Map<String, Object> param) throws Exception{
		return (BMap) selectByPk("SalesOrderMapper.selectCustAddr", param);
	}
	
	/**
	 * Sales Order Partner Function List 의 Ship조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> getShipToBySold(Map<String, Object> param) throws Exception{
		return list("SalesOrderMapper.getShipToBySold", param);
	}

	/**
	 * Sales Order Modi Tms조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String getModiTms(Map<String, Object> param) throws Exception{
		return (String)selectByPk("SalesOrderMapper.getModiTms", param);
	}
	
	/**
	 * Approval Id 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectApprovalId() throws Exception{
		return list("SalesOrderMapper.selectApprovalId","");
	}
	
	/**
	 * Sales Order 전송 여부 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public int getIfyn(BMap param) throws Exception{
		return (int)selectByPk("SalesOrderMapper.getIfyn", param);
	}
	
	/**
	 * 그리드용 Item Cat Grp 값 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap>  selectBatchPopList(Map<String, Object> param) throws Exception{
		return list("SalesOrderMapper.selectBatchPopList", param);
	}
	
	/**
	 * 그리드용 Item Cat Grp 값 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BMap getApprData(BMap param) throws Exception{
		return (BMap) selectByPk("SalesOrderMapper.getApprData", param);
	}
	
	/**
	 * Delete Sales Order Appr
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void deleteAppr(Map<String, Object> param) throws Exception{
		delete("SalesOrderMapper.deleteAppr", param);
	}
	
	/**
	 * Insert Sales Order Appr
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void insertAppr(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.insertAppr", param);
	}
	
	/**
	 * Interface Sts 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String getIfSts(Map<String, Object> param) throws Exception{
		return (String)selectByPk("SalesOrderMapper.getIfSts", param);
	}
	
	/**
	 * update Sales Order Head
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void updateQuotToSales(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.updateQuotToSales", param);
	}
	
	
	/**
	 * Update App Price
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void updateNetPrice(Map<String, Object> param) throws Exception{
		update("SalesOrderMapper.updateNetPrice", param);
	}
	
	@SuppressWarnings("unchecked")
	public void updateNetPriceNull(Map<String, Object> param) throws Exception{
		update("SalesOrderMapper.updateNetPriceNull", param);
	}
	
	/**
	 * Sales Order Closed(Header).
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void salesOrderClosedByHeader(BMap param) throws Exception{
		update("SalesOrderMapper.salesOrderClosedByHeader", param);
	}
	
	/**
	 * Sales Order Closed(Item).
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void salesOrderClosedByItem(BMap param) throws Exception{
		update("SalesOrderMapper.salesOrderClosedByItem", param);
	}
	
	/**
	 * Release Credit Block
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void releaseCreditBlock(BMap param) throws Exception{
		update("SalesOrderMapper.releaseCreditBlock", param);
	}
	
	/**
	 * get Partner Customer
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BMap getPartnerData(BMap param) throws Exception{
		return (BMap) selectByPk("SalesOrderMapper.getPartnerData", param);
	}
	
	/**
	 * get Contact Person
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BMap getContactPersonData(BMap param) throws Exception{
		return (BMap) selectByPk("SalesOrderMapper.getContactPersonData", param);
	}
	
	/**
	 * History Tab 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectHisTab(BMap param) throws Exception{
		return list("SalesOrderMapper.selectHisTab", param);
	}
	
	/**
	 * search deli plant
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CodeVO> setDeliPlantCombo(BMap param) throws Exception{
		return list("SalesOrderMapper.setDeliPlantCombo", param);
	}
	
	/**
	 * get Contact Person
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String selectSegement(BMap param) throws Exception{
		return (String) selectByPk("SalesOrderMapper.selectSegement", param);
	}
	
	/**
	 * get Contact Person
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String getItemCondition(Map<String, Object> param) throws Exception{
		return (String) selectByPk("SalesOrderMapper.getItemCondition", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<BMap> searchExternalList(BMap param) throws Exception{
		return list("SalesOrderMapper.searchExternalList", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<BMap> searchExternalItemList(BMap param) throws Exception{
		return list("SalesOrderMapper.searchExternalItemList", param);
	}
	
	/**
	 * Item Plant Cd조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String getPlantCD(Map<String, Object> param) throws Exception{
		return (String)selectByPk("SalesOrderMapper.getPlantCD", param);
	}
	
	/**
	 * get Contact Person
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String setGridForm(Map<String, Object> param) throws Exception{
		return (String) selectByPk("SalesOrderMapper.setGridForm", param);
	}
	
	/**
	 * 승인 Country Head 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String getCounrtyHead(Map<String, Object> param) throws Exception{
		return (String) selectByPk("SalesOrderMapper.getCounrtyHead", param);
	}
	
	/**
	 * 승인 Sales Planning 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String getSalesPlanning(Map<String, Object> param) throws Exception{
		return (String) selectByPk("SalesOrderMapper.getSalesPlanning", param);
	}
	
	/**
	 * Move APPR
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void moveAppr(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.moveAppr", param);
	}

	@SuppressWarnings("unchecked")
	public List<BMap> selectPDFConditionTab(BMap param) throws Exception{
		return list("SalesOrderMapper.selectPDFConditionTab", param);
	}
	
	/**
	 * update Sales Order Head
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void syncSalesOrder(BMap param) throws Exception{
		insert("SalesOrderMapper.syncSalesOrder", param);
	}
	
	/**
	 * update Sales Order Head
	 * @param param
	 * @return
	 * @throws Exception
	 */	
	public void syncScheduline(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.syncScheduline", param);
	}
	
	/**
	 * update Sales Order Head
	 * @param param
	 * @return
	 * @throws Exception
	 */	
	public void syncItemUpdate(Map<String, Object> param) throws Exception{
		update("SalesOrderMapper.syncItemUpdate", param);
	}
	
	/**
	 * update Sales Order Head
	 * @param param
	 * @return
	 * @throws Exception
	 */	
	public void syncItemInsert(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.syncItemInsert", param);
	}
	
	/**
	 * update Sales Order Head
	 * @param param
	 * @return
	 * @throws Exception
	 */	
	public void syncCondition(Map<String, Object> param) throws Exception{
		insert("SalesOrderMapper.syncCondition", param);
	}

	@SuppressWarnings("unchecked")
	public String selectItemWP(Map<String, Object> param) throws Exception{
		return (String) selectByPk("SalesOrderMapper.selectItemWP", param);
	}
	
	/**
	 * exist item.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectExistsItem(Map<String, Object> param) throws Exception{
		return (Map<String, Object>) selectByPk("SalesOrderMapper.selectExistsItem", param);
	}
	
	
	/**
	 * update Sales Order Head
	 * @param param
	 * @return
	 * @throws Exception
	 */	
	public void syncItemDelete(Map<String, Object> param) throws Exception{
		delete("SalesOrderMapper.syncItemDelete", param);
	}

	@SuppressWarnings("unchecked")
	public List<BMap> selectItemAppr(BMap param) throws Exception{
		return list("SalesOrderMapper.selectItemAppr", param);
	}
	
	@SuppressWarnings("unchecked")
	public BMap getPDFHeaderData(BMap param) throws Exception{
		return (BMap) selectByPk("SalesOrderMapper.getPDFHeaderData", param);
	}

	
	@SuppressWarnings("unchecked")
	public List<BMap>  selectItemPlant(Map<String, Object> param) throws Exception{
		return list("SalesOrderMapper.selectItemPlant", param);
	}

	@SuppressWarnings("unchecked")
	public List<BMap>  selectStoreLocPopList(Map<String, Object> param) throws Exception{
		return list("SalesOrderMapper.selectStoreLocPopList", param);
	}
	
	/**
	 * Sales Order Header Create
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void updateAttachFile(BMap param) throws Exception{
		update("SalesOrderMapper.updateAttachFile", param);
	}

}