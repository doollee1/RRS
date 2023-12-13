package bt.common.service;

import javax.annotation.Resource;

import org.apache.commons.mail.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import bt.btframework.utils.BMap;
import bt.common.dao.MailSendDao;

@Service("MailSendService")
@PropertySource("classpath:/egovframework/properties/common.properties")
public class MailSendService {
	
	@Resource(name = "MailSendDao")
	private MailSendDao mailSendDao;

    @Autowired
    private Environment env;

	/**
	 * Send Mail
	 * @param 
	 * @return boolean
	 * @exception Exception
	 */
	public boolean sendMail(BMap param) throws Exception {
//		String sender = param.getString("SENDER"); // 수신자
//		String receiver = param.getString("RECEIVER"); // 수신자
//		String carbonCopy = param.getString("CARBON_COPY"); // 수신자
//		String title = param.getString("EMAIL_TITLE"); // 메일제목
//		String emailContents = param.getString("EMAIL_BODY"); // 메일내용
//		String atchmnFileNm = param.getString("EMAIL_ATACH_FILE"); // 첨부파일이름
//		String atchmnFilePath = param.getString("EMAIL_ATACH_PATH"); // 첨부파일경로		

		try {
		    String fileNm = (String) param.get("FILE_NM");
		    String fileFullNm = (String) param.get("FILE_FULL_NM");
		    String toEmail = (String) param.get("TO_EMAIL");
		    
		    EmailAttachment attachment = new EmailAttachment();
		    attachment.setPath(fileFullNm);
		    attachment.setDisposition(EmailAttachment.ATTACHMENT);
		    attachment.setDescription("첨부 관련 TEST입니다");
		    attachment.setName(fileNm); // 

		    // 기본 메일 정보를 생성합니다
		    MultiPartEmail email = new MultiPartEmail();
		    email.setCharset("euc-kr");// 한글 인코딩
		    email.setHostName(env.getProperty("EMAIL.HOST"));
            email.setSmtpPort(Integer.parseInt(env.getProperty("EMAIL.PORT")));
            email.setSslSmtpPort(env.getProperty("EMAIL.PORT"));
            email.setAuthenticator(new DefaultAuthenticator(env.getProperty("EMAIL.FROM"), "skEnffl!2#4")); // common.properties 
            email.setSSLOnConnect(true);
            
		    email.addTo(toEmail);
		    email.setFrom(env.getProperty("EMAIL.FROM"));
		    
		    email.setSubject("인보이스 첨부 파일 TEST입니다");
		    email.setMsg("인보이스 첨부...");
		    //email.setContent(aObject, aContentType);

		    // 생성한 attachment를 추가합니다
		    email.attach(attachment);

		    // 메일을 전송합니다
		    email.send();

//			email.setFrom(sender);
//			email.addTo(receiver);
//			email.addCc(carbonCopy);
//			email.setSubject(title);
//			email.setMsg(emailContents);
			
			email.send();

		} catch (EmailException  ex) {
			System.err.println("System Exception ::::: " + ex.getMessage());
			return false;
		}
		
		return true;
	}

	
}
