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
import cn.sdu.travel.service.AuditorService;
import cn.sdu.travel.utils.HrDbUtils;
import cn.sdu.travel.utils.ManageDbUtils;
import cn.sdu.travel.utils.WebUtils;

public class AuditorServiceImpl implements AuditorService {
	@Override
	public Map<String, Object> getCheckApply(String role) {
		Map<String, Object> map = new HashMap<String, Object>();
		ApplicationDao adao = new ApplicationDaoImpl();
		List<Application> apply = new ArrayList<Application>();
		try {
			ManageDbUtils.startTransaction();

			if (role.equals("r20")) {
				apply = adao.getApplyByStatusNoPublicity("研究生", "0000000000");
			} else if (role.equals("r21")) {
				apply = adao.getApplyByStatus("教学", "0000000000");
				apply.addAll(adao.getApplyByStatusNoPublicity("行政",
						"0000000000"));
				apply.addAll(adao.getApplyByStatusNoPublicity("本科",
						"0000000000"));
				apply.addAll(adao.getApplyByStatus("研究生", "0000000001"));
			} else if (role.equals("r22")) {
				apply = adao.getApplyByStatus("0000000010");
			} else if (role.equals("r23")) {
				apply = adao.getApplyByStatus("教学", "0000000100");
				apply.addAll(adao.getApplyByStatus("行政", "0000000100"));
			} else if (role.equals("r24")) {
				apply = adao.getApplyByStatus("本科", "0000000100");
			} else if (role.equals("r25")) {
				apply = adao.getApplyByStatus("研究生", "0000000100");
			} else if (role.equals("r26")) {
				apply = adao.getApplyByStatus("本科", "0000010000");
			} else if (role.equals("r27")) {
				apply = adao.getApplyByStatus("研究生", "0000100000");
			} else if (role.equals("r28")) {
				apply = adao.getApplyByStatus("教学", "0100000000");
				apply.addAll(adao.getApplyByStatus("行政", "0100000000"));
			}

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
	public Map<String, Object> rejectApply(String role, String appNo,
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

			if (role.equals("r20")) {
				adao.setApplyStatus(appNo, "0000000002");
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getApplyDate()));
				rdao.review("tutor_state", "tutor_time", "tutor_length", "驳回",
						date2, day + "天", appNo);
			} else if (role.equals("r21")) {
				if (app.getCategory().equals("研究生")) {
					adao.setApplyStatus(appNo, "0000000020");
					int day = WebUtils.daysBetween(date,
							sdf.parse(review.getTutorTime()));
					rdao.review("depart_lead_state", "depart_lead_time",
							"depart_lead_length", "驳回", date2, day + "天", appNo);
				} else {
					adao.setApplyStatus(appNo, "0000000020");
					int day = WebUtils.daysBetween(date,
							sdf.parse(review.getApplyDate()));
					rdao.review("depart_lead_state", "depart_lead_time",
							"depart_lead_length", "驳回", date2, day + "天", appNo);
				}
			} else if (role.equals("r22")) {
				adao.setApplyStatus(appNo, "0000000200");
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getDepartLeadTime()));
				rdao.review("finance_state", "finance_time", "finance_length",
						"驳回", date2, day + "天", appNo);
			} else if (role.equals("r23")) {
				adao.setApplyStatus(appNo, "0000002000");
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getFinanceTime()));
				rdao.review("hr_state", "hr_time", "hr_length", "驳回", date2,
						day + "天", appNo);
			} else if (role.equals("r24")) {
				adao.setApplyStatus(appNo, "0000020000");
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getFinanceTime()));
				rdao.review("bks_state", "bks_time", "bks_length", "驳回", date2,
						day + "天", appNo);
			} else if (role.equals("r25")) {
				adao.setApplyStatus(appNo, "0000200000");
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getFinanceTime()));
				rdao.review("yjs_state", "yjs_time", "yjs_length", "驳回", date2,
						day + "天", appNo);
			} else if (role.equals("r26")) {
				adao.setApplyStatus(appNo, "0002000000");
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getBksTime()));
				rdao.review("xgb_state", "xgb_time", "xgb_length", "驳回", date2,
						day + "天", appNo);
			} else if (role.equals("r27")) {
				adao.setApplyStatus(appNo, "0002000000");
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getYjsTime()));
				rdao.review("ygb_state", "ygb_time", "ygb_length", "驳回", date2,
						day + "天", appNo);
			} else if (role.equals("r28")) {
				adao.setApplyStatus(appNo, "2000000000");
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getInternationTime()));
				rdao.review("school_lead_state", "school_lead_time",
						"school_lead_length", "驳回", date2, day + "天", appNo);
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
	public Map<String, Object> acceptApply(String role, String appNo) {
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

			if (role.equals("r20")) {
				adao.setApplyStatus(appNo, "0000000001");
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getApplyDate()));
				rdao.review("tutor_state", "tutor_time", "tutor_length", "已审核",
						date2, day + "天", appNo);
			} else if (role.equals("r21")) {
				if (app.getCategory().equals("研究生")) {
					adao.setApplyStatus(appNo, "0000000010");
					int day = WebUtils.daysBetween(date,
							sdf.parse(review.getTutorTime()));
					rdao.review("depart_lead_state", "depart_lead_time",
							"depart_lead_length", "已审核", date2, day + "天", appNo);
				} else {
					adao.setApplyStatus(appNo, "0000000010");
					int day = WebUtils.daysBetween(date,
							sdf.parse(review.getApplyDate()));
					rdao.review("depart_lead_state", "depart_lead_time",
							"depart_lead_length", "已审核", date2, day + "天", appNo);
				}
			} else if (role.equals("r22")) {
				adao.setApplyStatus(appNo, "0000000100");
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getDepartLeadTime()));
				rdao.review("finance_state", "finance_time", "finance_length",
						"已审核", date2, day + "天", appNo);
			} else if (role.equals("r23")) {
				adao.setApplyStatus(appNo, "0000001000");
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getFinanceTime()));
				rdao.review("hr_state", "hr_time", "hr_length", "已审核", date2,
						day + "天", appNo);
			} else if (role.equals("r24")) {
				adao.setApplyStatus(appNo, "0000010000");
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getFinanceTime()));
				rdao.review("bks_state", "bks_time", "bks_length", "已审核", date2,
						day + "天", appNo);
			} else if (role.equals("r25")) {
				adao.setApplyStatus(appNo, "0000100000");
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getFinanceTime()));
				rdao.review("yjs_state", "yjs_time", "yjs_length", "已审核", date2,
						day + "天", appNo);
			} else if (role.equals("r26")) {
				adao.setApplyStatus(appNo, "0001000000");
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getBksTime()));
				rdao.review("xgb_state", "xgb_time", "xgb_length", "已审核", date2,
						day + "天", appNo);
			} else if (role.equals("r27")) {
				adao.setApplyStatus(appNo, "0001000000");
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getYjsTime()));
				rdao.review("ygb_state", "ygb_time", "ygb_length", "已审核", date2,
						day + "天", appNo);
			} else if (role.equals("r28")) {
				adao.setApplyStatus(appNo, "1000000000");
				int day = WebUtils.daysBetween(date,
						sdf.parse(review.getInternationTime()));
				rdao.review("school_lead_state", "school_lead_time",
						"school_lead_length", "已审核", date2, day + "天", appNo);
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
