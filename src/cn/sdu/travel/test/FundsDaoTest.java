package cn.sdu.travel.test;

import java.sql.SQLException;

import org.junit.Test;

import cn.sdu.travel.bean.Funds;
import cn.sdu.travel.dao.FundsDao;
import cn.sdu.travel.dao.impl.FundsDaoImpl;
import cn.sdu.travel.utils.WebUtils;

public class FundsDaoTest {
	@Test
	public void testAdd() {
		Funds f = new Funds();
		f.setId(WebUtils.generateID());
		f.setPayType("1");
		f.setPayItem("kkkkk");
		f.setAccountName("11213131");
		f.setFundsAccount("sssdwed");
		f.setProveFile("222222222222222222");
			FundsDao fd = new FundsDaoImpl();
			try {
				fd.add(f);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}

	@Test
	public void testUpdate() {
		Funds f = new Funds();
		f.setId("514afe0e-bbb6-43b7-bdf0-9b55e8c28ac4");
		f.setPayType("1");
		f.setPayItem("kkkkk");
		f.setAccountName("11213131");
		f.setFundsAccount("sssdwed");
		f.setProveFile("1111111111111111");
		FundsDao fd = new FundsDaoImpl();
		try {
			fd.update(f);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

	@Test
	public void testDelete() {
		try {
			FundsDao fd = new FundsDaoImpl();
			fd.delete("514afe0e-bbb6-43b7-bdf0-9b55e8c28ac4");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testFind() {
		try {
			FundsDao fd = new FundsDaoImpl();
			Funds f= fd.find("514afe0e-bbb6-43b7-bdf0-9b55e8c28ac4");
			System.out.println(f.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
