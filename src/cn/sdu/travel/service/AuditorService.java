package cn.sdu.travel.service;

import java.util.Map;

public interface AuditorService {

	Map<String, Object> getCheckApply(String role);

	Map<String, Object> rejectApply(String role, String appNo,
			String rejectReason);

	Map<String, Object> acceptApply(String role, String appNo);

}