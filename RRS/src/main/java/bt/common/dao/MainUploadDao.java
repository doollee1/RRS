package bt.common.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("MainUploadDao")
public class MainUploadDao extends DBAbstractMapper {

	public void insertMainUpload(BMap param) throws Exception{
		insert("MainUploadMapper.insertMainUpload", param);
	}

	public void deleteMainUpload() throws Exception {
		delete("MainUploadMapper.deleteMainUpload", null);
	}
	
	public Object insertMainDS(Map<String, Object> param) throws Exception {
		return selectByPk("MainUploadMapper.insertMainDS", param);
	}
}
