package com.mpark.admin.login.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mpark.admin.login.dao.AdminLoginDao;

@Service
public class AdminLoginService {

	@Resource
	AdminLoginDao adminLoginDAO;

	public Map<String, Object> selectAdminInfo(Map<String, Object> map) {
		return adminLoginDAO.selectAdminInfo(map);
	}

	public int updateLogin(String uId) {
		return adminLoginDAO.updateLogin(uId);
	}

}

