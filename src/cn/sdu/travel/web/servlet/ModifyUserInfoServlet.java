package cn.sdu.travel.web.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.sdu.travel.bean.EmergencyContactPerson;
import cn.sdu.travel.bean.HumanResource;
import cn.sdu.travel.service.ApplicantService;
import cn.sdu.travel.service.impl.ApplicantServiceImpl;
import cn.sdu.travel.utils.Constants;
import cn.sdu.travel.utils.WebUtils;
import cn.sdu.travel.web.formbean.UserInfoForm;

public class ModifyUserInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 表单校验
		UserInfoForm form = WebUtils.request2Bean(request, UserInfoForm.class);
		String category = request.getParameter("category");
		if (category.equals("教学")) {
			form.setPosition(request.getParameter("position1"));
		} else if (category.equals("行政")) {
			form.setPosition(request.getParameter("position2"));
		} else if (category.equals("学生")) {
			form.setPosition(request.getParameter("position3"));
		}
		if (!form.validate()) {
			request.setAttribute("form", form);
			request.setAttribute("action", "2");
			request.getRequestDispatcher("/WEB-INF/pages/edituserinfo.jsp")
					.forward(request, response);
			return;
		}

		// 构建新的bean
		HumanResource hr = new HumanResource();
		WebUtils.copyBean(form, hr);
		HumanResource oldHr = (HumanResource) request.getSession()
				.getAttribute("hr");
		if (form.getCategory().equals("行政")) {
			hr.setPosition(form.getPosition() + "/" + form.getSubPosition());
		}
		hr.setId(oldHr.getId());
		hr.setEmergencyContactPerson(oldHr.getEmergencyContactPerson());

		if (form.getEcpName() != null) {
			EmergencyContactPerson ecp = new EmergencyContactPerson();
			ecp.setId(oldHr.getEmergencyContactPerson());
			ecp.setName(form.getEcpName());
			ecp.setEmail(form.getEcpEmail());
			ecp.setMobilePhone(form.getEcpMobilePhone());
			ecp.setFixedPhone(form.getEcpFixedPhone());
			hr.setEcp(ecp);
		}

		// 调用服务接口存储
		ApplicantService service = new ApplicantServiceImpl();
		Map<String, Object> result = service.saveUserInfo(hr);
		if ((int) result.get("returnCode") != Constants.MODIFY_USER_INFO_SUCCESS) {
			request.setAttribute("returnInfo", result.get("returnInfo"));
			request.getRequestDispatcher("/web/exception.jsp").forward(request,
					response);
			return;
		}

		request.getSession().setAttribute("hr", hr);
		request.setAttribute("action", "2");
		request.getRequestDispatcher("/WEB-INF/pages/showuserinfo.jsp")
				.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
