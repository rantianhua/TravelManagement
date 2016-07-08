package cn.sdu.travel.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/NavigationServlet")
public class NavigationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		parseRightPage(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		parseRightPage(request,response);
	}
	
	private void parseRightPage(HttpServletRequest request, HttpServletResponse response) {
		String rep = request.getParameter("action");
		String path = null;
		switch (rep) {
		case "1":
			//显示公示信息
			path = "/WEB-INF/pages/showuserinfo.jsp";
			break;
		case "2":
			//显示个人信息详情
			path = "/WEB-INF/pages/showuserinfo.jsp";
			break;
		case "3":
			//护照管理
			path = "/WEB-INF/pages/passport.jsp";
			break;
		case "4":
			//申请出国
			path = "/WEB-INF/pages/applyabroad.jsp";
			break;
		case "5":
			//状态查询
			path = "/WEB-INF/pages/checkstatus.jsp";
			break;	
		case "6":
			//回国校验
			path = "/WEB-INF/pages/backwriteoff.jsp";
			break;
		case "7":
			path = "/WEB-INF/pages/edituserinfo.jsp";
			break;
		case "8":
			path = "/WEB-INF/pages/editpassport.jsp";
			break;
		default:
			break;
		}
		try {
			request.getRequestDispatcher(path).forward(
					request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
