package cn.sdu.travel.web.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.sdu.travel.bean.Application;
import cn.sdu.travel.bean.HumanResource;
import cn.sdu.travel.service.AuditorService;
import cn.sdu.travel.service.InternationService;
import cn.sdu.travel.service.impl.AuditorServiceImpl;
import cn.sdu.travel.service.impl.InternationServiceImpl;
import cn.sdu.travel.utils.Constants;

public class AcceptApplicationServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String rejectReason = request.getParameter("rejectReason");
		String appNo = request.getParameter("appNo");
		HumanResource hr = (HumanResource) request.getSession().getAttribute(
				"hr");

		Map<String, Object> map = new HashMap<String, Object>();
		String where = request.getParameter("where");
		if (where.equals("auditor")) {
			AuditorService service = new AuditorServiceImpl();
			map = service.acceptApply(hr.getRole(), appNo);
		} else if (where.equals("internation")) {
			InternationService service = new InternationServiceImpl();
			map = service.acceptApply(appNo);
		}
		if ((int) map.get("returnCode") == Constants.ACCEPT_APPLY_SUCCESS) {
			AuditorServiceImpl service2 = new AuditorServiceImpl();
			map = service2.getCheckApply(hr.getRole());
			if ((int) map.get("returnCode") == Constants.GET_CHECK_APPLY_SUCCESS) {
				request.setAttribute("apply",
						(List<Application>) map.get("data"));
				request.getRequestDispatcher(
						"/WEB-INF/" + where + "/review.jsp").forward(request,
						response);
			} else {
				request.setAttribute("returnInfo", map.get("returnInfo"));
				request.getRequestDispatcher("/web/exception.jsp").forward(
						request, response);
			}
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
