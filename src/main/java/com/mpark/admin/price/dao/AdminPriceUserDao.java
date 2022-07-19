package com.mpark.admin.price.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminPriceUserDao {
	
	public List<Map<String, Object>> priceUserList(Map<String, Object> map);
	
	public int priceUserCnt(Map<String, Object> map);

}
