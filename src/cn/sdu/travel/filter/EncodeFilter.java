package cn.sdu.travel.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

//解决全站乱码的过滤器
public class EncodeFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		chain.doFilter(new MyRequest(request), response);
	}

	public void init(FilterConfig filterConfig) throws ServletException {

	}

	class MyRequest extends HttpServletRequestWrapper {
		private HttpServletRequest request;

		public MyRequest(HttpServletRequest request) {
			super(request);
			this.request = request;
		}

		public String getParameter(String name) {
			String value = request.getParameter(name);
			if (!request.getMethod().equalsIgnoreCase("get")) {
				return value;
			}
			if (value == null) {
				return null;
			}
			try {
				return value = new String(value.getBytes("iso8859-1"),
						request.getCharacterEncoding());
			} catch (UnsupportedEncodingException e) {
				throw new RuntimeException(e);
			}
		}
	}
}