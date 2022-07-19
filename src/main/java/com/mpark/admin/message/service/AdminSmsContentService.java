package com.mpark.admin.message.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mpark.admin.message.dao.AdminSmsContentDao;

@Service
public class AdminSmsContentService {

	@Resource 
	AdminSmsContentDao adminSmsContentDao; 

	public List<Map<String, Object>> adminSmsContentList(Map<String, Object> param) {
		return adminSmsContentDao.adminSmsContentList(param);
	}
	
	public Map<String, Object> smsContentInfo(Map<String, Object> param) {
		return adminSmsContentDao.smsContentInfo(param);
	}
	
	public int smsContentInsert(Map<String, Object> param) {
		return adminSmsContentDao.smsContentInsert(param);
	}
	
	public int smsContentUpdate(Map<String, Object> param) {
		return adminSmsContentDao.smsContentUpdate(param);
	}
	
	public int smsDelete(Map<String, Object> param) {
		return adminSmsContentDao.smsDelete(param);
	}
	
	public int smsContentCnt() {
		return adminSmsContentDao.smsContentCnt();
	}

}

