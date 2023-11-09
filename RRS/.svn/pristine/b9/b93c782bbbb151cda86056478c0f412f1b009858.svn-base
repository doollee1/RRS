package bt.btframework.common.fileupload;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import bt.btframework.common.FileManager;

public class FileTransferManager {
	
	private List<IFiter> _filters = new ArrayList<IFiter>();	

	private String _uploadLocation;	
	
	public FileTransferManager (String uploadLocation) {	
		this._uploadLocation = uploadLocation;
	}
	
	public void set_uploadLocation(String _uploadLocation) {
		this._uploadLocation = _uploadLocation;
	}
	
	public void addFilter(IFiter filter) {
		this._filters.add(filter);
	}
	
	public void removeFilter(IFiter filter) {
		this._filters.remove(filter);
	}	
	
	public boolean upload(String newfileName, File temfile) throws IOException {
		
		boolean bPossibleUpload = true;
		for (IFiter filter : this._filters) {			
			if (!filter.execute()) {
				bPossibleUpload = false;
				break;
			} 
		}		
		
		if (!bPossibleUpload) { // 업로더 불가능 한 조건이면
			temfile.delete();	
			return false;
		}
		
		// 업로드 디렉토리 생성
		FileManager.mkDir(this._uploadLocation);		
		temfile.renameTo(new File(this._uploadLocation + newfileName));
		
        return true;
	}
}
