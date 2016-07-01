package cn.sdu.travel.dao;

import java.sql.SQLException;

import cn.sdu.travel.bean.Funds;

public interface FundsDao {

	public abstract void add(Funds f) throws SQLException;

	public abstract void delete(String id) throws SQLException;

	public abstract void update(Funds f) throws SQLException;

	public abstract Funds find(String id) throws SQLException;

}