package cn.sdu.travel.dao;

import java.sql.SQLException;
import java.util.List;

import cn.sdu.travel.bean.Family;

public interface FamilyDao {
	void add(Family family) throws SQLException;
	
	void update(Family family) throws SQLException;
	
	void delete(String id,String name) throws SQLException;
	
	void delete(String id) throws SQLException;
	
	Family find(String id,String name) throws SQLException;
	
	List<Family> find(String id) throws SQLException;
}
