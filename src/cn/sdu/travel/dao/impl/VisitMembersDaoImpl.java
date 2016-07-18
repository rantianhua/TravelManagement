package cn.sdu.travel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.sdu.travel.bean.VisitMembers;
import cn.sdu.travel.dao.VisitMembersDao;
import cn.sdu.travel.utils.ManageDbUtils;

public class VisitMembersDaoImpl implements VisitMembersDao{

	@Override
	public void add(VisitMembers members) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into visit_members(id,name,unit,title) values(?,?,?,?)";
		Object[] param = {members.getId(),members.getName(),members.getUnit(),members.getTitle()};
		runner.update(ManageDbUtils.getConnection(),sql,param);
	}

	@Override
	public void update(VisitMembers members) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update visit_members set unit=?,title=? where id=? and name=?";
		Object[] param = {members.getUnit(),members.getTitle(),members.getId(),members.getName()};
		runner.update(ManageDbUtils.getConnection(),sql,param);
	}

	@Override
	public void delete(String id, String name) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from visit_members where id=? and name=?";
		Object[] param = {id,name};
		runner.update(ManageDbUtils.getConnection(),sql,param);
	}

	@Override
	public void delete(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from visit_members where id=?";
		Object[] param = {id};
		runner.update(ManageDbUtils.getConnection(),sql,param);
	}

	@Override
	public VisitMembers find(String id, String name) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from visit_members where id=? and name=?";
		Object[] param = {id,name};
		return (VisitMembers)runner.query(ManageDbUtils.getConnection(), sql,param, new BeanHandler(VisitMembers.class));
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<VisitMembers> find(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from visit_members where id=?" ;
		return (List<VisitMembers>)runner.query(ManageDbUtils.getConnection(), sql,id,new BeanListHandler(VisitMembers.class));
	}

	
}
