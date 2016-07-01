package cn.sdu.travel.dao;

import java.sql.SQLException;

import cn.sdu.travel.bean.EmergencyContactPerson;

public interface EmergencyContactPersonDao {

	void add(EmergencyContactPerson ecp) throws SQLException;

	void delete(String id) throws SQLException;

	void update(EmergencyContactPerson ecp) throws SQLException;

	EmergencyContactPerson find(String id) throws SQLException;

}