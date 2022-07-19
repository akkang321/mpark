package com.mpark.admin.academy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminAcademyClassDao {
	
	public int academyClassCnt(Map<String, Object> map);
	public List<Map<String, Object>> academyClassList(Map<String, Object> map);
	public List<Map<String, Object>> academyClassPriceList();
	
	public Map<String, Object> academyClassInfo(String cId);
	public int academyClassInsert(Map<String, Object> map);
	public int academyClassUpdate(Map<String, Object> map);
	public int academyClassDelete(String cId);
	
	public List<Map<String, Object>> academyClassScheduleList(Map<String, Object> map);
	public int academyClassScheduleInsert(Map<String, Object> map);
	public int academyClassScheduleDelete(Map<String, Object> map);
	
}

