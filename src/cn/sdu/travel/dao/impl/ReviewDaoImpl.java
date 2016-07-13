package cn.sdu.travel.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.sdu.travel.bean.Review;
import cn.sdu.travel.dao.ReviewDao;
import cn.sdu.travel.utils.ManageDbUtils;

public class ReviewDaoImpl implements ReviewDao {
	@Override
	public void add(String appNo, String applyDate) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into review(application_id,apply_date) values(?,?)";
		Object[] param = { appNo, applyDate };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public void review(String arg1, String arg2, String arg3, String state,
			String time, String length, String appNo) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update review set " + arg1 + "=?," + arg2 + "=?," + arg3
				+ "=? where application_id=?";
		Object[] param = { state, time, length, appNo };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public void updateRejectReason(String appNo, String rejectReason)
			throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update review set reject_reason=? where application_id=?";
		Object[] param = { rejectReason, appNo };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public Review find(String appNo) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from review where application_id=?";
		return (Review) runner.query(ManageDbUtils.getConnection(), sql, appNo,
				new BeanHandler(Review.class));
	}

	@Override
	public void delete(String appNo) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from review where application_id=?";
		runner.update(ManageDbUtils.getConnection(), sql, appNo);
	}
}
