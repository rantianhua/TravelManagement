package cn.sdu.travel.web.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import cn.sdu.travel.bean.HumanResource;
import cn.sdu.travel.service.RegisterService;
import cn.sdu.travel.service.impl.RegisterServiceImpl;
import cn.sdu.travel.utils.Constants;
import cn.sdu.travel.utils.WebUtils;
import cn.sdu.travel.web.formbean.RegisterForm;

public class RegisterServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");

		RegisterForm form = WebUtils.request2Bean(request, RegisterForm.class);
		if (!form.validate()) {
			request.setAttribute("form", form);
			request.getRequestDispatcher("/web/register.jsp").forward(request,
					response);
			return;
		}

		HumanResource hr = new HumanResource();
		hr.setId(id);
		hr.setPassword(DigestUtils.md5Hex(password));

		RegisterService service = new RegisterServiceImpl();
		Map<String, Object> result = service.register(hr);
		request.setAttribute("form", form);
		request.setAttribute("returnInfo", result.get("returnInfo"));
		if (!((int) result.get("returnCode") == Constants.REGISTER_SUCCESS)) {
			request.getRequestDispatcher("/web/register.jsp").forward(request,
					response);
		} else {
			request.getRequestDispatcher("/web/login.jsp").forward(request,
					response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
