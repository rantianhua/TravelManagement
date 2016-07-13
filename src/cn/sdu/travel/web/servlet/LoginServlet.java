package cn.sdu.travel.web.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import cn.sdu.travel.bean.Application;
import cn.sdu.travel.bean.HumanResource;
import cn.sdu.travel.service.InternationService;
import cn.sdu.travel.service.LoginService;
import cn.sdu.travel.service.impl.AuditorServiceImpl;
import cn.sdu.travel.service.impl.InternationServiceImpl;
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
		if ((int) result.get("returnCode") != Constants.LOGIN_SUCCESS) {
			request.setAttribute("form", form);
			request.setAttribute("returnInfo", result.get("returnInfo"));
			request.getRequestDispatcher("/web/login.jsp").forward(request,
					response);
			return;
		}
		HumanResource hr = (HumanResource) result.get("data");
		request.getSession().setAttribute("hr", hr);
		request.setAttribute("action", "1");
		if (hr.getRole().equals("r10")) {
			// 申请者
			request.getRequestDispatcher("/WEB-INF/pages/publicnotify.jsp")
					.forward(request, response);
		} else if (hr.getRole().equals("r30")) {
			// 国际部
			InternationService service2 = new InternationServiceImpl();
			Map<String, Object> map = service2.getCheckApply();
			if ((int) map.get("returnCode") == Constants.GET_CHECK_APPLY_SUCCESS) {
				request.setAttribute("apply",
						(List<Application>) map.get("data"));
				request.getRequestDispatcher("/WEB-INF/internation/review.jsp")
						.forward(request, response);
			} else {
				request.setAttribute("returnInfo", map.get("returnInfo"));
				request.getRequestDispatcher("/web/exception.jsp").forward(
						request, response);
			}
		} else {
			// 其他审核者
			AuditorServiceImpl service3 = new AuditorServiceImpl();
			Map<String, Object> map = service3.getCheckApply(hr.getRole());
			if ((int) map.get("returnCode") == Constants.GET_CHECK_APPLY_SUCCESS) {
				request.setAttribute("apply",
						(List<Application>) map.get("data"));
				request.getRequestDispatcher("/WEB-INF/auditor/review.jsp")
						.forward(request, response);
			} else {
				request.setAttribute("returnInfo", map.get("returnInfo"));
				request.getRequestDispatcher("/web/exception.jsp").forward(
						request, response);
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
