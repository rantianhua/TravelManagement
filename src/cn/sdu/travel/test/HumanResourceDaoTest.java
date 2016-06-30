package cn.sdu.travel.test;

import cn.sdu.travel.bean.HumanResource;
import cn.sdu.travel.dao.HumanResourceDao;
import cn.sdu.travel.dao.impl.HumanResourceDaoImpl;
import cn.sdu.travel.utils.WebUtils;

public class HumanResourceDaoTest {
	public void testAdd(){
		HumanResource hr = new HumanResource();
		hr.setId(WebUtils.generateID());	
		HumanResourceDao hdao = new HumanResourceDaoImpl();
	}
}
