package com.mpark.admin.message.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminSmsSendDao {

	public List<Map<String, Object>> smsSendList(Map<String, Object> param); 
	
	public int smsSendListCnt(Map<String, Object> param); 
}

