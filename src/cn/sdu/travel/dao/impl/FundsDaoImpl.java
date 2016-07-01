package cn.sdu.travel.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.sdu.travel.bean.Funds;
import cn.sdu.travel.dao.FundsDao;
import cn.sdu.travel.utils.HrDbUtils;
import cn.sdu.travel.utils.ManageDbUtils;

public class FundsDaoImpl implements FundsDao {
	/* (non-Javadoc)
	 * @see cn.sdu.travel.dao.impl.FundsDao#add(cn.sdu.travel.bean.Funds)
	 */
	@Override
	public void add(Funds f) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into funds(id,pay_type,pay_item,account_name,funds_account,prove_file) values(?,?,?,?,?,?)";
		Object[] param = { f.getId(), f.getPayType(), f.getPayItem(),
				f.getAccountName(), f.getFundsAccount(),f.getProveFile()};
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}


	/* (non-Javadoc)
	 * @see cn.sdu.travel.dao.impl.FundsDao#delete(java.lang.String)
	 */
	@Override
	public void delete(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from funds where id=?";
		runner.update(ManageDbUtils.getConnection(), sql, id);
	}


	/* (non-Javadoc)
	 * @see cn.sdu.travel.dao.impl.FundsDao#update(cn.sdu.travel.bean.Funds)
	 */
	@Override
	public void update(Funds f) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update funds set pay_type=?,pay_item=?,account_name=?,funds_account=?,prove_file=? where id=?";
		Object[] param = {f.getPayType(),f.getPayItem(),f.getAccountName(),f.getFundsAccount(),f.getProveFile(),f.getId()};
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}


	/* (non-Javadoc)
	 * @see cn.sdu.travel.dao.impl.FundsDao#find(java.lang.String)
	 */
	@Override
	public Funds find(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from funds where id=?";
		return (Funds)runner.query(ManageDbUtils.getConnection(), sql, id, new BeanHandler(
				Funds.class));
	}
}
