package bt.system.service;


import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import bt.btframework.utils.BMap;
import bt.system.dao.MyMenuDao;

/**
 * 마이메뉴 서비스
 * 
 * @author DOOLLEE2
 *
 */
@Service("MyMenuService")
public class MyMenuService {

	private static final Logger logger = LoggerFactory.getLogger(MyMenuService.class);
	
	@Resource(name = "MyMenuDao")
	private MyMenuDao mymenuDao;
	
	//전체 메뉴 리스트 검색
	public List<BMap> getMenuList(BMap param) throws Exception {
		List<BMap> resultMenuList = mymenuDao.getMenuList(param);
		
		return resultMenuList;
	
	}
	//마이 메뉴 리스트 조회
	public List<BMap> getMyMenuList(BMap param) throws Exception {
		List<BMap> resultMenuList = mymenuDao.getMyMenuList(param);
		
		return resultMenuList;
	}
	//마이 메뉴 리스트 저장
	public void saveMyMenuList(BMap param, List<BMap> paramList) throws Exception {
		param.put("USER_ID", param.getString("USER_ID"));
		mymenuDao.delMyMenuList(param);
		
		for (int i=0; i<paramList.size(); i++) {
			BMap saveData = new BMap(paramList.get(i));
			saveData.put("USER_ID", param.getString("USER_ID"));
			mymenuDao.saveMyMenuList(saveData);
		}	
	}
	
		
	/**
	 * 마이메뉴 개별 저장 서비스
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Boolean saveMyMenuData(BMap param) throws Exception {
		
		logger.info("====== 마이메뉴 개별 저장서비스 =====");
		
		Boolean isValid = true;
		int cnt = mymenuDao.selectMyMenuData(param);
		logger.info("===== 갯수 : "+cnt);
		
		if(cnt == 0){
			
			//마이메뉴 개별 저장
			mymenuDao.saveMyMenuList(param);
		}else{
			
			//마이메뉴 개별 삭제
			int resultDel = mymenuDao.delMyMenu(param);
			logger.info("===== 마이메뉴개별삭제 결과 : "+resultDel);
			
			isValid = false;
		}
		return isValid;
	}
	
	public Boolean selectMyMenuData(BMap param) throws Exception {
		
		Boolean isValid = true;
		int cnt = mymenuDao.selectMyMenuData(param);
		
		if(cnt > 0){
			isValid = false;
		}else{
			isValid = true;
		}
		return isValid;
	}
}
