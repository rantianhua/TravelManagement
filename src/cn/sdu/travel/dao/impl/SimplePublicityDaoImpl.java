package cn.sdu.travel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.sdu.travel.bean.SimplePublicity;
import cn.sdu.travel.dao.SimplePublicityDao;
import cn.sdu.travel.utils.ManageDbUtils;

public class SimplePublicityDaoImpl implements SimplePublicityDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<SimplePublicity> findAll() throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select application.application_number,application.apply_date,application.purpose_content,passport.name,application.public_notification_id "
				+ " from application,passport where application.passport_id=passport.identity and application.public_notification_id is not null";
		return (List<SimplePublicity>)runner.query(ManageDbUtils.getConnection(),sql,new BeanListHandler(SimplePublicity.class));
	}

}
