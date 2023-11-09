package bt.btframework.sap;

import com.sap.conn.jco.JCoFieldIterator;
import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoParameterFieldIterator;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoStructure;
import com.sap.conn.jco.JCoTable;

import bt.btframework.utils.BList;
import bt.btframework.utils.BMap;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.sap.conn.jco.JCoField;

public class JCOHandler {

    private JCoFunction function = null;
    private JCoParameterList parameterList = null;
    private JCoParameterList outputList = null;
    private JCoParameterList tableList = null;

    private List<BMap> bList = new ArrayList<BMap>();
    private List<BMap> bOutList = new ArrayList<BMap>();

    private Connection connect = null;
    private CRMConnection crmconnect = null;

    protected int stateCode = 0;
    protected String messageType = "";
    protected String stateMSG = "";
    protected String aName = "";

    public JCOHandler() {
        this("default");
    }

    public JCOHandler(String spec) {
        super();

        try {
            //TODO connection 처리
        } catch (Exception e) {
            createErrLog(e);
            e.printStackTrace();
        }
    }


    public void brokenError(int code, String message){
        stateCode = code;
        stateMSG = message;
    }

    
    public int getStateCode(){
        return stateCode;
    }

    public String getStateMSG(){
        return stateMSG;
    }

    public String getMessageType(){
        return messageType;
    }

    public String getTableName(){
        return aName;
    }

    private void createErrLog(Exception e){
        try {
        	BMap param = new BMap();
            if (function == null) {
            	param.put("errFuncNm", "INIT_SAP_CLIENT");
            } else {
            	param.put("errFuncNm", function.getName());
            }
            param.put("errFgCd", "03");
            param.put("errCd", stateCode);
            param.put("errDesc", stateMSG);
            param.put("errTrc", e.toString());

        } catch (Exception sape) {
            System.err.println("Insert Log Fail : JCo 연동 모듈 로그 작성에 실패하였습니다.");
            System.err.println(sape.toString());
        }
    }


    public void initFunction(String functionName) throws Exception{
        try {
            connect = new Connection();
            function = connect.getFunction(functionName);

            parameterList = function.getImportParameterList();
                                  
            
//            System.err.println("parameterList :: " + parameterList);

//            if (parameterList == null) {
//
//            } else {
//
//            }
            outputList = function.getExportParameterList();
            
//            System.err.println("outputList :: " + outputList);

//            if (outputList == null) {
//
//            } else {
//
//            }
            tableList = function.getTableParameterList();
            
//            System.err.println("tableList :: " + tableList);
            
//            if (tableList == null) {
//
//            } else {
//
//            }
        } catch (Exception e) {
            createErrLog(e);
            throw e;
        }
    }

    
    public void initCRMFunction(String functionName) throws Exception{
        try {
            crmconnect = new CRMConnection();
            function = crmconnect.getFunction(functionName);

            parameterList = function.getImportParameterList();
                                  
            
//            System.err.println("parameterList :: " + parameterList);

//            if (parameterList == null) {
//
//            } else {
//
//            }
            outputList = function.getExportParameterList();
            
//            System.err.println("outputList :: " + outputList);

//            if (outputList == null) {
//
//            } else {
//
//            }
            tableList = function.getTableParameterList();
            
//            System.err.println("tableList :: " + tableList);
            
//            if (tableList == null) {
//
//            } else {
//
//            }
        } catch (Exception e) {
            createErrLog(e);
            throw e;
        }
    }

    public List<BMap> invokeFunction(String functionName) throws Exception{
        long start_time;
        try {

            start_time = System.currentTimeMillis();
            connect.execute(function);

            int cnt = parameterList.getFieldCount();
            
            //outputList = function.getExportParameterList();
            //tableList = function.getTableParameterList();
            
            System.out.println("<<outputList>>");
            System.out.println(outputList);
            System.out.println("==================");
            System.out.println("<<tableList>>");
            System.out.println(tableList);
            System.out.println("==================");
            
            if (outputList != null) { }

            if (tableList != null) { }
            
            
            String result = function.getExportParameterList().getString("EV_MSGTYP");
            String returnMsg = function.getExportParameterList().getString("EV_MSGTXT");

            System.out.println("<<result>>");
            System.out.println(result);
            System.out.println("==================");

            bOutList = new ArrayList<BMap>();
//            
//            if ( result.equals("E") ) {
//            	BMap map = new BMap();
//            	
//                System.out.println("<<fasil>>");
//                System.out.println(returnMsg);
//                System.out.println("==================");
//                
//                map.put("ERR_CODE", result);
//                map.put("ERR_MSG", returnMsg);                
//                bOutList.add(map);
//                
//            } else {
                if (outputList == null) {

                } else {
//                    if(parameterList != null){
//                        System.out.println(parameterList.toString());
//                    }

                    int count = outputList.getFieldCount();
                    JCoField field;
                    BMap map = new BMap();

                    for (JCoParameterFieldIterator e = outputList.getParameterFieldIterator(); e.hasNextField();){
                        field = e.nextField();
                        map.put(field.getName(), field.getString());
                    }
                    bOutList.add(map);
                }

//                if (tableList != null) {
//                    getResultMultiData();
//                }            	
//            }

//            if (stateCode != 0) {
//                JCoTable messageResult = tableList.getTable("MESSAGE");
//                messageType = messageResult.getString("MSGTP");
//                stateMSG += messageResult.getString("CONTS");
//            } else {
//                bOutList = new ArrayList<BMap>();
//
//                if (outputList == null) {
//
//                } else {
//                    if(parameterList != null){
//                        System.out.println(parameterList.toString());
//                    }
//
//                    int count = outputList.getFieldCount();
//                    JCoField field;
//                    BMap map = new BMap();
//
//                    for (JCoParameterFieldIterator e = outputList.getParameterFieldIterator(); e.hasNextField();){
//                        field = e.nextField();
//                        map.put(field.getName(), field.getString());
//                    }
//                    bOutList.add(map);
//                }
//
//                if (tableList != null) {
//                    getResultMultiData();
//                }
//            }

        } catch (Exception e) {
            System.err.println("JCOHandler.invokeFunction() Exception : " + e.toString());
            System.err.println("------------------------------------------");
            createErrLog(e);
            throw e;
        }
        System.out.println("RFC Name = " + function.getName() + ", 실행시간 : " + (System.currentTimeMillis() - start_time) + " ms" );
        return bOutList;
    }


    public List<BMap> getConnectionReturnLMultiData(String fncName, String fncGubun) throws Exception{

    	List<BMap> list = new ArrayList<BMap>();

        try {
            Connection connect = new Connection();
            JCoFunction function = connect.getFunction(fncName);

            connect.execute(function);

            JCoTable jcoTable = function.getTableParameterList().getTable(fncGubun);
            JCoTable resultTable = jcoTable;

            for (int i = 0; i < jcoTable.getNumRows(); i++) {
                jcoTable.setRow(i);

                BMap map = new BMap();

                map.put("seq", i);

                for (JCoFieldIterator e = resultTable.getRecordFieldIterator(); e.hasNextField(); ) {
                    JCoField field = e.nextField();
                    map.put(changeFieldName(field.getName()), field.getString());
                }
                list.add(map);
            }

            String result = function.getExportParameterList().getString("E_SUBRC");
            String returnMsg = function.getExportParameterList().getString("E_MESSAGE");
        } catch (Exception e) {
            createErrLog(e);
            System.err.print(this.getClass().getName() + " => " + e.getMessage());
            throw new Exception("RFC 연결 오류", e);
        } finally {

        }
        return list;

    }

    public void setInputParam(BMap inputData) throws Exception{

        if ( parameterList == null )
            return;

        int count = parameterList.getFieldCount();
        
        for (JCoFieldIterator e = parameterList.getParameterFieldIterator(); e.hasNextField();) {
            JCoField field = e.nextField();
            String fieldName = field.getName();
            setInputValue(fieldName, inputData.getString(fieldName));
        }
        
        System.err.println("<<parameterList>>");
        System.err.println(parameterList);
        System.err.println("=================");

    }

    public void setInputValue(String parameterName, String value) throws Exception{
        try {
            parameterList.setValue(parameterName, value);
        } catch (Exception e) {
            createErrLog(e);
            System.err.println("setInputValue() Exception : " + e.toString());
            throw e;
        }
    }

    public List<BMap> getResultMultiData(BMap param) throws Exception{

        int tableSize = tableList.getFieldCount();
        
        
//        String tableParam[][] = null;
        
        /* ============================================================== */
        for (int i = 0; i < tableSize; i++) {
        	
        	JCoTable resultTable = tableList.getTable(i);

            String tName = tableList.getString(i);
            
            String VKORG = (String) param.get("VKORG");
            String T001W = (String) param.get("T001W");
            String BWKEY = (String) param.get("BWKEY");
            String MATNR = (String) param.get("MATNR");
            
        	if ( tName.equals("T_TVKO") ) {
        		
	            	resultTable.appendRow();
	            	resultTable.setValue("VKORG", VKORG);
            	
        	} else if ( tName.equals("T_T001W") ) {

	            	resultTable.appendRow();
	            	resultTable.setValue("WERKS", T001W);

        	} else if ( tName.equals("T_T001K") ) {

	            	resultTable.appendRow();
	            	resultTable.setValue("BWKEY", BWKEY);

        	} else if ( tName.equals("T_MARA") ) {	

        		System.out.println("@______________@ " + MATNR);
	            	resultTable.appendRow();
	            	resultTable.setValue("MATNR", MATNR);	// E, You need not m c
	            	
//        		for (int j = 0; j < param.size(); j++) {
//	            	resultTable.appendRow();
//	            	resultTable.setValue("MATNR", param.get("MATNR"));
//        		}
        	}
        	
        	connect.execute(function);
  
        	outputList = function.getExportParameterList();
            tableList = function.getTableParameterList();
            
            System.err.println("### outputList : " + tName + "//" + outputList);
            
//
//            System.err.println(" << resultTable >>");
//            System.out.println(resultTable);
            

//            System.err.println(" << tName >>");
//            System.out.println(tName);

            List<BMap> tempMData = new ArrayList<BMap>();
            BMap resultMap = new BMap();
            
            int fieldSize = resultTable.getFieldCount();

//            System.err.println("resultTable.getNumRows() ::" + resultTable.getNumRows() );
            
//            JCoTable tableItems = function.getTableParameterList().getTable(tName);
            
            //System.err.println("tableItems :: " + tableItems.toString());
       
//            for (int j = 0; j < resultTable.getNumRows(); j++) {
//            	resultTable.setRow(j);
//            	Iterator it = resultTable.iterator();
//            	            	
//            	BMap map = new BMap();
//            	
//            	while(it.hasNext()){
//            		String fieldName = (String)it.next();
//            		String value = resultTable.getString(fieldName);
//            		map.put(fieldName, value);
//                    System.err.println("fieldName ::" + fieldName );
//                    System.err.println("value ::" + value);
//            	}
//            	tempMData.add(map);
//            }
    
            if ( resultTable.getNumRows() > 0) {
                do {
                	
                	BMap map = new BMap();
                    // Loop over all columns in the current row
                    for (JCoFieldIterator e = resultTable.getRecordFieldIterator(); e.hasNextField();) {
                        JCoField field = e.nextField();
//                        System.err.println("JCoField field ::" + field.toString() );
//                        System.err.println("changeFieldName(field.getName()) ::" + changeFieldName(field.getName()));
//                        System.err.println("field.getString() ::" + field.getString());
                        
                        map.put(changeFieldName(field.getName()), field.getString());
                    } //for
                    tempMData.add(map);
                } 
                while(resultTable.nextRow());
            }
            resultMap.put(tName, tempMData);
            
            bList.add(resultMap);
        }
        
        
        //System.err.println("bList" + bList);
        
        return bList;

    }

    public String getExportParameterList(String strId) throws Exception {
        return function.getExportParameterList().getString(strId);
    }

    public JCoTable getTable(String tableId) throws Exception{
        return function.getTableParameterList().getTable(tableId);
    }

    public JCoParameterList getImportParameterList(){
        return parameterList;
    }

    public String changeFieldName (String sourceStr) {

        String testStr = sourceStr;
        String targetStr = "";
        char ch;
        boolean nextPos = false;

        for (int i=0; i < testStr.length(); i++) {
            ch=testStr.charAt(i);

            // 대문자 처리
            for (char c = 65; c < 91; c++ ){
                if (ch == c) {
                    if (nextPos) {
                        targetStr += ch;
                        nextPos = false;
                        break;
                    }
                    targetStr += (char)(ch +32);
                }
            }

            // 소문자 처리
            for (char c = 97; c < 123; c++ ){
                if (ch == c) {
                    if (nextPos) {
                        targetStr += (char)(ch - 32);
                        nextPos = false;
                        break;
                    }
                    targetStr += ch;
                }
            }

            // 숫자 처리
            for (char c = 48; c < 58; c++ ){
                if (ch == c) {
                     targetStr += ch;
                }
            }
            // _인경우 다음 문자를 대문자로 처리하기 위한 position 처리
            if (ch == 95) nextPos = true;
        }

        return targetStr;
    }

    public String changeFieldName2 (String sourceStr) {

        String testStr = sourceStr;
        String targetStr = "";
        char ch;
        boolean prePos = false;

        for (int i=0; i < testStr.length(); i++) {
            ch=testStr.charAt(i);

            // 대문자 처리  (A:65, B:66 ...)
            for (char c = 65; c < 91; c++ ){
                if (ch == c) {
                    if (prePos) {
                        // 소문자 다음에 대문자인 경우  "_"를  붙이기 위한 position 처리
                        targetStr += "_";
                        targetStr += ch;
                        prePos = false;
                        break;
                    }
                }
            }

            // 소문자 -> 대문자 처리
            for (char c = 97; c < 123; c++ ){
                if (ch == c) {
                    targetStr += (char)(ch - 32);
                    prePos = true;
                    break;
                }
            }

            // 숫자 처리
            for (char c = 48; c < 58; c++ ){
                if (ch == c) targetStr += ch;
            }

            // '#'인경우 '_'문자로 대체함.
            if (ch == 35) targetStr += "_";

        }
        return targetStr;
    }


}
