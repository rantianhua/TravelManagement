package cn.sdu.travel.dao;

import java.sql.SQLException;
import java.util.List;

import cn.sdu.travel.bean.Funds;

public interface FundsDao {

	public abstract void add(Funds f) throws SQLException;

	public abstract void delete(String id) throws SQLException;

	public abstract void update(Funds f) throws SQLException;

	public abstract List<Funds> findFunds(String id) throws SQLException;

}