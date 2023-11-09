package bt.btframework.sap;

import java.util.Properties;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

import com.sap.conn.jco.JCoDestination;
import com.sap.conn.jco.JCoRepository;

import egovframework.rte.fdl.property.EgovPropertyService;

import com.sap.conn.jco.JCoContext;
import com.sap.conn.jco.JCoDestination;
import com.sap.conn.jco.JCoDestinationManager;
import com.sap.conn.jco.JCoException;
import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoRepository;
import com.sap.conn.jco.ext.DestinationDataProvider;

@PropertySource("classpath:/egovframework/properties/common.properties")
public class CRMConnection {
	
	@Autowired
    private Environment env;
	
	static String SAP_SERVER = "SAP_SERVER";
	private JCoRepository repos;
	private JCoDestination dest;
	private final Properties properties;

	public CRMConnection() {
		
		properties = new Properties();

		try{
			
			System.err.println("CRM CONNECT");
//	        System.err.println("SAP_HOST_NAME :: " + env.getProperty("SAP_SYSTEM_ID"));
//
//			String SAP_SYSTEM_ID = env.getProperty("SAP_SYSTEM_ID");
////	        String SAP_POOL_NAME = env.getProperty("SAP_POOL_NAME");
////	        String SAP_MAX_CONNECT = env.getProperty("SAP_MAX_CONNECT");
//	        String SAP_CLIENT_NO = env.getProperty("SAP_CLIENT_NO");
//	        String SAP_USER_ID = env.getProperty("SAP_USER_ID");
//	        String SAP_PASSWORD = env.getProperty("SAP_PASSWORD");
//	        String SAP_LANGUAGE = env.getProperty("SAP_LANGUAGE");
//	        String SAP_SERVER_IP = env.getProperty("SAP_SERVER_IP");
//	        String SAP_HOST_NAME = env.getProperty("SAP_HOST_NAME");
//	        String SAP_SERVER_NAME = env.getProperty("SAP_SERVER_NAME");
////	        String SAP_R3_NAME = env.getProperty("SAP_R3_NAME");
//	        String SAP_SYSTEM_NO = env.getProperty("SAP_SYSTEM_NO");
//	        String SAP_GROUP = env.getProperty("SAP_GROUP");

//        	properties.setProperty(DestinationDataProvider.JCO_MSHOST, SAP_HOST_NAME);
//        	properties.setProperty(DestinationDataProvider.JCO_GROUP, SAP_GROUP);
////        	properties.setProperty(DestinationDataProvider.JCO_R3NAME, SAP_R3_NAME);
//	        properties.setProperty(DestinationDataProvider.JCO_SYSNR,  SAP_SYSTEM_NO);
//	        properties.setProperty(DestinationDataProvider.JCO_CLIENT, SAP_CLIENT_NO);
//	        properties.setProperty(DestinationDataProvider.JCO_USER,   SAP_USER_ID);
//	        properties.setProperty(DestinationDataProvider.JCO_PASSWD, SAP_PASSWORD);
//	        properties.setProperty(DestinationDataProvider.JCO_LANG,   SAP_LANGUAGE);
//	        properties.setProperty(DestinationDataProvider.JCO_POOL_CAPACITY, "3");
//	        properties.setProperty(DestinationDataProvider.JCO_PEAK_LIMIT, "10");
        
			
//	        String	SAP_SYSTEM_ID	=	"SD1";
//	        String	SAP_CLIENT_NO	=	"100";
//	        String	SAP_USER_ID		=	"RFC_OMS";
//    		String	SAP_PASSWORD	=	"Hqc2018#";
////	        String	SAP_USER_ID		=	"mkim";
////    		String	SAP_PASSWORD	=	"Hqc2018!";
//    		String	SAP_LANGUAGE	=	"EN";
//    		String	SAP_SERVER_IP	=	"192.168.254.205";
//    		String	SAP_HOST_NAME	=	"qmoas04";
//    		String	SAP_SERVER_NAME	=	"qmoas04_SD1_02";
//    		String	SAP_SYSTEM_NO	=	"02";
//	        String	SAP_GROUP		=	"Dev.";    
//	        String	SAP_MSSERV		=	"sapmsSD1";
//	        
	        String	SAP_SYSTEM_ID="CP1";
	        String	SAP_CLIENT_NO="100";
	        String	SAP_USER_ID="OMS_RFC";
	        String	SAP_PASSWORD="Rfc_OMS2018";
	        String	SAP_LANGUAGE="EN";
	        String	SAP_SERVER_IP="192.168.254.215"; 
	        String	SAP_HOST_NAME="qmoas12";
	        String	SAP_SERVER_NAME="qmoas12_CP1_11";
	        String	SAP_SYSTEM_NO="11";
	        String	SAP_MSSERV="sapmsCP1";
	        String	SAP_GROUP="CI1";
	        
	        System.err.println("JCO_SYSNR :: " + SAP_SYSTEM_NO);
	        System.err.println("JCO_ASHOST :: " + SAP_SERVER_NAME);
	        System.err.println("JCO_GWHOST :: " + SAP_HOST_NAME);
	        System.err.println("JCO_R3NAME :: " + SAP_SYSTEM_ID);
	        System.err.println("JCO_GROUP :: " + SAP_GROUP);
	        System.err.println("JCO_USER :: " + SAP_USER_ID);	        
	        System.err.println("JCO_PASSWD :: " + SAP_PASSWORD);
	        System.err.println("JCO_LANG :: " + SAP_LANGUAGE);
	        System.err.println("JCO_CLIENT :: " + SAP_CLIENT_NO);
	        System.err.println("JCO_GWSERV :: " + SAP_SERVER_IP); 
	        System.err.println("JCO_MSHOST :: " + SAP_SERVER_IP);  
	        System.err.println("JCO_MSSERV :: " + SAP_MSSERV);  	        

	        properties.setProperty(DestinationDataProvider.JCO_SYSNR,  SAP_SYSTEM_NO);
	        properties.setProperty(DestinationDataProvider.JCO_ASHOST, SAP_SERVER_NAME);
	        properties.setProperty(DestinationDataProvider.JCO_GWHOST, SAP_HOST_NAME);
	        properties.setProperty(DestinationDataProvider.JCO_R3NAME, SAP_SYSTEM_ID);
	        properties.setProperty(DestinationDataProvider.JCO_GROUP, SAP_GROUP);
	        properties.setProperty(DestinationDataProvider.JCO_USER,   SAP_USER_ID);
	        properties.setProperty(DestinationDataProvider.JCO_PASSWD, SAP_PASSWORD);
	        properties.setProperty(DestinationDataProvider.JCO_LANG,   SAP_LANGUAGE);
	        properties.setProperty(DestinationDataProvider.JCO_CLIENT, SAP_CLIENT_NO);
	        properties.setProperty(DestinationDataProvider.JCO_GWSERV, SAP_SERVER_IP);
	        properties.setProperty(DestinationDataProvider.JCO_MSHOST, SAP_SERVER_IP);
	        properties.setProperty(DestinationDataProvider.JCO_MSSERV, SAP_MSSERV);

			MyDestinationDataProvider myProvider = new MyDestinationDataProvider();
			myProvider.changePropertiesForABAP_AS(properties);

			if (!com.sap.conn.jco.ext.Environment.isDestinationDataProviderRegistered()) {
				com.sap.conn.jco.ext.Environment.registerDestinationDataProvider(myProvider);
			}

		}catch(Exception e){
			e.printStackTrace();
		}

		try {
			dest = JCoDestinationManager.getDestination(SAP_SERVER);
			repos = dest.getRepository();
			System.out.println("SAP Connection OK !!!");
		} catch (JCoException e) {
			throw new RuntimeException(e);
		}

	}

	/**
	 * Method getFunction read a SAP Function and return it to the caller. The
	 * caller can then set parameters (import, export, tables) on this function
	 * and call later the method execute.
	 *
	 * getFunction translates the JCo checked exceptions into a non-checked
	 * exceptions
	 */
	public JCoFunction getFunction(String functionStr) {
		JCoFunction function = null;
		try {
			function = repos.getFunction(functionStr);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(
					"Problem retrieving JCO.Function object.");
		}
		if (function == null) {
			throw new RuntimeException("Not possible to receive function. ");
		}

		return function;
	}

	/**
	 * Method execute will call a function. The Caller of this function has
	 * already set all required parameters of the function
	 * @throws JCoException
	 *
	 */
	public void execute(JCoFunction function) throws JCoException {
		// modified by hosung from EACC.
		JCoContext.begin(dest);
		try {
			function.execute(dest);

		} catch (JCoException e) {
			System.err.println(function.toXML());
			e.printStackTrace();

		} finally {
			System.out.println("RFC END");
			JCoContext.end(dest);
		}
	}
}
