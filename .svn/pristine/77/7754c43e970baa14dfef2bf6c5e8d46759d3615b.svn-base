package bt.common.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("MenuDao")
public class MenuDao extends DBAbstractMapper {
	/**
	 * 로그인한 유저의 대메뉴 조회 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectSystemMenuList(BMap param) throws Exception{
		return list("MenuMapper.selectSystemMenuList", param);
	}
	
	/**
	 * 로그인한 유저의 메뉴 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectMenuList(BMap param) throws Exception{
		return list("MenuMapper.selectMenuList", param);
	}
	
	/**
	 * 로그인한 유저의 특정 메뉴의 사용 버튼 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectButtonList(BMap param) throws Exception{
		return list("MenuMapper.selectButtonList", param);
	}
	
	@SuppressWarnings("unchecked")
	public String selectAuth(BMap param) throws Exception{
		return (String)selectByPk("MenuMapper.selectAuth", param);
	}
	
}
