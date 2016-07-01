package cn.sdu.travel.dao;

import java.sql.SQLException;

import cn.sdu.travel.bean.Inviter;

public interface InviterDao {

	public abstract void add(Inviter i) throws SQLException;

	public abstract void delete(String id) throws SQLException;

	public abstract void update(Inviter i) throws SQLException;

	public abstract Inviter find(String id) throws SQLException;

}