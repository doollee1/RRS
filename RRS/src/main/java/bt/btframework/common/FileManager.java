package bt.btframework.common;

import java.io.File;

public class FileManager {
	
	public synchronized static boolean mkDir (String dirpath) {
		
		boolean result = false;
		
		File theDir = new File(dirpath);	
		if (!theDir.exists()) {		    
		    try {
		    	System.out.println(dirpath);
		        theDir.mkdirs();
		        result = true;
		    } 
		    catch(SecurityException se) {
		        //handle it
		    }
		}
		
		return result;
	}
	
	public synchronized static boolean removeFile (String filepath) {
	
		File file = new File(filepath);		
		return file.delete();			
	}
	
	
	public synchronized static String getExtension (String fileName) {
		return fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
	}
	
}
