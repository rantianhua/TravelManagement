package cn.sdu.travel.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.sdu.travel.bean.Family;
import cn.sdu.travel.bean.Publicity;
import cn.sdu.travel.bean.Record;
import cn.sdu.travel.bean.VisitMembers;
import cn.sdu.travel.dao.ApplicationDao;
import cn.sdu.travel.dao.FamilyDao;
import cn.sdu.travel.dao.PublicityDao;
import cn.sdu.travel.dao.RecordDao;
import cn.sdu.travel.dao.VisitMembersDao;
import cn.sdu.travel.dao.impl.ApplicationDaoImpl;
import cn.sdu.travel.dao.impl.FamilyDaoImpl;
import cn.sdu.travel.dao.impl.PublicityDaoImpl;
import cn.sdu.travel.dao.impl.RecordDaoImpl;
import cn.sdu.travel.dao.impl.VisitMembersDaoImpl;
import cn.sdu.travel.service.PublicityAndRecordService;
import cn.sdu.travel.utils.Constants;
import cn.sdu.travel.utils.ManageDbUtils;

public class PublicityAndRecordServiceImpl implements PublicityAndRecordService {

	@Override
	public Map<String, Object> savePublicity(Publicity publicity) {
		Map<String, Object> map = new HashMap<String, Object>();
		VisitMembersDao visitMembersDao = new VisitMembersDaoImpl();
		PublicityDao publicityDao = new PublicityDaoImpl();
		try {
			ManageDbUtils.startTransaction();
			if(publicity.getVisitMembers() != null && publicity.getVisitMembers().size() > 0) {
				for(VisitMembers member : publicity.getVisitMembers()) {
					visitMembersDao.add(member);
				}
			}
			publicityDao.add(publicity);
			//更新application表
			ApplicationDao applicationDao = new ApplicationDaoImpl();
			applicationDao.updatePublicity(publicity.getApplicationNumber(), publicity.getId());
			ManageDbUtils.commitTransaction();
			map.put("returnCode", Constants.SAVE_PUBLICITY_SUCCESS);
			map.put("returnInfo", "保存公示表信息成功");
			map.put("data", publicity);
		} catch (SQLException e) {
			e.printStackTrace();
			map.put("returnCode", Constants.DB_ERROR);
			map.put("returnInfo", "保存公示表失败");
			map.put("data", e.getMessage());
		}finally {
			ManageDbUtils.closeConnection();
		}
		return map;
	}


	@Override
	public Map<String, Object> saveRecord(Record record) {
		Map<String, Object> map = new HashMap<String, Object>();
		FamilyDao familyDao = new FamilyDaoImpl();
		RecordDao recordDao = new RecordDaoImpl();
		try {
			ManageDbUtils.startTransaction();
			if(record.getFamilys() != null && record.getFamilys().size() > 0) {
				for(Family family : record.getFamilys()) {
					familyDao.add(family);
				}
			}
			recordDao.add(record);
			ApplicationDao applicationDao = new ApplicationDaoImpl();
			applicationDao.updateVisitRecord(record.getApplicationNumber(), record.getId());
			ManageDbUtils.commitTransaction();
			map.put("returnCode", Constants.SAVE_RECORD_SUCCESS);
			map.put("returnInfo", "保存出访备案表信息成功");
			map.put("data", record);
		} catch (SQLException e) {
			e.printStackTrace();
			map.put("returnCode", Constants.DB_ERROR);
			map.put("returnInfo", "保存出访备案表失败");
			map.put("data", e.getMessage());
		} finally {
			ManageDbUtils.closeConnection();
		}
		return map;
	}
	
	

}
