package com.mpark.admin.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminUserDao {

	public int userCnt(Map<String, Object> map);
	public List<Map<String, Object>> userList(Map<String, Object> map); 
	public Map<String, Object> userInfo(Map<String, Object> param); 
	
	public int userPwInit(Map<String, Object> map); 
	public int userUpdate(Map<String, Object> map); 
	public int userDelete(Map<String, Object> map); 
	

}


