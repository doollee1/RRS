package bt.btframework.common.fileupload;

public class FileExtFilter implements IFiter {
	
	private String _filename;
	
	private String[] _whiteList = null;
	
	public FileExtFilter(String whiteList, String filename) {
		this._whiteList = this.convertToWhiteList(whiteList);
		this._filename = filename;
	}
	
	public FileExtFilter(String[] whiteList, String filename) {		
		this._whiteList = whiteList;
		this._filename = filename;
	}
	
	/**
	 * 파일의 확장자를 체크하여 필터링된 확장자를 포함한 파일인 경우에 true를 리턴한다.
	 * @param file
	 * */
	private boolean isPossibleFileExt(String fileName) {
		
	    String ext = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());

        int len = this._whiteList.length;
        for (int i = 0; i < len; i++) {
            if (ext.equalsIgnoreCase(this._whiteList[i])) {
                return true; // 업로더 가능 확장자..
            }
        }   
	    return false;
	}
	
	private String[] convertToWhiteList(String whiteList) {		
		String[] tem = whiteList.split(",");
		return tem;
	}

	@Override
	public boolean execute() {
		// TODO Auto-generated method stub
		return this.isPossibleFileExt(this._filename);
	}

	@Override
	public void setTarget(Object obj) {
		// TODO Auto-generated method stub
		this._filename = (String)obj;
	}
}
