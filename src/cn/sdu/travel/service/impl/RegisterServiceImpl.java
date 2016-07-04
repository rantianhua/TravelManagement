package cn.sdu.travel.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import cn.sdu.travel.bean.HumanResource;
import cn.sdu.travel.dao.HumanResourceDao;
import cn.sdu.travel.dao.impl.HumanResourceDaoImpl;
import cn.sdu.travel.service.RegisterService;
import cn.sdu.travel.utils.HrDbUtils;

//注册接口逻辑
public class RegisterServiceImpl implements RegisterService {
	// 检查是否已被注册
	@Override
	public Map<String, Object> checkId(String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HumanResourceDao hdao = new HumanResourceDaoImpl();
		try {
			HumanResource hr = hdao.find(id);
			if (hr != null) {
				map.put("returnCode", 1201);
				map.put("returnInfo", "该身份证已被使用！");
			} else {
				map.put("returnCode", 1202);
				map.put("returnInfo", "该身份证未被使用！");
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

	// 注册
	@Override
	public Map<String, Object> register(HumanResource hr) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HumanResourceDao hdao = new HumanResourceDaoImpl();
		try {
			hdao.add(hr);
			map.put("returnCode", 1200);
			map.put("returnInfo", "注册成功");
		} catch (SQLException e) {
			map.put("returnCode", 1999);
			map.put("returnInfo", "数据库异常");
			e.printStackTrace();
			return map;
		} finally {
			HrDbUtils.closeConnection();
		}
		return map;
	}
}
