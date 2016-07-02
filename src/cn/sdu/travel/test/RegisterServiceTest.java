package cn.sdu.travel.test;

import java.util.Map;

import org.junit.Test;

import cn.sdu.travel.bean.HumanResource;
import cn.sdu.travel.service.RegisterService;
import cn.sdu.travel.service.impl.RegisterServiceImpl;

public class RegisterServiceTest {
	@Test
	public void testCheckId() {
		String id = "140000199503230003";
		RegisterService service = new RegisterServiceImpl();
		Map<String, Object> checkId = service.checkId(id);
		System.out.println(checkId.get("returnCode"));
		System.out.println(checkId.get("returnInfo"));
	}

	@Test
	public void testRegister() {
		String id = "140000199503230003";
		String password = "1234";
		HumanResource hr = new HumanResource();
		hr.setId(id);
		hr.setPassword(password);
		RegisterService service = new RegisterServiceImpl();
		Map<String, Object> checkId = service.register(hr);
		System.out.println(checkId.get("returnCode"));
		System.out.println(checkId.get("returnInfo"));
	}
}
