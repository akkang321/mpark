package com.mpark.common.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SmsDao {
	public Map<String, Object> smsContent(Map<String, Object> param);
	
	public int smsSendInsert(Map<String, Object> param);
}
