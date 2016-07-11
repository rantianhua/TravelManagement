package cn.sdu.travel.dao;

import java.sql.SQLException;

import cn.sdu.travel.bean.Record;

public interface RecordDao {
	
	void add(Record record) throws SQLException;
	
	void update(Record record) throws SQLException;
	
	void delete(String id) throws SQLException;
	
	Record find(String id) throws SQLException;

}
