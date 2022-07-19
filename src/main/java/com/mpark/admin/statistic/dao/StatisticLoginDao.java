package com.mpark.admin.statistic.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StatisticLoginDao { 

	public List<Map<String, Object>> statisticLoginList(Map<String, Object> param); 
	
	public int loginCnt();
	
}

