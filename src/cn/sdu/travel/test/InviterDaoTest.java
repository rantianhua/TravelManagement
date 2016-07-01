package cn.sdu.travel.test;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.junit.Test;

import cn.sdu.travel.bean.Funds;
import cn.sdu.travel.bean.HumanResource;
import cn.sdu.travel.bean.Inviter;
import cn.sdu.travel.dao.FundsDao;
import cn.sdu.travel.dao.HumanResourceDao;
import cn.sdu.travel.dao.InviterDao;
import cn.sdu.travel.dao.impl.FundsDaoImpl;
import cn.sdu.travel.dao.impl.HumanResourceDaoImpl;
import cn.sdu.travel.dao.impl.InviterDaoImpl;
import cn.sdu.travel.utils.WebUtils;

public class InviterDaoTest {
	@Test
	public void testAdd() {
		Inviter i=new Inviter();
		i.setId(WebUtils.generateID());
		i.setAddress("ssssssss");
		i.setEmail("2222222222");
		i.setTelephone("222222222222");
		i.setTitle("qweqedqd");
		i.setUnitName("dadacswq");
		i.setUrl("d()");
			InviterDao id=new InviterDaoImpl();
			try {
				id.add(i);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}

	@Test
	public void testUpdate() {
		Inviter i=new Inviter();
		i.setId("7ea57fb9-bef2-4fa5-aaf9-f64518f4f242");
		i.setAddress("ssssssss");
		i.setEmail("2222222222");
		i.setTelephone("222222222222");
		i.setTitle("qweqedqd");
		i.setUnitName("dadacswq");
		i.setUrl("c()");
		InviterDao id = new InviterDaoImpl();
		try {
			id.update(i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

	@Test
	public void testDelete() {
		try {
			InviterDao id= new InviterDaoImpl();
			id.delete("7ea57fb9-bef2-4fa5-aaf9-f64518f4f242");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testFind() {
		try {
			InviterDao id = new InviterDaoImpl();
			Inviter i= id.find("7ea57fb9-bef2-4fa5-aaf9-f64518f4f242");
			System.out.println(i.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
