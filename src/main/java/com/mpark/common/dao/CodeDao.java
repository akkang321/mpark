package com.mpark.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CodeDao {
	
	public List<Map<String, Object>> getCode(String parentCode);
	
	public List<Map<String, Object>> getCode(Map<String, Object> map);
	
	public Map<String, Object> getMyInfo(String uId);
}
