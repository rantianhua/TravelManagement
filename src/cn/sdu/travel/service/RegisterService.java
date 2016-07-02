package cn.sdu.travel.service;

import java.util.Map;

import cn.sdu.travel.bean.HumanResource;

public interface RegisterService {

	// 检查是否已被注册
	Map<String, Object> checkId(String id);

	// 注册
	Map<String, Object> register(HumanResource hr);

}