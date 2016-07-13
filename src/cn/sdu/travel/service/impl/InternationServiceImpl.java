package cn.sdu.travel.service.impl;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.sdu.travel.bean.Application;
import cn.sdu.travel.bean.Review;
import cn.sdu.travel.dao.ApplicationDao;
import cn.sdu.travel.dao.ReviewDao;
import cn.sdu.travel.dao.impl.ApplicationDaoImpl;
import cn.sdu.travel.dao.impl.ReviewDaoImpl;
import cn.sdu.travel.service.InternationService;
import cn.sdu.travel.utils.HrDbUtils;
import cn.sdu.travel.utils.ManageDbUtils;
import cn.sdu.travel.utils.WebUtils;

//国际部服务
public class InternationServiceImpl implements InternationService {
	@Override
	public Map<String, Object> getCheckApply() {
		Map<String, Object> map = new HashMap<String, Object>();
		ApplicationDao adao = new ApplicationDaoImpl();
		List<Application> apply = new ArrayList<Application>();
		try {
			ManageDbUtils.startTransaction();

			apply = adao.getApplyByStatus("教学", "0000001000");
			apply.addAll(adao.getApplyByStatus("行政", "0000001000"));
			apply.addAll(adao.getApplyByStatus("本科", "0001000000"));
			apply.addAll(adao.getApplyByStatus("研究生", "0010000000"));

			ManageDbUtils.commitTransaction();

			map.put("returnCode", 2000);
			map.put("returnInfo", "获取待审查申请信息成功！");
			map.put("data", apply);
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

	@Override
	public Map<String, Object> rejectApply(String appNo,
			String rejectReason) {
		Map<String, Object> map = new HashMap<String, Object>();
		ApplicationDao adao = new ApplicationDaoImpl();
		ReviewDao rdao = new ReviewDaoImpl();
		try {
			ManageDbUtils.startTransaction();

			Review review = rdao.find(appNo);
			Application app = adao.find(appNo);
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String date2 = sdf.format(date);

			adao.setApplyStatus(appNo, "0200000000");
			if (app.getCategory().equals("本科")) {
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getXgbTime()));
				rdao.review("internation_state", "internation_time",
						"internation_length", "驳回", date2, day + "天", appNo);
			} else if (app.getCategory().equals("研究生")) {
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getYgbTime()));
				rdao.review("internation_state", "internation_time",
						"internation_length", "驳回", date2, day + "天", appNo);
			} else {
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getHrTime()));
				rdao.review("internation_state", "internation_time",
						"internation_length", "驳回", date2, day + "天", appNo);
			}

			rdao.updateRejectReason(appNo, rejectReason);
			ManageDbUtils.commitTransaction();

			map.put("returnCode", 2100);
			map.put("returnInfo", "驳回申请成功！");
		} catch (SQLException e) {
			map.put("returnCode", 1999);
			map.put("returnInfo", "数据库异常！");
			e.printStackTrace();
			return map;
		} catch (ParseException e) {
			map.put("returnCode", 1999);
			map.put("returnInfo", "日期转换异常！");
			e.printStackTrace();
			return map;
		} finally {
			HrDbUtils.closeConnection();
		}

		return map;
	}

	@Override
	public Map<String, Object> acceptApply(String appNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		ApplicationDao adao = new ApplicationDaoImpl();
		ReviewDao rdao = new ReviewDaoImpl();
		try {
			ManageDbUtils.startTransaction();

			Review review = rdao.find(appNo);
			Application app = adao.find(appNo);
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String date2 = sdf.format(date);

			adao.setApplyStatus(appNo, "0100000000");
			if (app.getCategory().equals("本科")) {
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getXgbTime()));
				rdao.review("internation_state", "internation_time",
						"internation_length", "已审核", date2, day + "天", appNo);
			} else if (app.getCategory().equals("研究生")) {
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getYgbTime()));
				rdao.review("internation_state", "internation_time",
						"internation_length", "已审核", date2, day + "天", appNo);
			} else {
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getHrTime()));
				rdao.review("internation_state", "internation_time",
						"internation_length", "已审核", date2, day + "天", appNo);
			}

			ManageDbUtils.commitTransaction();

			map.put("returnCode", 2200);
			map.put("returnInfo", "批准申请成功！");
		} catch (SQLException e) {
			map.put("returnCode", 1999);
			map.put("returnInfo", "数据库异常！");
			e.printStackTrace();
			return map;
		} catch (ParseException e) {
			map.put("returnCode", 1999);
			map.put("returnInfo", "日期转换异常！");
			e.printStackTrace();
			return map;
		} finally {
			HrDbUtils.closeConnection();
		}

		return map;
	}
}
