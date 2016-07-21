package cn.sdu.travel.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.mysql.jdbc.ResultSet;

import cn.sdu.travel.bean.Application;
import cn.sdu.travel.bean.Passport;
import cn.sdu.travel.dao.PassportDao;
import cn.sdu.travel.utils.ManageDbUtils;

public class PassportDaoImpl implements PassportDao {
	@Override
	public void add(Passport p) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into passport(identity,id_card,img,passport_name,name,sex,issuing_place,birthday,exp_date,account_book) values(?,?,?,?,?,?,?,?,?,?)";
		Object[] param = { p.getIdentity(), p.getIdCard(), p.getImg(),
				p.getPassportName(), p.getName(), p.getSex(),
				p.getIssuingPlace(), p.getBirthday(), p.getExpDate(),
				p.getAccountBook() };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public void delete(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from passport where identity=?";
		runner.update(ManageDbUtils.getConnection(), sql, id);
	}

	@Override
	public void update(Passport p) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update passport set id_card=?,img=?,passport_name=?,name=?,sex=?,issuing_place=?,birthday=?,exp_date=?,account_book=? where identity=?";
		Object[] param = { p.getIdCard(), p.getImg(), p.getPassportName(),
				p.getName(), p.getSex(), p.getIssuingPlace(), p.getBirthday(),
				p.getExpDate(), p.getAccountBook(), p.getIdentity() };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public void updateForApply(Passport p) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update passport set passport_name=?,name=?,sex=?,issuing_place=?,birthday=?,exp_date=? where identity=?";
		Object[] param = { p.getPassportName(), p.getName(), p.getSex(),
				p.getIssuingPlace(), p.getBirthday(), p.getExpDate(),
				p.getIdentity() };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public Passport find(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from passport where identity=?";
		return (Passport) runner.query(ManageDbUtils.getConnection(), sql, id,
				new BeanHandler(Passport.class));
	}
	
	
	public List<Passport> FindAll() throws SQLException
	{
		QueryRunner runner = new QueryRunner();
		String sql = "select * from vertification";
		return (List<Passport>) runner.query(ManageDbUtils.getConnection(),
				sql, new BeanListHandler(Passport.class));
		
		
	}

}
