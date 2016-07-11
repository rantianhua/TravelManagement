package cn.sdu.travel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.sdu.travel.bean.Funds;
import cn.sdu.travel.dao.FundsDao;
import cn.sdu.travel.utils.ManageDbUtils;

public class FundsDaoImpl implements FundsDao {
	@Override
	public void add(Funds f) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into funds(id,pay_type,pay_amount,account_name,pay_item,ps,pay_detail,prove_file) values(?,?,?,?,?,?,?,?)";
		Object[] param = { f.getId(), f.getPayType(), f.getPayAmount(),
				f.getAccountName(), f.getPayItem(), f.getPs(),
				f.getPayDetail(), f.getProveFile() };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public void delete(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from funds where id=?";
		runner.update(ManageDbUtils.getConnection(), sql, id);
	}

	@Override
	public void update(Funds f) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update funds set pay_type=?,pay_amount=?,account_name=?,pay_item=?,ps=?,pay_detail=?,prove_file=? where id=?";
		Object[] param = { f.getPayType(), f.getPayAmount(),
				f.getAccountName(), f.getPayItem(), f.getPs(),
				f.getPayDetail(), f.getProveFile(), f.getId() };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public List<Funds> findFunds(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from funds where id=?";
		return (List<Funds>) runner.query(ManageDbUtils.getConnection(), sql, id,
				new BeanListHandler(Funds.class));
	}
}
