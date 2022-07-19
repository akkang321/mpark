package com.mpark.admin.user.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.mpark.admin.user.dao.AdminAdminDao;

@Service
public class AdminAdminService {

	@Resource
	AdminAdminDao adminAdminDAO;

	public List<Map<String, Object>> adminList(Map<String, Object> map) throws Exception {
		return adminAdminDAO.adminList(map);
	}
	
	public Map<String, Object> adminInfo(Map<String, Object> param) throws Exception {
		return adminAdminDAO.adminInfo(param);
	}
	
	public int checkAdminId(Map<String, Object> param) throws Exception {
		return adminAdminDAO.checkAdminId(param);
	}
	
	public int adminInsert(Map<String, Object> param) throws Exception {
		return adminAdminDAO.adminInsert(param);
	}
	
	
	public int adminUpdate(Map<String, Object> param) throws Exception {
		return adminAdminDAO.adminUpdate(param);
	}
	
	
	public int adminDelete(Map<String, Object> param) throws Exception {
		return adminAdminDAO.adminDelete(param);
	}
}


