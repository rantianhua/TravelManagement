package cn.sdu.travel.dao;

import java.sql.SQLException;
import java.util.List;

import cn.sdu.travel.bean.Application;

public interface ApplicationDao {

	void add(Application app) throws SQLException;

	void delete(String appNo) throws SQLException;

	void update(Application app) throws SQLException;

	Application find(String appNo) throws SQLException;

	void setApplyStatus(String appNo, String status) throws SQLException;

	List<Application> getMyOwnApply(String id) throws SQLException;

	List<Application> getMyAssigneeApply(String id) throws SQLException;

	List<Application> getApplyByStatus(String status) throws SQLException;

	List<Application> getApplyByStatus(String category, String status)
			throws SQLException;

	List<Application> getApplyByStatusNoPublicity(String category, String status)
			throws SQLException;

	List<Application> getAll() throws SQLException;

	// 更新对公示表的引用
	void updatePublicity(String applicationId, String publicityId)
			throws SQLException;

	// 更新对出访备案表的引用
	void updateVisitRecord(String applicationId, String recordId)
			throws SQLException;

}