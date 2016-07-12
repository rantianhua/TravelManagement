package cn.sdu.travel.dao;

import java.sql.SQLException;

import cn.sdu.travel.bean.Review;

public interface ReviewDao {

	void add(String appNo, String applyDate) throws SQLException;

	void review(String arg1, String arg2, String arg3, String state,
			String time, String length, String apNo) throws SQLException;

	Review find(String appNo) throws SQLException;

}