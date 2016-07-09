package cn.sdu.travel.utils;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory;

public class HrDbUtils {
	private static DataSource ds;
	private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();

	// 准备连接池
	static {
		try {
			Properties prop = new Properties();
			InputStream in = HrDbUtils.class.getClassLoader()
					.getResourceAsStream("hr_dbcpconfig.properties");
			BasicDataSourceFactory factory = new BasicDataSourceFactory();
			prop.load(in);
			in.close();
			ds = factory.createDataSource(prop);
		} catch (Exception e) {
			throw new ExceptionInInitializerError(e);
		}
	}

	// 获取连接池
	public static DataSource getDataSource() {
		return ds;
	}

	// 获取数据库连接
	public static Connection getConnection() throws SQLException {
		try {
			Connection conn = tl.get();
			if (conn == null) {
				conn = ds.getConnection();
				tl.set(conn);
			}
			return conn;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 得到当前线程上绑定的链接开启事务
	public static void startTransaction() throws SQLException {
		try {
			Connection conn = tl.get();
			if (conn == null) {
				conn = ds.getConnection();
				tl.set(conn);
			}
			conn.setAutoCommit(false);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static void commitTransaction() {
		try {
			Connection conn = tl.get();
			if (conn != null) {
				conn.commit();
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			tl.remove();// 移除当前线程上的链接
		}
	}

	public static void closeConnection() {
		try {
			Connection conn = tl.get();
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			tl.remove();
		}
	}
}
