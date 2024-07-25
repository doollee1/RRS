package bt.product.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.product.dao.ProductDao;

@Service("ProductService")
public class ProductService {
	@Resource(name = "ProductDao")
	private ProductDao productDao;
	
	/**
	 * Product Info 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectProductInfo(BMap param) throws Exception{
		return productDao.selectProductInfo(param);
	}
	   
	/**
    * 기준년도 셀렉트 항목 가져오기
    * @param param
    * @return
    * @throws Exception
    */
   public List<BMap> selectBasYY(BMap param) throws Exception {
      return productDao.selectBasYY(param);
   }
   
	/**
	 * 공통코드 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectGetCommonCode(BMap param) throws Exception {
		return productDao.selectGetCommonCode(param);
	}
   
	/**
    * 시즌구분 셀렉트 항목 가져오기
    * @param param
    * @return
    * @throws Exception
    */
   public List<BMap> selectSeason(BMap param) throws Exception {
      return productDao.selectSeason(param);
   }
   
	/**
    * 항목구분 셀렉트 항목 가져오기
    * @param param
    * @return
    * @throws Exception
    */
   public List<BMap> selectHdng(BMap param) throws Exception {
      return productDao.selectHdng(param);
   }
   
	/**
    * 조건구분 셀렉트 항목 가져오기
    * @param param
    * @return
    * @throws Exception
    */
   public List<BMap> selectCond(BMap param) throws Exception {
      return productDao.selectCond(param);
   }
   
	/**
	 * Product Info 저장
	 * @param param
	 * @return 
	 * @throws Exception
	 */
	public Boolean saveProductInfo(BMap param) throws Exception{
		Boolean isValid = true;
		param.put("LOGIN_USER", LoginInfo.getUserId());
		if(param.getString("modify").equals("1")){
			productDao.updateProductInfo(param); // 상품 수정
		} else {
			productDao.insertProductInfo(param); //상품 등록
		}
		return isValid;
	}
	
	/**
	 * Product Info 삭제
	 * @param param
	 * @return 
	 * @return 
	 * @throws Exception
	 */
	public Boolean deleteProductInfo(BMap param) throws Exception{
		Boolean isValid = true;
		try {
			productDao.deleteProductInfo(param); // 상품 삭제;
		}
		catch (Exception e) {
			e.getStackTrace();
			isValid = false;
		}
		return isValid;
	}
	
	
	/**
	 * Period Info 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectPeriodInfo(BMap param) throws Exception{
		return productDao.selectPeriodInfo(param);
	}
	
	/**
	 * Period Info 저장
	 * @param param
	 * @return 
	 * @throws Exception
	 */
	public Boolean savePeriodInfo(BMap param, List<BMap> detail) throws Exception{
		Boolean isValid = true;
		
		try {
			for(int i = 0; i < detail.size(); i++){
				BMap detailMap = new BMap(detail.get(i));
				detailMap.put("LOGIN_USER", LoginInfo.getUserId());
				
				if(detailMap.getString("STATUS_P").equals("I")){
					productDao.insertPeriodInfo(detailMap);
					System.out.println("ㅁㅁㅁㅁㅁ" + detailMap);
				}else if(detailMap.getString("STATUS_P").equals("U")){
					productDao.updatePeriodInfo(detailMap); // 상품 수정
					System.out.println("ㄴㄴㄴㄴ" + detailMap);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			isValid = false;
		}
				
		return isValid;
	}
	
	/**
	 * Period Info 삭제
	 * @param param
	 * @return 
	 * @throws Exception
	 */
	public void deletePeriodInfo(BMap param) throws Exception{
		productDao.deletePeriodInfo(param); // 상품 수정;
	}
	
	/**
	 * Copy 등록
	 * @param param
	 * @return 
	 * @throws Exception
	 */
	public Boolean saveCopyInfo(BMap param) throws Exception{
		Boolean isValid = true;
		param.put("LOGIN_USER", LoginInfo.getUserId());
		if(param.getString("branch").equals("period")){
			productDao.insertPeriodCopyInfo(param); //기간 복사
		} else if(param.getString("branch").equals("normal")) {
			productDao.insertProductCopyInfo(param); //상품 복사
		}
		
		return isValid;
	}
	
	/**
	 * Period Info 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectPeriodPopUp(BMap param) throws Exception{
		return productDao.selectPeriodPopUp(param);
	}
	
	/**
	 * 예약테이블 취소상태 확인
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectReserveStatus(BMap param) throws Exception{
		return productDao.selectReserveStatus(param);
	}
	/**
	 * 미팅샌딩 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectMSendingInfoList(Map<String, Object> param) throws Exception{
		return productDao.selectMSendingInfoList(param);
	}
	/**
	 * 야간할증비용 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectExtraChargeInfoList(Map<String, Object> param) throws Exception{
		return productDao.selectExtraChargeInfoList(param);
	}

	/**
	 * 공통코드 참조 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	
	public List<BMap> selectRefCode(BMap param) throws Exception {
		return productDao.selectRefCode(param);
	}

	/**
	 * 미팅샌딩 이용금액 수정
	 * @param param
	 * @return 
	 * @return 
	 * @throws Exception
	 */
	public Boolean updateMSendingCost(BMap param, List<BMap> paramList) throws Exception{
		Boolean isValid = true;
		try {
			
			for(int i = 0; i < paramList.size(); i++){
				BMap map = new BMap(paramList.get(i));				
				map.put("LOGIN_USER", LoginInfo.getUserId());
				map.put("BAS_YY", param.getString("BAS_YY"));
				productDao.updateMSendingCost(map);  // 이용금액 수정 
			}
		}
		catch (Exception e) {
			e.getStackTrace();
			isValid = false;
		}
		return isValid;
	}
	
}
	