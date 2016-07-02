package cn.sdu.travel.test;

import java.util.Map;

import org.junit.Test;

import cn.sdu.travel.service.LoginService;
import cn.sdu.travel.service.impl.LoginServiceImpl;

public class LoginServiceTest {
	@Test
	public void testLogin(){
		String id = "140000199503230002";
		String password = "1234";
		LoginService service = new LoginServiceImpl();
		Map<String, Object> login = service.login(id, password);
		System.out.println(login.get("returnCode"));
		System.out.println(login.get("returnInfo"));
		if(login.get("returnCode").equals("1100")){
			System.out.println(login.get("data"));
		}
	}
}
