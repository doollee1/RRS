package bt.btframework.sap;

import java.io.IOException;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

import com.sap.conn.jco.ext.DestinationDataProvider;

public class SAPDataProvider {
	private static final Logger logger = LoggerFactory.getLogger(SAPDataProvider.class);
	
	private static final String COMMON_PROPERTIES_PATH = "/egovframework/properties/common.properties";
	
	public static final String ERP = "erp";
	public static final String CRM = "crm";
	public static final String BATCH = "batch";
	
	private static Properties properties;
	
	static {
		Resource resource = new ClassPathResource(COMMON_PROPERTIES_PATH);
		try {
			properties = PropertiesLoaderUtils.loadProperties(resource);
		} catch (IOException e) {
			logger.error(e.getLocalizedMessage());
		}
	}
	
	public static SAPDestinationDataProvider getDataProvider(String type) {
		if (type == SAPDataProvider.ERP) {
			Properties prop = new Properties();
			String serverName = properties.getProperty("SAP_ERP_HOST_NAME");
			prop.setProperty(DestinationDataProvider.JCO_ASHOST, serverName);
			prop.setProperty(DestinationDataProvider.JCO_SYSNR,  properties.getProperty("SAP_ERP_SYSTEM_NO"));
			prop.setProperty(DestinationDataProvider.JCO_GWHOST, properties.getProperty("SAP_ERP_HOST_NAME"));
			prop.setProperty(DestinationDataProvider.JCO_R3NAME, properties.getProperty("SAP_ERP_SYSTEM_ID"));
			prop.setProperty(DestinationDataProvider.JCO_GROUP, properties.getProperty("SAP_ERP_GROUP"));
			prop.setProperty(DestinationDataProvider.JCO_USER, properties.getProperty("SAP_ERP_USER_ID"));
			prop.setProperty(DestinationDataProvider.JCO_PASSWD, properties.getProperty("SAP_ERP_PASSWORD"));
			prop.setProperty(DestinationDataProvider.JCO_CLIENT, properties.getProperty("SAP_ERP_CLIENT_NO"));
			prop.setProperty(DestinationDataProvider.JCO_GWSERV, properties.getProperty("SAP_ERP_SERVER_IP"));
			prop.setProperty(DestinationDataProvider.JCO_MSHOST, properties.getProperty("SAP_ERP_SERVER_IP"));
			prop.setProperty(DestinationDataProvider.JCO_MSSERV, properties.getProperty("SAP_ERP_MSSERV"));
			prop.setProperty(DestinationDataProvider.JCO_LANG, properties.getProperty("SAP_ERP_LANGUAGE"));
//			String lang = LoginInfo.getLang();
//			if (StringUtils.isEmpty(lang)) {
//				logger.error("Can not found lang");
//				prop.setProperty(DestinationDataProvider.JCO_LANG, properties.getProperty("SAP_ERP_LANGUAGE"));
//			} else {
//				prop.setProperty(DestinationDataProvider.JCO_LANG, lang);
//			}
			
			SAPDestinationDataProvider provider = new SAPDestinationDataProvider(prop, serverName);
			
			return provider;
		} else if (type == SAPDataProvider.CRM) {
			Properties prop = new Properties();
			String serverName = properties.getProperty("SAP_CRM_HOST_NAME");
			prop.setProperty(DestinationDataProvider.JCO_ASHOST, serverName);
			prop.setProperty(DestinationDataProvider.JCO_SYSNR,  properties.getProperty("SAP_CRM_SYSTEM_NO"));
			prop.setProperty(DestinationDataProvider.JCO_GWHOST, properties.getProperty("SAP_CRM_HOST_NAME"));
			prop.setProperty(DestinationDataProvider.JCO_R3NAME, properties.getProperty("SAP_CRM_SYSTEM_ID"));
			prop.setProperty(DestinationDataProvider.JCO_GROUP, properties.getProperty("SAP_CRM_GROUP"));
			prop.setProperty(DestinationDataProvider.JCO_USER, properties.getProperty("SAP_CRM_USER_ID"));
			prop.setProperty(DestinationDataProvider.JCO_PASSWD, properties.getProperty("SAP_CRM_PASSWORD"));
			prop.setProperty(DestinationDataProvider.JCO_CLIENT, properties.getProperty("SAP_CRM_CLIENT_NO"));
			prop.setProperty(DestinationDataProvider.JCO_GWSERV, properties.getProperty("SAP_CRM_SERVER_IP"));
			prop.setProperty(DestinationDataProvider.JCO_MSHOST, properties.getProperty("SAP_CRM_SERVER_IP"));
			prop.setProperty(DestinationDataProvider.JCO_MSSERV, properties.getProperty("SAP_CRM_MSSERV"));
			prop.setProperty(DestinationDataProvider.JCO_LANG, properties.getProperty("SAP_CRM_LANGUAGE"));
//			String lang = LoginInfo.getLang();
//			if (StringUtils.isEmpty(lang)) {
//				logger.error("Can not found lang");
//				prop.setProperty(DestinationDataProvider.JCO_LANG, properties.getProperty("SAP_CRM_LANGUAGE"));
//			} else {
//				prop.setProperty(DestinationDataProvider.JCO_LANG, lang);
//			}
			
			SAPDestinationDataProvider provider = new SAPDestinationDataProvider(prop, serverName);
			
			return provider;
		}else if(type == SAPDataProvider.BATCH) {
			Properties prop = new Properties();
			String serverName = properties.getProperty("SAP_ERP_HOST_NAME");
			prop.setProperty(DestinationDataProvider.JCO_ASHOST, serverName);
			prop.setProperty(DestinationDataProvider.JCO_SYSNR,  properties.getProperty("SAP_ERP_SYSTEM_NO"));
			prop.setProperty(DestinationDataProvider.JCO_GWHOST, properties.getProperty("SAP_ERP_HOST_NAME"));
			prop.setProperty(DestinationDataProvider.JCO_R3NAME, properties.getProperty("SAP_ERP_SYSTEM_ID"));
			prop.setProperty(DestinationDataProvider.JCO_GROUP, properties.getProperty("SAP_ERP_GROUP"));
			prop.setProperty(DestinationDataProvider.JCO_USER, properties.getProperty("SAP_ERP_USER_ID"));
			prop.setProperty(DestinationDataProvider.JCO_PASSWD, properties.getProperty("SAP_ERP_PASSWORD"));
			prop.setProperty(DestinationDataProvider.JCO_CLIENT, properties.getProperty("SAP_ERP_CLIENT_NO"));
			prop.setProperty(DestinationDataProvider.JCO_GWSERV, properties.getProperty("SAP_ERP_SERVER_IP"));
			prop.setProperty(DestinationDataProvider.JCO_MSHOST, properties.getProperty("SAP_ERP_SERVER_IP"));
			prop.setProperty(DestinationDataProvider.JCO_MSSERV, properties.getProperty("SAP_ERP_MSSERV"));
			
			prop.setProperty(DestinationDataProvider.JCO_LANG, properties.getProperty("SAP_ERP_LANGUAGE"));
			
			SAPDestinationDataProvider provider = new SAPDestinationDataProvider(prop, serverName);
			
			return provider;
		}
		
		return null;
	}
}
