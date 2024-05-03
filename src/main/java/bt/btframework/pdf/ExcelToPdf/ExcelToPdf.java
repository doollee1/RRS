/**
 * 
 */
package bt.btframework.pdf.ExcelToPdf;

import com.pdftron.common.PDFNetException;
import com.pdftron.pdf.Convert;
import com.pdftron.pdf.PDFDoc;
import com.pdftron.pdf.PDFNet;
import com.pdftron.sdf.SDFDoc;

/**
 * Excel(xlsx)을 pdf로 변환
 * 
 * @author DOOLLEE2
 *
 */
public class ExcelToPdf {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//PDFNet.initialize(PDFTronLicense.Key());
        //PDFNet.setResourcesPath("../Resources");

        // first the one-line conversion interface
        simpleDocxConvert("C:\\프로젝트\\팜리조트\\기타\\김욱_20240426.xlsx", "C:\\프로젝트\\팜리조트\\기타\\김욱_20240426.pdf");

        //PDFNet.terminate();
	}

	/**
	 * Office를 pdf로 변환모듈
	 * 
	 * @param inputFilename
	 * @param outputFilename
	 */
	public static void simpleDocxConvert(String inputFilename, String outputFilename) {
		 
		 	PDFNet.initialize(PDFTronLicense.Key());
	        PDFNet.setResourcesPath("../Resources");
	        
	        try (PDFDoc pdfdoc = new PDFDoc()) {

	            // perform the conversion with no optional parameters
	            Convert.officeToPdf(pdfdoc, inputFilename, null);

	            // save the result
	            pdfdoc.save(outputFilename, SDFDoc.SaveMode.INCREMENTAL, null);
	            // output PDF pdfdoc

	            // And we're done!
	            System.out.println("Done conversion " + outputFilename);
	        } catch (PDFNetException e) {
	            System.out.println("Unable to convert MS Office document, error:");
	            e.printStackTrace();
	            System.out.println(e);
	        }
	        
	        PDFNet.terminate();
	    }

	   
}
