package com.mpark.admin.academy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminAcademyScheduleDao {
	
	public List<Map<String, Object>> academyScheduleList(Map<String, Object> map);
}