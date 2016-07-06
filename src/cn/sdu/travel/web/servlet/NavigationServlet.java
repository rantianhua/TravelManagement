package cn.sdu.travel.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NavigationServlet
 */
@WebServlet("/NavigationServlet")
public class NavigationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NavigationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		parseRightPage(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		parseRightPage(request,response);
	}
	
	private void parseRightPage(HttpServletRequest request, HttpServletResponse response) {
		String rep = request.getParameter("action");
		String path = null;
		switch (rep) {
		case "1":
			//显示个人信息详情
			path = "/WEB-INF/pages/showuserinfo.jsp";
			break;
		case "2":
			//申请出国
			path = "/WEB-INF/pages/applyabroad.jsp";
			break;
		case "3":
			//状态查询
			path = "/WEB-INF/pages/checkstatus.jsp";
			break;	
		case "4":
			//回国校验
			path = "/WEB-INF/pages/backwriteoff.jsp";
			break;
		case "5":
			path = "/WEB-INF/pages/userdetail.jsp";
			break;
		default:
			break;
		}
		try {
			request.getRequestDispatcher(path).forward(
					request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
