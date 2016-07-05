package cn.sdu.travel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.sdu.travel.bean.HumanResource;
import cn.sdu.travel.dao.HumanResourceDao;
import cn.sdu.travel.utils.HrDbUtils;

public class HumanResourceDaoImpl implements HumanResourceDao {
	@Override
	public void add(HumanResource hr) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into human_resource(id,password,role,name_ch,name_en,sex,name_pinyin,other_name,birthday,category,position,company,passport,email,mobile_phone,fixed_phone,emergency_contact_person) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] param = { hr.getId(), hr.getPassword(), hr.getRole(),
				hr.getNameCh(), hr.getNameEn(), hr.getSex(),
				hr.getNamePinyin(), hr.getOtherName(), hr.getBirthday(),
				hr.getCategory(), hr.getPosition(), hr.getCompany(),
				hr.getPassport(), hr.getEmail(), hr.getMobilePhone(),
				hr.getFixedPhone(), hr.getEmergencyContactPerson() };
		runner.update(HrDbUtils.getConnection(), sql, param);
	}

	@Override
	public void delete(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from human_resource where id=?";
		runner.update(HrDbUtils.getConnection(), sql, id);
	}

	@Override
	public void update(HumanResource hr) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update human_resource set name_ch=?,name_en=?,sex=?,name_pinyin=?,other_name=?,birthday=?,category=?,position=?,company=?,passport=?,email=?,mobile_phone=?,fixed_phone=?,emergency_contact_person=? where id=?";
		Object[] param = { hr.getNameCh(), hr.getNameEn(), hr.getSex(),
				hr.getNamePinyin(), hr.getOtherName(), hr.getBirthday(),
				hr.getCategory(), hr.getPosition(), hr.getCompany(),
				hr.getPassport(), hr.getEmail(), hr.getMobilePhone(),
				hr.getFixedPhone(), hr.getEmergencyContactPerson(), hr.getId() };
		runner.update(HrDbUtils.getConnection(), sql, param);
	}

	@Override
	public HumanResource find(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from human_resource where id=?";
		return (HumanResource) runner.query(HrDbUtils.getConnection(), sql, id,
				new BeanHandler(HumanResource.class));
	}

	@Override
	public List<HumanResource> getAll() throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from human_resource";
		return (List<HumanResource>) runner.query(HrDbUtils.getConnection(),
				sql, new BeanListHandler(HumanResource.class));
	}
}
