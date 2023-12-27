package bt.common.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository
public class QnaDao extends DBAbstractMapper{

	private static final Logger logger=LoggerFactory.getLogger(QnaDao.class);
	
	public List<BMap> QnaSelectList(BMap param) throws Exception {
		return list("QnaMapper.QnaSelectList",param);
	}
	
	public List<BMap> qnaViewDetail(BMap param) throws Exception {
		return list("QnaMapper.qnaViewDetail",param);
	}
	
	public List<BMap> qnaViewAnswer(BMap param) throws Exception{
		return list("QnaMapper.qnaViewAnswer",param);
	}
	public void qnaInsertAnswer(BMap param) throws Exception{
		insert("QnaMapper.qnaInsertAnswer",param);
		update("QnaMapper.qnaStsUpdate",param);
	}
	
	
	
}
