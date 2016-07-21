package cn.sdu.travel.dao;

import java.sql.SQLException;
import java.util.List;

import cn.sdu.travel.bean.Vertification;

public interface VertificationDao {

	public abstract void add(Vertification ve) throws SQLException;

	public abstract void delete(String id) throws SQLException;

	public abstract void update(Vertification ve) throws SQLException;

	public abstract Vertification find(String id) throws SQLException;

	List<Vertification> FindAll() throws SQLException;
}