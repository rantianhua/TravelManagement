package cn.sdu.travel.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.sdu.travel.bean.Vertification;
import cn.sdu.travel.dao.VertificationDao;
import cn.sdu.travel.utils.ManageDbUtils;

public class VertificationDaoImpl implements VertificationDao {

	/* (non-Javadoc)
	 * @see cn.sdu.travel.dao.impl.VertificationDao#add(cn.sdu.travel.bean.Vertification)
	 */
	@Override
	public void add(Vertification ve) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into vertification(vertification_id,exit_border_date,enter_border_date,vertification_program,vertification_money,vertification_summerize,vertification_stuff) values(?,?,?,?,?,?,?)";
		Object[] param = {ve.getVertificationId(),ve.getExitBorderDate(),ve.getEnterBorderDate(),
				ve.getVertificationProgram(),ve.getVertificationMoney(),
				ve.getVertificationSummerize(),ve.getVertificationStuff() };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}


	/* (non-Javadoc)
	 * @see cn.sdu.travel.dao.impl.VertificationDao#delete(java.lang.String)
	 */
	@Override
	public void delete(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from vertification where vertification_id=?";
		runner.update(ManageDbUtils.getConnection(), sql, id);
	}


	/* (non-Javadoc)
	 * @see cn.sdu.travel.dao.impl.VertificationDao#update(cn.sdu.travel.bean.Vertification)
	 */
	@Override
	public void update(Vertification ve) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update vertification set exit_border_date=?,enter_border_date=?,vertification_program=?,vertification_money=?,vertification_summerize=?,vertification_stuff=? where vertification_id=?";
		Object[] param = {ve.getExitBorderDate(),ve.getEnterBorderDate(),ve.getVertificationProgram(),ve.getVertificationMoney(),
				        ve.getVertificationSummerize(),ve.getVertificationStuff(),
				        ve.getVertificationId()};
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	
	/* (non-Javadoc)
	 * @see cn.sdu.travel.dao.impl.VertificationDao#find(java.lang.String)
	 */
	@Override
	public Vertification find(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from vertification where vertification_id=?";
		return (Vertification) runner.query(ManageDbUtils.getConnection(), sql, id,
				new BeanHandler(Vertification.class));
	}
}
