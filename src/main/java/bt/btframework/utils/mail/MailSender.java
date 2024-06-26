/**
 * 
 */
package bt.btframework.utils.mail;

import java.util.Properties;

/**
 * 메일보내기 테스트
 * @author DOOLLEE2
 *
 */
public class MailSender {

	public static void main(String[] args) {
		
		String title = "메일보내기 테스트 메일";
		String content = "메일보내기 테스트 메일 입니다.";
		
		SendMail sendMail = new SendMail();
		sendMail.goMail(sendMail.setting(new Properties()), title, content);
	}
}
