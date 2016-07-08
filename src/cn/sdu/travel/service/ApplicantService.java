package cn.sdu.travel.service;

import java.util.Map;

import cn.sdu.travel.bean.HumanResource;
import cn.sdu.travel.bean.Passport;

public interface ApplicantService {

	Map<String, Object> saveUserInfo(HumanResource hr);
	
	Map<String, Object> savePassportInfo(Passport p);
	
	Map<String, Object> getPassportInfo(String id);

}