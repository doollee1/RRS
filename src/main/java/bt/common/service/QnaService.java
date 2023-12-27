package bt.common.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import bt.btframework.utils.BMap;
import bt.common.dao.QnaDao;
import bt.reserve.service.ReserveService;

@Service
public class QnaService {

	private static final Logger logger = LoggerFactory.getLogger(QnaService.class);
	
	
	@Resource
	private QnaDao qnaDao;
	
	public List<BMap> qnaSelectList(BMap param) throws Exception {
		return qnaDao.QnaSelectList(param);
	}
	public List<BMap> qnaViewDetail(BMap param) throws Exception {
		return qnaDao.qnaViewDetail(param);
	}
	public List<BMap> qnaViewAnswer(BMap param) throws Exception {
		return qnaDao.qnaViewAnswer(param);
	}
	public Boolean qnaInsertAnswer(BMap param) throws Exception {
		Boolean isValid = true;

        try {
        
        	qnaDao.qnaInsertAnswer(param);
		 
		} catch (Exception e) {
		    // TODO: handle exception
			e.printStackTrace();
			isValid = false;
		}
		return isValid;
	}
}
