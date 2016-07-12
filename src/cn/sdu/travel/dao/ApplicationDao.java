package cn.sdu.travel.dao;

import java.sql.SQLException;
import java.util.List;

import cn.sdu.travel.bean.Application;

public interface ApplicationDao {

	void add(Application app) throws SQLException;

	void delete(String appNo) throws SQLException;

	void update(Application app) throws SQLException;

	Application find(String appNo) throws SQLException;

	List<Application> getMyOwnApply(String id) throws SQLException;

	List<Application> getMyAssigneeApply(String id) throws SQLException;

	List<Application> getApplyByStatus(String status) throws SQLException;

	List<Application> getAll() throws SQLException;

}