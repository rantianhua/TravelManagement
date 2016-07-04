package cn.sdu.travel.service;

import java.util.Map;

public interface LoginService {
	
	Map<String, Object> login(String id, String password);

}