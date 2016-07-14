package cn.sdu.travel.web.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.sdu.travel.bean.Application;
import cn.sdu.travel.bean.Review;
import cn.sdu.travel.service.ApplicantService;
import cn.sdu.travel.service.impl.ApplicantServiceImpl;
import cn.sdu.travel.utils.Constants;

public class CheckApplicationServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String appNo = request.getParameter("appNo");
		ApplicantService service = new ApplicantServiceImpl();
		Map<String, Object> map = service.getApplyDetail(appNo);
		if ((int) map.get("returnCode") == Constants.GET_APPLY_DETAIL_SUCCESS) {
			Application apply = (Application) map.get("data");
			request.setAttribute("apply", apply);
			request.setAttribute("action", "1");
			map = service.getReviewInfo(appNo);
			request.setAttribute("review", (Review) map.get("data"));
			String where = request.getParameter("where");
			request.getRequestDispatcher(
					"/WEB-INF/" + where + "/checkapplicaiton.jsp").forward(
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
