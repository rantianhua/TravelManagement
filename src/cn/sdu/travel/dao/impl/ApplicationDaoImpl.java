package cn.sdu.travel.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import cn.sdu.travel.bean.Application;
import cn.sdu.travel.utils.ManageDbUtils;

public class ApplicationDaoImpl {
	public void add(Application app) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into application(application_number,invitation_raw,invitaion_zh,plan,purpose,passport_info,type,conference_name,conference_desc,speech_outline,papers_outline,group_unit,examine_unit,group_work,group_members,inviter_info,identify_type,licence_type,inviter_pay,funds_id,loan) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] param = { app.getApplicationNumber(), app.getInvitationRaw(),
				app.getInvitationZh(), app.getPlan(), app.getPurpose(),
				app.getPassportInfo(), app.getType(), app.getConferenceName(),
				app.getConferenceDesc(), app.getSpeechOutline(),
				app.getPapersOutline(), app.getGroupUnit(),
				app.getExamineUnit(), app.getGroupWork(),
				app.getGroupMembers(), app.getInviterInfo(),
				app.getIdentifyType(), app.getLicenceType(),
				app.getInviterPay(), app.getFundsId(), app.getLoan() };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}
}
