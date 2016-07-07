package cn.sdu.travel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.sdu.travel.bean.VisitDestination;
import cn.sdu.travel.dao.VisitDestinationDao;
import cn.sdu.travel.utils.ManageDbUtils;

public class VisitDestinationDaoImpl implements VisitDestinationDao {
	@Override
	public void add(VisitDestination vd) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into visit_destination(plan_id,country,city,arrive_date,exit_city_date,trans_addr) values(?,?,?,?,?)";
		Object[] param = { vd.getPlanId(), vd.getCountry(), vd.getCity(),
				vd.getArriveDate(), vd.getExitCityDate(), vd.getTransAddr() };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public void delete(String pid) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from visit_destination where plan_id=?";
		runner.update(ManageDbUtils.getConnection(), sql, pid);
	}

	@Override
	public void update(VisitDestination vd) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update visit_destination set country=?,city=?,arrive_date=?,exit_city_date=?,trans_addr=? where plan_id=?";
		Object[] param = { vd.getCountry(), vd.getCity(), vd.getArriveDate(),
				vd.getExitCityDate(), vd.getTransAddr(), vd.getPlanId() };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public List<VisitDestination> findDestinations(String pid)
			throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from visit_destination where plan_id=?";
		return (List<VisitDestination>) runner.query(ManageDbUtils
				.getConnection(), sql, pid, new BeanListHandler(
				VisitDestination.class));
	}
}
