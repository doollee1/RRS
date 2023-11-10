package bt.common.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bt.btframework.utils.BMap;
import bt.common.dao.MainDao;

@Service("MainService")
public class MainService {
	@Resource(name="MainDao")
	private MainDao mainDao;
	
	/**
	 * 메인화면 공지사항 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectMainNotice(BMap param) throws Exception{
		return mainDao.selectMainNotice(param);
	}
	
	/**
	 * 메인화면 Order Status
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectOrderStatus(BMap param) throws Exception{
		return mainDao.selectOrderStatus(param);
	}

	/**
	 * 메인화면 Quotation
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectQuotationStatus(BMap param) throws Exception{
		return mainDao.selectQuotationStatus(param);
	}
}
