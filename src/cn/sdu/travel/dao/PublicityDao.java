package cn.sdu.travel.dao;

import java.sql.SQLException;
import java.util.List;

import cn.sdu.travel.bean.Publicity;
import cn.sdu.travel.bean.VisitMembers;

public interface PublicityDao {
	
	void add(Publicity pblicity) throws SQLException;
	
	void delete(String id) throws SQLException;
	
	void update(Publicity publicity) throws SQLException;
	
	Publicity findPublicity(String id) throws SQLException;
	
	List<VisitMembers> findMembers(String membersId) throws SQLException;

}
