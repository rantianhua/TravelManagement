package cn.sdu.travel.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.sdu.travel.bean.Application;
import cn.sdu.travel.bean.Vertification;
import cn.sdu.travel.dao.ApplicationDao;
import cn.sdu.travel.dao.VertificationDao;
import cn.sdu.travel.dao.impl.ApplicationDaoImpl;
import cn.sdu.travel.dao.impl.VertificationDaoImpl;
import cn.sdu.travel.service.VertificationService;
import cn.sdu.travel.utils.ManageDbUtils;

public class VertificationServiceImpl implements VertificationService {
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * cn.sdu.travel.service.impl.VertificationService#saveVertificationInfo
	 * (cn.sdu.travel.bean.Vertification)
	 */
	@Override
	public Map<String, Object> saveVertificationInfo(Vertification v) {
		Map<String, Object> map = new HashMap<String, Object>();
		VertificationDao vdao = new VertificationDaoImpl();
		ApplicationDao adao = new ApplicationDaoImpl();
		
		try {
			ManageDbUtils.startTransaction();
			Vertification v2 = vdao.find(v.getVertificationId());
			Application a3 = adao.find(v.getVertificationId());
			if (a3 == null) {
				map.put("returnCode", 3000);
				map.put("returnInfo", "找不到符合条件的出国记录");
			} else if (v2 != null) {
				map.put("returnCode", 3001);
				map.put("returnInfo", "该核销申请已存在");
			}

			else {
				vdao.add(v);
				a3.setVerification("00000000");
				adao.update(a3);
				map.put("returnCode", 3002);
				map.put("returnInfo", "核销申请保存成功！");
			}
			ManageDbUtils.commitTransaction();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			map.put("returnCode", 3003);
			map.put("returnInfo", "数据库异常！");
			e.printStackTrace();
		} finally {
			ManageDbUtils.closeConnection();
		}

		return map;
	}
}
