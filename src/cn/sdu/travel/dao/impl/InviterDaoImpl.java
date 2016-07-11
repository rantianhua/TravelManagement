package cn.sdu.travel.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.sdu.travel.bean.Inviter;
import cn.sdu.travel.dao.InviterDao;
import cn.sdu.travel.utils.ManageDbUtils;

public class InviterDaoImpl implements InviterDao {

	@Override
	public void add(Inviter i) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into inviter(id,name,title_ch,title_en,unit_name,address,telephone,email,url,invitation_raw,invitation_zh) values(?,?,?,?,?,?,?,?,?,?,?)";
		Object[] param = { i.getId(), i.getName(), i.getTitleCh(),
				i.getTitleEn(), i.getUnitName(), i.getAddress(),
				i.getTelephone(), i.getEmail(), i.getUrl(),
				i.getInvitationRaw(), i.getInvitationZh() };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public void delete(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from inviter where id=?";
		runner.update(ManageDbUtils.getConnection(), sql, id);
	}

	@Override
	public void update(Inviter i) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update inviter set name=?,title_ch=?,title_en=?,unit_name=?,address=?,telephone=?,email=?,url=?,invitation_raw=?,invitation_zh=? where id=?";
		Object[] param = { i.getName(), i.getTitleCh(), i.getTitleEn(),
				i.getUnitName(), i.getAddress(), i.getTelephone(),
				i.getEmail(), i.getUrl(), i.getInvitationRaw(),
				i.getInvitationZh(), i.getId() };
		runner.update(ManageDbUtils.getConnection(), sql, param);
	}

	@Override
	public Inviter find(String id) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from inviter where id=?";
		return (Inviter) runner.query(ManageDbUtils.getConnection(), sql, id,
				new BeanHandler(Inviter.class));
	}
}
