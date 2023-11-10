package bt.system.service;


import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.system.dao.MyMenuDao;

@Service("MyMenuService")
public class MyMenuService {

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
	
	//마이 메뉴 리스트 저장
	public Boolean saveMyMenuData(BMap param) throws Exception {
		
		Boolean isValid = true;
		int cnt = mymenuDao.selectMyMenuData(param);
		
		if(cnt == 0){
			mymenuDao.saveMyMenuList(param);
		}else{
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
