package cn.sdu.travel.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.sdu.travel.bean.VisitPurpose;
import cn.sdu.travel.dao.VisitPurposeDao;
import cn.sdu.travel.utils.ManageDbUtils;

public class VisitPurposeDaoImpl implements VisitPurposeDao {
	@Override
	public void add(VisitPurpose vp) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into visit_purpose(id,class_name,partner_name,partner_title,partner_expertise,cooperation_content,train_content,study_content,teacher_name,teacher_title,teacher_expertise,degree_type,conference_name_ch,conference_name_en,conference_desc,speech,speech_outline,paper_outline) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] param = { vp.getId(), vp.getClassName(), vp.getPartnerName(),
				vp.getPartnerTitle(), vp.getPartnerExpertise(),
				vp.getCooperationCotent(), vp.getTrainContent(),
				vp.getStudyContent(), vp.getTeacherName(),
				vp.getTeacherTitle(), vp.getTeacherExpertise(),
				vp.getDegreeType(), vp.getConferenceNameCh(),
				vp.getConferenceNameEn(), vp.getConferenceDesc(),
				vp.getSpeech(), vp.getSpeechOutline(), vp.getPaperOutline() };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public void delete(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from visit_purpose where id=?";
		runner.update(ManageDbUtils.getConnection(), sql, id);
	}

	@Override
	public void update(VisitPurpose vp) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update visit_purpose set class_name=?,partner_name=?,partner_title=?,partner_expertise=?,cooperation_content=?,train_content=?,study_content=?,teacher_name=?,teacher_title=?,teacher_expertise=?,degree_type=?,conference_name_ch=?,conference_name_en=?,conference_desc=?,speech=?,speech_outline=?,paper_outline=? where id=?";
		Object[] param = { vp.getClassName(), vp.getPartnerName(),
				vp.getPartnerTitle(), vp.getPartnerExpertise(),
				vp.getCooperationCotent(), vp.getTrainContent(),
				vp.getStudyContent(), vp.getTeacherName(),
				vp.getTeacherTitle(), vp.getTeacherExpertise(),
				vp.getDegreeType(), vp.getConferenceNameCh(),
				vp.getConferenceNameEn(), vp.getConferenceDesc(),
				vp.getSpeech(), vp.getSpeechOutline(), vp.getPaperOutline(),
				vp.getId() };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public VisitPurpose find(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from visit_purpose where id=?";
		return (VisitPurpose) runner.query(ManageDbUtils.getConnection(), sql,
				id, new BeanHandler(VisitPurpose.class));
	}
}