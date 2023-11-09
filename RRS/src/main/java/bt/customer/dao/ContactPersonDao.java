package bt.customer.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("ContactPersonDao")
public class ContactPersonDao extends DBAbstractMapper {
		
	/**
	 * Contact Person 정보 추가 (INSERT)
	 */
	public void insertContactPerson(BMap param) {
		insert("ContactPersonMapper.insertContactPerson", param);
	}
	
	/**
	 * Contact Person 정보 수정 (UPDATE)
	 */
	public void updateContactPerson(BMap param) {
		update("ContactPersonMapper.updateContactPerson", param);
	}
	
	/**
	 * Contact Person List 조회
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> getContactList(BMap param) throws Exception {
		return list("ContactPersonMapper.getContactList", param);
	}
	
	/**
	 * Contact Person Info 조회
	 */
	public BMap getContactInfo(BMap param) throws Exception {
		return (BMap) selectByPk("ContactPersonMapper.getContactInfo", param);
	}
	
	/**
	 * Contact Person Popup 조회
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectContactPersonPopup(BMap param) throws Exception {
		return list("ContactPersonMapper.selectContactPersonPopup", param);
	}
	
	/**
	 * Contact Person Popup 조회
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectContactPersonList(BMap param) throws Exception {
		return list("ContactPersonMapper.selectContactPersonList", param);
	}
		
	/**
	 * Contact Person Popup2 조회
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectContactPersonPopup2(BMap param) throws Exception {
		return list("ContactPersonMapper.selectContactPersonPopup2", param);
	}
	
	/**
	 * Vendor Popup 조회
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectVendorPopup(BMap param) throws Exception {
		return list("ContactPersonMapper.selectVendorPopup", param);
	}

	/**
	 * Customer count 조회
	 */
	@SuppressWarnings("unchecked")
	public int selectCustomerCnt(BMap param) throws Exception {
		return (int)selectByPk("ContactPersonMapper.selectCustomerCnt", param);
	}
}
