package bt.common.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import bt.btframework.sap.JCOHandler;
import bt.btframework.utils.BMap;

public class SapTestConn {
	
	public List<BMap> selectSapTestList(HttpServletRequest req, BMap param) throws Exception{
		List<BMap> result = new ArrayList<BMap>();
		
		String functionName = "RFC_FUNCTION_NAME";
		
		try {
			// 1. JCO Handler 생성
            JCOHandler jcoHandler = new JCOHandler();
            
            // 2. JCO Connection
            jcoHandler.initFunction(functionName);
            
            // 3. Set Input Parameter
            jcoHandler.setInputParam(param);
            
            // 4. RFC 함수 호출
            //LLog.debug.println( "4. RFC 함수 호출 : invokeFunction");
            jcoHandler.invokeFunction(functionName);
            
            result = null;  // jcoHandler.getResultMultiData();
            
		}
		catch(Exception e) {
			System.err.println(e.getMessage());			
		}
		
		return result;
	}
}
