package com.mpark.admin.message.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminSmsContentDao {

	public List<Map<String, Object>> adminSmsContentList(Map<String, Object> param); 
	
	public Map<String, Object> smsContentInfo(Map<String, Object> param); 
	
	public int smsContentInsert(Map<String, Object> param);
	
	public int smsContentUpdate(Map<String, Object> param);
	
	public int smsDelete(Map<String, Object> param);
	
	public int smsContentCnt(); 

}

