package bt.common.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import bt.api.controller.APIController;
import bt.btframework.common.vo.CodeVO;
import bt.btframework.excel.POIExcelUpload;
import bt.btframework.excel.POIExcelUploadEx;
import bt.btframework.utils.BMap;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.btframework.utils.ResponseStatus;
import bt.common.dao.CommonDao;
import bt.customer.dao.CustomerDao;

@Service("CommonService")
public class CommonService {
	@Resource(name = "CommonDao")
	private CommonDao commonDao;
	
	@Resource
	private CustomerDao customerDao;
	
	private static final Logger logger = LoggerFactory.getLogger(APIController.class);
	
	//그리드 컬럼 정보 저장
	public void saveGridInfo(List<BMap> paramList) throws Exception {
		BMap map = new BMap(paramList.get(0));
		map.put("COMP_CD", LoginInfo.getCompCd());
		map.put("USER_ID", LoginInfo.getUserId());
		commonDao.deleteGridColInfo(map);

		for (int i=0; i<paramList.size(); i++) {
			BMap param = new BMap(paramList.get(i));
			param.put("COMP_CD", LoginInfo.getCompCd());
			param.put("USER_ID", LoginInfo.getUserId());
			
			commonDao.insertGridColInfo(param);
		}
	}

	//그리드 컬럼 정보 초기화
	public void delGridInfoAll(BMap param) throws Exception {
		param.put("COMP_CD", LoginInfo.getCompCd());
		param.put("USER_ID", LoginInfo.getUserId());
		commonDao.deleteGridColInfo(param);
	}
	
	// 그리드 정보 가져오기
	public List<BMap> getGridColInfoAll(String compCd, String userId) throws Exception {
		BMap param = new BMap();
		param.put("COMP_CD", compCd);
		param.put("USER_ID", userId);
		return commonDao.getGridColInfoAll(param);
	}
	
	/**
	 * 공통코드 값 조회
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public List<CodeVO> selectCommonCode(String code) throws Exception{
		BMap param = new BMap();
		param.put("HEAD_CD", code);
		param.put("LANG", LoginInfo.getLang());
		return commonDao.selectCommonCode(param);
	}
	
	/**
	 * 공통코드 값 조회(Ref 값에 따라 조회)
	 * @param code
	 * @param refMap
	 * @return
	 * @throws Exception
	 */
	public List<CodeVO> selectCommonCode(String code, BMap refMap) throws Exception{
		BMap param = new BMap();
		param.put("HEAD_CD", code);
		
		if(refMap.containsKey("REF_CHR1"))
			param.put("REF_CHR1", refMap.get("REF_CHR1").toString());
		if(refMap.containsKey("REF_CHR2"))
			param.put("REF_CHR2", refMap.get("REF_CHR2").toString());
		if(refMap.containsKey("REF_CHR3"))
			param.put("REF_CHR3", refMap.get("REF_CHR3").toString());
		if(refMap.containsKey("REF_CHR4"))
			param.put("REF_CHR4", refMap.get("REF_CHR4").toString());
		if(refMap.containsKey("REF_CHR5"))
			param.put("REF_CHR5", refMap.get("REF_CHR5").toString());
		if(refMap.containsKey("REF_NUM1"))
			param.put("REF_NUM1", refMap.get("REF_NUM1").toString());
		if(refMap.containsKey("REF_NUM2"))
			param.put("REF_NUM2", refMap.get("REF_NUM2").toString());
		if(refMap.containsKey("REF_NUM3"))
			param.put("REF_NUM3", refMap.get("REF_NUM3").toString());
		if(refMap.containsKey("REF_NUM4"))
			param.put("REF_NUM4", refMap.get("REF_NUM4").toString());
		if(refMap.containsKey("REF_NUM5"))
			param.put("REF_NUM5", refMap.get("REF_NUM5").toString());
		
		return commonDao.selectCommonCodeRef(param);
	}
	
	/**
	 * 그리드용 공통코드 값 조회
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public String selectCommonCodeGrid(String code) throws Exception{
		BMap param = new BMap();
		param.put("HEAD_CD", code);
		param.put("LANG", LoginInfo.getLang());
		List<CodeVO> codeList = commonDao.selectCommonCode(param);
		
		String resultValue = "";
		for (int i=0; i<codeList.size(); i++) {
			if (i == 0) {
				resultValue += codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
			} else {
				resultValue += ";" + codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
			}
		}
		
		return resultValue;
	}
	
	/**
	 * 그리드용 공통코드 값 조회(Ref 값에 따라 조회)
	 * @param code
	 * @param refMap
	 * @return
	 * @throws Exception
	 */
	public String selectCommonCodeGrid(String code, BMap refMap) throws Exception{
		BMap param = new BMap();
		param.put("HEAD_CD", code);
		
		if(refMap.containsKey("REF_CHR1"))
			param.put("REF_CHR1", refMap.get("REF_CHR1").toString());
		if(refMap.containsKey("REF_CHR2"))
			param.put("REF_CHR2", refMap.get("REF_CHR2").toString());
		if(refMap.containsKey("REF_CHR3"))
			param.put("REF_CHR3", refMap.get("REF_CHR3").toString());
		if(refMap.containsKey("REF_CHR4"))
			param.put("REF_CHR4", refMap.get("REF_CHR4").toString());
		if(refMap.containsKey("REF_CHR5"))
			param.put("REF_CHR5", refMap.get("REF_CHR5").toString());
		if(refMap.containsKey("REF_NUM1"))
			param.put("REF_NUM1", refMap.get("REF_NUM1").toString());
		if(refMap.containsKey("REF_NUM2"))
			param.put("REF_NUM2", refMap.get("REF_NUM2").toString());
		if(refMap.containsKey("REF_NUM3"))
			param.put("REF_NUM3", refMap.get("REF_NUM3").toString());
		if(refMap.containsKey("REF_NUM4"))
			param.put("REF_NUM4", refMap.get("REF_NUM4").toString());
		if(refMap.containsKey("REF_NUM5"))
			param.put("REF_NUM5", refMap.get("REF_NUM5").toString());
		
		List<CodeVO> codeList = commonDao.selectCommonCode(param);
		
		String resultValue = "";
		for (int i=0; i<codeList.size(); i++) {
			if (i == 0) {
				resultValue += codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
			} else {
				resultValue += ";" + codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
			}
		}
		
		return resultValue;
	}
	
	/**
	 * 그리드용 공통코드 값 조회
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public String selectCommonCodeByAjax(BMap param) throws Exception{
		
		List<CodeVO> codeList = commonDao.selectCommonCode(param);
		
		String resultValue = "";
		for (int i=0; i<codeList.size(); i++) {
			if (i == 0) {
				resultValue += codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
			} else {
				resultValue += ";" + codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
			}
		}
		
		return resultValue;
	}
	
	public BRespData uploadQuotationExcel(HttpServletRequest req) throws Exception {
		POIExcelUploadEx upload = new POIExcelUploadEx();
		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest) req;
		String[] header = new String[]{"MATL_CD", "MATL_DESC", "ORD_QTY", "QPARTNER", "STANDARD", "TURNED"};
		List<MultipartFile> files =  mpRequest.getFiles("fileupload[]");
		List<BMap> result = new ArrayList<BMap>();
		
		logger.debug("uploadQuotationExcel 1");
		
		String custcd = req.getParameter("SOLD_CUST_CD");
		BMap m = new BMap();
		m.put("SOLD_CUST_CD", custcd);
		
	    // SOLD_CUST_CD
		BMap qmap = customerDao.isQPartner(m);
		String bQpartner = qmap.getString("IsQPartner");
		
		logger.debug("uploadQuotationExcel 3" + bQpartner);
		
		for(MultipartFile file : files) {
			List<BMap> list = upload.excelUpload(file, header);
			
			// 20180502
		    SimpleDateFormat sdfDate = new SimpleDateFormat("yyyyMMdd");//dd/MM/yyyy				   
		    String cdate = sdfDate.format(new Date());		   	
			
			for(int i = 1; i < list.size(); i++) {
				BMap map = list.get(i);				
				if (! "".equals(map.get("MATL_CD"))) {
										
					map.put("SOLD_CUST_CD", custcd);
					
					String matlcd = (String) map.get("MATL_CD");
					int cddelimit = matlcd.indexOf(".");
					if (cddelimit > 0) {
						matlcd = matlcd.substring(0, cddelimit);
					}
					map.put("MATL_CD", matlcd);
					
					/*
					 *  1. (6)에 금액이 있을 경우 (6)이 최종 가격임					
						2. Q.partner이고 (6)에 가격이 없을 경우 (4)가 최종 가격임					
						3. Q.partner가 아니고 (6)에 가격이 없을 경우 (5)가 최종 가격임					
						4. (1)에 material no.가 없는 라인은 무시함					
						5. 모든 amount field는 소수점 3자리 반올림하여 소수점 2자리로 rounding
						   (현업에게 업로드시 둘째자리 까지로 자료 작성하도록 독려할 것이나 만약의 경우를 대비하여 rounding 기능 필요)					
					 * 
					 * */
					String qpartner = (String) map.get("QPARTNER"); // 4
					String standard = (String) map.get("STANDARD"); // 5
					String turned = (String) map.get("TURNED"); // 6
					
					double netprice = 0;					
					if ("".equals(turned)) {
						// q partner 여부
						if ("Y".equals(bQpartner)) {
							netprice = Double.parseDouble(qpartner);		
						} else {
							netprice = Double.parseDouble(standard);
						}						
					} else {
						netprice = Double.parseDouble(turned);
					}
					map.put("NET_PRICE", String.valueOf(netprice));

					String Amount = (String) map.get("ORD_QTY");
					double nAmount = Float.parseFloat(Amount) ;
					map.put("ORD_QTY", Amount);					
										
					// ORD_QTY X NET_PRICE
					double netval = 0;
					netval = nAmount * netprice;
					map.put("NET_VAL", String.format("%.2f", netval).replace(",", "."));
					
					map.put("VAL_FR_DT", cdate);
					map.put("T_WGT",  "");
					map.put("MATL_WGT",  "");
					map.put("X",  "");
					
					logger.debug("uploadQuotationExcel 4" + map);
					result.add(map);
				}
			}
		}
		
		return new BRespData(ResponseStatus.OK, result);
	}
	
	public BRespData uploadQuotationExcelEx(HttpServletRequest req) throws Exception {
		POIExcelUpload upload = new POIExcelUpload();
		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest) req;
		String[] header = new String[]{ "SOLD_CUST_CD", "VAL_FR_DT", "NET_VAL", "T_WGT", "NET_PRICE", "ORD_QTY", "MATL_WGT", "MATL_CD", "MATL_DESC", "X", "X" };
		List<MultipartFile> files =  mpRequest.getFiles("fileupload[]");
		List<BMap> result = new ArrayList<BMap>();
		for(MultipartFile file : files) {
			List<BMap> list = upload.excelUpload(file, header);
			for(int i = 0; i < list.size(); i++) {
				result.add(list.get(i));
			}
		}
		
		return new BRespData(ResponseStatus.OK, result);
	}
}
