package bt.btframework.pdf;

import java.io.StringReader;
import java.nio.charset.Charset;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.output.ByteArrayOutputStream;

import com.itextpdf.text.Document;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

public class PdfCreate {
	private Document document;
	
	public PdfCreate() {
		// Document 생성
		this.document = new Document(PageSize.A4.rotate(), 20, 20, 80, 50);
	}
	
	public PdfCreate(Rectangle pageSize, int marginLeft, int marginRight, int marginTop, int marginBottom) {
		// Document 생성
		this.document = new Document(pageSize, marginLeft, marginRight, marginTop, marginBottom);
	}

	public byte[] setPDF(HttpServletRequest req, HttpServletResponse resp, PdfPageEvent event) throws Exception {
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		PdfWriter writer = PdfWriter.getInstance(document, bos);
		writer.setInitialLeading(12.5f);
		writer.setPageEvent(event);
		
		// Document 오픈
		document.open();
		
		// CSS
		CSSResolver cssResolver = new StyleAttrCSSResolver();
		//CssFile cssFile = helper.getCSS(new FileInputStream("C:/pdf.css"));
		//cssResolver.addCss(cssFile);
		
		// HTML, 폰트 설정
		XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
		//String path = req.getSession().getServletContext().getRealPath(File.separator) + File.separator + "css" + File.separator + "font" + File.separator + "NanumGothic.ttf";
		//fontProvider.register(path, "NanumGothic");
		fontProvider.register("C:/Windows/Fonts/malgun.TTF", "malgun");
		CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);
		
		HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
		htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
		
		// Pipelines
		PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
		HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
		CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);
		
		XMLWorker worker = new XMLWorker(css, true);
		XMLParser xmlParser = new XMLParser(worker, Charset.forName("UTF-8"));
		
		StringReader strReader = new StringReader(event.getHtmlContent().toString());
		xmlParser.parse(strReader);
		
		document.close();
		writer.close();
		
		byte[] pdfBinary = bos.toByteArray();
		bos.close();
		
		return pdfBinary;
	}
}
