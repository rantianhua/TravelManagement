package cn.sdu.travel.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.sdu.travel.bean.EmergencyContactPerson;
import cn.sdu.travel.dao.EmergencyContactPersonDao;
import cn.sdu.travel.utils.HrDbUtils;

import com.mysql.jdbc.ResultSet;

public class EmergencyContactPersonDaoImpl implements EmergencyContactPersonDao {
	@Override
	public void add(EmergencyContactPerson ecp) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into emergency_contact_person(id,name,email,mobile_phone,fixed_phone) values(?,?,?,?,?)";
		Object[] param = { ecp.getId(), ecp.getName(), ecp.getEmail(),
				ecp.getMobilePhone(), ecp.getFixedPhone() };
		runner.update(HrDbUtils.getConnection(), sql, param);
	}

	@Override
	public void delete(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from emergency_contact_person where id=?";
		runner.update(HrDbUtils.getConnection(), sql, id);
	}

	@Override
	public void update(EmergencyContactPerson ecp) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update emergency_contact_person set name=?,email=?,mobile_phone=?,fixed_phone=? where id=?";
		Object[] param = { ecp.getName(), ecp.getEmail(), ecp.getMobilePhone(),
				ecp.getFixedPhone(), ecp.getId() };
		runner.update(HrDbUtils.getConnection(), sql, param);
	}

	@Override
	public EmergencyContactPerson find(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from emergency_contact_person where id=?";
		return (EmergencyContactPerson) runner.query(HrDbUtils.getConnection(),
				sql, id, new BeanHandler(EmergencyContactPerson.class));
	}
}
