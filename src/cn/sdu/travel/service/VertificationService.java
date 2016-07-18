package cn.sdu.travel.service;

import java.util.Map;

import cn.sdu.travel.bean.Vertification;

public interface VertificationService {

	Map<String, Object> saveVertificationInfo(Vertification v);

}