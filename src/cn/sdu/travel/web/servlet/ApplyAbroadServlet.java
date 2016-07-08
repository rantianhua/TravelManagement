package cn.sdu.travel.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ApplyAbroadServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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