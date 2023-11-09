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

		String sender = param.getString("SENDER"); // 수신자
		String receiver = param.getString("RECEIVER"); // 수신자
		String carbonCopy = param.getString("CARBON_COPY"); // 수신자
		String title = param.getString("EMAIL_TITLE"); // 메일제목
		String emailContents = param.getString("EMAIL_BODY"); // 메일내용
		String atchmnFileNm = param.getString("EMAIL_ATACH_FILE"); // 첨부파일이름
		String atchmnFilePath = param.getString("EMAIL_ATACH_PATH"); // 첨부파일경로		

		try {
			
			Email email = new SimpleEmail();
			email.setHostName(env.getProperty("EMAIL.HOST"));
			email.setSmtpPort(Integer.parseInt(env.getProperty("EMAIL.PORT")));
			email.setSslSmtpPort(env.getProperty("EMAIL.PORT"));
			//email.setAuthenticator(new DefaultAuthenticator("username", "password"));
			email.setSSLOnConnect(false);
			
			email.setFrom(env.getProperty("EMAIL.FROM"));
			email.setSubject("TestMail");
			email.setMsg("This is a test mail ...");
			//email.addTo(env.getProperty("EMAIL.TO"));
			//email.addCc(env.getProperty("EMAIL.TO"));
			
//			email.addTo("H.Cho@q-cells.com");
			
//			email.setFrom(sender);
//			email.addTo(receiver);
//			email.addCc(carbonCopy);
//			email.setSubject(title);
//			email.setMsg(emailContents);
			
//			email.send();
	
			

		} catch (EmailException  ex) {
			System.err.println("System Exception ::::: " + ex.getMessage());
			return false;
		}

		
		return true;
	}

	
}
