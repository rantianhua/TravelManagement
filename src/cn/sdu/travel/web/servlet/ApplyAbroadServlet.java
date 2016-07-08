package cn.sdu.travel.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ApplyAbraodServlet
 */
@WebServlet("/ApplyAbraodServlet")
public class ApplyAbroadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyAbroadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		if(name == null) return;
		request.setAttribute("action","4");
		String path = "/WEB-INF/pages/applykeeprecord.jsp";
		//暂时都跳到一个页面
		if(name.equals("tempSave")) {
			//临时保存
		}else if(name.equals("next")) {
			//下一步
		}
		request.getRequestDispatcher(path).forward(
				request, response);
	}

}
