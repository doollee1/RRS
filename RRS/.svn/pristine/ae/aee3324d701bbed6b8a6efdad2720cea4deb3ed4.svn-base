package bt.api.dao;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;

@Repository
public class APIDao extends DBAbstractMapper {
	private static final Logger logger = LoggerFactory.getLogger(APIDao.class);
	
	public void insertLead(Map<String, Object> param) throws Exception {
		insert("ApiMapper.insertLead", param);
	}
	
	public void callSpIfMellowRecvLead() throws Exception {
		selectByPk("ApiMapper.callSpIfMellowRecvLead", "");
	}
}
