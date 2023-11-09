package bt.api.aop;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;

public class RereadableRequestWrapper extends HttpServletRequestWrapper {

	private final Charset encoding;
	private byte[] rawData;

	public RereadableRequestWrapper(HttpServletRequest request) throws IOException {
		super(request);
		
		String characterEncoding = request.getCharacterEncoding();
		if (StringUtils.isBlank(characterEncoding)) {
			characterEncoding = StandardCharsets.UTF_8.name();
		}
		
		this.encoding = Charset.forName(characterEncoding);

		// Convert InputStream data to byte array and store it to this wrapper instance.
		try {
			InputStream inputStream = request.getInputStream();
			this.rawData = IOUtils.toByteArray(inputStream);
		} catch (IOException e) {
			throw e;
		}
	}
	
	@Override
	public ServletInputStream getInputStream() throws IOException {
		final ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(this.rawData);
		ServletInputStream servletInputStream = new ServletInputStream() {
			public int read() throws IOException {
				return byteArrayInputStream.read();
			}
		};
		
		return servletInputStream;
	}

	@Override
	public BufferedReader getReader() throws IOException {
		return new BufferedReader(new InputStreamReader(this.getInputStream(), this.encoding));
	}

	@Override
	public ServletRequest getRequest() {
		return super.getRequest();
	}
}