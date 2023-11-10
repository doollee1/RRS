package bt.product.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("ProductDao")
public class ProductDao extends DBAbstractMapper {
	/**
	 * Product 리스트 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BMap selectProductInfo(BMap param) throws Exception{
		return (BMap) selectByPk("ProductMapper.selectProductInfo", param);
	}
	
	/**
	 * Product Desc 리스트 조회.
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectDescList(BMap param)throws Exception{
		return list("ProductMapper.selectDescList", param);
	}
	
	/**
	 * Product Unit of Measeur 리스트 조회.
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectUOMList(BMap param)throws Exception{
		return list("ProductMapper.selectUOMList", param);
	}
	
	/**
	 * Product Basic Data Text 리스트 조회.
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectBasicList(BMap param)throws Exception{
		return list("ProductMapper.selectBasicList", param);
	}
	
	/**
	 * Product PopUp List 조회.
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectMatlPopList(BMap param)throws Exception{
		return list("ProductMapper.selectMatlPopList", param);
	}
	
	/**
	 * Product Code Check
	 */
	public String chkMatlCd(BMap param)throws Exception{
		return (String)selectByPk("ProductMapper.chkMatlCd", param);
	}
	
	/**
	 * Product Data 조회.
	 */
	@SuppressWarnings("unchecked")
	public BMap getMatlData(BMap param)throws Exception{
		return (BMap) selectByPk("ProductMapper.getMatlData", param);
	}
}