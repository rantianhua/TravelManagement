package cn.sdu.travel.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.sdu.travel.bean.Record;
import cn.sdu.travel.dao.RecordDao;
import cn.sdu.travel.utils.ManageDbUtils;

public class RecordDaoImpl implements RecordDao {

	@Override
	public void add(Record record) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into visit_record(id,name,sex,birthday,political_status,health,"
				+ "secret_info,family_members,group_unit,position_in_group,places_info,latest_places,authority_unit) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] param = {record.getId(),record.getName(),record.getSex(),record.getBirthday(),record.getPoliticalStatus(),
				record.getHealth(),record.getSecretInfo(),record.getFamilyMembers(),record.getGroupUnit(),record.getPositionInGroup(),
				record.getPlacesInfo(),record.getLatestPlaces(),record.getAuthorityUnit()};
		runner.update(ManageDbUtils.getConnection(),sql,param);
	}

	@Override
	public void update(Record record) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update  visit_record set name=?,sex=?,birthday=?,political_status=?,health=?,"
				+ "secret_info=?,family_members=?,group_unit=?,position_in_group=?,places_info=?,latest_places=?,authority_unit=? where id=?";
		Object[] param = {record.getName(),record.getSex(),record.getBirthday(),record.getPoliticalStatus(),
				record.getHealth(),record.getSecretInfo(),record.getFamilyMembers(),record.getGroupUnit(),record.getPositionInGroup(),
				record.getPlacesInfo(),record.getLatestPlaces(),record.getAuthorityUnit(),record.getId()};
		runner.update(ManageDbUtils.getConnection(),sql,param);
	}

	@Override
	public void delete(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from visit_record where id=?";
		Object[] param = {id};
		runner.update(ManageDbUtils.getConnection(),sql,param);
	}

	@Override
	public Record find(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from visit_record where id=?";
		Object[] param = {id};
		return (Record)runner.query(ManageDbUtils.getConnection(), sql,param,new BeanHandler(Record.class));
	}

}
