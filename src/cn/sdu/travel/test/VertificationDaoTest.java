package cn.sdu.travel.test;

import java.sql.SQLException;

import org.junit.Test;

import cn.sdu.travel.bean.Vertification;
import cn.sdu.travel.dao.VertificationDao;
import cn.sdu.travel.dao.impl.VertificationDaoImpl;

public class VertificationDaoTest {
	@Test
	public void testAdd(){
	   Vertification ve=new Vertification();
	   ve.setVertificationId("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
	   ve.setExitBorderDate("2017-1-1");
	   ve.setEnterBorderDate("2018-7-1");
	   ve.setVertificationProgram("住宿费");
	   ve.setVertificationMoney("10000");
	   ve.setVertificationSummerize("ssss");
	   ve.setVertificationStuff("http://hao123.com");
	   VertificationDao ved=new VertificationDaoImpl();
	   try {
		ved.add(ve);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   }
	@Test
	public void testdelete(){
		VertificationDao ved=new VertificationDaoImpl();
		Vertification ve=new Vertification();
		   ve.setVertificationId("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		   ve.setExitBorderDate("2017-1-1");
		   ve.setEnterBorderDate("2018-7-1");
		   ve.setVertificationProgram("住宿费");
		   ve.setVertificationMoney("10000");
		   ve.setVertificationSummerize("ssss");
		   ve.setVertificationStuff("http://hao123.com");
        try {
			ved.delete(ve.getVertificationId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@Test
	public void testupdate(){
		VertificationDao ved=new VertificationDaoImpl();
		Vertification ve=new Vertification();
		   ve.setVertificationId("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		   ve.setExitBorderDate("2017-1-1");
		   ve.setEnterBorderDate("2019-7-1");
		   ve.setVertificationProgram("住宿费");
		   ve.setVertificationMoney("10000");
		   ve.setVertificationSummerize("ssss");
		   ve.setVertificationStuff("http://hao123.com");
        try {
			ved.update(ve);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
 
}
