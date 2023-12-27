package bt.product.service;

import java.util.List;

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
	 * @throws Exception
	 */
	public void deleteProductInfo(BMap param) throws Exception{
		productDao.deleteProductInfo(param); // 상품 수정;
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
	public Boolean savePeriodInfo(BMap param) throws Exception{
		Boolean isValid = true;
		param.put("LOGIN_USER", LoginInfo.getUserId());
		if(param.getString("modify").equals("1")){
			productDao.updatePeriodInfo(param); // 상품 수정
		} else {
			productDao.insertPeriodInfo(param); //상품 등록
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
}