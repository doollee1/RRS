package bt.common.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bt.btframework.utils.BMap;
import bt.common.dao.MenuDao;

@Service("MenuService")
public class MenuService {
	@Resource(name = "MenuDao")
	private MenuDao menuDao;
	
	/**
	 * 로그인 유저 대메뉴 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectSystemMenuList(BMap param) throws Exception{
		return menuDao.selectSystemMenuList(param);
	}
	
	/**
	 * 로그인한 유저 메뉴 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectMenuList(BMap param) throws Exception{
		return menuDao.selectMenuList(param);
	}
	
	/**
	 * 로그인한 유저 특정 프로그램의 버튼 권한 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public String selectButtonList(BMap param) throws Exception{
		String auth = "";
		String LV = "";
		List<BMap> menuMap = menuDao.selectButtonList(param);  //여러 권한을 가지고 있는 사용자 처리 위해 리스트 가져옴
//		String menuArr[] = {"N","N","N","N","N","N","N","N","N","N","N","N","N","N"};
		String menuArr[] = {"Y","Y","Y","Y","Y","Y","Y","Y","Y","Y","Y","Y","Y","Y"};
		
		//여러 권한을 가지고 있을 때 한개의 권한에서 Y가 존재 할시 무조건 Y로 처리
		for(int i = 0; i < menuMap.size(); i++){
			BMap map = new BMap(menuMap.get(i));
			for(int j = 0; j < map.getString("AUTH").length(); j++){
				if(!"Y".equals(menuArr[j])){
					if("Y".equals(map.getString("AUTH").substring(j, j + 1))){
						menuArr[j] = "Y";
					}
				}
			}
			LV = map.getString("PROG_LV");
		}
		
		//리턴해 줄 버튼 권한을 String화 시킴
		for(int i = 0; i < menuArr.length; i++){
			auth += menuArr[i];
		}
		
		return auth + LV;
	}
	
	public String selectAuth(BMap param) throws Exception{
		return menuDao.selectAuth(param); 
	}
	
}
