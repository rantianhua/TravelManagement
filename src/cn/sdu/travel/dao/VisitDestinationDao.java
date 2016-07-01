package cn.sdu.travel.dao;

import java.sql.SQLException;
import java.util.List;

import cn.sdu.travel.bean.VisitDestination;

public interface VisitDestinationDao {

	void add(VisitDestination vd) throws SQLException;

	void delete(String pid) throws SQLException;

	void update(VisitDestination vd) throws SQLException;

	List<VisitDestination> findDestinations(String pid) throws SQLException;

}