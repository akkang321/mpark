package com.mpark.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommonDao {

	public List<Map<String, Object>> teacherList();

	public String nowYear();
	public String nowMonth();
	public String nowDay();
	public String nowHour();
	public String nowMinute();
	public int insertLog(Map<String, Object> param); 
	public int userTicketCnt(String uId);
}

