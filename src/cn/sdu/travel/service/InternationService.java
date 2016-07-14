package cn.sdu.travel.service;

import java.util.Map;

public interface InternationService {

	Map<String, Object> getCheckApply();

	Map<String, Object> rejectApply(String appNo, String rejectReason);

	Map<String, Object> acceptApply(String appNo);

}