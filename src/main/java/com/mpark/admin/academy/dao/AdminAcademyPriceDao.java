package com.mpark.admin.academy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminAcademyPriceDao {
	
	public List<Map<String, Object>> tPriceList(Map<String, Object> map);
	public List<Map<String, Object>> cPriceList(Map<String, Object> map);
	
	public int tPriceInsert(Map<String, Object> map);
	public int cPriceInsert(Map<String, Object> map);
	public int tPriceUpdate(Map<String, Object> map);
	public int cPriceUpdate(Map<String, Object> map);
	public int priceDelete(Map<String, Object> map);
	
}

