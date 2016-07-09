package cn.sdu.travel.web.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.sdu.travel.bean.HumanResource;
import cn.sdu.travel.bean.Passport;
import cn.sdu.travel.service.ApplicantService;
import cn.sdu.travel.service.impl.ApplicantServiceImpl;
import cn.sdu.travel.utils.Constants;

public class ApplyAbroadServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 跳过流程说明，开始进入申请页
		ApplicantService service = new ApplicantServiceImpl();
		HumanResource hr = (HumanResource) request.getSession().getAttribute(
				"hr");
		Map<String, Object> map = service.getPassportInfo(hr.getId());
		if ((int) map.get("returnCode") != Constants.GET_PASSPORT_INFO_SUCCESS) {
			request.setAttribute("returnInfo", map.get("returnInfo"));
			request.getRequestDispatcher("/web/exception.jsp").forward(request,
					response);
			return;
		} else {
			Passport p = (Passport) map.get("data");
			request.setAttribute("passport", (Passport) map.get("data"));
		}
		
		request.setAttribute("action", "9");
		request.getRequestDispatcher("/WEB-INF/pages/applyabroad.jsp").forward(
				request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		if (name == null)
			return;
		request.setAttribute("action", "4");
		String path = "/WEB-INF/pages/applykeeprecord.jsp";
		// 暂时都跳到一个页面
		if (name.equals("tempSave")) {
			// 临时保存
		} else if (name.equals("next")) {
			// 下一步
		}
		request.getRequestDispatcher(path).forward(request, response);
	}
}