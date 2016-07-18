package cn.sdu.travel.dao;

import java.sql.SQLException;

import cn.sdu.travel.bean.Vertification;

public interface VertificationDao {

	public abstract void add(Vertification ve) throws SQLException;

	public abstract void delete(String id) throws SQLException;

	public abstract void update(Vertification ve) throws SQLException;

	public abstract Vertification find(String id) throws SQLException;

}