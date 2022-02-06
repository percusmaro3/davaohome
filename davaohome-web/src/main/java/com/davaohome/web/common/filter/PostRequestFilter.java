package com.davaohome.web.common.filter;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;

// Request의 Content-Type이 application/json의 경우
// json 데이터를 jsonData를 키로 하여 request의 attribute에 넣는다.
public class PostRequestFilter implements Filter {

	private FilterConfig filterConfig;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
			ServletException {
		ServletRequestInputStreamCloner inputSteramCloner = null;

		if (StringUtils.startsWithIgnoreCase(request.getContentType(), "application/json")) {
			inputSteramCloner = new ServletRequestInputStreamCloner((HttpServletRequest) request);
			BufferedReader reader = inputSteramCloner.getReader();

			StringBuffer sb = new StringBuffer();
			String line = null;
			while ((line = reader.readLine()) != null) {
				sb.append(line + "\n");
			}

			if (sb != null && sb.length() > 0) {
				request.setAttribute("json", sb.toString());
			}
		}
		chain.doFilter(inputSteramCloner == null ? request : inputSteramCloner, response);
	}

	@Override
	public void destroy() {

	}

	// request.getInputStream(), request.getReader()를 override하여
	// 복사된 InputStream, Reader를 반환해주는 클래스
	private class ServletRequestInputStreamCloner extends HttpServletRequestWrapper {

		private ByteArrayOutputStream cachedBytes;

		private ServletRequestInputStreamCloner(HttpServletRequest request) {
			super(request);
		}

		@Override
		public ServletInputStream getInputStream() throws IOException {

			if (cachedBytes == null) {
				cacheBytes();
			}

			return new CachedServletInputStream();
		}

		private void cacheBytes() throws IOException {
			cachedBytes = new ByteArrayOutputStream();
			IOUtils.copy(super.getInputStream(), cachedBytes);
		}

		@Override
		public BufferedReader getReader() throws IOException {
			return new BufferedReader(new InputStreamReader(getInputStream()));
		}

		private class CachedServletInputStream extends ServletInputStream {

			private ByteArrayInputStream input;

			private CachedServletInputStream() {
				input = new ByteArrayInputStream(cachedBytes.toByteArray());
			}

			@Override
			public int read() throws IOException {
				return input.read();
			}
		}
	}
}
