package cn.sdu.travel.service;

import java.util.Map;

import cn.sdu.travel.bean.Publicity;
import cn.sdu.travel.bean.Record;

public interface PublicityAndRecordService {

	Map<String,Object> savePublicity(Publicity publicity);
	
	Map<String,Object> saveRecord(Record record);
	
	Map<String,Object> findPublicity(String id);
	
}
