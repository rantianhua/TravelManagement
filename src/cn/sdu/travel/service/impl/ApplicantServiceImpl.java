package cn.sdu.travel.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.sdu.travel.bean.Application;
import cn.sdu.travel.bean.EmergencyContactPerson;
import cn.sdu.travel.bean.Funds;
import cn.sdu.travel.bean.HumanResource;
import cn.sdu.travel.bean.Inviter;
import cn.sdu.travel.bean.Passport;
import cn.sdu.travel.bean.VisitDestination;
import cn.sdu.travel.bean.VisitPlan;
import cn.sdu.travel.bean.VisitPurpose;
import cn.sdu.travel.dao.ApplicationDao;
import cn.sdu.travel.dao.EmergencyContactPersonDao;
import cn.sdu.travel.dao.FundsDao;
import cn.sdu.travel.dao.HumanResourceDao;
import cn.sdu.travel.dao.InviterDao;
import cn.sdu.travel.dao.PassportDao;
import cn.sdu.travel.dao.VisitDestinationDao;
import cn.sdu.travel.dao.VisitPlanDao;
import cn.sdu.travel.dao.VisitPurposeDao;
import cn.sdu.travel.dao.impl.ApplicationDaoImpl;
import cn.sdu.travel.dao.impl.EmergencyContactPersonDaoImpl;
import cn.sdu.travel.dao.impl.FundsDaoImpl;
import cn.sdu.travel.dao.impl.HumanResourceDaoImpl;
import cn.sdu.travel.dao.impl.InviterDaoImpl;
import cn.sdu.travel.dao.impl.PassportDaoImpl;
import cn.sdu.travel.dao.impl.VisitDestinationDaoImpl;
import cn.sdu.travel.dao.impl.VisitPlanDaoImpl;
import cn.sdu.travel.dao.impl.VisitPurposeDaoImpl;
import cn.sdu.travel.service.ApplicantService;
import cn.sdu.travel.utils.HrDbUtils;
import cn.sdu.travel.utils.ManageDbUtils;

//申请者服务接口实现
public class ApplicantServiceImpl implements ApplicantService {

	// 修改个人资料
	@Override
	public Map<String, Object> saveUserInfo(HumanResource hr) {
		Map<String, Object> map = new HashMap<String, Object>();
		HumanResourceDao hdao = new HumanResourceDaoImpl();
		EmergencyContactPersonDao edao = new EmergencyContactPersonDaoImpl();

		try {
			HrDbUtils.startTransaction();
			hdao.update(hr);
			EmergencyContactPerson ecp = hr.getEcp();
			if (ecp != null) {
				if (edao.find(hr.getEmergencyContactPerson()) == null) {
					edao.add(ecp);
				} else {
					edao.update(ecp);
				}
			}
			HrDbUtils.commitTransaction();
			map.put("returnCode", 1300);
			map.put("returnInfo", "修改个人资料成功！");
			map.put("data", hr);
		} catch (SQLException e) {
			map.put("returnCode", 1999);
			map.put("returnInfo", "数据库异常！");
			e.printStackTrace();
			return map;
		} finally {
			HrDbUtils.closeConnection();
		}

		return map;
	}

	// 修改护照信息
	@Override
	public Map<String, Object> savePassportInfo(Passport p) {
		Map<String, Object> map = new HashMap<String, Object>();
		PassportDao pdao = new PassportDaoImpl();

		try {
			ManageDbUtils.startTransaction();
			Passport find = pdao.find(p.getIdentity());
			if (find == null) {
				pdao.add(p);
			} else {
				pdao.update(p);
			}
			map.put("returnCode", 1400);
			map.put("returnInfo", "修改护照信息成功！");
			map.put("data", p);
			ManageDbUtils.commitTransaction();
		} catch (SQLException e) {
			map.put("returnCode", 1999);
			map.put("returnInfo", "数据库异常！");
			e.printStackTrace();
			return map;
		} finally {
			ManageDbUtils.closeConnection();
		}

		return map;
	}

	// 获取护照信息
	@Override
	public Map<String, Object> getPassportInfo(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		PassportDao pdao = new PassportDaoImpl();
		try {
			Passport p = pdao.find(id);
			map.put("returnCode", 1401);
			map.put("data", p);
		} catch (SQLException e) {
			map.put("returnCode", 1999);
			map.put("returnInfo", "数据库异常！");
			e.printStackTrace();
			return map;
		} finally {
			ManageDbUtils.closeConnection();
		}
		return map;
	}

	// 保存申请
	public Map<String, Object> saveApply(Application app) {
		Map<String, Object> map = new HashMap<String, Object>();
		ApplicationDao adao = new ApplicationDaoImpl();
		VisitPlanDao vplandao = new VisitPlanDaoImpl();
		VisitDestinationDao vddao = new VisitDestinationDaoImpl();
		VisitPurposeDao vpdao = new VisitPurposeDaoImpl();
		PassportDao pdao = new PassportDaoImpl();
		InviterDao idao = new InviterDaoImpl();
		FundsDao fdao = new FundsDaoImpl();

		try {
			ManageDbUtils.startTransaction();

			VisitPlan vpFind = vplandao.find(app.getPlan());
			if (vpFind != null) {
				vplandao.update(app.getVplan());
			} else {
				vplandao.add(app.getVplan());
			}

			List<VisitDestination> destinations = vddao.findDestinations(app
					.getPlan());
			if (destinations.size() != 0) {
				vddao.delete(app.getPlan());
			}
			for (VisitDestination vd : app.getVplan().getDestinations()) {
				vddao.add(vd);
			}

			VisitPurpose pFind = vpdao.find(app.getPurpose());
			if (pFind != null) {
				vpdao.update(app.getVpurpose());
			} else {
				vpdao.add(app.getVpurpose());
			}

			Passport ppFind = pdao.find(app.getPassportId());
			if (ppFind != null) {
				pdao.updateForApply(app.getPassport());
			} else {
				pdao.add(app.getPassport());
			}

			Inviter iFind = idao.find(app.getInviterInfo());
			if (iFind != null) {
				idao.update(app.getInviter());
			} else {
				idao.add(app.getInviter());
			}

			Application appFind = adao.find(app.getApplicationNumber());
			if (appFind != null) {
				adao.update(app);
			} else {
				adao.add(app);
			}

			List<Funds> funds = fdao.findFunds(app.getApplicationNumber());
			if (funds.size() != 0) {
				fdao.delete(app.getApplicationNumber());
			}
			for (Funds f : app.getFunds()) {
				fdao.add(f);
			}

			ManageDbUtils.commitTransaction();
			map.put("returnCode", 1500);
			map.put("returnInfo", "申请保存成功！");
			map.put("data", app);
		} catch (SQLException e) {
			map.put("returnCode", 1999);
			map.put("returnInfo", "数据库异常！");
			e.printStackTrace();
			return map;
		} finally {
			ManageDbUtils.closeConnection();
		}
		return map;
	}

	@Override
	public Map<String, Object> getMyApply(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		ApplicationDao adao = new ApplicationDaoImpl();
		try {
			ManageDbUtils.startTransaction();
			List<Application> myOwnApply = adao.getMyOwnApply(id);
			List<Application> myAssigneeApply = adao.getMyAssigneeApply(id);
			ManageDbUtils.commitTransaction();

			map.put("returnCode", 1600);
			map.put("returnInfo", "查询我的申请成功！");
			map.put("data1", myOwnApply);
			map.put("data2", myAssigneeApply);
		} catch (SQLException e) {
			map.put("returnCode", 1999);
			map.put("returnInfo", "数据库异常！");
			e.printStackTrace();
			return map;
		} finally {
			ManageDbUtils.closeConnection();
		}
		return map;
	}

	// 获取申请详细信息
	@Override
	public Map<String, Object> getApplyDetail(String appNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		ApplicationDao adao = new ApplicationDaoImpl();
		VisitPlanDao vplandao = new VisitPlanDaoImpl();
		VisitDestinationDao vddao = new VisitDestinationDaoImpl();
		VisitPurposeDao vpdao = new VisitPurposeDaoImpl();
		PassportDao pdao = new PassportDaoImpl();
		InviterDao idao = new InviterDaoImpl();
		FundsDao fdao = new FundsDaoImpl();

		try {
			ManageDbUtils.startTransaction();

			Application app = adao.find(appNo);
			if (app == null) {
				map.put("returnCode", 1601);
				map.put("returnInfo", "获取申请信息失败！");
			} else {
				VisitPlan plan = vplandao.find(app.getPlan());
				if (plan != null) {
					List<VisitDestination> destinations = vddao.findDestinations(app.getPlan());
					plan.setDestinations(destinations);
				}
				app.setVplan(plan);
				VisitPurpose purpose = vpdao.find(app.getPurpose());
				app.setVpurpose(purpose);
				Passport passport = pdao.find(app.getPassportId());
				app.setPassport(passport);
				Inviter inviter = idao.find(app.getInviterInfo());
				app.setInviter(inviter);
				List<Funds> funds = fdao.findFunds(app.getApplicationNumber());
				app.setFunds(funds);
			}
			ManageDbUtils.commitTransaction();
			
			map.put("returnCode", 1602);
			map.put("returnInfo", "获取申请信息成功！");
			map.put("data", app);
		} catch (SQLException e) {
			map.put("returnCode", 1999);
			map.put("returnInfo", "数据库异常！");
			e.printStackTrace();
			return map;
		} finally {
			ManageDbUtils.closeConnection();
		}

		return map;
	}
}
