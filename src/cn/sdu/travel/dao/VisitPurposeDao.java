package cn.sdu.travel.dao;

import java.sql.SQLException;

import cn.sdu.travel.bean.VisitPurpose;

public interface VisitPurposeDao {

	void add(VisitPurpose vp) throws SQLException;

	void delete(String id) throws SQLException;

	void update(VisitPurpose vp) throws SQLException;

	VisitPurpose find(String id) throws SQLException;

}