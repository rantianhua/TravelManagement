package cn.sdu.travel.service;

import java.util.Map;

import cn.sdu.travel.bean.HumanResource;

public interface ApplicantService {

	Map<String, Object> saveUserInfo(HumanResource hr);

}