package cn.sdu.travel.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import cn.sdu.travel.bean.EmergencyContactPerson;
import cn.sdu.travel.bean.HumanResource;
import cn.sdu.travel.dao.EmergencyContactPersonDao;
import cn.sdu.travel.dao.HumanResourceDao;
import cn.sdu.travel.dao.impl.EmergencyContactPersonDaoImpl;
import cn.sdu.travel.dao.impl.HumanResourceDaoImpl;
import cn.sdu.travel.service.LoginService;
import cn.sdu.travel.utils.HrDbUtils;

//登录接口实现
public class LoginServiceImpl implements LoginService {

	@Override
	public Map<String, Object> login(String id, String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		HumanResourceDao hdao = new HumanResourceDaoImpl();
		EmergencyContactPersonDao edao = new EmergencyContactPersonDaoImpl();
		try {
			HumanResource hr = hdao.find(id);
			if (hr == null) {
				map.put("returnCode", 1102);
				map.put("returnInfo", "该用户不存在！");
			} else if (!password.equals(hr.getPassword())) {
				map.put("returnCode", 1101);
				map.put("returnInfo", "密码错误！");
			} else {
				map.put("returnCode", 1100);
				map.put("returnInfo", "登录成功！");
				if(hr.getEmergencyContactPerson() != null &&  !hr.getEmergencyContactPerson().equals("")){
					EmergencyContactPerson ecp = edao.find(hr.getEmergencyContactPerson());
					hr.setEcp(ecp);
				}
				map.put("data", hr);
			}
		} catch (SQLException e) {
			map.put("returnCode", 1999);
			map.put("returnInfo", "数据库异常！");
			e.printStackTrace();
			return map;
		} finally {
			HrDbUtils.closeConnection();
		}
		return map;
	}
}
