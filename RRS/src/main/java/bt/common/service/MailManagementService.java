package bt.common.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.MultiPartEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import bt.btframework.mail.MailSenderManager;
import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.common.dao.MailManagementDao;

@Service("MailManagementService")
public class MailManagementService {

	private static final Logger logger = LoggerFactory.getLogger(MailManagementService.class);

	@Resource(name = "MailManagementDao")
	private MailManagementDao mailManagementDao;

    @Autowired
    private Environment env;
    
	/**
	 * search Mail Contents
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> searchMailContents(BMap param) throws Exception {
		return mailManagementDao.searchMailContents(param);
	}

	/**
	 * search Mail Title
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> searchMailTitle(BMap param) throws Exception {
		return mailManagementDao.searchMailTitle(param);
	}

	/**
	 * search Mail Recipient
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> searchMailRecipient(BMap param) throws Exception {
		return mailManagementDao.searchMailRecipient(param);
	}

	/**
	 * save Mail Contents
	 * 
	 * @param master
	 * @param detail
	 * @throws Exception
	 */
	public String saveMailContents(BMap param) throws Exception {

		Map<String, Object> mailData = (Map<String, Object>) param.get("mailData");
		List<Map<String, Object>> titleGrid = (List<Map<String, Object>>) param.get("titleGrid");
		List<Map<String, Object>> recipientGrid = (List<Map<String, Object>>) param.get("recipientGrid");
		Map<String, Object> mailBody = (Map<String, Object>) param.get("mailBody");

		String userId = LoginInfo.getUserId();

		String mailCode = (String) mailData.get("MAIL_CD");

		System.err.println(param);

		if (null != mailData) {

			mailData.put("USERID", userId);
			mailData.put("BODY_CONTENTS", mailBody.get("BODY_CONTENTS"));

			// New
			if (null != mailData.get("isStatus") && (!"U".equals(mailData.get("isStatus")))) {
				// insert
				mailManagementDao.insertMailBody(mailData);

			} else {
				// update
				mailManagementDao.updateMailBody(mailData);
			}

			// title Grid
			if (null != titleGrid) {
				for (Map<String, Object> tempMap : titleGrid) {

					tempMap.put("MAIL_CD", mailData.get("MAIL_CD"));
					tempMap.put("MAIL_LANG", mailData.get("MAIL_LANG"));
					tempMap.put("USERID", userId);

					if ("".equals(tempMap.get("SEQ"))) {
						mailManagementDao.insertMailTitle(tempMap);
					} else {
						mailManagementDao.updateMailTitle(tempMap);
					}

				}
			}

			// recipient Grid
			if (null != recipientGrid) {
				for (Map<String, Object> tempMap : recipientGrid) {

					tempMap.put("MAIL_CD", mailData.get("MAIL_CD"));
					tempMap.put("MAIL_LANG", mailData.get("MAIL_LANG"));
					tempMap.put("USERID", userId);

					// if("".equals(tempMap.get("SEQ"))){
					// mailManagementDao.insertMailRecipient(tempMap);
					// }else {
					// mailManagementDao.updateMailRecipient(tempMap);
					// }
					if ("I".equals(tempMap.get("ROW_STATUS"))) {
						mailManagementDao.insertMailRecipient(tempMap);
					} else if ("U".equals(tempMap.get("ROW_STATUS"))) {
						mailManagementDao.updateMailRecipient(tempMap);
					} else if ("D".equals(tempMap.get("ROW_STATUS"))) {
						mailManagementDao.deleteMailRecipient(tempMap);
					}

				}
			}

		}

		return mailCode;
	}

	public BMap selectMailContents(BMap param) throws Exception {
		return mailManagementDao.selectMailContents(param);
	}

	public List<BMap> selectMailTitle(BMap param) throws Exception {
		return mailManagementDao.selectMailTitle(param);
	}

	public List<BMap> selectMailRecipient(BMap param) throws Exception {
		return mailManagementDao.selectMailRecipient(param);
	}

	public BMap mailPreview(BMap param) throws Exception {
		return mailManagementDao.mailPreview(param);
	}

	public List<BMap> selectMailHistory(BMap param) throws Exception {
		return mailManagementDao.selectMailHistory(param);
	}

	/**
	 * @param param
	 * @throws Exception
	 */
	public void sendEmailCust(HttpServletRequest request, Map<String, Object> param) throws Exception {

		// get data from rdb
		BMap bmap = new BMap();
		bmap.put("COMP_CD", LoginInfo.getCompCd());
		bmap.put("MAIL_CD", param.get("MAIL_CD"));
		bmap.put("MAIL_LANG", LoginInfo.getLang());

		List<BMap> itemList = mailManagementDao.selectMailPreview(bmap);

		MultiPartEmail email = MailSenderManager.getInstance();
		String mail_from = "";
		String mail_to = "";
		String mail_cc = "";

		if(null != LoginInfo.getEmail()){
			email.setFrom(LoginInfo.getEmail());
			email.addTo(LoginInfo.getEmail());
			mail_from = LoginInfo.getEmail();
		}else{
			email.setFrom("OMS@q-cells.com");
			mail_from ="OMS@q-cells.com";
		}
		if (itemList != null && itemList.size() > 0) {
			for (int j = 0; j < itemList.size(); j++) {

				BMap item = itemList.get(j);
				String mail = item.getString("E_MAIL");
				if ("002".equals(item.get("TYPE"))) {
					email.addTo(mail);
					if (mail_to == "") {
						mail_to = mail;
					} else {
						mail_to = mail_to + ", " + mail;
					}
				} else if ("003".equals(item.get("TYPE"))) {
					email.addCc(mail);
					if (mail_cc == "") {
						mail_cc = mail;
					} else {
						mail_cc = mail_cc + ", " + mail;
					}
				}
			}
		} else {
			logger.error("Not found email information");
		}

		// email.addTo(mail_to);
		String title = itemList.get(0).getString("TITLE_TEXT");
		title = title.replace("{Customer ID}", param.get("CUST_CD").toString());
		title = title.replace("{Customer Name}", param.get("CUST_NM").toString());
		title = title.replace("{Requested Amount}", param.get("AMOUNT").toString());

		bmap.put("MAIL_TITLE", title);
		email.setSubject(title);

		String body = itemList.get(0).getString("BODY_CONTENTS");
		body = body.replace("{Customer ID}", param.get("CUST_CD").toString());
		body = body.replace("{Customer Name}", param.get("CUST_NM").toString());
		body = body.replace("{Requested Amount}", param.get("AMOUNT").toString());
		body = body.replace("{Order Manager's Name}", LoginInfo.getUserNm());
		email.setMsg(body);
		bmap.put("MAIL_CONTENTS", body);
		email.send();

		bmap.put("MAIL_FROM", mail_from);
		bmap.put("MAIL_TO", mail_to);
		bmap.put("MAIL_CC", mail_cc);
		long curr = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String datetime = sdf.format(new Date(curr));
		bmap.put("SEND_DATE", datetime);
		bmap.put("USERID", LoginInfo.getUserId());
		bmap.put("ATTACH_FILE_YN", "N");

		// TODO
		try {
			mailManagementDao.insertEmailHistory(bmap);
		} catch (Exception e) {
			// TODO..
		}

	}

	/**
	 * @param param
	 * @throws Exception
	 */
	public void sendEmailEtc(HttpServletRequest request, Map<String, Object> param) throws Exception {

		System.err.println(param);
		// get data from rdb
		BMap bmap = new BMap();
		bmap.put("MAIL_CD", param.get("MAIL_CD"));
		bmap.put("MAIL_LANG", LoginInfo.getLang());

		MultiPartEmail email = MailSenderManager.getInstance();
		String mail_from = "";
		String mail_to = "";
		String mail_cc = "";

		mail_from = param.get("SENDER_T").toString();
		email.setFrom(mail_from);
		email.addTo(mail_from);
		if (null != param.get("RECEIVER_T").toString() && "" != param.get("RECEIVER_T").toString()) {
			String recever[] = param.get("RECEIVER_T").toString().split(";");
			for (int i = 0; i < recever.length; i++) {
				email.addTo(recever[i]);
				if (mail_to == "") {
					mail_to = recever[i];
				} else {
					mail_to = mail_to + "; " + recever[i];
				}
			}
		}
		if (null != param.get("CARBON_COPY_T").toString() && "" != param.get("CARBON_COPY_T").toString()) {
			String carbon[] = param.get("CARBON_COPY_T").toString().split(";");
			for (int i = 0; i < carbon.length; i++) {
				email.addCc(carbon[i]);
				if (mail_cc == "") {
					mail_cc = carbon[i];
				} else {
					mail_cc = mail_cc + "; " + carbon[i];
				}
			}
		}

		String title = (String) param.get("MAIL_TITLE_T");
		bmap.put("MAIL_TITLE", title);
		email.setSubject(title);
		String body = (String) param.get("BODY_CONTENTS_T");
		email.setMsg(body);
		bmap.put("MAIL_CONTENTS", body);
		email.send();

		bmap.put("MAIL_FROM", mail_from);
		bmap.put("MAIL_TO", mail_to);
		bmap.put("MAIL_CC", mail_cc);
		long curr = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String datetime = sdf.format(new Date(curr));
		bmap.put("SEND_DATE", datetime);
		bmap.put("USERID", LoginInfo.getUserId());
		bmap.put("ATTACH_FILE_YN", "N");

		// TODO
		try {
			mailManagementDao.insertEmailHistory(bmap);
		} catch (Exception e) {
			// TODO..
		}
	}
	
	/**
	 * PDF 다운로드
	 * @param req
	 * @param resp
	 * @throws Exception
	 */
	public void downloadPdfAttach(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		String filename = req.getParameter("f");        
        //String filename = new String(fname.getBytes("iso-8859-1"),"UTF-8");
        String of = req.getParameter("of"); //인코딩 서버 기본값 ("iso-8859-1")
        
        System.out.println("filename="+filename);
        System.out.println("uploadedFilneName="+of);
        
        String dirid = req.getParameter("dirid");
		if(dirid == null || "".equals(dirid)){
			dirid = "common";
		}
        
        if(filename==null||filename.trim().equals("")){
            return;
        }
        
        //업로드 경로와 파일이름을 가지고 File인스턴스 생성
        File downloadFile = new File(env.getProperty("PDF_ATTACHFILEPATH") + filename);
        
        String userAgent 	= req.getHeader("User-Agent");
		if(userAgent.indexOf("MSIE") > -1){
			filename = URLEncoder.encode(filename, "utf-8");
		}else if (userAgent.indexOf("Trident") > -1) { //MS IE 11
			filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "\\ ");
	    }else{
	    	filename = new String(filename.getBytes("utf-8"), "iso-8859-1");
		}

        //웹브라우저가 파일을 다운로드 받로록 하려면 다음과 같이 컨테츠타입지정
        resp.setContentType("application/octet-stream");
        //response.setContentType("application/download; charset=utf-8");         
        resp.setContentLength((int)downloadFile.length());//콘텐트 크기 지정
        //Content-Disposition헤더를 이용해서 전송되는 파일의 이름을 명시
        resp.setHeader("Content-Disposition", "attachment; filename=\""+ of +"\"");
        //전송되는 데이터의 인코딩이 바이너리 타입이라는것을 명시
        resp.setHeader("Content-Transfer-Encoding","binary");
        resp.setHeader("Pragma",  "no-cache;");
        resp.setHeader("Expires", "-1;");
        
        OutputStream out = resp.getOutputStream();         
        FileInputStream fis = null;         
        try {             
            fis = new FileInputStream(downloadFile);             
            FileCopyUtils.copy(fis, out);
        } catch(FileNotFoundException e){
        	System.out.println(e.getMessage());
        } catch(Exception e) {             
        	System.out.println(e.getMessage());             
        } finally {             
            if (fis != null) {                 
                try { fis.close(); } catch (Exception e) {}
            }             
        }
         
        out.flush();
	}
	
	/**
	 * @param param
	 * @throws Exception
	 */
	public void sendRejectEmail(HttpServletRequest request, Map<String, Object> param) throws Exception {

		// get data from rdb
		BMap bmap = new BMap();
		bmap.put("COMP_CD", LoginInfo.getCompCd());
		bmap.put("MAIL_CD", param.get("MAIL_CD"));
		bmap.put("CUST_CD", param.get("CUST_CD"));
		bmap.put("MAIL_LANG", LoginInfo.getLang());

		List<BMap> itemList = mailManagementDao.selectMailPreview(bmap);		
		List<BMap> fromInfo = mailManagementDao.selectFromInfo(param);
		List<BMap> appList = mailManagementDao.selectApprList(param);

		MultiPartEmail email = MailSenderManager.getInstance();
		String mail_from = "";
		String mail_to = "";
		String mail_cc = "";

		if(null != LoginInfo.getEmail()){
			email.setFrom(fromInfo.get(0).getString("E_MAIL"));
			mail_from = fromInfo.get(0).getString("E_MAIL");
			//email.addTo(fromInfo.get(0).getString("E_MAIL"));
		}else{
			email.setFrom("OMS@q-cells.com");
			mail_from ="OMS@q-cells.com";
		}
		
		//상신자에게 메일전송
		if(!"".equals(itemList.get(0).getString("AP_CARBON_COPY"))){
			mail_to = itemList.get(0).getString("AP_CARBON_COPY");
			email.addTo(itemList.get(0).getString("AP_CARBON_COPY"));
		}
		
		if (appList != null && appList.size() > 0) {
			for (int j = 0; j < appList.size(); j++) {

				BMap item = appList.get(j);
				String mail = item.getString("E_MAIL");
				if(!"".equals(mail)){
					email.addTo(mail);					
				}
				if(mail_to == ""){
					mail_to = mail;
				}else{
					mail_to = mail_to + ", " + mail;
				}
			}
		} 
		
		// email.addTo(mail_to);
		String title = itemList.get(0).getString("TITLE_TEXT");
		title = title.replace("{DOC_GR}", param.get("DOC_GR").toString());
		title = title.replace("{Customer Name}", param.get("CUST_NM").toString());
		title = title.replace("{DOC_NO}", param.get("DOC_NO").toString());

		bmap.put("MAIL_TITLE", title);
		email.setSubject(title);
		
		String body = itemList.get(0).getString("BODY_CONTENTS");
		body = body.replace("{Requestor Name2}", fromInfo.get(0).getString("NAME_FULL").toString());
		body = body.replace("{Reject Reason}", param.get("REJECT_RSN").toString());
//		body = body.replace("{Requested Amount}", param.get("AMOUNT").toString());
//		body = body.replace("{Order Manager's Name}", LoginInfo.getUserNm());
		email.setMsg(body);
		bmap.put("MAIL_CONTENTS", body);
		
		System.err.println(body);
		email.send();

		bmap.put("MAIL_FROM", mail_from);
		bmap.put("MAIL_TO", mail_to);
		bmap.put("MAIL_CC", mail_cc);
		long curr = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String datetime = sdf.format(new Date(curr));
		bmap.put("SEND_DATE", datetime);
		bmap.put("USERID", LoginInfo.getUserId());
		bmap.put("ATTACH_FILE_YN", "N");

		// TODO
		try {
			mailManagementDao.insertEmailHistory(bmap);
		} catch (Exception e) {
			// TODO..
		}

	}
}
