package com.mpark.admin.academy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminAcademyCouponDao {

	public List<Map<String, Object>> academyCouponList(Map<String, Object> map);
	
	public Map<String, Object> academyCouponInfo(Map<String, Object> map);
	
	public int couponIdCheck(Map<String, Object> map);
	
	public int academyCouponInsert(Map<String, Object> map);
	
	public int academyCouponUpdate(Map<String, Object> map);
	
	public int academyCouponDelete(Map<String, Object> map);
	
	public int couponCnt(); 

 }


