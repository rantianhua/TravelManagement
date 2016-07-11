package cn.sdu.travel.dao;

import java.sql.SQLException;

import cn.sdu.travel.bean.Passport;

public interface PassportDao {

	void add(Passport p) throws SQLException;

	void delete(String id) throws SQLException;

	void update(Passport p) throws SQLException;
	
	void updateForApply(Passport p) throws SQLException;

	Passport find(String id) throws SQLException;

}