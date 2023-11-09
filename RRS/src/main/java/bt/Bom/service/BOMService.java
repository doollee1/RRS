package bt.Bom.service;

import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import bt.Bom.dao.BOMDao;
import bt.btframework.excel.ExcelDataListRowHandler;
import bt.btframework.utils.BMap;

@Service("BOMService")
public class BOMService {
	
	@Resource(name = "BOMSearchDao")
	private BOMDao bomDao;
	
	/**
	 * BOM 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectMaterialList(BMap param) throws Exception{
		return bomDao.selectMaterialList(param);
	}

	/**
	 * Material 코드 여부 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap>  selectMaterialCode(BMap param) throws Exception{
		return bomDao.selectMaterialCode(param);
	}
	
	/**
	 * Material 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap>  selectBOMList(BMap param) throws Exception{
		return bomDao.selectBOMList(param);
	}

	/**
	 * 엑셀 BOM정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void selectBOMListAll(String title, LinkedHashMap<String,Object> header, HttpServletResponse response, BMap param) throws Exception{
		ExcelDataListRowHandler handler = null;
		try {
			handler = new ExcelDataListRowHandler(title, header, response);
			bomDao.selectBOMListAll(param, handler);
		}catch(Exception ex){
			throw new RuntimeException(ex);
		}finally{
			if(handler != null){
				try{ handler.close();}catch(Exception ex){}
			}
		}
		
	}
}
