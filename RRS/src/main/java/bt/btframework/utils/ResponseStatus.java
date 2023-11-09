package bt.btframework.utils;

public enum ResponseStatus {
	OK(1, "OK"),
	Bad_Request(400, "Bad Request"),
	Unauthorized(401, "Unauthorized"),
	Internal_Server_Error(500, "Internal Server Error"),
	SAP_Communication_Error(600, "SAP Communication Error");
	
	private final int status;
	private String description;
	
	private ResponseStatus(int status, String description) {
		this.status = status;
		this.description = description;
	}

	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}

	public int getStatus() {
		return status;
	}
}
