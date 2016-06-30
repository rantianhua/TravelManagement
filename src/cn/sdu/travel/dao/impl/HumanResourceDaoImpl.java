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
		QueryRunner runner = new QueryRunner(HrDbUtils.getDataSource());
		String sql = "insert into human_resource(id,role,name_ch,name_en,sex,name_pinyin,other_name,birthday,position,company,passport,email,mobile_phone,fixed_phone,emergency_contact_person) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = { hr.getId(), hr.getRole(), hr.getNameCh(),
				hr.getNameEn(), hr.getSex(), hr.getNamePinyin(),
				hr.getOtherName(), hr.getBirthday(), hr.getPosition(),
				hr.getCompany(), hr.getPassport(), hr.getEmail(),
				hr.getMobilePhone(), hr.getFixedPhone(),
				hr.getEmergencyContactPerson() };
		runner.update(sql, params);
	}

	@Override
	public void delete(String id) throws SQLException {
		QueryRunner runner = new QueryRunner(HrDbUtils.getDataSource());
		String sql = "delete from human_resource where id=?";
		runner.update(sql, id);
	}

	@Override
	public void update(HumanResource hr) throws SQLException {
		QueryRunner runner = new QueryRunner(HrDbUtils.getDataSource());
		String sql = "update human_resource set name_ch=?,name_en=?,sex=?,name_pinyin=?,other_name=?,birthday=?,position=?,company=?,passport=?,email=?,mobile_phone=?,fixed_phone=?,emergency_contact_person=? where id=?";
		Object[] params = { hr.getNameCh(), hr.getNameEn(), hr.getSex(),
				hr.getNamePinyin(), hr.getOtherName(), hr.getBirthday(),
				hr.getPosition(), hr.getCompany(), hr.getPassport(),
				hr.getEmail(), hr.getMobilePhone(), hr.getFixedPhone(),
				hr.getEmergencyContactPerson(), hr.getId() };
		runner.update(sql, params);
	}

	@Override
	public HumanResource find(String id) throws SQLException {
		QueryRunner runner = new QueryRunner(HrDbUtils.getDataSource());
		String sql = "select * from human_resource where id=?";
		return (HumanResource) runner.query(sql, id, new BeanHandler(
				HumanResource.class));
	}

	@Override
	public List<HumanResource> getAll() throws SQLException {
		QueryRunner runner = new QueryRunner(HrDbUtils.getDataSource());
		String sql = "select * from human_resource";
		return (List<HumanResource>) runner.query(sql, new BeanListHandler(
				HumanResource.class));
	}
}
