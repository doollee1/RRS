package bt.btframework.mail;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Properties;

import javax.mail.MessagingException;

import org.apache.commons.mail.MultiPartEmail;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

public class MailSenderManager {
	private static final Logger logger = LoggerFactory.getLogger(MailSenderManager.class);
	
	private static final String COMMON_TEMPLATE_PATH = "/mail/";
	public static final String TEMPLATE_DOCUMENT_QUOTATION_EN = "quotation_en.html";
	public static final String TEMPLATE_DOCUMENT_QUOTATION_DE = "quotation_de.html";
	public static final String TEMPLATE_DOCUMENT_QUOTATION_FR = "quotation_fr.html";
	public static final String TEMPLATE_DOCUMENT_QUOTATION_EN_3500 = "quotation_en_3500.html";
	public static final String TEMPLATE_DOCUMENT_QUOTATION_DE_3500 = "quotation_de_3500.html";
	public static final String TEMPLATE_DOCUMENT_QUOTATION_FR_3500 = "quotation_fr_3500.html";
	public static final String TEMPLATE_DOCUMENT_ORDER = "order.html";
	public static final String TEMPLATE_DOCUMENT_INVOICE = "invoice.html";
	
	public static final String TEMPLATE_DOCUMENT_PROFORMA_INVOICE_EN = "proforma_invoice_en.html";
	public static final String TEMPLATE_DOCUMENT_PROFORMA_INVOICE_DE = "proforma_invoice_de.html";
	public static final String TEMPLATE_DOCUMENT_PROFORMA_INVOICE_FR = "proforma_invoice_fr.html";
	public static final String TEMPLATE_DOCUMENT_PROFORMA_INVOICE_EN_3500 = "proforma_invoice_en_3500.html";
	public static final String TEMPLATE_DOCUMENT_PROFORMA_INVOICE_DE_3500 = "proforma_invoice_de_3500.html";
	public static final String TEMPLATE_DOCUMENT_PROFORMA_INVOICE_FR_3500 = "proforma_invoice_fr_3500.html";
	public static final String TEMPLATE_DOCUMENT_ORDER_CONFIRMATION_EN = "order_confirmation_en.html";
	public static final String TEMPLATE_DOCUMENT_ORDER_CONFIRMATION_DE = "order_confirmation_de.html";
	public static final String TEMPLATE_DOCUMENT_ORDER_CONFIRMATION_FR = "order_confirmation_fr.html";
	public static final String TEMPLATE_DOCUMENT_ORDER_CONFIRMATION_EN_3500 = "order_confirmation_en_3500.html";
	public static final String TEMPLATE_DOCUMENT_ORDER_CONFIRMATION_DE_3500 = "order_confirmation_de_3500.html";
	public static final String TEMPLATE_DOCUMENT_ORDER_CONFIRMATION_FR_3500 = "order_confirmation_fr_3500.html";
	
	private static final String COMMON_PROPERTIES_PATH = "/egovframework/properties/common.properties";
	private static Properties properties;
	
	static {
		Resource resource = new ClassPathResource(COMMON_PROPERTIES_PATH);
		try {
			properties = PropertiesLoaderUtils.loadProperties(resource);
		} catch (IOException ioe) {
			logger.error(ioe.getLocalizedMessage());
		}
	}
	
	public static Document getTemplateDocument(String template) throws IOException {
		Resource resource = new ClassPathResource(COMMON_TEMPLATE_PATH + template);
		File file = resource.getFile();
		return Jsoup.parse(file, StandardCharsets.UTF_8.toString());
	}
	
	public static MultiPartEmail getInstance() throws MessagingException {
		MultiPartEmail multiPartEmail = new MultiPartEmail();
		multiPartEmail.setHostName(properties.getProperty("EMAIL.HOST"));
		multiPartEmail.setSmtpPort(Integer.parseInt(properties.getProperty("EMAIL.PORT")));
		return multiPartEmail;
	}
}