package cn.sdu.travel.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//检查session是否过期的过滤器
public class SessionCheckFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;

		String servletPath = request.getServletPath();
		if (servletPath.equals("/web/login.jsp")
				|| servletPath.equals("/web/register.jsp")
				|| servletPath.equals("/web/error.jsp")
				|| servletPath.equals("/servlet/LoginServlet")) {
			chain.doFilter(request, response);
			return;
		}
		if (request.getSession().getAttribute("hr") == null) {
			request.getRequestDispatcher("/web/error.jsp").forward(request, response);;
			return;
		}
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
