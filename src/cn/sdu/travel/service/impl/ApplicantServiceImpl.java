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
import cn.sdu.travel.service.ApplicantService;
import cn.sdu.travel.utils.HrDbUtils;
//import cn.sdu.travel.utils.HrDbUtils;

//申请者服务接口实现
public class ApplicantServiceImpl implements ApplicantService {
	@Override
	public Map<String, Object> saveUserInfo(HumanResource hr) {
		Map<String, Object> map = new HashMap<String, Object>();
		HumanResourceDao hdao = new HumanResourceDaoImpl();
		EmergencyContactPersonDao edao = new EmergencyContactPersonDaoImpl();

		try {
			hdao.update(hr);
			EmergencyContactPerson ecp = hr.getEcp();
			if (ecp != null) {
				edao.update(ecp);
			}
			map.put("returnCode", 1300);
			map.put("returnInfo", "修改个人资料成功！");
			map.put("data", hr);
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
