package cn.sdu.travel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.sdu.travel.bean.Application;
import cn.sdu.travel.dao.ApplicationDao;
import cn.sdu.travel.utils.ManageDbUtils;

public class ApplicationDaoImpl implements ApplicationDao {
	@Override
	public void add(Application app) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into application(application_number,applicant_id,assignee_id,,apply_date,category,invitation_raw,invitaion_zh,plan,purpose,passport_info,type,group_unit,examine_unit,group_work,group_members,inviter_info,identify_type,licence_type,inviter_pay,loan,public_notification_id,record_id,verification,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] param = { app.getApplicationNumber(), app.getApplicantId(),
				app.getAssigneeId(), app.getApplyDate(), app.getCategory(),
				app.getInvitationRaw(), app.getInvitationZh(), app.getPlan(),
				app.getPurpose(), app.getPassportInfo(), app.getType(),
				app.getGroupUnit(), app.getExamineUnit(), app.getGroupWork(),
				app.getGroupMembers(), app.getInviterInfo(),
				app.getIdentifyType(), app.getLicenceType(),
				app.getInviterPay(), app.getLoan(),
				app.getPublicNotificationId(), app.getRecordId(),
				app.getVerification(), app.getStatus() };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public void delete(String appNo) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete form application where application_number=?";
		runner.update(ManageDbUtils.getConnection(), sql, appNo);
	}

	@Override
	public void update(Application app) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update application set applicant_id=?,assignee_id=?,apply_date=?,category=?invitation_raw=?,invitaion_zh=?,plan=?,purpose=?,passport_info=?,type=?,group_unit=?,examine_unit=?,group_work=?,group_members=?,inviter_info=?,identify_type=?,licence_type=?,inviter_pay=?,loan=?,public_notification_id=?,record_id=?,verification=?,status=? where application_number=?";
		Object[] param = { app.getApplicantId(), app.getAssigneeId(),
				app.getApplyDate(), app.getCategory(), app.getInvitationRaw(),
				app.getInvitationZh(), app.getPlan(), app.getPurpose(),
				app.getPassportInfo(), app.getType(), app.getGroupUnit(),
				app.getExamineUnit(), app.getGroupWork(),
				app.getGroupMembers(), app.getInviterInfo(),
				app.getIdentifyType(), app.getLicenceType(),
				app.getInviterPay(), app.getLoan(),
				app.getPublicNotificationId(), app.getRecordId(),
				app.getVerification(), app.getStatus(),
				app.getApplicationNumber() };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public Application find(String appNo) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * form application where application_number=?";
		return (Application) runner.query(ManageDbUtils.getConnection(), sql,
				appNo, new BeanHandler(Application.class));
	}

	@Override
	public List<Application> getAll() throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * form application";
		return (List<Application>) runner.query(ManageDbUtils.getConnection(),
				sql, new BeanListHandler(Application.class));
	}

}
