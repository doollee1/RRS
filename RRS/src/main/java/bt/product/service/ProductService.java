package bt.product.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.util.Streams;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import bt.btframework.common.FileManager;
import bt.btframework.common.fileupload.FileExtFilter;
import bt.btframework.common.fileupload.FileMaxUploadFilter;
import bt.btframework.common.fileupload.FileTransferManager;
import bt.btframework.utils.BMap;
import bt.btframework.utils.Constants;
import bt.btframework.utils.LoginInfo;
import bt.btframework.utils.StringUtils;
import bt.product.dao.ProductDao;

@Service("ProductService")
public class ProductService {
	@Resource(name = "ProductDao")
	private ProductDao productDao;
	
	/**
	 * Product Info 조회.
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap selectProductInfo(BMap param) throws Exception{
		return productDao.selectProductInfo(param);
	}
	
	/**
	 * Product Desc List 조회.
	 */
	public List<BMap> selectDescList(BMap param) throws Exception{
		return productDao.selectDescList(param);
	}
	
	/**
	 * Product Unit of Measure List 조회.
	 */
	public List<BMap> selectUOMList(BMap param) throws Exception{
		return productDao.selectUOMList(param);
	}
	
	/**
	 * Product Basic Data Text List 조회.
	 */
	public List<BMap> selectBasicList(BMap param) throws Exception{
		return productDao.selectBasicList(param);
	}
	
	/**
	 * Product PopUp List 조회.
	 */
	public List<BMap> selectMatlPopList(BMap param) throws Exception{
		return productDao.selectMatlPopList(param);
	}
	
	/**
	 * Product Code Check
	 */
	public String chkMatlCd(BMap param) throws Exception{
		return productDao.chkMatlCd(param);
	}
	
	/**
	 * Product Data 조회.
	 */
	public BMap getMatlData(BMap param) throws Exception{
		return productDao.getMatlData(param);
	}
}