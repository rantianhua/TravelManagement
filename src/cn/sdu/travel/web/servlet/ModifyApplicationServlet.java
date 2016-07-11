package cn.sdu.travel.web.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.sdu.travel.bean.Application;
import cn.sdu.travel.service.ApplicantService;
import cn.sdu.travel.service.impl.ApplicantServiceImpl;
import cn.sdu.travel.utils.Constants;

public class ModifyApplicationServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String appNo = request.getParameter("appNo");
		ApplicantService service = new ApplicantServiceImpl();
		Map<String, Object> map = service.getApplyDetail(appNo);
		if ((int) map.get("returnCode") == Constants.GET_APPLY_DETAIL_SUCCESS) {
			request.setAttribute("action", "9");
			request.setAttribute("apply", (Application) map.get("data"));
			request.getRequestDispatcher("/WEB-INF/pages/applyabroad.jsp").forward(
					request, response);
		} else {
			request.setAttribute("returnInfo", map.get("returnInfo"));
			request.getRequestDispatcher("/web/exception.jsp").forward(request,
					response);
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
