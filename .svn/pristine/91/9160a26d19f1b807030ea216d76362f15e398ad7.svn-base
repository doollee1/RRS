package bt.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;


@Repository("MyMenuDao")
public class MyMenuDao extends DBAbstractMapper {
	/**
	 * 전체 메뉴 리스트 조회 (SELECT)
	 * @return {List} 전체 메뉴 리스트
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> getMenuList(BMap param) throws Exception {
		return list("SystemMapper.getMenuList", param);
	}
	
	/**
	 * 마이 메뉴 리스트 조회 (SELECT)
	 * @return {List} 마이 메뉴 리스트
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> getMyMenuList(BMap param) throws Exception {
		return list("SystemMapper.getMyMenuList", param);
	}
	
	/**
	 * 마이 메뉴 저장 (UPDATE)
	 */
	public void saveMyMenuList(BMap param) {
		update("SystemMapper.saveMyMenuList", param);
	}

	/**
	 * 마이 메뉴 삭제 (DELETE)
	 */
	public void delMyMenuList(BMap param) {
		delete("SystemMapper.delMyMenuList", param);
	}
	
	/**
	 * 마이 메뉴 정보 카운트
	 */
	public int selectMyMenuData(BMap param) throws Exception{
		return (int)selectByPk("SystemMapper.selectMyMenuData", param);
	}
	
}