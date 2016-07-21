package cn.sdu.travel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.sdu.travel.bean.Application;
import cn.sdu.travel.dao.ApplicationDao;
import cn.sdu.travel.dao.PublicityDao;
import cn.sdu.travel.utils.Constants;
import cn.sdu.travel.utils.ManageDbUtils;


public class ApplicationDaoImpl implements ApplicationDao {
	@Override
	public void add(Application app) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into application(application_number,applicant_id,assignee_id,apply_date,passport_id,category,plan,purpose,purpose_content,type,can_tuan,group_unit,examine_unit,group_work,group_members,inviter_info,licence_type,inviter_pay,loan,public_notification_id,record_id,verification,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] param = { app.getApplicationNumber(), app.getApplicantId(),
				app.getAssigneeId(), app.getApplyDate(), app.getPassportId(),
				app.getCategory(), app.getPlan(), app.getPurpose(),
				app.getPurposeContent(), app.getType(), app.getCanTuan(),
				app.getGroupUnit(), app.getExamineUnit(), app.getGroupWork(),
				app.getGroupMembers(), app.getInviterInfo(),
				app.getLicenceType(), app.getInviterPay(), app.getLoan(),
				app.getPublicNotificationId(), app.getRecordId(),
				app.getVerification(), app.getStatus() };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public void delete(String appNo) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from application where application_number=?";
		runner.update(ManageDbUtils.getConnection(), sql, appNo);
	}

	@Override
	public void update(Application app) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update application set applicant_id=?,assignee_id=?,apply_date=?,passport_id=?,category=?,plan=?,purpose=?,purpose_content=?,type=?,can_tuan=?,group_unit=?,examine_unit=?,group_work=?,group_members=?,inviter_info=?,licence_type=?,inviter_pay=?,loan=?,public_notification_id=?,record_id=?,verification=?,status=? where application_number=?";
		Object[] param = { app.getApplicantId(), app.getAssigneeId(),
				app.getApplyDate(), app.getPassportId(), app.getCategory(),
				app.getPlan(), app.getPurpose(), app.getPurposeContent(),
				app.getType(), app.getCanTuan(), app.getGroupUnit(),
				app.getExamineUnit(), app.getGroupWork(),
				app.getGroupMembers(), app.getInviterInfo(),
				app.getLicenceType(), app.getInviterPay(), app.getLoan(),
				app.getPublicNotificationId(), app.getRecordId(),
				app.getVerification(), app.getStatus(),
				app.getApplicationNumber() };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public Application find(String appNo) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from application where application_number=?";
		return (Application) runner.query(ManageDbUtils.getConnection(), sql,
				appNo, new BeanHandler(Application.class));
	}

	@Override
	public List<Application> getMyOwnApply(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from application where applicant_id=? and assignee_id=''";
		return (List<Application>) runner.query(ManageDbUtils.getConnection(),
				sql, id, new BeanListHandler(Application.class));
	}

	@Override
	public List<Application> getMyAssigneeApply(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from application where applicant_id=? and assignee_id!=''";
		return (List<Application>) runner.query(ManageDbUtils.getConnection(),
				sql, id, new BeanListHandler(Application.class));
	}

	@Override
	public List<Application> getApplyByStatus(String status)
			throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from application where status=?";
		return (List<Application>) runner.query(ManageDbUtils.getConnection(),
				sql, status, new BeanListHandler(Application.class));
	}

	@Override
	public void setApplyStatus(String appNo, String status) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update application set status=? where application_number=?";
		Object[] param = { status, appNo };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public List<Application> getApplyByStatus(String category, String status)
			throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from application where category=? and status=?";
		Object[] param = { category, status };
		return (List<Application>) runner.query(ManageDbUtils.getConnection(),
				sql, param, new BeanListHandler(Application.class));
	}

	@Override
	public List<Application> getApplyByStatusNoPublicity(String category,
			String status) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from application where category=? and status=? and public_notification_id is null";
		Object[] param = { category, status };
		return (List<Application>) runner.query(ManageDbUtils.getConnection(),
				sql, param, new BeanListHandler(Application.class));
	}

	@Override
	public List<Application> getAll() throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * form application";
		return (List<Application>) runner.query(ManageDbUtils.getConnection(),
				sql, new BeanListHandler(Application.class));
	}

	@Override
	public void updatePublicity(String applicationId, String publicityId)
			throws SQLException {
		QueryRunner runner = new QueryRunner();
		//在更新前删除之前的数据
		try{
			Application application = find(applicationId);
			if(application != null && application.getPublicNotificationId() != null && application.getPublicNotificationId().length() > 0) {
				//先清除之前的数据
				PublicityDao publicityDao = new PublicityDaoImpl();
				publicityDao.delete(application.getPublicNotificationId());
			}
		}catch(Exception e) {
			if(Constants.LOG) {
				e.printStackTrace();
			}
		}
		String sql = "update application set public_notification_id= ? where application_number=?" ;
		Object[] param = {publicityId,applicationId};
		runner.update(ManageDbUtils.getConnection(), sql,param);
	}

	@Override
	public void updateVisitRecord(String applicationId, String recordId)
			throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update application set record_id=? where application_number=?";
		Object[] param = { recordId, applicationId };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}
	public void updateVertification(String applicationId,String vertification) throws SQLException
	{
		QueryRunner runner = new QueryRunner();
		String sql = "update application set verification=? where application_number=?";
		Object[] param = { vertification, applicationId };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}
	
	public List<Application> idFind(String applicantId) throws SQLException
	{
		QueryRunner runner = new QueryRunner();
		String sql = "select * from application where applicant_id=?";
		Object[] param = { applicantId };
		return (List<Application>) runner.query(ManageDbUtils.getConnection(),
				sql,param, new BeanListHandler(Application.class));
	}
	
}
