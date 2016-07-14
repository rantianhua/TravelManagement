package cn.sdu.travel.dao;

import java.sql.SQLException;
import java.util.List;

import cn.sdu.travel.bean.SimplePublicity;

public interface SimplePublicityDao {

	List<SimplePublicity> findAll() throws SQLException;
}
