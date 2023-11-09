package bt.Bom.dao;

import java.util.List;

import org.apache.ibatis.session.ResultHandler;
import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("BOMSearchDao")
public class BOMDao extends DBAbstractMapper {
	
	/**
	 * BOM 정보 조회
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectMaterialList(BMap param )throws Exception{
		return list("BOMMapper.selectMaterialList", param);
	}

	/**
	 * Material 코드 여부 조회
	 */
	@SuppressWarnings("unchecked")
	public List<BMap>  selectMaterialCode(BMap param )throws Exception{
		return list("BOMMapper.selectMaterialCode", param);
	}
	
	/**
	 * Material 코드 여부 조회
	 */
	@SuppressWarnings("unchecked")
	public List<BMap>  selectBOMList(BMap param )throws Exception{
		return list("BOMMapper.selectBOMList", param);
	}	

	/**
	 * 엑셀 BOM정보 조회
	 */
	@SuppressWarnings("unchecked")
	public void selectBOMListAll(BMap param, ResultHandler<?> handler)throws Exception{
		listToOutUsingResultHandler("BOMMapper.selectBOMListAll", param, handler);
	}	
}
