package cn.sdu.travel.test;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.junit.Test;

import cn.sdu.travel.bean.HumanResource;
import cn.sdu.travel.dao.HumanResourceDao;
import cn.sdu.travel.dao.impl.HumanResourceDaoImpl;
import cn.sdu.travel.utils.WebUtils;

public class HumanResourceDaoTest {
	@Test
	public void testAdd() {
		HumanResource hr = new HumanResource();
		hr.setId("140000199503230001");
		hr.setRole("r10");
		hr.setNameCh("张三");
		hr.setNameEn("Jung");
		hr.setSex("男");
		hr.setNamePinyin("Zhang San");
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			hr.setBirthday(sdf.parse("1995-03-15"));
			HumanResourceDao hdao = new HumanResourceDaoImpl();
			hdao.add(hr);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testUpdate() {
		HumanResource hr = new HumanResource();
		hr.setId("140000199503230001");
		hr.setRole("r10");
		hr.setNameCh("张三");
		hr.setNameEn("Jung");
		hr.setSex("男");
		hr.setNamePinyin("Zhang San");
		hr.setEmergencyContactPerson(WebUtils.generateID());
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			hr.setBirthday(sdf.parse("1995-03-23"));
			HumanResourceDao hdao = new HumanResourceDaoImpl();
			hdao.update(hr);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testDelete() {
		try {
			HumanResourceDao hdao = new HumanResourceDaoImpl();
			hdao.delete("140000199503230001");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testFind() {
		try {
			HumanResourceDao hdao = new HumanResourceDaoImpl();
			HumanResource hr = hdao.find("140000199503230001");
			System.out.println(hr.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testGetAll() {
		try {
			HumanResourceDao hdao = new HumanResourceDaoImpl();
			List<HumanResource> all = hdao.getAll();
			System.out.println(all);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}