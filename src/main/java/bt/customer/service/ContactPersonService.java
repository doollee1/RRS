package bt.customer.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bt.btframework.utils.BMap;
import bt.customer.dao.ContactPersonDao;
import bt.customer.dao.CustomerDao;

@Service("ContactPersonService")
public class ContactPersonService {
	
	@Resource(name = "ContactPersonDao")
	private ContactPersonDao contactPersonDao;
	
	@Resource
	private CustomerDao customerDao;
	
	@Resource
	private CustomerService customerService;
	/**
	 *  Contact Person 저장
	 */
	public void saveContactPerson(BMap param) throws Exception {

		if(param.get("ISNEW").equals("1")){
			contactPersonDao.insertContactPerson(param);
		}else {
			contactPersonDao.updateContactPerson(param);
		}
		
		String accountGr = (String) param.get("ACCOUNT_GR");
		if (!accountGr.equals("Z005")) {
			customerDao.callSpIfErpSendCustInsert(param);
			customerService.callRfc(param);
			param.put("IF_STS", "D");
			customerDao.callSpIfErpSendCustStsUpdate(param);
		}
	}
	
	/**
	 * Contact Person List 조회
	 */
	public List<BMap> getContactList(BMap param) throws Exception {
		return contactPersonDao.getContactList(param);
	}
	
	/**
	 * Contact Person Info 조회
	 */
	public BMap getContactInfo(BMap param) throws Exception {
		return contactPersonDao.getContactInfo(param);
	}
	
	/**
	 * Contact Person Popup 조회
	 */
	public List<BMap> selectContactPersonPopup(BMap param) throws Exception {
		return contactPersonDao.selectContactPersonPopup(param);
	}
	
	/**
	 * Contact Person Popup 조회
	 */
	public List<BMap> selectContactPersonList(BMap param) throws Exception {
		return contactPersonDao.selectContactPersonList(param);
	}
	
	
	/**
	 * Contact Person Popup 조회
	 */
	public List<BMap> selectContactPersonPopup2(BMap param) throws Exception {
		return contactPersonDao.selectContactPersonPopup2(param);
	}
	
	/**
	 * Contact Person Popup 조회
	 */
	public List<BMap> selectVendorPopup(BMap param) throws Exception {
		return contactPersonDao.selectVendorPopup(param);
	}
	
	/**
	 *  Contact Person 저장
	 */
	public int selectCustomerCnt(BMap param) throws Exception {
		return contactPersonDao.selectCustomerCnt(param);
	}
	
}
