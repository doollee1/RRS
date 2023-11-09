package bt.common.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import bt.btframework.excel.POIExcelUpload;
import bt.btframework.utils.BMap;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.btframework.utils.ResponseStatus;
import bt.common.dao.MainUploadDao;

@Service("MainUploadService")
public class MainUploadService {
	
	@Resource(name = "MainUploadDao")
	private MainUploadDao mainUploadDao;
	
	public BRespData uploadMainExcel(HttpServletRequest req) throws Exception {
		POIExcelUpload upload = new POIExcelUpload();
		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest) req;
		String[] header = new String[]{ "ORDER_GRADING",	"DOCUMENT_ID", 		"LISP", 			"LS_POS", 			"PTYP", 				
										"BEZ_ATT", 			"BEZ_NUTZUNG", 		"VART", 			"AUFTR_GEB", 		"CUSTOMER", 			
										"COUNTRY", 			"BESTELLNUMMER", 	"VKORG", 			"VWEG", 			"REGION", 				
										"REG", 				"SP", 				"KAM", 				"ANGEL_AM", 		"MATERIAL", 			
										"PRODUCT", 			"USAGE", 			"ORIGIN", 			"PRODUCT_GROUP", 	"WARENGRUPPENBEZ_2", 	
										"WERK", 			"LORT", 			"CHARGE", 			"WL_DATUM", 		"LIEFDATUM", 			
										"WARENAUSG", 		"DELIVERY_WEEK", 	"INCTM", 			"INCO_2", 			"PAYMENT_TERM", 		
										"POWERCLASS", 		"VOLUME_IN_WP", 	"VOLUME_IN_MW", 	"QUANTITY_IN_PCS", 	"AMOUNT", 				
										"CURR", 			"PRICE_WP", 		"LIEFERUNG", 		"LIEFER_MNG", 		"ISTWA_DAT", 			
										"INVOICE_DATE", 	"PL_FKDAT", 		"FAK_LEIST", 		"NETTOWERT", 		"FAKTURA", 				
										"REVENUE_MONTH", 	"YEAR", 			"Q_PARTNER" };
		List<MultipartFile> files =  mpRequest.getFiles("fileupload[]");
		List<BMap> result = new ArrayList<BMap>();
		for(MultipartFile file : files) {
			List<BMap> list = upload.excelUpload(file, header);
			
			mainUploadDao.deleteMainUpload();
			
			for(int i = 0; i < list.size(); i++) {
				result.add(list.get(i));
				mainUploadDao.insertMainUpload(list.get(i));
			}
		}
		
		BMap map = new BMap();
		map.put("USERID", LoginInfo.getUserId());
		mainUploadDao.insertMainDS(map);
		
		return new BRespData(ResponseStatus.OK, result);
	}
}
