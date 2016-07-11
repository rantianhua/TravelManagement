package cn.sdu.travel.web.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.sdu.travel.bean.Application;
import cn.sdu.travel.bean.Funds;
import cn.sdu.travel.bean.HumanResource;
import cn.sdu.travel.bean.Inviter;
import cn.sdu.travel.bean.Passport;
import cn.sdu.travel.bean.VisitDestination;
import cn.sdu.travel.bean.VisitPlan;
import cn.sdu.travel.bean.VisitPurpose;
import cn.sdu.travel.dao.HumanResourceDao;
import cn.sdu.travel.dao.impl.HumanResourceDaoImpl;
import cn.sdu.travel.service.ApplicantService;
import cn.sdu.travel.service.impl.ApplicantServiceImpl;
import cn.sdu.travel.utils.Constants;
import cn.sdu.travel.utils.HrDbUtils;
import cn.sdu.travel.utils.WebUtils;
import cn.sdu.travel.web.formbean.ApplyForm;

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
		try {
			// 上传设置
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(1024 * 1024);
			factory.setRepository(new File(this.getServletContext()
					.getRealPath("/temp")));
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setFileSizeMax(1024 * 1024 * 10);

			upload.setHeaderEncoding("UTF-8");
			List<FileItem> list = upload.parseRequest(request);

			String submitName = null;
			// 处理申请
			for (FileItem item : list) {
				if (item.isFormField()
						&& item.getFieldName().equals("submitName")) {
					submitName = item.getString("UTF-8");
				}
			}

			// 封装表单
			ApplyForm form = new ApplyForm();
			int count = 1;
			for (FileItem item : list) {
				if (item.isFormField()) {
					String name = item.getFieldName();
					String value = item.getString("UTF-8");
					BeanUtils.setProperty(form, name, value);

					if (name.equals("cityCount")) {
						count = Integer.parseInt(value);
					}
				} else {
					String name = item.getFieldName();
					String value = item.getName();
					BeanUtils.setProperty(form, name, value);
				}
			}

			// 封装中途抵达城市
			for (int i = 1; i <= count; i++) {
				VisitDestination vd = new VisitDestination();
				String country = null, city = null, arriveDate = null, exitCityDate = null, transfer = null, transAddr = null;
				for (FileItem item : list) {
					if (item.isFormField()) {
						if (item.getFieldName().equals("reachCountry" + i)) {
							country = item.getString("UTF-8");
						}
						if (item.getFieldName().equals("reachCity" + i)) {
							city = item.getString("UTF-8");
						}
						if (item.getFieldName().equals("reachDate" + i)) {
							arriveDate = item.getString("UTF-8");
						}
						if (item.getFieldName().equals("exitDate" + i)) {
							exitCityDate = item.getString("UTF-8");
						}
						if (item.getFieldName().equals("transfer" + i)) {
							transfer = item.getString("UTF-8");
						}
						if (item.getFieldName().equals("transferAdress" + i)) {
							transAddr = item.getString("UTF-8");
						}
					}
				}
				if (country != null || city != null || arriveDate != null
						|| exitCityDate != null || transAddr != null) {
					vd.setCountry(country);
					vd.setCity(city);
					vd.setArriveDate(arriveDate);
					vd.setExitCityDate(exitCityDate);
					vd.setTransfer(transfer);
					vd.setTransAddr(transAddr);
					form.getDests().add(vd);
				}
			}

			// 封装经费信息
			for (int i = 1; i < 5; i++) {
				Funds f = new Funds();
				String payAmount = null, accountName = null, payItem = null, ps = null;
				for (FileItem item : list) {
					if (item.isFormField()) {
						if (item.getFieldName().equals("payAmount" + i)) {
							payAmount = item.getString("UTF-8");
						}
						if (item.getFieldName().equals("accountName" + i)) {
							accountName = item.getString("UTF-8");
						}
						if (item.getFieldName().equals("payItem" + i)) {
							payItem = item.getString("UTF-8");
						}
						if (item.getFieldName().equals("ps" + i)) {
							ps = item.getString("UTF-8");
						}
					}
				}
				f.setPayAmount(payAmount);
				f.setAccountName(accountName);
				f.setPayItem(payItem);
				f.setPs(ps);
				form.getFds().add(f);
			}

			if (submitName == null)
				return;
			if (submitName.equals("tempSave")) {
				// 临时保存
				// 表单校验
				if (!form.saveValidate()) {
					request.setAttribute("form", form);
					request.setAttribute("action", "9");
					request.getRequestDispatcher(
							"/WEB-INF/pages/applyabroad.jsp").forward(request,
							response);
					return;
				}

				// 创建要保存的申请对象
				Application app = new Application();
				WebUtils.copyBean(form, app);
				HumanResource hr = (HumanResource) request.getSession()
						.getAttribute("hr");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				if (form.getApplicationNumber() == null
						|| form.getApplicationNumber().trim().equals("")) {
					app.setApplicationNumber(WebUtils.generateID());
				} else {
					app.setApplicationNumber(form.getApplicationNumber());
				}
				app.setApplicantId(hr.getId());
				app.setApplyDate(sdf.format(new Date()));
				app.setPurposeContent(form.getPurpose());
				if (form.getPlanInfo() == null
						|| form.getPlanInfo().trim().equals("")) {
					app.setPlan(WebUtils.generateID());
				} else {
					app.setPlan(form.getPlanInfo());
				}
				if (form.getPurposeInfo() == null
						|| form.getPurposeInfo().trim().equals("")) {
					app.setPurpose(WebUtils.generateID());
				} else {
					app.setPurpose(form.getPurposeInfo());
				}
				if (form.getInviterInfo() == null
						|| form.getInviterInfo().trim().equals("")) {
					app.setInviterInfo(WebUtils.generateID());
				} else {
					app.setInviterInfo(form.getInviterInfo());
				}
				if (form.getAssigneeId() == null
						|| form.getAssigneeId().trim().equals("")) {
					app.setPassportId(hr.getId());
				} else {
					app.setPassportId(form.getAssigneeId().trim());
				}
				app.setStatus("----------");

				VisitPlan vplan = new VisitPlan();
				vplan.setPlanId(app.getPlan());
				vplan.setOutCity(form.getOutCity());
				vplan.setExitBorderDate(form.getExitBorderDate());
				vplan.setBackCity(form.getBackCity());
				vplan.setEnterBorderDate(form.getEnterBorderDate());
				for (VisitDestination d : form.getDests()) {
					d.setPlanId(vplan.getPlanId());
				}
				vplan.setDestinations(form.getDests());
				app.setVplan(vplan);

				Passport passport = new Passport();
				WebUtils.copyBean(form, passport);
				if (form.getAssigneeId() == null
						|| form.getAssigneeId().trim().equals("")) {
					passport.setIdentity(hr.getId());
				} else {
					passport.setIdentity(form.getAssigneeId());
				}
				app.setPassport(passport);

				VisitPurpose vpurpose = new VisitPurpose();
				WebUtils.copyBean(form, vpurpose);
				vpurpose.setId(app.getPurpose());
				app.setVpurpose(vpurpose);

				Inviter inviter = new Inviter();
				WebUtils.copyBean(form, inviter);
				inviter.setId(app.getInviterInfo());
				inviter.setName(form.getiName());
				inviter.setTitleCh(form.getiTitleCh());
				inviter.setTitleEn(form.getiTitleEn());
				app.setInviter(inviter);

				boolean b = false;
				for (Funds f : form.getFds()) {
					if (!b) {
						f.setPayType("1");
						b = true;
					} else {
						f.setPayType("2");
					}
					f.setId(app.getApplicationNumber());
				}
				Funds f3 = new Funds();
				f3.setPayType("3");
				f3.setId(app.getApplicationNumber());
				f3.setPayDetail(form.getPayDetail());
				f3.setProveFile(form.getProveFile());
				form.getFds().add(f3);
				app.setFunds(form.getFds());

				// 保存
				ApplicantService service = new ApplicantServiceImpl();
				Map<String, Object> map = service.saveApply(app);
				if ((int) map.get("returnCode") == Constants.SAVE_APPLY_SUCCESS) {
					request.setAttribute("action", "5");
					map = service.getMyApply(hr.getId());
					if ((int) map.get("returnCode") != Constants.GET_MY_APPLY_SUCCESS) {
						request.setAttribute("returnInfo",
								map.get("returnInfo"));
						request.getRequestDispatcher("/web/exception.jsp")
								.forward(request, response);
						return;
					} else {
						List<Application> ownApply = (List<Application>) map
								.get("data1");
						List<Application> assigneeApply = (List<Application>) map
								.get("data2");
						request.setAttribute("ownApply", ownApply);
						request.setAttribute("assigneeApply", assigneeApply);
					}
					String path = "/WEB-INF/pages/checkstatus.jsp";
					request.getRequestDispatcher(path).forward(request,
							response);
				} else {
					request.setAttribute("returnInfo", map.get("returnInfo"));
					request.getRequestDispatcher("/web/exception.jsp").forward(
							request, response);
				}

			} else if (submitName.equals("next")) {
				// 表单校验
				if (!form.commitValidate()) {
					request.setAttribute("form", form);
					request.setAttribute("action", "9");
					request.getRequestDispatcher(
							"/WEB-INF/pages/applyabroad.jsp").forward(request,
							response);
					return;
				}

				// 上传文件
				for (FileItem item : list) {
					if (!item.isFormField()) {
						if (item.getName() != null
								&& !item.getName().trim().equals("")) {
							String filename = item.getName().substring(
									item.getName().lastIndexOf("\\") + 1);
							InputStream in = item.getInputStream();
							int len = 0;
							byte buffer[] = new byte[1024];
							String saveFileName = WebUtils
									.generateFileName(filename);
							String savepath = WebUtils.generateSavePath(
									this.getServletContext().getRealPath(
											"/upload/file"), saveFileName);
							String path = savepath + File.separator
									+ saveFileName;
							FileOutputStream out = new FileOutputStream(path);
							while ((len = in.read(buffer)) > 0) {
								out.write(buffer, 0, len);
							}
							in.close();
							out.close();
							item.delete();

							String name = item.getFieldName();
							String value = path.substring(path
									.indexOf(File.separator + "upload"
											+ File.separator + "file"));
							BeanUtils.setProperty(form, name, value);
						}
					}
				}

				// 创建要保存的申请对象
				Application app = new Application();
				WebUtils.copyBean(form, app);
				HumanResource hr = (HumanResource) request.getSession()
						.getAttribute("hr");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				if (form.getApplicationNumber() == null
						|| form.getApplicationNumber().trim().equals("")) {
					app.setApplicationNumber(WebUtils.generateID());
				} else {
					app.setApplicationNumber(form.getApplicationNumber());
				}
				app.setApplicantId(hr.getId());
				app.setApplyDate(sdf.format(new Date()));
				app.setPurposeContent(form.getPurpose());
				if (form.getPlanInfo() == null
						|| form.getPlanInfo().trim().equals("")) {
					app.setPlan(WebUtils.generateID());
				} else {
					app.setPlan(form.getPlanInfo());
				}
				if (form.getPurposeInfo() == null
						|| form.getPurposeInfo().trim().equals("")) {
					app.setPurpose(WebUtils.generateID());
				} else {
					app.setPurpose(form.getPurposeInfo());
				}
				if (form.getInviterInfo() == null
						|| form.getInviterInfo().trim().equals("")) {
					app.setInviterInfo(WebUtils.generateID());
				} else {
					app.setInviterInfo(form.getInviterInfo());
				}
				if (form.getAssigneeId() == null
						|| form.getAssigneeId().trim().equals("")) {
					app.setPassportId(hr.getId());
				} else {
					app.setPassportId(form.getAssigneeId().trim());
				}
				app.setStatus("0000000000");

				VisitPlan vplan = new VisitPlan();
				vplan.setPlanId(app.getPlan());
				vplan.setOutCity(form.getOutCity());
				vplan.setExitBorderDate(form.getExitBorderDate());
				vplan.setBackCity(form.getBackCity());
				vplan.setEnterBorderDate(form.getEnterBorderDate());
				for (VisitDestination d : form.getDests()) {
					d.setPlanId(vplan.getPlanId());
				}
				vplan.setDestinations(form.getDests());
				app.setVplan(vplan);

				Passport passport = new Passport();
				WebUtils.copyBean(form, passport);
				if (form.getAssigneeId() == null
						|| form.getAssigneeId().trim().equals("")) {
					passport.setIdentity(hr.getId());
				} else {
					passport.setIdentity(form.getAssigneeId());
				}
				app.setPassport(passport);

				VisitPurpose vpurpose = new VisitPurpose();
				WebUtils.copyBean(form, vpurpose);
				vpurpose.setId(app.getPurpose());
				app.setVpurpose(vpurpose);

				Inviter inviter = new Inviter();
				WebUtils.copyBean(form, inviter);
				inviter.setId(app.getInviterInfo());
				inviter.setName(form.getiName());
				inviter.setTitleCh(form.getiTitleCh());
				inviter.setTitleEn(form.getiTitleEn());
				app.setInviter(inviter);

				boolean b = false;
				for (Funds f : form.getFds()) {
					if (!b) {
						f.setPayType("1");
						b = true;
					} else {
						f.setPayType("2");
					}
					f.setId(app.getApplicationNumber());
				}
				Funds f3 = new Funds();
				f3.setPayType("3");
				f3.setId(app.getApplicationNumber());
				f3.setPayDetail(form.getPayDetail());
				f3.setProveFile(form.getProveFile());
				form.getFds().add(f3);
				app.setFunds(form.getFds());

				// 保存
				ApplicantService service = new ApplicantServiceImpl();
				Map<String, Object> map = service.saveApply(app);
				if ((int) map.get("returnCode") == Constants.SAVE_APPLY_SUCCESS) {
					// 判断是否需要公示
					if (form.getAssigneeId() == null
							|| form.getAssigneeId().trim().equals("")) {
						if (hr.getPosition().contains("处级")
								|| hr.getPosition().contains("部级")) {
							request.setAttribute("notify", "1");
						}
					} else {
						HumanResourceDao dao = new HumanResourceDaoImpl();
						HumanResource find = dao.find(form.getAssigneeId());
						if (find.getPosition().contains("处级")
								|| find.getPosition().contains("部级")) {
							request.setAttribute("notify", "1");
						}
					}
					HrDbUtils.closeConnection();
					request.setAttribute("action", "11");
					request.setAttribute("apply", (Application) map.get("data"));
					String path = "/WEB-INF/pages/applykeeprecord.jsp";
					request.getRequestDispatcher(path).forward(request,
							response);
				} else {
					request.setAttribute("returnInfo", map.get("returnInfo"));
					request.getRequestDispatcher("/web/exception.jsp").forward(
							request, response);
				}
			}
		} catch (ParseException e) {
			request.setAttribute("returnInfo", "时间转换错误！");
			request.getRequestDispatcher("/web/exception.jsp").forward(request,
					response);
		} catch (FileUploadBase.FileSizeLimitExceededException e) {
			request.setAttribute("message", "文件大小不能超过10M");
			request.setAttribute("action", "9");
			request.getRequestDispatcher("/WEB-INF/pages/applyabroad.jsp")
					.forward(request, response);
			return;
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("returnInfo", "未知错误！");
			request.getRequestDispatcher("/web/exception.jsp").forward(request,
					response);
		}
	}
}