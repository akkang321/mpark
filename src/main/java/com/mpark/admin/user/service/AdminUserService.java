package com.mpark.admin.user.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mpark.admin.user.dao.AdminUserDao;

@Service
public class AdminUserService {

	@Resource
	AdminUserDao adminUserDAO;

	public List<Map<String, Object>> userList(Map<String, Object> map) throws Exception {
		return adminUserDAO.userList(map);
	}
	
	public int userCnt(Map<String, Object> map) {
		return adminUserDAO.userCnt(map);
	}
	
	public int userPwInit(Map<String, Object> map) {
		return adminUserDAO.userPwInit(map);
	}

	public int userUpdate(Map<String, Object> map) {
		return adminUserDAO.userUpdate(map);
	}
	
	public Map<String, Object> userInfo(Map<String, Object> param) throws Exception{
		return adminUserDAO.userInfo(param);
	}
	
	
	public int userDelete(Map<String, Object> uId) {
		return adminUserDAO.userDelete(uId);
	}


	
}


