package cn.sdu.travel.web.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.sdu.travel.bean.Publicity;
import cn.sdu.travel.service.PublicityAndRecordService;
import cn.sdu.travel.service.impl.PublicityAndRecordServiceImpl;
import cn.sdu.travel.utils.Constants;

public class ShowNotifyServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String notifyNo = request.getParameter("notifyNo");
		if (getPublicityInfo(request, response, notifyNo)) {
			request.setAttribute("action", "12");
			request.getRequestDispatcher("/WEB-INF/pages/shownotify.jsp")
					.forward(request, response);
		}
	}

	private boolean getPublicityInfo(HttpServletRequest request,
			HttpServletResponse response, String notifyNo) {
		PublicityAndRecordService service = new PublicityAndRecordServiceImpl();
		Map<String, Object> map = service.findPublicity(notifyNo);
		if ((int) map.get(Constants.RETURN_CODE) == Constants.GET_PUBLICITY_SUCCESS) {
			Publicity publicity = (Publicity) map.get(Constants.RETURN_DATA);
			if (publicity == null) {
				System.out.println("获取的Publicity为空");
			}
			request.setAttribute("publicity", publicity);
			return true;
		} else {
			request.setAttribute(Constants.RETURN_INFO,
					map.get(Constants.RETURN_INFO));
			try {
				request.getRequestDispatcher("/web/exception.jsp").forward(
						request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}

	}

}
