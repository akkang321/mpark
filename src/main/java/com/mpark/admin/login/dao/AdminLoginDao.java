package com.mpark.admin.login.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminLoginDao {

	public Map<String, Object> selectAdminInfo(Map<String, Object> map);

	public int updateLogin(String uId);
	
}

