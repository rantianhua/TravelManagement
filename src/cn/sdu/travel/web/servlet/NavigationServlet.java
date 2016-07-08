package cn.sdu.travel.web.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.sdu.travel.bean.HumanResource;
import cn.sdu.travel.bean.Passport;
import cn.sdu.travel.service.ApplicantService;
import cn.sdu.travel.service.impl.ApplicantServiceImpl;
import cn.sdu.travel.utils.Constants;

@WebServlet("/NavigationServlet")
public class NavigationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		parseRightPage(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		parseRightPage(request, response);
	}

	private void parseRightPage(HttpServletRequest request,
			HttpServletResponse response) {
		String rep = request.getParameter("action");
		String path = null;

		// 加载护照信息
		if (rep.equals("3") || rep.equals("4") || rep.equals("8")) {
			ApplicantService service = new ApplicantServiceImpl();
			HumanResource hr = (HumanResource) request.getSession()
					.getAttribute("hr");
			Map<String, Object> map = service.getPassportInfo(hr.getId());
			if ((int) map.get("returnCode") != Constants.GET_PASSPORT_INFO_SUCCESS) {
				request.setAttribute("returnInfo", map.get("returnInfo"));
				path = "/web/exception.jsp";
				try {
					request.getRequestDispatcher(path).forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return;
			} else {
				Passport p = (Passport) map.get("data");
				request.setAttribute("passport", (Passport) map.get("data"));
			}
		}

		switch (rep) {
		case "1":
			// 显示公示信息
			path = "/WEB-INF/pages/showuserinfo.jsp";
			break;
		case "2":
			// 显示个人信息详情
			path = "/WEB-INF/pages/showuserinfo.jsp";
			break;
		case "3":
			// 护照管理
			path = "/WEB-INF/pages/passport.jsp";
			break;
		case "4":
			// 申请出国
			path = "/WEB-INF/pages/applyabroad.jsp";
			break;
		case "5":
			// 状态查询
			path = "/WEB-INF/pages/checkstatus.jsp";
			break;
		case "6":
			// 回国校验
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
			request.getRequestDispatcher(path).forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
