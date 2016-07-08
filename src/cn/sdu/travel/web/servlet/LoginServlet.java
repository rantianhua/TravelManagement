package cn.sdu.travel.web.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import cn.sdu.travel.bean.HumanResource;
import cn.sdu.travel.service.LoginService;
import cn.sdu.travel.service.impl.LoginServiceImpl;
import cn.sdu.travel.utils.Constants;
import cn.sdu.travel.utils.WebUtils;
import cn.sdu.travel.web.formbean.LoginForm;

public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 表单校验
		LoginForm form = WebUtils.request2Bean(request, LoginForm.class);
		if (!form.validate()) {
			request.setAttribute("form", form);
			request.getRequestDispatcher("/web/login.jsp").forward(request,
					response);
			return;
		}

		// 登录
		LoginService service = new LoginServiceImpl();
		String password = DigestUtils.md5Hex(form.getPassword());
		Map<String, Object> result = service.login(form.getId(), password);
		if (!((int) result.get("returnCode") == Constants.LOGIN_SUCCESS)) {
			request.setAttribute("form", form);
			request.setAttribute("returnInfo", result.get("returnInfo"));
			request.getRequestDispatcher("/web/login.jsp").forward(request,
					response);
			return;
		}
		HumanResource hr = (HumanResource) result.get("data");
		request.getSession().setAttribute("hr", hr);
		request.setAttribute("action", "2");
		request.getRequestDispatcher("/WEB-INF/pages/showuserinfo.jsp").forward(
				request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
