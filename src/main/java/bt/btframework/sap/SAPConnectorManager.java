package bt.btframework.sap;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.sap.conn.jco.JCoContext;
import com.sap.conn.jco.JCoDestination;
import com.sap.conn.jco.JCoDestinationManager;
import com.sap.conn.jco.JCoException;
import com.sap.conn.jco.JCoField;
import com.sap.conn.jco.JCoFieldIterator;
import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoMetaData;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoRecordFieldIterator;
import com.sap.conn.jco.JCoRepository;
import com.sap.conn.jco.JCoStructure;
import com.sap.conn.jco.JCoTable;


public class SAPConnectorManager {
	private static final Logger logger = LoggerFactory.getLogger(SAPConnectorManager.class);
	
	private static final String EV_MSGTYP = "EV_MSGTYP";
	private static final String EV_MSGTXT = "EV_MSGTXT";
	private static final String EV_MSGTYP_SUCCESS = "D";
	private static final String EV_EMPTY_RESULT = "Not Found Satisfied Condition Data";
	private static final String EV_EMPTY_RESULT2 = "Data not found!";
	private static final String EV_EMPTY_RESULT3 = "No data.";
	
	private static String currentType;
	private static SAPDestinationDataProvider currentProvider;
	private static JCoDestination jcoDestination;
	private static JCoRepository jcoRepository;
	
	private static void initialize(String type) throws JCoException {
		if (currentType == type) {
			return;
		}
		
		SAPDestinationDataProvider provider = SAPDataProvider.getDataProvider(type);
		if (com.sap.conn.jco.ext.Environment.isDestinationDataProviderRegistered()) {
			com.sap.conn.jco.ext.Environment.unregisterDestinationDataProvider(currentProvider);
		}
		
		com.sap.conn.jco.ext.Environment.registerDestinationDataProvider(provider);
		currentProvider = provider;
		currentType = type;
		jcoDestination = JCoDestinationManager.getDestination(provider.getServerName());
		jcoRepository = jcoDestination.getRepository();
	}
	
	private static List<SAPTable> innerExecute(JCoFunction function) throws JCoException {
		List<SAPTable> result = new ArrayList<SAPTable>();
		try {
			// execute
			JCoContext.begin(jcoDestination);
			function.execute(jcoDestination);
			
			// TODO
			// Kunhoon Kim
			String rfcName = function.getName();
			StackTraceElement[] stackTraces = Thread.currentThread().getStackTrace();
			logger.debug("[Class: " + stackTraces[3].getClassName() + "][Method: " + stackTraces[3].getMethodName() + "][RFC: " + rfcName + "] Before");
			
			// check validation
			JCoParameterList rfcResult = function.getExportParameterList();
			String retCode = rfcResult.getString(EV_MSGTYP);
			if (!EV_MSGTYP_SUCCESS.equals(retCode)) {
				String message = rfcResult.getString(EV_MSGTXT);
				if (!EV_EMPTY_RESULT.equals(message) && !EV_EMPTY_RESULT2.equals(message) && !EV_EMPTY_RESULT3.equals(message)) {
					logger.error("[Class: " + stackTraces[3].getClassName() + "][Method: " + stackTraces[3].getMethodName() + "][RFC: " + rfcName + "] After Message: " + message);
					//logger.error("RFC error message: " + message);
					throw new JCoException(JCoException.JCO_ERROR_SYSTEM_FAILURE, EV_MSGTXT, message);
				}
			}
			logger.debug("[Class: " + stackTraces[3].getClassName() + "][Method: " + stackTraces[3].getMethodName() + "][RFC: " + rfcName + "] After Message: " + EV_MSGTYP_SUCCESS);
			
			// make result table for export parameter value type
			JCoFieldIterator iter = rfcResult.getParameterFieldIterator();
			SAPTable tableMap = new SAPTable("ExportParameter");
			while (iter.hasNextField()) {
				JCoField field = iter.nextField();
				if (field.getType() != JCoMetaData.TYPE_STRUCTURE) {
					tableMap.put(field.getName(), field.getString());
				}
			}
			result.add(tableMap);
			
			// make result table for export parameter structure type
			iter = rfcResult.getParameterFieldIterator();
			while (iter.hasNextField()) {
				JCoField field = iter.nextField();
				String name = field.getName();
				tableMap = new SAPTable(name);
				if (field.getType() == JCoMetaData.TYPE_STRUCTURE) {
					JCoStructure jCoStructure = field.getStructure();
					Map<String, Object> row = new HashMap<String, Object>();
					iter = jCoStructure.getRecordFieldIterator();
					while (iter.hasNextField()) {
						field = iter.nextField();
						row.put(field.getName(), field.getString());
					}
					tableMap.addRow(row);
				} else {
					Map<String, Object> row = new HashMap<String, Object>();
					row.put(field.getName(), field.getString());
					tableMap.addRow(row);
				}
				
				result.add(tableMap);
			}
			
			// make result table for table parameter
			JCoParameterList list = function.getTableParameterList();
			if (list != null) {
				for (int i = 0; i < list.getFieldCount(); i++) {
					String tableName = list.getString(i);
					JCoTable jcoTable = list.getTable(i);
					tableMap = new SAPTable(tableName);
					if (jcoTable.getNumRows() > 0) {
						do {
							Map<String, Object> row = new HashMap<String, Object>();
							iter = jcoTable.getRecordFieldIterator();
							while (iter.hasNextField()) {
								JCoField field = iter.nextField();
								row.put(field.getName(), field.getString());
							}
							tableMap.addRow(row);
						} while (jcoTable.nextRow());
					}
					result.add(tableMap);
				}
			}
		} finally {
			JCoContext.end(jcoDestination);
		}
		
		return result;
	}
	
	private static List<SAPTable> innerBinaryExecute(JCoFunction function) throws JCoException {
		List<SAPTable> result = new ArrayList<SAPTable>();
		try {
			// execute
			JCoContext.begin(jcoDestination);
			function.execute(jcoDestination);
			
			// TODO
			// Kunhoon Kim
			String rfcName = function.getName();
			StackTraceElement[] stackTraces = Thread.currentThread().getStackTrace();
			logger.debug("[Class: " + stackTraces[3].getClassName() + "][Method: " + stackTraces[3].getMethodName() + "][RFC: " + rfcName + "] Before");
			
			// check validation
			JCoParameterList rfcResult = function.getExportParameterList();
			if (rfcResult != null) {
				logger.debug("[Class: " + stackTraces[3].getClassName() + "][Method: " + stackTraces[3].getMethodName() + "][RFC: " + rfcName + "] After Message: " + EV_MSGTYP_SUCCESS);
			
				// make result table for export parameter value type
				JCoFieldIterator iter = rfcResult.getParameterFieldIterator();
				SAPTable tableMap = new SAPTable("ExportParameter");
				while (iter.hasNextField()) {
					JCoField field = iter.nextField();
					if (field.getType() != JCoMetaData.TYPE_STRUCTURE) {
						if (field.getType() == JCoMetaData.TYPE_XSTRING) {
							logger.debug("ExportParameter>>TYPE_XSTRING " + field.getName());
							tableMap.put(field.getName(), field.getByteArray());
						} else {
							tableMap.put(field.getName(), field.getString());
						}
					}
				}
				result.add(tableMap);
				
				
				// make result table for export parameter structure type
				iter = rfcResult.getParameterFieldIterator();
				while (iter.hasNextField()) {
					JCoField field = iter.nextField();
					String name = field.getName();
					tableMap = new SAPTable(name);
					if (field.getType() == JCoMetaData.TYPE_STRUCTURE) {
						JCoStructure jCoStructure = field.getStructure();
						Map<String, Object> row = new HashMap<String, Object>();
						iter = jCoStructure.getRecordFieldIterator();
						while (iter.hasNextField()) {
							field = iter.nextField();
							if (field.getType() == JCoMetaData.TYPE_XSTRING) {		
								logger.debug("ExportTable>>TYPE_XSTRING");
								row.put(field.getName(), field.getByteArray());
							} else {
								row.put(field.getName(), field.getString());
							}
						}
						tableMap.addRow(row);
					} else {
						Map<String, Object> row = new HashMap<String, Object>();
						row.put(field.getName(), field.getString());
						tableMap.addRow(row);
					}
					
					result.add(tableMap);
				}
				
				// make result table for table parameter
				JCoParameterList list = function.getTableParameterList();
				if (list != null) {
					for (int i = 0; i < list.getFieldCount(); i++) {
						String tableName = list.getString(i);
						JCoTable jcoTable = list.getTable(i);
						tableMap = new SAPTable(tableName);
						if (jcoTable.getNumRows() > 0) {
							do {
								Map<String, Object> row = new HashMap<String, Object>();
								iter = jcoTable.getRecordFieldIterator();
								while (iter.hasNextField()) {
									JCoField field = iter.nextField();
									if (field.getType() == JCoMetaData.TYPE_XSTRING) {
										logger.debug("3>>TYPE_XSTRING");
										row.put(field.getName(), field.getByteArray());
									} else {
										row.put(field.getName(), field.getString());									
									}
								}
								tableMap.addRow(row);
							} while (jcoTable.nextRow());
						}
						result.add(tableMap);
					}
				}
			} else {
				logger.error("[Class: " + stackTraces[3].getClassName() + "][Method: " + stackTraces[3].getMethodName() + "][RFC: " + rfcName + "] After Message: " + "returned null that a SAP result");
				throw new JCoException(JCoException.JCO_ERROR_SYSTEM_FAILURE, EV_MSGTXT, "returned null that a SAP result");
			}
		} finally {
			JCoContext.end(jcoDestination);
		}
		
		return result;
	}
	
	private static List<SAPTable> innerExecuteBAPI(JCoFunction function) throws JCoException {
		List<SAPTable> result = new ArrayList<SAPTable>();
		try {
			// execute
			JCoContext.begin(jcoDestination);
			function.execute(jcoDestination);
			
			// TODO
			// Kunhoon Kim
			String rfcName = function.getName();
			StackTraceElement[] stackTraces = Thread.currentThread().getStackTrace();
			logger.debug("[Class: " + stackTraces[3].getClassName() + "][Method: " + stackTraces[3].getMethodName() + "][RFC: " + rfcName + "] Before");
						
			// make result table for table parameter
			JCoParameterList list = function.getTableParameterList();
			if (list != null) {
				logger.debug("[Class: " + stackTraces[3].getClassName() + "][Method: " + stackTraces[3].getMethodName() + "][RFC: " + rfcName + "] After Message: " + EV_MSGTYP_SUCCESS);
				
				for (int i = 0; i < list.getFieldCount(); i++) {
					String tableName = list.getString(i);
					JCoTable jcoTable = list.getTable(i);					
					SAPTable tableMap = new SAPTable(tableName);
					
					if (jcoTable.getNumRows() > 0) {
						do {
							Map<String, Object> row = new HashMap<String, Object>();
							JCoFieldIterator iter = jcoTable.getRecordFieldIterator();
							while (iter.hasNextField()) {
								JCoField field = iter.nextField();
								row.put(field.getName(), field.getString());
							}
							tableMap.addRow(row);
						} while (jcoTable.nextRow());
					}
					result.add(tableMap);
				}
				
			} else {
				logger.error("[Class: " + stackTraces[3].getClassName() + "][Method: " + stackTraces[3].getMethodName() + "][RFC: " + rfcName + "] After Message: " + "returned null that a SAP result");
				//logger.error("RFC error message: " + message);
				throw new JCoException(JCoException.JCO_ERROR_SYSTEM_FAILURE, EV_MSGTXT, "returned null that a SAP result");
			}
			
		} finally {
			JCoContext.end(jcoDestination);
		}
		
		return result;
	}
	
	private static void makeTableParampeter(JCoFunction function,  List<SAPTable> tables) throws JCoException, IOException {
		// set table
		JCoParameterList list = function.getTableParameterList();
		for (int i = 0; i < tables.size(); i++) {
			String tableName = tables.get(i).getTableName();
			JCoTable jcoTable = list.getTable(tableName);
			if (jcoTable != null) {
				SAPTable sapTable = tables.get(i);
				List<Map<String, Object>> rows = sapTable.getRows();
				for (int j = 0; j < rows.size(); j++) {
					
					jcoTable.appendRow();
					JCoFieldIterator itor = jcoTable.getFieldIterator();
					while (itor.hasNextField()) {
						JCoField field = itor.nextField();
						String name = field.getName();
						Object value = sapTable.getRows().get(j).get(name);
						if (value != null) {
							jcoTable.setValue(name, value.toString());
						} else {
							//logger.debug("(TableParampeter) Can not found data name: " + name + " value: " + value);
						}
					}
					
				}
			} else {
				//logger.debug("Can not found the table: " + tableName);
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	private static void makeImportParampeter(JCoFunction function, Map<String, Object> param) throws JCoException, IOException { 
		// set parameter
		if (param != null && param.size() > 0) {
			JCoParameterList list = function.getImportParameterList();
			JCoFieldIterator iter = list.getParameterFieldIterator();
			while (iter.hasNextField()) {
				JCoField field = iter.nextField();
				String name = field.getName();
				Object value = param.get(name);
				if (value == null) {
					continue;
				}
				if (field.getType() == JCoMetaData.TYPE_STRUCTURE) {
					JCoStructure jCoStructure = field.getStructure();
					Map<String, Object> mapValue = (Map<String, Object>) value;
					JCoRecordFieldIterator structureIter = jCoStructure.getRecordFieldIterator();
					while (structureIter.hasNextField()) {
						JCoField structureField = structureIter.nextField();
						String structureName = structureField.getName();
						Object structureValue = mapValue.get(structureName);
												
						if (structureValue != null) {
							if (structureValue.getClass().getName().equals("java.math.BigDecimal")) {
								jCoStructure.setValue(structureName, ((BigDecimal) structureValue).toString());
							} else {
								jCoStructure.setValue(structureName, structureValue);
							}
						} else {
							//logger.debug("(ImportParampeter) Can not found data name: " + structureName + " value: " + structureValue);
						}
					}
					field.setValue(jCoStructure);
				} else if (field.getType() == JCoMetaData.TYPE_CHAR) {
					field.setValue(value);
				}
			}
		}
	}
	
	/**
	 * @param functionName
	 * @return
	 * @throws JCoException
	 * @throws IOException
	 */
	public static List<SAPTable> execute(String type, String functionName) throws JCoException, IOException {
		initialize(type);
		JCoFunction function = jcoRepository.getFunction(functionName);
		
		return innerExecute(function);
	}
	
	/**
	 * @param functionName
	 * @param tables
	 * @return
	 * @throws JCoException
	 * @throws IOException
	 */
	public static List<SAPTable> execute(String type, String functionName, List<SAPTable> tables) throws JCoException, IOException {
		initialize(type);
		JCoFunction function = jcoRepository.getFunction(functionName);
		makeTableParampeter(function, tables);
		
		return innerExecute(function);
	}
	
	/**
	 * @param functionName
	 * @param param
	 * @return
	 * @throws JCoException
	 * @throws IOException
	 */
	public static List<SAPTable> execute(String type, String functionName, Map<String, Object> param) throws JCoException, IOException {
		initialize(type);
		JCoFunction function = jcoRepository.getFunction(functionName);
		makeImportParampeter(function, param);
		
		return innerExecute(function);
	}
	
	/**
	 * @param functionName
	 * @param param
	 * @param tables
	 * @return
	 * @throws JCoException
	 * @throws IOException
	 */
	public static List<SAPTable> execute(String type, String functionName, Map<String, Object> param, List<SAPTable> tables) throws JCoException, IOException {
		initialize(type);
		JCoFunction function = jcoRepository.getFunction(functionName);
		makeImportParampeter(function, param);
		makeTableParampeter(function, tables);
		
		return innerExecute(function);
	}
	
	/**
	 * @param functionName
	 * @param param
	 * @param tables
	 * @return
	 * @throws JCoException
	 * @throws IOException
	 */
	public static List<SAPTable> executeBAPI(String type, String functionName, Map<String, Object> param, List<SAPTable> tables) throws JCoException, IOException {
		initialize(type);
		JCoFunction function = jcoRepository.getFunction(functionName);
		makeImportParampeter(function, param);
		makeTableParampeter(function, tables);
		
		return innerExecuteBAPI(function);
	}
	
	/**
	 * @param functionName
	 * @param param
	 * @param tables
	 * @return
	 * @throws JCoException
	 * @throws IOException
	 */
	public static List<SAPTable> executeBinary(String type, String functionName, Map<String, Object> param) throws JCoException, IOException {
		initialize(type);
		JCoFunction function = jcoRepository.getFunction(functionName);
		makeImportBinaryParampeter(function, param);
		
		return innerBinaryExecute(function);
	}
	
	@SuppressWarnings("unchecked")
	private static void makeImportBinaryParampeter(JCoFunction function, Map<String, Object> param) throws JCoException, IOException { 
		// set parameter
		if (param != null && param.size() > 0) {
			JCoParameterList list = function.getImportParameterList();
			JCoFieldIterator iter = list.getParameterFieldIterator();
			while (iter.hasNextField()) {
				JCoField field = iter.nextField();
				String name = field.getName();
				Object value = param.get(name);
				if (value == null) {
					continue;
				}				
				
				if (field.getType() == JCoMetaData.TYPE_STRUCTURE) {
					JCoStructure jCoStructure = field.getStructure();
					Map<String, Object> mapValue = (Map<String, Object>) value;					
					
					JCoRecordFieldIterator structureIter = jCoStructure.getRecordFieldIterator();
					while (structureIter.hasNextField()) {
						JCoField structureField = structureIter.nextField();
						String structureName = structureField.getName();
						Object structureValue = mapValue.get(structureName);
												
						if (structureValue != null) {
							if (structureValue.getClass().getName().equals("java.math.BigDecimal")) {
								jCoStructure.setValue(structureName, ((BigDecimal) structureValue).toString());
							} else if (structureValue.getClass().getName().equals("[B")) {
								byte[] data = (byte[]) structureValue; // your file as byte array								
								jCoStructure.setValue(structureName, data);
							} else {
								jCoStructure.setValue(structureName, structureValue);
							}
						} else {
							//logger.debug("(ImportParampeter) Can not found data name: " + structureName + " value: " + structureValue);
						}
					}
					field.setValue(jCoStructure);
				} else if (field.getType() == JCoMetaData.TYPE_XSTRING) {
					byte[] data = (byte[]) value; // your file as byte array								
					field.setValue(data);
				} else if (field.getType() == JCoMetaData.TYPE_STRING) {
					field.setValue(value);					
				} else if (field.getType() == JCoMetaData.TYPE_CHAR) {
					field.setValue(value);
				}
			}
		}
	}
	
	private static void makeBinaryTableParampeter(JCoFunction function,  List<SAPTable> tables) throws JCoException, IOException {
		// set table
		JCoParameterList list = function.getTableParameterList();
		for (int i = 0; i < tables.size(); i++) {
			String tableName = tables.get(i).getTableName();
			JCoTable jcoTable = list.getTable(tableName);
			if (jcoTable != null) {
				SAPTable sapTable = tables.get(i);
				List<Map<String, Object>> rows = sapTable.getRows();
				for (int j = 0; j < rows.size(); j++) {
					
					jcoTable.appendRow();
					JCoFieldIterator itor = jcoTable.getFieldIterator();
					while (itor.hasNextField()) {
						JCoField field = itor.nextField();
						String name = field.getName();						
						Object value = sapTable.getRows().get(j).get(name);
						System.out.println("return type=" + value.getClass().getName());
						
						if (value != null) {
							if (value.getClass().isArray()) {
								byte[] data = (byte[]) value; // your file as byte array
								
								ByteArrayInputStream dataStream = new ByteArrayInputStream(data);
								BufferedInputStream bufferedInputStream = new BufferedInputStream(dataStream);
								byte[] dataPart;
								while (bufferedInputStream.available() > 0){
									dataPart = new byte[1024];// This size is quite important //
									bufferedInputStream.read(dataPart);
									jcoTable.appendRow();
									jcoTable.setValue(name, dataPart);
								}
							} else {
								jcoTable.setValue(name, value.toString());
							}
						} else {
							//logger.debug("(TableParampeter) Can not found data name: " + name + " value: " + value);
						}
					}
					
				}
			} else {
				//logger.debug("Can not found the table: " + tableName);
			}
		}
	}	
}