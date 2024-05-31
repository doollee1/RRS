package bt.btframework.pdf;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.CMYKColor;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;

import bt.btframework.utils.StringUtils;

public class PdfPageEvent extends PdfPageEventHelper {
	private List<HashMap<String, Object>> colModelList;
	private List<HashMap<String, Object>> gridDataList;
	private String title;
    private Font objFont10;
    private Font objFont16;
    private int pagenumber;
    
	@SuppressWarnings("unchecked")
	public PdfPageEvent(HashMap<String, Object> param, HttpServletRequest req) {
		BaseFont objBaseFont = null;
        
		try {
			colModelList = (List<HashMap<String, Object>>) param.get("colModel");
			gridDataList = (List<HashMap<String, Object>>) param.get("gridData");
			title = StringUtils.NULL(param.get("title"));
			
			//맑은고딕
			String path = req.getSession().getServletContext().getRealPath(File.separator) + File.separator + "css" + File.separator + "font" + File.separator + "malgun.ttf";
			objBaseFont = BaseFont.createFont(path, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

			//objBaseFont = BaseFont.createFont("C:/Windows/Fonts/malgun.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
			this.objFont10 = new Font(objBaseFont, 10, Font.NORMAL, new CMYKColor(0, 0, 0, 240));
			this.objFont16 = new Font(objBaseFont, 16, Font.BOLD, new CMYKColor(0, 0, 0, 250));
		} catch (Exception e) {
		}
	}
	
	@Override
	public void onCloseDocument(PdfWriter writer, Document document) {
	}

	@Override
	public void onParagraph(PdfWriter writer, Document document, float paragraphPosition) {
	}

	@Override
	public void onParagraphEnd(PdfWriter writer, Document document, float paragraphPosition) {
	}

	@Override
	public void onChapterEnd(PdfWriter writer, Document document, float position) {
	}

	@Override
	public void onSection(PdfWriter writer, Document document, float paragraphPosition, int depth, Paragraph title) {
	}

	@Override
	public void onSectionEnd(PdfWriter writer, Document document, float position) {
	}

	@Override
	public void onGenericTag(PdfWriter writer, Document document, Rectangle rect, String text) {
	}

	@Override
    public void onOpenDocument(PdfWriter writer, Document document) {
    }
    
	@Override
    public void onChapter(PdfWriter writer, Document document, float paragraphPosition, Paragraph title) {
        pagenumber = 1;
    }
 
    @Override
    public void onStartPage(PdfWriter writer, Document document) {
        pagenumber++;
        
        Rectangle rect = writer.getPageSize();
        ColumnText.showTextAligned(writer.getDirectContent(), Element.ALIGN_CENTER
        		, new Phrase(this.title, objFont16)
        		, (rect.getLeft() + rect.getRight()) / 2, rect.getTop() - 50, 0);
    }
     
    @Override
    public void onEndPage(PdfWriter writer, Document document) {
        Rectangle rect = writer.getPageSize();
        
        Calendar cal = Calendar.getInstance();
        String ampm = "";
        if (cal.get(Calendar.AM_PM) == 0)
        	ampm = "AM";
        else
        	ampm = "PM";
        	
        String today = String.format("%04d-%02d-%02d %s %02d:%02d:%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, 
        		cal.get(Calendar.DAY_OF_MONTH), ampm, cal.get(Calendar.HOUR), cal.get(Calendar.MINUTE), cal.get(Calendar.SECOND));

        // Watermark
        //ColumnText.showTextAligned(writer.getDirectContentUnder(),
        //        Element.ALIGN_CENTER, new Phrase("CONFIDENTIAL DOCUMENT", FONT), // 워터마크로 넣을 텍스트
        //        297.5f, 421, writer.getPageNumber() % 2 == 1 ? 45 : -45);

        // 쪽 번호 매기기
        ColumnText.showTextAligned(writer.getDirectContent(), Element.ALIGN_CENTER,
        		new Phrase(String.format("- %d -", pagenumber), objFont10),
                (rect.getLeft() + rect.getRight()) / 2, rect.getBottom() + 20, 0);
        // 오늘 날짜 매기기
        ColumnText.showTextAligned(writer.getDirectContent(), Element.ALIGN_RIGHT,
        		new Phrase(today, objFont10),
        		rect.getRight() - 20, rect.getBottom() + 20, 0);
    }
    
	public StringBuilder getHtmlContent() {
		int colModelLength = colModelList.size();
		int gridDataLength = gridDataList.size();
		
    	StringBuilder htmlStr = new StringBuilder();
    	htmlStr.append("<html><head><title>PDF</title>");
		htmlStr.append("<style type='text/css'>");
		htmlStr.append("	html,body {width:100%;height:100%;}");
		htmlStr.append("	body,div,dl,dt,dd,ul,ol,li,p {margin:0;padding:0;}");
		htmlStr.append("	body,div,table,td {font:10pt malgun;color:#2A2A2A;}");
		htmlStr.append("	th {border-top:1px solid gray;border-bottom:1px solid gray;padding:8px 0 8px 0;text-align:center;}");
		htmlStr.append("	td {padding-top:7px;padding-bottom:7px;border-bottom:1px solid #dedede;word-wrap:break-word;}");
		htmlStr.append("</style></head><body>");
		htmlStr.append("<table style='width:100%;border-collapse:collapse;border-spacing:0;table-layout:fixed;'>");
		
		// Header 부분
		htmlStr.append("<tr>");
		htmlStr.append("<th>");
		htmlStr.append("NO");
		htmlStr.append("</th>");
		
		for (int i=0; i<colModelLength; i++) {
			htmlStr.append("<th>");
			htmlStr.append(StringUtils.NULL(colModelList.get(i).get("label")));
			htmlStr.append("</th>");
    	}
		
		htmlStr.append("</tr>");

		// Body 부분
		for (int i=0; i<gridDataLength; i++) {
			htmlStr.append("<tr>");
			htmlStr.append("<td style=\"text-align:center;\">" + (i + 1) + "</td>");
			
			for (int j=0; j<colModelLength; j++) {
				if ("center".equals(colModelList.get(j).get("align")))
					htmlStr.append("<td style=\"text-align:center;\">");
				else if ("right".equals(colModelList.get(j).get("align")))
					htmlStr.append("<td style=\"text-align:right;padding-right:5px;\">");
				else
					htmlStr.append("<td style=\"padding-left:5px;\">");
    			
    			if ("integer".equals(colModelList.get(j).get("formatter")) || "number".equals(colModelList.get(j).get("formatter"))) {
    				htmlStr.append(String.format("%,d", Integer.parseInt(StringUtils.NULL(gridDataList.get(i).get(colModelList.get(j).get("name")), "0"))));
    			} else {
    				htmlStr.append(StringUtils.NULL(gridDataList.get(i).get(colModelList.get(j).get("name"))));
    			}
    			
    			htmlStr.append("</td>");
    		}
			
			htmlStr.append("</tr>");
        }
		
		htmlStr.append("</table>");
		htmlStr.append("</body></html>");

		return htmlStr;
    }
    
    public String getFilename() {
    	return this.title;
    }
}