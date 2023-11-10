package bt.btframework.common.fileupload;

public class FileMaxUploadFilter implements IFiter {
	
	private long _maxFileSize; // 최대 허용 파일 사이즈
	private long _targetFileSize; // 비교대상 파일 사이즈
		
	public FileMaxUploadFilter(long maxFileSize, long targetFileSize) {
		this._maxFileSize = maxFileSize;
		this._targetFileSize = targetFileSize;
	}
	
	/**
	 * 파일의 확장자를 체크하여 필터링된 확장자를 포함한 파일인 경우에 true를 리턴한다.
	 * @param file
	 * */
	private boolean isPossible(long maxFileSize) {
		
		if (maxFileSize>0) {
			if (this._targetFileSize > maxFileSize) 
				return false;
			else
				return true;
		} 
		else
			return true;
	}
	

	@Override
	public boolean execute() {
		// TODO Auto-generated method stub
		return this.isPossible(this._maxFileSize);
	}

	@Override
	public void setTarget(Object obj) {
		// TODO Auto-generated method stub
		this._targetFileSize = Long.parseLong((String) obj);
	}
}
