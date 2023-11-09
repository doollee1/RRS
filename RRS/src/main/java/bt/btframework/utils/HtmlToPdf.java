package bt.btframework.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Properties;

import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

import com.evopdf.HorizontalTextAlign;
import com.evopdf.HtmlToPdfConverter;
import com.evopdf.HtmlToPdfElement;
import com.evopdf.HtmlToPdfVariableElement;
import com.evopdf.PdfFont;
import com.evopdf.RgbColor;
import com.evopdf.TextElement;

import bt.btframework.common.FileManager;
import bt.btframework.common.fileupload.FileExtFilter;
import bt.btframework.common.fileupload.FileMaxUploadFilter;
import bt.btframework.common.fileupload.FileTransferManager;
import bt.btframework.common.vo.CodeVO;

public class HtmlToPdf {
	
	/**
	 * 그리드용 공통코드로 변환
	 * @param codeList
	 * @return
	 * @throws Exception 
	 */
	
	private static Properties properties;
	
	private static final String COMMON_PROPERTIES_PATH = "/egovframework/properties/common.properties";
	
	static {
		Resource resource = new ClassPathResource(COMMON_PROPERTIES_PATH);
		try {
			properties = PropertiesLoaderUtils.loadProperties(resource);
		} catch (IOException e) {
			
		}
	}
	
//	public byte[] void createHtmlToPdf(String document) {
//	public static void createHtmlToPdf(String document, String fileTitle, String lang) throws Exception {
	public static void createHtmlToPdf(String document, String fileTitle, String lang, String salesOrg) throws Exception {
		// create the HTML to PDF converter
		HtmlToPdfConverter htmlToPdfConverter = new HtmlToPdfConverter("127.0.0.1", 40001);
		
		// set license key
		htmlToPdfConverter.setLicenseKey(properties.getProperty("PDF_LICENSE_KEY"));
		
		// set margins
		htmlToPdfConverter.pdfDocumentOptions().setLeftMargin(20);
		htmlToPdfConverter.pdfDocumentOptions().setRightMargin(20);
		htmlToPdfConverter.pdfDocumentOptions().setTopMargin(20);
		htmlToPdfConverter.pdfDocumentOptions().setBottomMargin(30);
		
		StringBuffer headerHtmlSb = new StringBuffer();
		headerHtmlSb.append("<!DOCTYPE html>");
		headerHtmlSb.append("<html>");
		headerHtmlSb.append("<head>");
		headerHtmlSb.append("<style>");
		headerHtmlSb.append("body {font-size:11px; font-family:verdana;}");
		headerHtmlSb.append("p {font-size:8px;font-family:verdana;}");
		headerHtmlSb.append("body table {font-family:verdana; font-size:10px;}");
		headerHtmlSb.append("table th {text-align:left; font-family:verdana;}");
		headerHtmlSb.append("body table tr td {font-family:verdana; font-size:10px;}");
		headerHtmlSb.append("table thead th {text-align:center; height:100px; font-family:verdana;} ");
		headerHtmlSb.append("@media print");
		headerHtmlSb.append("{");
		headerHtmlSb.append("body {padding:25px;}");
		headerHtmlSb.append("#footer { display: block; position: fixed;bottom: 0; padding-top:70px;}");
		headerHtmlSb.append("}");
		headerHtmlSb.append(".orange_color {color:#ff6600;}");
		headerHtmlSb.append(".report_table_line {width:100%; font-family:verdana;}");
		headerHtmlSb.append(".report_table_line tr {border-bottom:1px solid #ccc;}");
		headerHtmlSb.append(".report_table_line tr td {height: 15px;}");
		headerHtmlSb.append(".report_table_subtotal { width:100%; border-bottom: 1px solid #ccc; background-color: #DFEAFF;}");
		headerHtmlSb.append(".report_totalprice { width:100%; border-bottom:2px solid #333;}");
		headerHtmlSb.append(".report_footer_table {width: 100%; font-family:verdana;}");
		headerHtmlSb.append(".report_footer_table tr td {vertical-align: top; vertical-align: text-top;font-size: 7px; font-family:verdana;}");
		headerHtmlSb.append("</style>");
		headerHtmlSb.append("</head>");
		headerHtmlSb.append("<table border='0' width='100%'>");
		headerHtmlSb.append("<thead>");
		headerHtmlSb.append("<tr>");
		headerHtmlSb.append("<th style='width:100% margin-bottom:20px'><img style='page-break-before:always;' src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABdwAAADsCAYAAABud2RuAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAABBJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTQyIDc5LjE2MDkyNCwgMjAxNy8wNy8xMy0wMTowNjozOSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ1dWlkOjVEMjA4OTI0OTNCRkRCMTE5MTRBODU5MEQzMTUwOEM4IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjYwNjg5REEwMTAxMDExRThBQkQ3RTBFQTY4MTU5QzczIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjYwNjg5RDlGMTAxMDExRThBQkQ3RTBFQTY4MTU5QzczIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIElsbHVzdHJhdG9yIENTNiAoV2luZG93cykiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDoyNUE5Q0M4MEY0RjNFNDExOTlCRkIwNDFFNTgzNkYxMiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDoyNUE5Q0M4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' width='50%'></th>");
		headerHtmlSb.append("</tr>");
		headerHtmlSb.append("<tr>");
		headerHtmlSb.append("<th style='height:30px;'></th>");
		headerHtmlSb.append("</tr>");
		headerHtmlSb.append("</thead>");
		headerHtmlSb.append("<tfoot>");
		headerHtmlSb.append("<tr>");
		headerHtmlSb.append("<td width='100%'> ");
		headerHtmlSb.append("<table width='100%' border='0'>");
		headerHtmlSb.append("<tr> ");
		headerHtmlSb.append("<td colspan='4'><br>&nbsp;</td>");
		headerHtmlSb.append("</tr> ");
		headerHtmlSb.append("</table>");
		headerHtmlSb.append("</tfoot>");
				
//		// Set the header height in points
		htmlToPdfConverter.pdfHeaderOptions().setHeaderHeight(90);

//		// Set header background color
//		htmlToPdfConverter.pdfHeaderOptions().setHeaderBackColor(RgbColor.WHITE);

		// Create a HTML element to be added in header
		HtmlToPdfElement headerHtml = new HtmlToPdfElement(headerHtmlSb.toString(), null);

//		// Set the HTML element to fit the container height
//		headerHtml.setFitHeight(true);

		StringBuffer pagesHtmlSb = new StringBuffer();
		pagesHtmlSb.append("<table>");
		pagesHtmlSb.append("<td style=\"width: 90%\">Page <span style=\"color: balck; font-weight: bold\">&p;</span> of <span style=\"font-size: 16px; color: balck; font-weight: bold\">&P;</span>");
		pagesHtmlSb.append("</td>");
		pagesHtmlSb.append("</table>");
		
		HtmlToPdfVariableElement headerHtmlWithPageNumbers = new HtmlToPdfVariableElement(pagesHtmlSb.toString(), null);

		htmlToPdfConverter.pdfHeaderOptions().addElement(headerHtml);
		htmlToPdfConverter.pdfHeaderOptions().addElement(headerHtmlWithPageNumbers);
		htmlToPdfConverter.pdfDocumentOptions().setShowHeader(true);
		
		StringBuffer footerHtmlSb = new StringBuffer();
//		if(lang.equals("FR")){
		if(salesOrg.equals("3500")){
			footerHtmlSb.append("<table id='footer' class='report_footer_table' width='100%' style='margin-top:25px; font-family:Arial; font-size:12px;'>");
			footerHtmlSb.append("<tr>");
			footerHtmlSb.append("<td width='24%' style='vertical-align:top;'><font color='#ff6600'>Hanwha Q CELLS France SAS</font><br>");
			footerHtmlSb.append("Societé par actions simplifiée<br>");
			footerHtmlSb.append("au capital de 1.130.000 euros<br>");
			footerHtmlSb.append("31, Parc du Golf-CS 90519<br>");
			footerHtmlSb.append("350, AV JRGG DE LA LAUZIERE<br>");
			footerHtmlSb.append("AIX EN PROVENCE<br>");
			footerHtmlSb.append("France<br>");
			footerHtmlSb.append("<strong>TEL</strong> +33 1 63 43 80 08<br>");
			footerHtmlSb.append("<strong>FAX</strong> +33 1 63 43 63 00<br>");
			footerHtmlSb.append("<strong>MAIL</strong> sales.fr@q-cells.com<br>");
			footerHtmlSb.append("<td width='20%' style='vertical-align:top;'><font color='#ff6600'>Direction Générale</font><br>");
			footerHtmlSb.append("Hanwha Q CELLS GmbH<br>");
			footerHtmlSb.append("<td width='31%' style='vertical-align:top;'><p><font color='#ff6600'>Back account</font><br>");
			footerHtmlSb.append("Commerzbank Paris-France<br>");
			footerHtmlSb.append("<strong>Compte : </strong> 1762 9000 0100 1135 0520 066<br>");
			footerHtmlSb.append("<strong>IBAN : </strong> FR76 1762 9000 0100 1135 0520 066 <br>");
			footerHtmlSb.append("<strong>BIC (SWIFT)</strong>: COBAFRPX</p></td>");
			footerHtmlSb.append("<td width='31%' style='vertical-align:top;'><strong>SIREN : </strong> 809 931 363<br>");
			footerHtmlSb.append("<br>");
			footerHtmlSb.append("<br>");
			footerHtmlSb.append("<strong>R.C.S : </strong> Aix-en-Provence <br>");
			footerHtmlSb.append("<strong>SIRET : </strong> 809931363 00026 <br>");
			footerHtmlSb.append("<strong>Code APE : </strong> 4669 B <br>");
			footerHtmlSb.append("<strong>N TVA Intracom  : </strong> FR70 809931363 <br>");
			footerHtmlSb.append("</tr>");
			footerHtmlSb.append("</table>");
		}else{
			footerHtmlSb.append("<table id='footer' class='report_footer_table' width='100%' style='margin-top:25px; font-family:Arial; font-size:12px;'>");
			footerHtmlSb.append("<tr>");
			footerHtmlSb.append("<td width='24%' style='vertical-align:top;'><font color='#ff6600'>Hanwha Q CELLS GmbH</font><br>");
			footerHtmlSb.append("OT Thalheim <br>");
			footerHtmlSb.append("Sonnenallee 17-21<br>");
			footerHtmlSb.append("<strong>TEL</strong> +49 (0) 3494 66 99-0<br>");
			footerHtmlSb.append("<strong>FAX</strong> +49 (0) 3494 66 99-199<br>");
			footerHtmlSb.append("<strong>MAIL</strong> q-cells@q-cells.com<br>");
			footerHtmlSb.append("<strong>WEB</strong> www.hanwha-qcells.com</td>");
			footerHtmlSb.append("<td width='15%' style='vertical-align:top;'><font color='#ff6600'>Board of directors</font><br>");
			footerHtmlSb.append("Ji-Weon Jeong<br>");
			footerHtmlSb.append("Maeng Yoon Kim<br>");
			footerHtmlSb.append("Jun	Tae	Ko <br></td>");
			footerHtmlSb.append("<td width='35%' style='vertical-align:top;'><p><font color='#ff6600'>Back account</font><br>");
			footerHtmlSb.append("Commerzbank AG,Berlin, Germany<br>");
			footerHtmlSb.append("<strong>Account</strong> : 199999400 (EUR, USD, AUD, JPY, GBP)<br>");
			footerHtmlSb.append("<strong>Code</strong> : 100 400 00<br>");
			footerHtmlSb.append("<strong>IBAN</strong> : DE68 1004 0000 0199 9994 00<br>");
			footerHtmlSb.append("<strong>BIC (SWIFT)</strong>: COBADEBB</p></td>");
			footerHtmlSb.append("<td width='32%' style='vertical-align:top;'><font color='#ff6600'><strong>Registered office</strong> : </font>Bitterfeld-Wolfen<br>");
			footerHtmlSb.append("<font color='#ff6600'><strong>Tax office</strong> : </font>Bitterfeld<br>");
			footerHtmlSb.append("<font color='#ff6600'><strong>Tax number</strong> : </font>116/107/06438<br>");
			footerHtmlSb.append("<font color='#ff6600'><strong>Registered number</strong> : </font>18663<br>");
			footerHtmlSb.append("<font color='#ff6600'><strong>District court</strong> : </font>Stendal<br>");
			footerHtmlSb.append("<font color='#ff6600'><strong>VAT-ID</strong> : </font>DE284757331<br>");
			footerHtmlSb.append("<font color='#ff6600'><strong>WEEE-Registration-No</strong> : </font>DE 927 15097 </td>");
			footerHtmlSb.append("</tr>");
			footerHtmlSb.append("</table>");
		}
		
				
//		// Set the footer height in points
		htmlToPdfConverter.pdfFooterOptions().setFooterHeight(100);

//		// Set footer background color
//		htmlToPdfConverter.pdfFooterOptions().setFooterBackColor(RgbColor.WHITE_SMOKE);

		// Create a HTML element to be added in footer
		HtmlToPdfElement footerHtml = new HtmlToPdfElement(footerHtmlSb.toString(), null);

//		// Set the HTML element to fit the container height
//		footerHtml.setFitHeight(true);

		// Add HTML element to footer
		htmlToPdfConverter.pdfFooterOptions().addElement(footerHtml);

//		// Create a text element with page numbering place holders &p; and &P;
//		TextElement footerText = new TextElement(0, 30, "Page &p; of &P;  ",
//			new PdfFont("verdana", 10, true);
//
//		// Align the text at the right of the footer
//		footerText.setTextAlign(HorizontalTextAlign.Right);

//		// Set page numbering text color
//		footerText.setForeColor(RgbColor.NAVY);

//		// Embed the text element font in PDF
//		footerText.setEmbedSysFont(true);

		// Add the text element to footer
		htmlToPdfConverter.pdfFooterOptions().addElement(footerHtml);
		htmlToPdfConverter.pdfDocumentOptions().setShowFooter(true);
		
		byte[] outPdfBuffer = htmlToPdfConverter.convertHtml(document, "localhost:8001");
		
		OutputStream fs = null;
		try {
			//DEV
//			FileManager.mkDir(properties.getProperty("PDF_ATTACHFILEPATH"));
//			fs = new FileOutputStream(properties.getProperty("PDF_ATTACHFILEPATH") + fileTitle);
			
			//로컬
			FileManager.mkDir(properties.getProperty("PDF_ATTACHFILEPATH"));
			fs = new FileOutputStream(properties.getProperty("PDF_ATTACHFILEPATH") + fileTitle);
			fs.write(outPdfBuffer, 0, outPdfBuffer.length);
		} catch (Exception ex) {
			throw new Exception(
					String.format("Could not write the output file '%1$s' : %2$s", properties.getProperty("PDF_ATTACHFILEPATH"), ex.getMessage()));
		} finally {
			if (fs != null)
				fs.close();
		}
//		return byte[];
	}
}