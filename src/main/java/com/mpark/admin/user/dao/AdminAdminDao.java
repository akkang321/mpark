package com.mpark.admin.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminAdminDao {

	public List<Map<String, Object>> adminList(Map<String, Object> map); 

	public Map<String, Object> adminInfo(Map<String, Object> param); 

	public int checkAdminId(Map<String, Object> param); 
	
	public int adminInsert(Map<String, Object> param); 
	
	public int adminUpdate(Map<String, Object> param); 
	
	public int adminDelete(Map<String, Object> param); 
	
} 

