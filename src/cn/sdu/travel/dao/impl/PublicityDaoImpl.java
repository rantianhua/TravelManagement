package cn.sdu.travel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.sdu.travel.bean.Publicity;
import cn.sdu.travel.bean.VisitMembers;
import cn.sdu.travel.dao.PublicityDao;
import cn.sdu.travel.dao.VisitMembersDao;
import cn.sdu.travel.utils.Constants;
import cn.sdu.travel.utils.ManageDbUtils;

public class PublicityDaoImpl implements PublicityDao {

	@Override
	public void add(Publicity publicity) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into publicity(id,members_id,visit_places,transfer_places,exit_date,enter_date,detailed_schedule"
				+ ",task_summary,visit_persons,budget,inviter_desc) values(?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {publicity.getId(),publicity.getMembersId(),publicity.getVisitPlaces(),publicity.getTransferPlaces(),
				publicity.getExitDate(),publicity.getEnterDate(),publicity.getDetailedSchedule(),publicity.getTaskSummary(),publicity.getVisitPersons(),
				publicity.getBudget(),publicity.getInviterDesc()};
		runner.update(ManageDbUtils.getConnection(), sql, params);
	}

	@Override
	public void delete(String id) throws SQLException {
		try{
			Publicity publicity = findPublicity(id);
			if(publicity != null) {
				if(publicity.getMembersId() != null && publicity.getMembersId().length() > 0) {
					//先删除成员
					VisitMembersDao dao = new VisitMembersDaoImpl();
					dao.delete(publicity.getMembersId());
				}
			}
		}catch(Exception e) {
			if(Constants.LOG) {
				e.printStackTrace();
			}
		}
		QueryRunner runner = new QueryRunner();
		String sql = "delete from publicity where id=?";
		runner.update(ManageDbUtils.getConnection(), sql, id);
	}

	@Override
	public void update(Publicity publicity) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update publicity set members_id=?,visit_places=?,transfer_places=?,exit_date=?,enter_date=?,detailed_schedule=?"
				+ ",task_summary=?,visit_persons=?,budget=?,inviter_desc=? where id=?";
		Object[] params = {publicity.getMembersId(),publicity.getVisitPlaces(),publicity.getTransferPlaces(),
				publicity.getExitDate(),publicity.getEnterDate(),publicity.getDetailedSchedule(),publicity.getTaskSummary(),publicity.getVisitPersons(),
				publicity.getBudget(),publicity.getInviterDesc(),publicity.getId()};
		runner.update(ManageDbUtils.getConnection(), sql, params);
	}

	@Override
	public Publicity findPublicity(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from publicity where id=?";
		return (Publicity)runner.query(ManageDbUtils.getConnection(), sql, id,new BeanHandler(Publicity.class));
	}
	
	@Override
	public List<VisitMembers> findMembers(String membersId) throws SQLException {
		VisitMembersDaoImpl impl = new VisitMembersDaoImpl();
		return impl.find(membersId);
	}
	
}
