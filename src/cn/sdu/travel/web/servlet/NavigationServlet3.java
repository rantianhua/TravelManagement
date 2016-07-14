package cn.sdu.travel.web.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.sdu.travel.bean.Application;
import cn.sdu.travel.service.InternationService;
import cn.sdu.travel.service.impl.InternationServiceImpl;
import cn.sdu.travel.utils.Constants;

public class NavigationServlet3 extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		parseRightPage(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		parseRightPage(request, response);
	}

	private void parseRightPage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String rep = request.getParameter("action");
		String path = null;

		// 加载待审核申请
		if (rep.equals("1")) {
			InternationService service = new InternationServiceImpl();
			Map<String, Object> map = service.getCheckApply();
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
		}

		switch (rep) {
		case "1":
			// 审批界面
			path = "/WEB-INF/internation/checkapplication.jsp";
			break;
		case "2":
			// 审批核销
			path = "/WEB-INF/internation/xxx.jsp";
			break;
		case "3":
			// 出具批件
			path = "/WEB-INF/internation/xxx.jsp";
			break;
		default:
			break;
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

}
