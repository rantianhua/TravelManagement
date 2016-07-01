package cn.sdu.travel.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.sdu.travel.bean.VisitPlan;
import cn.sdu.travel.dao.VisitPlanDao;
import cn.sdu.travel.utils.ManageDbUtils;

public class VisitPlanDaoImpl implements VisitPlanDao {
	@Override
	public void add(VisitPlan vp) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into visit_plan(plan_id,out_city,exit_border_date,back_city,enter_border_date) values(?,?,?,?,?)";
		Object[] param = { vp.getPlanId(), vp.getOutCity(),
				vp.getExitBorderDate(), vp.getBackCity(),
				vp.getEnterBorderDate() };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public void delete(String pid) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from visit_plan where plan_id=?";
		runner.update(ManageDbUtils.getConnection(), sql, pid);
	}

	@Override
	public void update(VisitPlan vp) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update visit_plan set out_city=?,exit_border_date=?,back_city=?,enter_border_date=? where plan_id=?";
		Object[] param = { vp.getOutCity(), vp.getExitBorderDate(),
				vp.getBackCity(), vp.getEnterBorderDate(), vp.getPlanId() };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public VisitPlan find(String pid) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "selete * from visit_plan where plan_id=?";
		return (VisitPlan) runner.query(ManageDbUtils.getConnection(), sql,
				pid, new BeanHandler(VisitPlan.class));
	}
}
