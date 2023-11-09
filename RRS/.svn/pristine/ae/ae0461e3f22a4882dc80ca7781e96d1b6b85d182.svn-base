package bt.btframework.sap;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SAPTable {
	private String tableName;
	private Map<String, Object> row;
	private List<Map<String, Object>> rows;
	
	public SAPTable() {
		rows = new ArrayList<Map<String, Object>>();
	}
	
	public SAPTable(String name) {
		this();
		this.tableName = name;
	}
	
	/**
	 * @return the tableName
	 */
	public String getTableName() {
		return tableName;
	}
	/**
	 * @param tableName the tableName to set
	 */
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public void put(String key, Object value) {
		if (row == null) {
			row = new HashMap<String, Object>();
			this.rows.add(row);
		}
		this.row.put(key, value);
	}
	
	public void addRow(Map<String, Object> row) {
		this.rows.add(row);
	}
	
	public Map<String, Object> getRow() {
		return this.row;
	}
	
	public List<Map<String, Object>> getRows() {
		return this.rows;
	}
}