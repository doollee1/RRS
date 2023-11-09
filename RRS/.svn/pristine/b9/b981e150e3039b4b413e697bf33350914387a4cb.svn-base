package bt.common.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("MailManagementDao")
public class MailManagementDao extends DBAbstractMapper {
	/**
	 * search Mail Title
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> searchMailTitle(BMap param) throws Exception{
		return list("MailManagemnetMapper.searchMailTitle", param);
	}

	/**
	 * search Mail Recipient
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> searchMailRecipient(BMap param) throws Exception{
		return list("MailManagemnetMapper.searchMailRecipient", param);
	}
	
	/**
	 * search Mail Contents
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> searchMailContents(BMap param) throws Exception{
		return list("MailManagemnetMapper.searchMailContents", param);
	}
	
	@SuppressWarnings("unchecked")
	public void insertMailBody(Map<String, Object> param) throws Exception{
		insert("MailManagemnetMapper.insertMailBody", param);		
	}
	
	@SuppressWarnings("unchecked")
	public void updateMailBody(Map<String, Object> param) throws Exception{
		insert("MailManagemnetMapper.updateMailBody", param);		
	}
	
	@SuppressWarnings("unchecked")
	public void insertMailTitle(Map<String, Object> param) throws Exception{
		insert("MailManagemnetMapper.insertMailTitle", param);		
	}
	
	@SuppressWarnings("unchecked")
	public void updateMailTitle(Map<String, Object> param) throws Exception{
		insert("MailManagemnetMapper.updateMailTitle", param);		
	}
	
	@SuppressWarnings("unchecked")
	public void insertMailRecipient(Map<String, Object> param) throws Exception{
		insert("MailManagemnetMapper.insertMailRecipient", param);		
	}

	@SuppressWarnings("unchecked")
	public void updateMailRecipient(Map<String, Object> param) throws Exception{
		insert("MailManagemnetMapper.updateMailRecipient", param);		
	}

	@SuppressWarnings("unchecked")
	public void deleteMailRecipient(Map<String, Object> param) throws Exception{
		insert("MailManagemnetMapper.deleteMailRecipient", param);		
	}
	
	@SuppressWarnings("unchecked")
	public BMap selectMailContents(BMap param) throws Exception{
		return (BMap) selectByPk("MailManagemnetMapper.selectMailContents", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<BMap> selectMailTitle(BMap param) throws Exception{
		return list("MailManagemnetMapper.selectMailTitle", param);
	}

	@SuppressWarnings("unchecked")
	public List<BMap> selectMailRecipient(BMap param) throws Exception{
		return list("MailManagemnetMapper.selectMailRecipient", param);
	}
	
	@SuppressWarnings("unchecked")
	public BMap mailPreview(BMap param) throws Exception{
		return (BMap) selectByPk("MailManagemnetMapper.mailPreview", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<BMap> selectMailPreview(BMap param) throws Exception{
		return list("MailManagemnetMapper.selectMailPreview", param);
	}

	@SuppressWarnings("unchecked")
	public void insertEmailHistory(Map<String, Object> param) throws Exception{
		insert("MailManagemnetMapper.insertEmailHistory", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<BMap> selectMailHistory(BMap param) throws Exception{
		return list("MailManagemnetMapper.selectMailHistory", param);
	}

	public List<BMap> selectFromInfo(Map<String, Object> param) {
		return list("MailManagemnetMapper.selectFromInfo", param);
	}

	public List<BMap> selectApprList(Map<String, Object> param) {
		return list("MailManagemnetMapper.selectApprList", param);
	}

}
