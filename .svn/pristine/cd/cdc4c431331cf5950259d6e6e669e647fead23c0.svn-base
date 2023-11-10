package bt.btframework.sap;

import java.util.Properties;

import com.sap.conn.jco.ext.DestinationDataEventListener;
import com.sap.conn.jco.ext.DestinationDataProvider;

public class SAPDestinationDataProvider implements DestinationDataProvider {
	private DestinationDataEventListener destinationDataEventListener;
	private Properties properties;
	private String serverName;
	
	public SAPDestinationDataProvider(Properties properties, String serverName) {
		this.properties = properties;
		this.serverName = serverName;
	}
	
	@Override
	public Properties getDestinationProperties(String paramString) {
		return properties;
	}

	@Override
	public boolean supportsEvents() {
		// TODO
		// why?
		return true;
	}
	
	@Override
	public void setDestinationDataEventListener(DestinationDataEventListener destinationDataEventListener) {
		this.destinationDataEventListener = destinationDataEventListener;
	}
	
	public String getServerName() {
		return this.serverName;
	}
}
