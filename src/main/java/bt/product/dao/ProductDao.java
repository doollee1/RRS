package bt.product.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("ProductDao")
public class ProductDao extends DBAbstractMapper {
	
	/**
	 * Product Info 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectProductInfo(BMap param )throws Exception{
		return list("ProductMapper.selectProductInfo", param);
	}

	/**
    * 기준년도 셀렉트 항목 가져오기
    * @param param
    * @return
    * @throws Exception
    */
   @SuppressWarnings("unchecked")
   public List<BMap> selectBasYY(BMap param) throws Exception{
      return list("ProductMapper.selectBasYY", param);
   }
   
	/**
	 * 공통코드 리스트 가져오기
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectGetCommonCode(BMap param) throws Exception{
		return list("ProductMapper.selectGetCommonCode", param);
	}
	
	/**
    * 시즌구분 셀렉트 항목 가져오기
    * @param param
    * @return
    * @throws Exception
    */
   @SuppressWarnings("unchecked")
   public List<BMap> selectSeason(BMap param) throws Exception{
      return list("ProductMapper.selectSeason", param);
   }
   
	/**
    * 항목구분 셀렉트 항목 가져오기
    * @param param
    * @return
    * @throws Exception
    */
   @SuppressWarnings("unchecked")
   public List<BMap> selectHdng(BMap param) throws Exception{
      return list("ProductMapper.selectHdng", param);
   }
   
	/**
    * 조건구분 셀렉트 항목 가져오기
    * @param param
    * @return
    * @throws Exception
    */
   @SuppressWarnings("unchecked")
   public List<BMap> selectCond(BMap param) throws Exception{
      return list("ProductMapper.selectCond", param);
   }
   
	/**
	 * Product Info 등록
	 * @param param
	 * @throws Exception
	 */
	public void insertProductInfo(BMap param )throws Exception{
		insert("ProductMapper.insertProductInfo", param);
	}
	
	/**
	 * Product Info 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateProductInfo(BMap param )throws Exception{
		update("ProductMapper.updateProductInfo", param);
	}
	
	/**
	 * Product Info 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteProductInfo(BMap param )throws Exception{
		delete("ProductMapper.deleteProductInfo", param);
	}
	
	
	/**
	 * Period Info 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectPeriodInfo(BMap param )throws Exception{
		return list("ProductMapper.selectPeriodInfo", param);
	}
	
	/**
	 * Period Info 등록
	 * @param param
	 * @throws Exception
	 */
	public void insertPeriodInfo(BMap param )throws Exception{
		insert("ProductMapper.insertPeriodInfo", param);
	}
	
	/**
	 * Period Info 수정
	 * @param param
	 * @throws Exception
	 */
	public void updatePeriodInfo(BMap param )throws Exception{
		update("ProductMapper.updatePeriodInfo", param);
	}
	
	/**
	 * Product Info 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deletePeriodInfo(BMap param )throws Exception{
		delete("ProductMapper.deletePeriodInfo", param);
	}
	
	
	/**
	 * Period Copy 등록
	 * @param param
	 * @throws Exception
	 */
	public void insertPeriodCopyInfo(BMap param )throws Exception{
		insert("ProductMapper.insertPeriodCopyInfo", param);
	}
	
	/**
	 * Product Copy 등록
	 * @param param
	 * @throws Exception
	 */
	public void insertProductCopyInfo(BMap param )throws Exception{
		insert("ProductMapper.insertProductCopyInfo", param);
	}
	
	
	/**
	 * Period Info PopUp 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectPeriodPopUp(BMap param )throws Exception{
		return list("ProductMapper.selectPeriodPopUp", param);
	}
	
	/**
	 * 예약테이블 취소상태 확인
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectReserveStatus(BMap param )throws Exception{
		return list("ProductMapper.selectReserveStatus", param);
	}
	/**
	 * 미팅샌딩 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectMSendingInfoList(Map<String, Object> param)throws Exception{
		return list("ProductMapper.selectMSendingInfoList", param);
	}
	/**
	 * 야간할증비용 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectExtraChargeInfoList(Map<String, Object> param)throws Exception{
		return list("ProductMapper.selectExtraChargeInfoList", param);
	}
	/**
	 * 공통코드 참조 리스트 가져오기
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectRefCode(BMap param) throws Exception{
		return list("ProductMapper.selectRefCode", param);
	}
	/**
	 * 미팅샌딩 이용금액 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateMSendingCost(BMap param )throws Exception{
		update("ProductMapper.updateMSendingCost", param);
	}
	
}