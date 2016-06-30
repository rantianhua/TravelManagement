package cn.sdu.travel.dao;

import java.sql.SQLException;
import java.util.List;

import cn.sdu.travel.bean.HumanResource;

public interface HumanResourceDao {

	void add(HumanResource hr) throws SQLException;

	void delete(String id) throws SQLException;

	void update(HumanResource hr) throws SQLException;

	HumanResource find(String id) throws SQLException;

	List<HumanResource> getAll() throws SQLException;

}