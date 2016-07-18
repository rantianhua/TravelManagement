package cn.sdu.travel.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import cn.sdu.travel.bean.Application;
import cn.sdu.travel.bean.Family;
import cn.sdu.travel.bean.HumanResource;
import cn.sdu.travel.bean.Publicity;
import cn.sdu.travel.bean.Record;
import cn.sdu.travel.bean.VisitMembers;
import cn.sdu.travel.service.ApplicantService;
import cn.sdu.travel.service.PublicityAndRecordService;
import cn.sdu.travel.service.impl.ApplicantServiceImpl;
import cn.sdu.travel.service.impl.PublicityAndRecordServiceImpl;
import cn.sdu.travel.utils.Constants;
import cn.sdu.travel.utils.WebUtils;
import cn.sdu.travel.web.formbean.PublicityAndRecordForm;

/**
 * Servlet implementation class ApplyKeepRecordServlet
 */
@WebServlet("/ApplyKeepRecordServlet")
public class ApplyKeepRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyKeepRecordServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//表单
		PublicityAndRecordForm form = WebUtils.request2Bean(request, PublicityAndRecordForm.class);
		if(form == null) {
			errorOccur(request,response,"转换form失败","ApplyKeepRecordForm");
			return;
		}
		String applicationNumber = request.getParameter("applicationNumber");
		if(Constants.LOG) {
			System.out.println("applicationNumber is " + applicationNumber);
		}
		String notify = request.getParameter("notify");
		if(Constants.LOG) {
			System.out.println("notify is " + notify);
		}
		//首先获取团组成员信息
		String visitMembersId = WebUtils.generateID();
		for(int i =1;i < 6;i++) {
			String name = request.getParameter("memberName" + i);
			String unit =  request.getParameter("memberUnit" + i);
			String title = request.getParameter("memberTitle" + i);
			if((name != null && name.length() > 0)|| (unit != null && unit.length() > 0) ||( title != null && title.length() > 0)) {
				VisitMembers member = new VisitMembers();
				member.setId(visitMembersId);
				member.setName(name);
				member.setUnit(unit);
				member.setTitle(title);
				form.getMembers().add(member);
			}
		}
		//获取家庭成员信息
		String familyId = WebUtils.generateID();
		for(int i =1;i < 6;i++) {
			String appellation = request.getParameter("familyAppellation" + i);
			String name =  request.getParameter("familyName" + i);
			String age = request.getParameter("familyAge" + i);
			String politicalStatus = request.getParameter("familyPoliticalStatus" + i);
			String otherInfo = request.getParameter("familyOtherInfo" + i);
			if((appellation != null && appellation.length() > 0) || (name != null && name.length() > 0) || (age != null && age.length() > 0) || (politicalStatus != null && politicalStatus.length() > 0)  || (otherInfo != null && otherInfo.length() >0 )) {
				Family family = new Family();
				family.setId(familyId);
				try {
					family.setAge(Integer.valueOf(age));
				} catch (Exception e) {
				}
				family.setAppellation(appellation);
				family.setName(name);
				family.setOtherInfo(otherInfo);
				family.setPoliticalStatus(politicalStatus);
				form.getFamilyMembers().add(family);
			}
		}
		if(form.commitValid()) {
			//开始保存数据
			Publicity publicity = null ;
			if(notify != null && notify.equals("1")) {
				publicity = new Publicity();
				publicity.setApplicationNumber(applicationNumber);
				publicity.setId(WebUtils.generateID());
				publicity.setBudget(form.getBudget());
				publicity.setDetailedSchedule(form.getDetailedSchedule());
				publicity.setEnterDate(form.getEnterDate());
				publicity.setExitDate(form.getExitDate());
				publicity.setInviterDesc(form.getInviterDesc());
				publicity.setTaskSummary(form.getTaskSummary());
				publicity.setTransferPlaces(form.getTransferPlaces());
				publicity.setVisitPersons(form.getVisitPersons());
				publicity.setVisitPlaces(form.getVisitPlaces());
				publicity.setVisitMembers(form.getMembers());
				if(publicity.getVisitMembers().size() > 0 && publicity != null) {
					publicity.setMembersId(visitMembersId);
				}
			}
			Record  record = new Record();
			record.setApplicationNumber(applicationNumber);
			record.setId(WebUtils.generateID());
			record.setAuthorityUnit(form.getAuthorityUnit());
			record.setBirthday(form.getRecordBirthday());
			record.setGroupUnit(form.getGroupUnit());
			record.setHealth(form.getRecordHealth());
			record.setLatestPlaces(form.getLatestPlaces());
			record.setName(form.getRecordName());
			record.setPlacesInfo(form.getPlacesInfo());
			record.setPoliticalStatus(form.getRecordPoliticalStatus());
			record.setPositionInGroup(form.getPositionInGroup());
			record.setSecretInfo(form.getRecordSecretInfo());
			record.setSex(form.getRecordSex());
			record.setFamilys(form.getFamilyMembers());
			if(record.getFamilys().size() > 0) {
				record.setFamilyMembers(familyId);
			}
			PublicityAndRecordService service = new PublicityAndRecordServiceImpl();
			Map<String,Object> map = service.saveRecord(record);
			if((int)map.get("returnCode") == Constants.SAVE_RECORD_SUCCESS) {
				//继续保存公示表信息
				if(publicity != null) {
					map = service.savePublicity(publicity);
					if((int)map.get("returnCode") == Constants.SAVE_PUBLICITY_SUCCESS) {
						saveSuccess(request, response);
					}else {
						errorOccur(request,response,(String)map.get("returnInfo") ,(String)map.get("data"));
					}
				}else {
					saveSuccess(request,response);
				}
			}else {
				errorOccur(request,response,(String)map.get("returnInfo") ,(String)map.get("data"));
			}
		}else {
			//表单校验失败
			request.setAttribute("applicationNumber", applicationNumber);
			request.setAttribute("notify", notify);
			request.setAttribute("form", form);
			if(Constants.LOG) {
				System.out.println("表单校验失败　" + form.getRecordName());
			}
			request.setAttribute("action", "9");
			request.getRequestDispatcher(
					"/WEB-INF/pages/applykeeprecord.jsp").forward(request,
					response);
			return;
		}
	}
	
	private void saveSuccess(HttpServletRequest request,
			HttpServletResponse response) {
		request.setAttribute("action", "5");
		ApplicantService service = new ApplicantServiceImpl();
		HumanResource hr = (HumanResource) request.getSession().getAttribute(
				"hr");
		Map<String, Object> map = service.getMyApply(hr.getId());
		if ((int) map.get("returnCode") != Constants.GET_MY_APPLY_SUCCESS) {
			errorOccur(request,response,(String)map.get("returnInfo"),null);
		} else {
			List<Application> ownApply = (List<Application>) map.get("data1");
			List<Application> assigneeApply = (List<Application>) map
					.get("data2");
			request.setAttribute("ownApply", ownApply);
			request.setAttribute("assigneeApply", assigneeApply);
			try {
				request.getRequestDispatcher("/WEB-INF/pages/checkstatus.jsp").forward(request,
						response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void errorOccur(HttpServletRequest request,HttpServletResponse response,String  info,String data) {
		request.setAttribute("returnInfo",info + data);
		try {
			request.getRequestDispatcher("/web/exception.jsp").forward(
					request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
