package cn.sdu.travel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.sdu.travel.bean.Family;
import cn.sdu.travel.dao.FamilyDao;
import cn.sdu.travel.utils.ManageDbUtils;

public class FamilyDaoImpl implements FamilyDao{

	@Override
	public void add(Family family) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into family(id,appellation,name,age,political_status,other_info) values(?,?,?,?,?,?)";
		Object[] param = {family.getId(),family.getAppellation(),family.getName(),family.getAge(),family.getPoliticalStatus(),
				family.getOtherInfo()};
		runner.update(ManageDbUtils.getConnection(),sql,param);
	}

	@Override
	public void update(Family family) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update family set appellation=?,age=?,political_status=?,other_info=? where id=? and name=?";
		Object[] param = {family.getAppellation(),family.getAge(),family.getPoliticalStatus(),
				family.getOtherInfo(),family.getId(),family.getName()};
		runner.update(ManageDbUtils.getConnection(),sql,param);		
	}

	@Override
	public void delete(String id, String name) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from family where id=? and name=?";
		Object[] param = {id,name};
		runner.update(ManageDbUtils.getConnection(),sql,param);		
	}

	@Override
	public void delete(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from family where id=?";
		Object[] param = {id};
		runner.update(ManageDbUtils.getConnection(),sql,param);		
	}

	@Override
	public Family find(String id, String name) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select *  from family where id= " + id + " and name=" + name;
		return (Family)runner.query(ManageDbUtils.getConnection(), sql, new BeanHandler(Family.class));
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Family> find(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select *  from family where id= " + id;
		return ( List<Family>)runner.query(ManageDbUtils.getConnection(), sql, new BeanListHandler(Family.class));
	}
	
	

}
