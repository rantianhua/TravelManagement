package cn.sdu.travel.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.sdu.travel.bean.Funds;
import cn.sdu.travel.bean.Inviter;
import cn.sdu.travel.dao.InviterDao;
import cn.sdu.travel.utils.ManageDbUtils;

public class InviterDaoImpl implements InviterDao {
	

	/* (non-Javadoc)
	 * @see cn.sdu.travel.dao.impl.InviterDao#add(cn.sdu.travel.bean.Inviter)
	 */
	@Override
	public void add(Inviter i) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into inviter(id,title,unit_name,address,telephone,email,url) values(?,?,?,?,?,?,?)";
		Object[] param = { i.getId(),i.getTitle(),i.getUnitName(),i.getAddress(),i.getTelephone(),i.getEmail(),i.getUrl() };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}


	
	
	/* (non-Javadoc)
	 * @see cn.sdu.travel.dao.impl.InviterDao#delete(java.lang.String)
	 */
	@Override
	public void delete(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from inviter where id=?";
		runner.update(ManageDbUtils.getConnection(), sql, id);
	}



	/* (non-Javadoc)
	 * @see cn.sdu.travel.dao.impl.InviterDao#update(cn.sdu.travel.bean.Inviter)
	 */
	@Override
	public void update(Inviter i) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update inviter set title=?,unit_name=?,address=?,telephone=?,email=?,url=? where id=?";
		Object[] param = {i.getTitle(),i.getUnitName(),i.getAddress(),i.getTelephone(),i.getEmail(),i.getUrl(),i.getId()};
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}


	
	/* (non-Javadoc)
	 * @see cn.sdu.travel.dao.impl.InviterDao#find(java.lang.String)
	 */
	@Override
	public Inviter find(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from inviter where id=?";
		return (Inviter)runner.query(ManageDbUtils.getConnection(), sql, id, new BeanHandler(
				Inviter.class));
	}
}
