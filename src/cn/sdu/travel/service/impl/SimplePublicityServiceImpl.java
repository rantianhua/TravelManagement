package cn.sdu.travel.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.sdu.travel.bean.SimplePublicity;
import cn.sdu.travel.dao.SimplePublicityDao;
import cn.sdu.travel.dao.impl.SimplePublicityDaoImpl;
import cn.sdu.travel.service.SimplePublicityService;
import cn.sdu.travel.utils.Constants;

public class SimplePublicityServiceImpl implements SimplePublicityService {

	@Override
	public Map<String, Object> getAllSimpleInfo() {
		SimplePublicityDao simplePublicityDao = new SimplePublicityDaoImpl();
		Map<String,Object> map = new HashMap<String, Object>() ;
		try {
			List<SimplePublicity> datas = simplePublicityDao.findAll();
			if(datas == null) datas = new ArrayList<SimplePublicity>();
			map.put(Constants.RETURN_CODE, Constants.GET_SIMPLE_PUBLICITY_SUCCESS);
			map.put(Constants.RETURN_INFO, "获取公示列表成功");
			map.put(Constants.RETURN_DATA, datas);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put(Constants.RETURN_CODE, Constants.DB_ERROR);
			map.put(Constants.RETURN_INFO, "获取公示列表失败");
			map.put(Constants.RETURN_DATA, e.getMessage());
		}
		return map;
	}

}
