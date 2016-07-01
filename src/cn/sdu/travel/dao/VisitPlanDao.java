package cn.sdu.travel.dao;

import java.sql.SQLException;

import cn.sdu.travel.bean.VisitPlan;

public interface VisitPlanDao {

	void add(VisitPlan vp) throws SQLException;

	void delete(String pid) throws SQLException;

	void update(VisitPlan vp) throws SQLException;

	VisitPlan find(String pid) throws SQLException;

}