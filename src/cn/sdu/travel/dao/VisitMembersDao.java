package cn.sdu.travel.dao;

import java.sql.SQLException;
import java.util.List;

import cn.sdu.travel.bean.VisitMembers;

public interface VisitMembersDao {

	void add(VisitMembers members) throws SQLException;
	
	void update(VisitMembers members) throws SQLException;
	
	void delete(String id,String name) throws SQLException;
	
	void delete(String id) throws SQLException;
	
	VisitMembers find(String id,String name) throws SQLException;
	
	List<VisitMembers> find(String id) throws SQLException;
}
